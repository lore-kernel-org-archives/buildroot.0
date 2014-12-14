From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Dec 2014 14:08:11 +0100
Subject: [Buildroot] [RFC/PATCH v8 02/17] package/ffmpeg: Add Kodi patchset
In-Reply-To: <1418562506-16669-1-git-send-email-bernd.kuhls@t-online.de>
References: <1418562506-16669-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1418562506-16669-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the past xbmc delivered its own ffmpeg source code with specific patches to
address bugs found during the use of xbmc. For Helix the ffmpeg source code was
removed, Helix uses a vanilla ffmpeg source tarball and applies this patchset
on top of it.

Downloaded from
https://github.com/xbmc/FFmpeg/compare/FFmpeg:release/2.4...release/2.4-xbmc.patch
and rebased against ffmpeg-2.5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/0001-kodi.patch |  459 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 459 insertions(+)
 create mode 100644 package/ffmpeg/0001-kodi.patch

diff --git a/package/ffmpeg/0001-kodi.patch b/package/ffmpeg/0001-kodi.patch
new file mode 100644
index 0000000..fc85dcb
--- /dev/null
+++ b/package/ffmpeg/0001-kodi.patch
@@ -0,0 +1,459 @@
+diff -uNr ffmpeg-2.5.org/libavcodec/avcodec.h ffmpeg-2.5/libavcodec/avcodec.h
+--- ffmpeg-2.5.org/libavcodec/avcodec.h	2014-12-04 01:24:39.000000000 +0100
++++ ffmpeg-2.5/libavcodec/avcodec.h	2014-12-04 19:15:15.068516212 +0100
+@@ -520,6 +520,10 @@
+     AV_CODEC_ID_PJS        = MKBETAG('P','h','J','S'),
+     AV_CODEC_ID_ASS        = MKBETAG('A','S','S',' '),  ///< ASS as defined in Matroska
+ 
++    /* data codecs */
++    AV_CODEC_ID_VBI_DATA= 0x17500,
++    AV_CODEC_ID_VBI_TELETEXT,
++
+     /* other specific kind of codecs (generally used for attachments) */
+     AV_CODEC_ID_FIRST_UNKNOWN = 0x18000,           ///< A dummy ID pointing@the start of various fake codecs.
+     AV_CODEC_ID_TTF = 0x18000,
+diff -uNr ffmpeg-2.5.org/libavcodec/dvdsubdec.c ffmpeg-2.5/libavcodec/dvdsubdec.c
+--- ffmpeg-2.5.org/libavcodec/dvdsubdec.c	2014-12-04 01:24:39.000000000 +0100
++++ ffmpeg-2.5/libavcodec/dvdsubdec.c	2014-12-04 19:15:15.060516895 +0100
+@@ -64,6 +64,24 @@
+     }
+ }
+ 
++static void ayvu_to_argb(const uint8_t *ayvu, uint32_t *argb, int num_values)
++{
++    uint8_t *cm = ff_crop_tab + MAX_NEG_CROP;
++    uint8_t r, g, b;
++    int i, y, cb, cr, a;
++    int r_add, g_add, b_add;
++
++    for (i = num_values; i > 0; i--) {
++        a = *ayvu++;
++        y = *ayvu++;
++        cr = *ayvu++;
++        cb = *ayvu++;
++        YUV_TO_RGB1_CCIR(cb, cr);
++        YUV_TO_RGB2_CCIR(r, g, b, y);
++        *argb++ = (a << 24) | (r << 16) | (g << 8) | b;
++    }
++}
++
+ static int decode_run_2bit(GetBitContext *gb, int *color)
+ {
+     unsigned int v, t;
+@@ -697,6 +715,12 @@
+         parse_ifo_palette(ctx, ctx->ifo_str);
+     if (ctx->palette_str)
+         parse_palette(ctx, ctx->palette_str);
++
++    if (!ctx->has_palette && avctx->extradata_size == 64) {
++        ayvu_to_argb((uint8_t*)avctx->extradata, ctx->palette, 16);
++        ctx->has_palette = 1;
++    }
++
+     if (ctx->has_palette) {
+         int i;
+         av_log(avctx, AV_LOG_DEBUG, "palette:");
+diff -uNr ffmpeg-2.5.org/libavcodec/dxva2_h264.c ffmpeg-2.5/libavcodec/dxva2_h264.c
+--- ffmpeg-2.5.org/libavcodec/dxva2_h264.c	2014-12-01 01:21:41.000000000 +0100
++++ ffmpeg-2.5/libavcodec/dxva2_h264.c	2014-12-04 19:15:15.088514852 +0100
+@@ -451,6 +451,14 @@
+ 
+     if (ctx_pic->slice_count <= 0 || ctx_pic->bitstream_size <= 0)
+         return -1;
++
++    // Wait for an I-frame before start decoding. Workaround for ATI UVD and UVD+ GPUs
++    if (!h->got_first_iframe) {
++        if (!(ctx_pic->pp.wBitFields & (1 << 15)))
++            return -1;
++        h->got_first_iframe = 1;
++    }
++
+     ret = ff_dxva2_common_end_frame(avctx, &h->cur_pic_ptr->f,
+                                     &ctx_pic->pp, sizeof(ctx_pic->pp),
+                                     &ctx_pic->qm, sizeof(ctx_pic->qm),
+diff -uNr ffmpeg-2.5.org/libavcodec/h264.c ffmpeg-2.5/libavcodec/h264.c
+--- ffmpeg-2.5.org/libavcodec/h264.c	2014-12-04 01:24:39.000000000 +0100
++++ ffmpeg-2.5/libavcodec/h264.c	2014-12-04 19:15:15.088514852 +0100
+@@ -1085,6 +1085,7 @@
+     h->list_count = 0;
+     h->current_slice = 0;
+     h->mmco_reset = 1;
++    h->got_first_iframe = 0;
+ }
+ 
+ /* forget old pics after a seek */
+diff -uNr ffmpeg-2.5.org/libavcodec/h264.h ffmpeg-2.5/libavcodec/h264.h
+--- ffmpeg-2.5.org/libavcodec/h264.h	2014-12-01 01:21:41.000000000 +0100
++++ ffmpeg-2.5/libavcodec/h264.h	2014-12-04 19:15:15.088514852 +0100
+@@ -741,6 +741,8 @@
+     int luma_weight_flag[2];    ///< 7.4.3.2 luma_weight_lX_flag
+     int chroma_weight_flag[2];  ///< 7.4.3.2 chroma_weight_lX_flag
+ 
++    int got_first_iframe;
++
+     // Timestamp stuff
+     int sei_buffering_period_present;   ///< Buffering period SEI flag
+     int initial_cpb_removal_delay[32];  ///< Initial timestamps for CPBs
+diff -uNr ffmpeg-2.5.org/libavcodec/h264_slice.c ffmpeg-2.5/libavcodec/h264_slice.c
+--- ffmpeg-2.5.org/libavcodec/h264_slice.c	2014-12-04 01:24:39.000000000 +0100
++++ ffmpeg-2.5/libavcodec/h264_slice.c	2014-12-04 19:15:15.092514761 +0100
+@@ -1189,6 +1189,7 @@
+         ff_h264_free_tables(h, 0);
+     h->first_field           = 0;
+     h->prev_interlaced_frame = 1;
++    h->got_first_iframe = 0;
+ 
+     init_scan_tables(h);
+     ret = ff_h264_alloc_tables(h);
+diff -uNr ffmpeg-2.5.org/libavformat/asfdec.c ffmpeg-2.5/libavformat/asfdec.c
+--- ffmpeg-2.5.org/libavformat/asfdec.c	2014-12-01 01:21:46.000000000 +0100
++++ ffmpeg-2.5/libavformat/asfdec.c	2014-12-04 19:15:15.064516580 +0100
+@@ -1549,9 +1549,20 @@
+     AVStream *st    = s->streams[stream_index];
+     int ret = 0;
+ 
++    if (pts == 0) {
++      // this is a hack since av_gen_search searches the entire file in this case
++      av_log(s, AV_LOG_DEBUG, "SEEKTO: %"PRId64"\n", s->data_offset);
++      if (avio_seek(s->pb, s->data_offset, SEEK_SET) < 0)
++          return -1;
++      return 0;
++    }
++
+     if (s->packet_size <= 0)
+         return -1;
+ 
++    if (st->codec->codec_type != AVMEDIA_TYPE_VIDEO)
++        return -1;
++
+     /* Try using the protocol's read_seek if available */
+     if (s->pb) {
+         int ret = avio_seek_time(s->pb, stream_index, pts, flags);
+diff -uNr ffmpeg-2.5.org/libavformat/avformat.h ffmpeg-2.5/libavformat/avformat.h
+--- ffmpeg-2.5.org/libavformat/avformat.h	2014-12-04 01:24:39.000000000 +0100
++++ ffmpeg-2.5/libavformat/avformat.h	2014-12-04 19:15:15.092514761 +0100
+@@ -2121,6 +2121,11 @@
+ int av_read_frame(AVFormatContext *s, AVPacket *pkt);
+ 
+ /**
++ * Clear out any buffered data in context
++ */
++void av_read_frame_flush(AVFormatContext *s);
++
++/**
+  * Seek to the keyframe at timestamp.
+  * 'timestamp' in 'stream_index'.
+  *
+diff -uNr ffmpeg-2.5.org/libavformat/matroskadec.c ffmpeg-2.5/libavformat/matroskadec.c
+--- ffmpeg-2.5.org/libavformat/matroskadec.c	2014-12-04 01:24:39.000000000 +0100
++++ ffmpeg-2.5/libavformat/matroskadec.c	2014-12-04 19:15:47.396513193 +0100
+@@ -2929,8 +2929,8 @@
+     timestamp = FFMAX(timestamp, st->index_entries[0].timestamp);
+ 
+     if ((index = av_index_search_timestamp(st, timestamp, flags)) < 0 || index == st->nb_index_entries - 1) {
+-        avio_seek(s->pb, st->index_entries[st->nb_index_entries - 1].pos,
+-                  SEEK_SET);
++        if (avio_seek(s->pb, st->index_entries[st->nb_index_entries-1].pos, SEEK_SET) < 0)
++            return -1;
+         matroska->current_id = 0;
+         while ((index = av_index_search_timestamp(st, timestamp, flags)) < 0 || index == st->nb_index_entries - 1) {
+             matroska_clear_queue(matroska);
+@@ -2939,17 +2939,12 @@
+         }
+     }
+ 
+-    matroska_clear_queue(matroska);
+     if (index < 0 || (matroska->cues_parsing_deferred < 0 && index == st->nb_index_entries - 1))
+         goto err;
+ 
+     index_min = index;
+     tracks = matroska->tracks.elem;
+     for (i = 0; i < matroska->tracks.nb_elem; i++) {
+-        tracks[i].audio.pkt_cnt        = 0;
+-        tracks[i].audio.sub_packet_cnt = 0;
+-        tracks[i].audio.buf_timecode   = AV_NOPTS_VALUE;
+-        tracks[i].end_timecode         = 0;
+         if (tracks[i].type == MATROSKA_TRACK_TYPE_SUBTITLE &&
+             tracks[i].stream->discard != AVDISCARD_ALL) {
+             index_sub = av_index_search_timestamp(
+@@ -2963,8 +2958,18 @@
+         }
+     }
+ 
+-    avio_seek(s->pb, st->index_entries[index_min].pos, SEEK_SET);
+-    matroska->current_id       = 0;
++    if (avio_seek(s->pb, st->index_entries[index_min].pos, SEEK_SET) < 0)
++        return -1;
++
++    matroska_clear_queue(matroska);
++    for (i=0; i < matroska->tracks.nb_elem; i++) {
++        tracks[i].audio.pkt_cnt = 0;
++        tracks[i].audio.sub_packet_cnt = 0;
++        tracks[i].audio.buf_timecode = AV_NOPTS_VALUE;
++        tracks[i].end_timecode = 0;
++    }
++    matroska->current_id = 0;
++
+     if (flags & AVSEEK_FLAG_ANY) {
+         st->skip_to_keyframe = 0;
+         matroska->skip_to_timecode = timestamp;
+diff -uNr ffmpeg-2.5.org/libavformat/mov.c ffmpeg-2.5/libavformat/mov.c
+--- ffmpeg-2.5.org/libavformat/mov.c	2014-12-04 01:24:39.000000000 +0100
++++ ffmpeg-2.5/libavformat/mov.c	2014-12-04 19:15:15.084515038 +0100
+@@ -4028,8 +4028,8 @@
+             if (!sample || (!s->pb->seekable && current_sample->pos < sample->pos) ||
+                 (s->pb->seekable &&
+                  ((msc->pb != s->pb && dts < best_dts) || (msc->pb == s->pb &&
+-                 ((FFABS(best_dts - dts) <= AV_TIME_BASE && current_sample->pos < sample->pos) ||
+-                  (FFABS(best_dts - dts) > AV_TIME_BASE && dts < best_dts)))))) {
++                 ((FFABS(best_dts - dts) <= 4*AV_TIME_BASE && current_sample->pos < sample->pos) ||
++                  (FFABS(best_dts - dts) > 4*AV_TIME_BASE && dts < best_dts)))))) {
+                 sample = current_sample;
+                 best_dts = dts;
+                 *st = avst;
+diff -uNr ffmpeg-2.5.org/libavformat/mpegts.c ffmpeg-2.5/libavformat/mpegts.c
+--- ffmpeg-2.5.org/libavformat/mpegts.c	2014-12-04 01:24:39.000000000 +0100
++++ ffmpeg-2.5/libavformat/mpegts.c	2014-12-04 19:15:15.084515038 +0100
+@@ -88,6 +88,7 @@
+     int es_id;
+     int last_cc; /* last cc code (-1 if first packet) */
+     int64_t last_pcr;
++    int last_version; /* last version of data on this pid */
+     enum MpegTSFilterType type;
+     union {
+         MpegTSPESFilter pes_filter;
+@@ -450,6 +451,7 @@
+     filter->es_id   = -1;
+     filter->last_cc = -1;
+     filter->last_pcr= -1;
++    filter->last_version = -1;
+ 
+     return filter;
+ }
+@@ -572,6 +574,7 @@
+     uint8_t tid;
+     uint16_t id;
+     uint8_t version;
++    uint8_t current;
+     uint8_t sec_num;
+     uint8_t last_sec_num;
+ } SectionHeader;
+@@ -643,6 +646,7 @@
+     val = get8(pp, p_end);
+     if (val < 0)
+         return val;
++    h->current = val & 0x1;
+     h->version = (val >> 1) & 0x1f;
+     val = get8(pp, p_end);
+     if (val < 0)
+@@ -729,6 +733,8 @@
+     { 0x7b, AVMEDIA_TYPE_AUDIO,    AV_CODEC_ID_DTS          },
+     { 0x56, AVMEDIA_TYPE_SUBTITLE, AV_CODEC_ID_DVB_TELETEXT },
+     { 0x59, AVMEDIA_TYPE_SUBTITLE, AV_CODEC_ID_DVB_SUBTITLE }, /* subtitling descriptor */
++    { 0x45, AVMEDIA_TYPE_DATA,         AV_CODEC_ID_VBI_DATA }, /* VBI Data descriptor */
++    { 0x46, AVMEDIA_TYPE_DATA,     AV_CODEC_ID_VBI_TELETEXT }, /* VBI Teletext descriptor */
+     { 0 },
+ };
+ 
+@@ -826,6 +832,10 @@
+ 
+ static void new_pes_packet(PESContext *pes, AVPacket *pkt)
+ {
++    if(pkt->data) {
++      av_log(pes->stream, AV_LOG_ERROR, "ignoring previously allocated packet on stream %d\n", pkt->stream_index);
++      av_free_packet(pkt);
++    }
+     av_init_packet(pkt);
+ 
+     pkt->buf  = pes->buffer;
+@@ -984,7 +994,7 @@
+                         goto skip;
+ 
+                     /* stream not present in PMT */
+-                    if (!pes->st) {
++                    if (ts->auto_guess && !pes->st) {
+                         if (ts->skip_changes)
+                             goto skip;
+ 
+@@ -1966,6 +1976,12 @@
+         return;
+     if (ts->skip_changes)
+         return;
++    if (!h->current)
++        return;
++    if (h->version == filter->last_version)
++        return;
++    filter->last_version = h->version;
++    av_dlog(ts->stream, "version=%d\n", filter->last_version);
+ 
+     ts->stream->ts_id = h->id;
+ 
+@@ -2447,6 +2463,44 @@
+         av_log(s, pb->seekable ? AV_LOG_ERROR : AV_LOG_INFO, "Unable to seek back to the start\n");
+ }
+ 
++static int parse_timestamp(int64_t *ts, const uint8_t *buf)
++{
++    int afc, flags;
++    const uint8_t *p;
++
++    if(!(buf[1] & 0x40)) /* must be a start packet */
++        return -1;
++
++    afc = (buf[3] >> 4) & 3;
++    p = buf + 4;
++    if (afc == 0 || afc == 2) /* invalid or only adaption field */
++        return -1;
++    if (afc == 3)
++        p += p[0] + 1;
++    if (p >= buf + TS_PACKET_SIZE)
++        return -1;
++
++    if (p[0] != 0x00 || p[1] != 0x00 || p[2] != 0x01)  /* packet_start_code_prefix */
++        return -1;
++
++    flags = p[3] | 0x100; /* stream type */
++    if (!((flags >= 0x1c0 && flags <= 0x1df) ||
++          (flags >= 0x1e0 && flags <= 0x1ef) ||
++          (flags == 0x1bd) || (flags == 0x1fd)))
++        return -1;
++
++    flags = p[7];
++    if ((flags & 0xc0) == 0x80) {
++        *ts = ff_parse_pes_pts(p+9);
++        return 0;
++    } else if ((flags & 0xc0) == 0xc0) {
++        *ts = ff_parse_pes_pts(p+9+5);
++        return 0;
++    }
++    return -1;
++}
++
++
+ static int mpegts_read_header(AVFormatContext *s)
+ {
+     MpegTSContext *ts = s->priv_data;
+@@ -2599,6 +2653,8 @@
+ 
+     pkt->size = -1;
+     ts->pkt = pkt;
++    ts->pkt->data = NULL;
++
+     ret = handle_packets(ts, 0);
+     if (ret < 0) {
+         av_free_packet(ts->pkt);
+@@ -2646,6 +2702,7 @@
+     uint8_t buf[TS_PACKET_SIZE];
+     int pcr_l, pcr_pid =
+         ((PESContext *)s->streams[stream_index]->priv_data)->pcr_pid;
++    int pid = ((PESContext*)s->streams[stream_index]->priv_data)->pid;
+     int pos47 = ts->pos47_full % ts->raw_packet_size;
+     pos =
+         ((*ppos + ts->raw_packet_size - 1 - pos47) / ts->raw_packet_size) *
+@@ -2667,6 +2724,11 @@
+             *ppos = pos;
+             return timestamp;
+         }
++        if ((pid < 0 || (AV_RB16(buf + 1) & 0x1fff) == pid) &&
++            parse_timestamp(&timestamp, buf) == 0) {
++            *ppos = pos;
++            return timestamp;
++        }
+         pos += ts->raw_packet_size;
+     }
+ 
+@@ -2766,7 +2828,7 @@
+     .read_header    = mpegts_read_header,
+     .read_packet    = mpegts_read_packet,
+     .read_close     = mpegts_read_close,
+-    .read_timestamp = mpegts_get_dts,
++    .read_timestamp = mpegts_get_pcr,
+     .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
+     .priv_class     = &mpegts_class,
+ };
+@@ -2778,7 +2840,7 @@
+     .read_header    = mpegts_read_header,
+     .read_packet    = mpegts_raw_read_packet,
+     .read_close     = mpegts_read_close,
+-    .read_timestamp = mpegts_get_dts,
++    .read_timestamp = mpegts_get_pcr,
+     .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
+     .priv_class     = &mpegtsraw_class,
+ };
+diff -uNr ffmpeg-2.5.org/libavformat/utils.c ffmpeg-2.5/libavformat/utils.c
+--- ffmpeg-2.5.org/libavformat/utils.c	2014-12-04 01:24:39.000000000 +0100
++++ ffmpeg-2.5/libavformat/utils.c	2014-12-04 19:15:15.092514761 +0100
+@@ -1302,6 +1302,8 @@
+         if (ret < 0) {
+             if (ret == AVERROR(EAGAIN))
+                 return ret;
++            if (ret == AVERROR(EIO))
++                return ret;
+             /* flush the parsers */
+             for (i = 0; i < s->nb_streams; i++) {
+                 st = s->streams[i];
+@@ -1620,6 +1622,11 @@
+     }
+ }
+ 
++void av_read_frame_flush(AVFormatContext *s)
++{
++  ff_read_frame_flush(s);
++}
++
+ void ff_update_cur_dts(AVFormatContext *s, AVStream *ref_st, int64_t timestamp)
+ {
+     int i;
+@@ -2352,6 +2359,41 @@
+ #define DURATION_MAX_READ_SIZE 250000LL
+ #define DURATION_MAX_RETRY 4
+ 
++static void av_estimate_timings_from_pts2(AVFormatContext *ic, int64_t old_offset)
++{
++    AVStream *st;
++    int i, step= 1024;
++    int64_t ts, pos;
++
++    for(i=0;i<ic->nb_streams;i++) {
++        st = ic->streams[i];
++
++        pos = 0;
++        ts = ic->iformat->read_timestamp(ic, i, &pos, DURATION_MAX_READ_SIZE);
++        if (ts == AV_NOPTS_VALUE)
++            continue;
++        if (st->start_time > ts || st->start_time == AV_NOPTS_VALUE)
++            st->start_time = ts;
++
++        pos = avio_size(ic->pb) - 1;
++        do {
++            pos -= step;
++            ts = ic->iformat->read_timestamp(ic, i, &pos, pos + step);
++            step += step;
++        } while (ts == AV_NOPTS_VALUE && pos >= step && step < DURATION_MAX_READ_SIZE);
++
++        if (ts == AV_NOPTS_VALUE)
++            continue;
++
++        if (st->duration < ts - st->start_time || st->duration == AV_NOPTS_VALUE)
++            st->duration = ts - st->start_time;
++    }
++
++    fill_all_stream_timings(ic);
++
++    avio_seek(ic->pb, old_offset, SEEK_SET);
++}
++
+ /* only usable for MPEG-PS streams */
+ static void estimate_timings_from_pts(AVFormatContext *ic, int64_t old_offset)
+ {
+@@ -2502,6 +2544,10 @@
+          * the components */
+         fill_all_stream_timings(ic);
+         ic->duration_estimation_method = AVFMT_DURATION_FROM_STREAM;
++    } else if (ic->iformat->read_timestamp && 
++        file_size && ic->pb->seekable) {
++        /* get accurate estimate from the PTSes */
++        av_estimate_timings_from_pts2(ic, old_offset);
+     } else {
+         /* less precise: use bitrate info */
+         estimate_timings_from_bit_rate(ic);
-- 
1.7.10.4
