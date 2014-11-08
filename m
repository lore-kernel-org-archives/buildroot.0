From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Nov 2014 15:53:35 +0100
Subject: [Buildroot] [RFC/PATCH v5 02/13] package/ffmpeg: Add Kodi patchset
In-Reply-To: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
References: <1415458426-23645-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1415458426-23645-3-git-send-email-bernd.kuhls@t-online.de>
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg-0001-kodi.patch |  904 +++++++++++++++++++++++++++++++++
 1 file changed, 904 insertions(+)
 create mode 100644 package/ffmpeg/ffmpeg-0001-kodi.patch

diff --git a/package/ffmpeg/ffmpeg-0001-kodi.patch b/package/ffmpeg/ffmpeg-0001-kodi.patch
new file mode 100644
index 0000000..f13d674
--- /dev/null
+++ b/package/ffmpeg/ffmpeg-0001-kodi.patch
@@ -0,0 +1,904 @@
+In the past xbmc delivered its own ffmpeg source code with specific patches to
+address bugs found during the use of xbmc. For Helix the ffmpeg source code was
+removed, Helix uses a vanilla ffmpeg source tarball and applies this patchset
+on top of it.
+
+Downloaded from
+https://github.com/xbmc/FFmpeg/compare/FFmpeg:release/2.4...release/2.4-xbmc.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+From 622f5f1b5e76283e70772152134c7562b6e17e9d Mon Sep 17 00:00:00 2001
+From: Joakim Plate <elupus@ecce.se>
+Date: Sun, 11 Sep 2011 19:04:51 +0200
+Subject: [PATCH 01/17] Support raw dvdsub palette as stored on normal dvd's
+
+This is how the palette is stored on dvd's. Currently
+only xbmc passes the palette information to libavcodec
+this way.
+---
+ libavcodec/dvdsubdec.c | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/libavcodec/dvdsubdec.c b/libavcodec/dvdsubdec.c
+index 7355c03..4a945d9 100644
+--- a/libavcodec/dvdsubdec.c
++++ b/libavcodec/dvdsubdec.c
+@@ -61,6 +61,24 @@ static void yuv_a_to_rgba(const uint8_t *ycbcr, const uint8_t *alpha, uint32_t *
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
+@@ -629,6 +647,12 @@ static av_cold int dvdsub_init(AVCodecContext *avctx)
+ 
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
+
+From 5bd445513110e57a41458888c80b0532cdcd09aa Mon Sep 17 00:00:00 2001
+From: Joakim Plate <elupus@ecce.se>
+Date: Sat, 22 Oct 2011 18:33:45 +0200
+Subject: [PATCH 02/17] Check return value of avio_seek and avoid modifying
+ state if it fails
+
+The code still modifies state if the timestamp is not found. Not
+sure exactly how to avoid that.
+---
+ libavformat/matroskadec.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/libavformat/matroskadec.c b/libavformat/matroskadec.c
+index b8ddf67..1a1935f 100644
+--- a/libavformat/matroskadec.c
++++ b/libavformat/matroskadec.c
+@@ -2921,8 +2921,8 @@ static int matroska_read_seek(AVFormatContext *s, int stream_index,
+     timestamp = FFMAX(timestamp, st->index_entries[0].timestamp);
+ 
+     if ((index = av_index_search_timestamp(st, timestamp, flags)) < 0) {
+-        avio_seek(s->pb, st->index_entries[st->nb_index_entries - 1].pos,
+-                  SEEK_SET);
++        if (avio_seek(s->pb, st->index_entries[st->nb_index_entries-1].pos, SEEK_SET) < 0)
++            return -1;
+         matroska->current_id = 0;
+         while ((index = av_index_search_timestamp(st, timestamp, flags)) < 0) {
+             matroska_clear_queue(matroska);
+@@ -2931,16 +2931,11 @@ static int matroska_read_seek(AVFormatContext *s, int stream_index,
+         }
+     }
+ 
+-    matroska_clear_queue(matroska);
+     if (index < 0 || (matroska->cues_parsing_deferred < 0 && index == st->nb_index_entries - 1))
+         goto err;
+ 
+     index_min = index;
+     for (i = 0; i < matroska->tracks.nb_elem; i++) {
+-        tracks[i].audio.pkt_cnt        = 0;
+-        tracks[i].audio.sub_packet_cnt = 0;
+-        tracks[i].audio.buf_timecode   = AV_NOPTS_VALUE;
+-        tracks[i].end_timecode         = 0;
+         if (tracks[i].type == MATROSKA_TRACK_TYPE_SUBTITLE &&
+             tracks[i].stream->discard != AVDISCARD_ALL) {
+             index_sub = av_index_search_timestamp(
+@@ -2954,8 +2949,18 @@ static int matroska_read_seek(AVFormatContext *s, int stream_index,
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
+
+From 870b1a68c4fdb6a31b0dc29ece7aa429659fb52d Mon Sep 17 00:00:00 2001
+From: Joakim Plate <elupus@ecce.se>
+Date: Mon, 12 Sep 2011 21:37:17 +0200
+Subject: [PATCH 03/17] asf hacks
+
+---
+ libavformat/asfdec.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libavformat/asfdec.c b/libavformat/asfdec.c
+index 7f7bb4d..8911987 100644
+--- a/libavformat/asfdec.c
++++ b/libavformat/asfdec.c
+@@ -1549,9 +1549,20 @@ static int asf_read_seek(AVFormatContext *s, int stream_index,
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
+
+From 6fee17a0a63bf20b7835832e2d01ee7857b821b1 Mon Sep 17 00:00:00 2001
+From: Cory Fields <theuni-nospam-@xbmc.org>
+Date: Mon, 28 Jun 2010 01:55:31 -0400
+Subject: [PATCH 04/17] if av_read_packet returns AVERROR_IO, we are done.
+ ffmpeg's codecs might or might not handle returning any completed demuxed
+ packets correctly
+
+---
+ libavformat/utils.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libavformat/utils.c b/libavformat/utils.c
+index e899e4d..d75c168 100644
+--- a/libavformat/utils.c
++++ b/libavformat/utils.c
+@@ -1271,6 +1271,8 @@ static int read_frame_internal(AVFormatContext *s, AVPacket *pkt)
+         if (ret < 0) {
+             if (ret == AVERROR(EAGAIN))
+                 return ret;
++            if (ret == AVERROR(EIO))
++                return ret;
+             /* flush the parsers */
+             for (i = 0; i < s->nb_streams; i++) {
+                 st = s->streams[i];
+
+From f7ef5230815955d6db8037cbca363c23c1ebce5b Mon Sep 17 00:00:00 2001
+From: Cory Fields <theuni-nospam-@xbmc.org>
+Date: Mon, 28 Jun 2010 02:10:50 -0400
+Subject: [PATCH 05/17] added: Ticket #7187, TV Teletext support for DVB EBU
+ Teletext streams
+
+---
+ libavcodec/avcodec.h | 4 ++++
+ libavformat/mpegts.c | 2 ++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/libavcodec/avcodec.h b/libavcodec/avcodec.h
+index fb1c9ca..45bfba3 100644
+--- a/libavcodec/avcodec.h
++++ b/libavcodec/avcodec.h
+@@ -523,6 +523,10 @@ enum AVCodecID {
+     AV_CODEC_ID_PJS        = MKBETAG('P','h','J','S'),
+     AV_CODEC_ID_ASS        = MKBETAG('A','S','S',' '),  ///< ASS as defined in Matroska
+ 
++    /* data codecs */
++    AV_CODEC_ID_VBI_DATA= 0x17500,
++    AV_CODEC_ID_VBI_TELETEXT,
++
+     /* other specific kind of codecs (generally used for attachments) */
+     AV_CODEC_ID_FIRST_UNKNOWN = 0x18000,           ///< A dummy ID pointing at the start of various fake codecs.
+     AV_CODEC_ID_TTF = 0x18000,
+diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
+index 8808269..4d73e6d 100644
+--- a/libavformat/mpegts.c
++++ b/libavformat/mpegts.c
+@@ -717,6 +717,8 @@ static const StreamType DESC_types[] = {
+     { 0x7b, AVMEDIA_TYPE_AUDIO,    AV_CODEC_ID_DTS          },
+     { 0x56, AVMEDIA_TYPE_SUBTITLE, AV_CODEC_ID_DVB_TELETEXT },
+     { 0x59, AVMEDIA_TYPE_SUBTITLE, AV_CODEC_ID_DVB_SUBTITLE }, /* subtitling descriptor */
++    { 0x45, AVMEDIA_TYPE_DATA,         AV_CODEC_ID_VBI_DATA }, /* VBI Data descriptor */
++    { 0x46, AVMEDIA_TYPE_DATA,     AV_CODEC_ID_VBI_TELETEXT }, /* VBI Teletext descriptor */
+     { 0 },
+ };
+ 
+
+From 1b74fd18695d977496d26085fb305fababfebd1d Mon Sep 17 00:00:00 2001
+From: Joakim Plate <elupus@ecce.se>
+Date: Sun, 18 Sep 2011 19:16:34 +0200
+Subject: [PATCH 06/17] Don't accept mpegts PMT that isn't current
+
+---
+ libavformat/mpegts.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
+index 4d73e6d..4160c80 100644
+--- a/libavformat/mpegts.c
++++ b/libavformat/mpegts.c
+@@ -561,6 +561,7 @@ typedef struct SectionHeader {
+     uint8_t tid;
+     uint16_t id;
+     uint8_t version;
++    uint8_t current;
+     uint8_t sec_num;
+     uint8_t last_sec_num;
+ } SectionHeader;
+@@ -632,6 +633,7 @@ static int parse_section_header(SectionHeader *h,
+     val = get8(pp, p_end);
+     if (val < 0)
+         return val;
++    h->current = val & 0x1;
+     h->version = (val >> 1) & 0x1f;
+     val = get8(pp, p_end);
+     if (val < 0)
+@@ -1904,6 +1906,8 @@ static void pat_cb(MpegTSFilter *filter, const uint8_t *section, int section_len
+         return;
+     if (ts->skip_changes)
+         return;
++    if (!h->current)
++        return;
+ 
+     ts->stream->ts_id = h->id;
+ 
+
+From 354837b4c939246753039ce70c60cbd9fb1e01d0 Mon Sep 17 00:00:00 2001
+From: Joakim Plate <elupus@ecce.se>
+Date: Sun, 18 Sep 2011 19:17:23 +0200
+Subject: [PATCH 07/17] Don't reparse PMT unless it's version has changed
+
+---
+ libavformat/mpegts.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
+index 4160c80..c946449 100644
+--- a/libavformat/mpegts.c
++++ b/libavformat/mpegts.c
+@@ -87,6 +87,7 @@ struct MpegTSFilter {
+     int es_id;
+     int last_cc; /* last cc code (-1 if first packet) */
+     int64_t last_pcr;
++    int last_version; /* last version of data on this pid */
+     enum MpegTSFilterType type;
+     union {
+         MpegTSPESFilter pes_filter;
+@@ -439,6 +440,7 @@ static MpegTSFilter *mpegts_open_filter(MpegTSContext *ts, unsigned int pid,
+     filter->es_id   = -1;
+     filter->last_cc = -1;
+     filter->last_pcr= -1;
++    filter->last_version = -1;
+ 
+     return filter;
+ }
+@@ -1908,6 +1910,10 @@ static void pat_cb(MpegTSFilter *filter, const uint8_t *section, int section_len
+         return;
+     if (!h->current)
+         return;
++    if (h->version == filter->last_version)
++        return;
++    filter->last_version = h->version;
++    av_dlog(ts->stream, "version=%d\n", filter->last_version);
+ 
+     ts->stream->ts_id = h->id;
+ 
+
+From c874d974baefc35d6300938997131efd1a4da48b Mon Sep 17 00:00:00 2001
+From: Cory Fields <theuni-nospam-@xbmc.org>
+Date: Fri, 9 Jul 2010 16:43:31 -0400
+Subject: [PATCH 08/17] Read PID timestamps as well as PCR timestamps to find
+ location in mpegts stream
+
+---
+ libavformat/mpegts.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 46 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
+index c946449..772df83 100644
+--- a/libavformat/mpegts.c
++++ b/libavformat/mpegts.c
+@@ -2388,6 +2388,44 @@ static void seek_back(AVFormatContext *s, AVIOContext *pb, int64_t pos) {
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
+@@ -2587,6 +2625,7 @@ static av_unused int64_t mpegts_get_pcr(AVFormatContext *s, int stream_index,
+     uint8_t buf[TS_PACKET_SIZE];
+     int pcr_l, pcr_pid =
+         ((PESContext *)s->streams[stream_index]->priv_data)->pcr_pid;
++    int pid = ((PESContext*)s->streams[stream_index]->priv_data)->pid;
+     int pos47 = ts->pos47_full % ts->raw_packet_size;
+     pos =
+         ((*ppos + ts->raw_packet_size - 1 - pos47) / ts->raw_packet_size) *
+@@ -2608,6 +2647,11 @@ static av_unused int64_t mpegts_get_pcr(AVFormatContext *s, int stream_index,
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
+@@ -2707,7 +2751,7 @@ AVInputFormat ff_mpegts_demuxer = {
+     .read_header    = mpegts_read_header,
+     .read_packet    = mpegts_read_packet,
+     .read_close     = mpegts_read_close,
+-    .read_timestamp = mpegts_get_dts,
++    .read_timestamp = mpegts_get_pcr,
+     .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
+     .priv_class     = &mpegts_class,
+ };
+@@ -2719,7 +2763,7 @@ AVInputFormat ff_mpegtsraw_demuxer = {
+     .read_header    = mpegts_read_header,
+     .read_packet    = mpegts_raw_read_packet,
+     .read_close     = mpegts_read_close,
+-    .read_timestamp = mpegts_get_dts,
++    .read_timestamp = mpegts_get_pcr,
+     .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
+     .priv_class     = &mpegtsraw_class,
+ };
+
+From 24ad8f579e523eeec50fbedca28820c3619449c7 Mon Sep 17 00:00:00 2001
+From: Joakim Plate <elupus@ecce.se>
+Date: Sat, 22 Oct 2011 19:01:38 +0200
+Subject: [PATCH 09/17] Get stream durations using read_timestamp
+
+---
+ libavformat/utils.c | 39 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 39 insertions(+)
+
+diff --git a/libavformat/utils.c b/libavformat/utils.c
+index d75c168..9f74313 100644
+--- a/libavformat/utils.c
++++ b/libavformat/utils.c
+@@ -2312,6 +2312,41 @@ static void estimate_timings_from_bit_rate(AVFormatContext *ic)
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
+@@ -2462,6 +2497,10 @@ static void estimate_timings(AVFormatContext *ic, int64_t old_offset)
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
+
+From 5edeb3be287bae328c18b0dd6a3278843882a276 Mon Sep 17 00:00:00 2001
+From: Joakim Plate <elupus@ecce.se>
+Date: Wed, 8 Dec 2010 14:03:43 +0000
+Subject: [PATCH 10/17] changed: allow 4 second skew between streams in mov
+ before attempting to seek
+
+---
+ libavformat/mov.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/mov.c b/libavformat/mov.c
+index ae48c02..047cdc6 100644
+--- a/libavformat/mov.c
++++ b/libavformat/mov.c
+@@ -3694,8 +3694,8 @@ static AVIndexEntry *mov_find_next_sample(AVFormatContext *s, AVStream **st)
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
+
+From 957d47d1c2484a398bc357e102357fc47515610f Mon Sep 17 00:00:00 2001
+From: Joakim Plate <elupus@ecce.se>
+Date: Fri, 26 Nov 2010 20:56:48 +0000
+Subject: [PATCH 11/17] fixed: memleak in mpegts demuxer on some malformed (??)
+ mpegts files with too large pes packets
+
+at-visions sample file brokenStream.mpg
+---
+ libavformat/mpegts.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
+index 772df83..40dfab1 100644
+--- a/libavformat/mpegts.c
++++ b/libavformat/mpegts.c
+@@ -820,6 +820,10 @@ static void reset_pes_packet_state(PESContext *pes)
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
+@@ -2578,6 +2582,8 @@ static int mpegts_read_packet(AVFormatContext *s, AVPacket *pkt)
+ 
+     pkt->size = -1;
+     ts->pkt = pkt;
++    ts->pkt->data = NULL;
++
+     ret = handle_packets(ts, 0);
+     if (ret < 0) {
+         av_free_packet(ts->pkt);
+
+From 2962ec9624a1c7108b2874335616ef5cc0a4a0d3 Mon Sep 17 00:00:00 2001
+From: Joakim Plate <elupus@ecce.se>
+Date: Mon, 28 Jun 2010 21:26:54 +0000
+Subject: [PATCH 12/17] Speed up mpegts av_find_stream_info
+
+---
+ libavformat/mpegts.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
+index 40dfab1..031f4e1 100644
+--- a/libavformat/mpegts.c
++++ b/libavformat/mpegts.c
+@@ -982,7 +982,7 @@ static int mpegts_push_data(MpegTSFilter *filter,
+                         goto skip;
+ 
+                     /* stream not present in PMT */
+-                    if (!pes->st) {
++                    if (ts->auto_guess && !pes->st) {
+                         if (ts->skip_changes)
+                             goto skip;
+ 
+
+From 2418829bd999ac9ce6c4c1ce1e8bc267327a4b86 Mon Sep 17 00:00:00 2001
+From: marc <mhocking@ubuntu-desktop.(none)>
+Date: Mon, 18 Feb 2013 17:18:18 +0000
+Subject: [PATCH 13/17] dxva-h264 Fix dxva playback of streams that don't start
+ with an I-Frame.
+
+---
+ libavcodec/dxva2_h264.c | 8 ++++++++
+ libavcodec/h264.c       | 1 +
+ libavcodec/h264.h       | 2 ++
+ libavcodec/h264_slice.c | 1 +
+ 4 files changed, 12 insertions(+)
+
+diff --git a/libavcodec/dxva2_h264.c b/libavcodec/dxva2_h264.c
+index 6deccc3..85b25fd 100644
+--- a/libavcodec/dxva2_h264.c
++++ b/libavcodec/dxva2_h264.c
+@@ -451,6 +451,14 @@ static int dxva2_h264_end_frame(AVCodecContext *avctx)
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
+diff --git a/libavcodec/h264.c b/libavcodec/h264.c
+index c4f4b05..080845c 100644
+--- a/libavcodec/h264.c
++++ b/libavcodec/h264.c
+@@ -1085,6 +1085,7 @@ void ff_h264_flush_change(H264Context *h)
+     h->list_count = 0;
+     h->current_slice = 0;
+     h->mmco_reset = 1;
++    h->got_first_iframe = 0;
+ }
+ 
+ /* forget old pics after a seek */
+diff --git a/libavcodec/h264.h b/libavcodec/h264.h
+index 5ec4f0c..d26cee3 100644
+--- a/libavcodec/h264.h
++++ b/libavcodec/h264.h
+@@ -740,6 +740,8 @@ typedef struct H264Context {
+     int luma_weight_flag[2];    ///< 7.4.3.2 luma_weight_lX_flag
+     int chroma_weight_flag[2];  ///< 7.4.3.2 chroma_weight_lX_flag
+ 
++    int got_first_iframe;
++
+     // Timestamp stuff
+     int sei_buffering_period_present;   ///< Buffering period SEI flag
+     int initial_cpb_removal_delay[32];  ///< Initial timestamps for CPBs
+diff --git a/libavcodec/h264_slice.c b/libavcodec/h264_slice.c
+index ffb7de5..338114e 100644
+--- a/libavcodec/h264_slice.c
++++ b/libavcodec/h264_slice.c
+@@ -1178,6 +1178,7 @@ static int h264_slice_header_init(H264Context *h, int reinit)
+         ff_h264_free_tables(h, 0);
+     h->first_field           = 0;
+     h->prev_interlaced_frame = 1;
++    h->got_first_iframe = 0;
+ 
+     init_scan_tables(h);
+     ret = ff_h264_alloc_tables(h);
+
+From a8df0cfd31a31b6962616cabc40d7929746eee4d Mon Sep 17 00:00:00 2001
+From: elupus <elupus@xbmc.org>
+Date: Tue, 1 Nov 2011 20:18:35 +0100
+Subject: [PATCH 14/17] add public version of ff_read_frame_flush
+
+We need this since we sometimes seek on the
+input stream behind ffmpeg's back. After this
+all data need to be flushed completely.
+---
+ libavformat/avformat.h | 5 +++++
+ libavformat/utils.c    | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/libavformat/avformat.h b/libavformat/avformat.h
+index b915148..64695c6 100644
+--- a/libavformat/avformat.h
++++ b/libavformat/avformat.h
+@@ -2112,6 +2112,11 @@ int av_read_packet(AVFormatContext *s, AVPacket *pkt);
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
+diff --git a/libavformat/utils.c b/libavformat/utils.c
+index 9f74313..8de7c3d 100644
+--- a/libavformat/utils.c
++++ b/libavformat/utils.c
+@@ -1580,6 +1580,11 @@ void ff_read_frame_flush(AVFormatContext *s)
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
+
+From d01ef454fb11286e666d568c47ead0c1633d659a Mon Sep 17 00:00:00 2001
+From: Memphiz <memphis@machzwo.de>
+Date: Mon, 12 May 2014 18:27:01 +0200
+Subject: [PATCH 15/17] fix --disable-ffplay should disable any needs to check
+ or add compile/link flags otherwise SDL gets spewed all over pkg-config files
+ and generally causes a mess
+
+---
+ configure | 32 +++++++++++++++++---------------
+ 1 file changed, 17 insertions(+), 15 deletions(-)
+
+diff --git a/configure b/configure
+index 618dfab..30fe640 100755
+--- a/configure
++++ b/configure
+@@ -4911,22 +4911,24 @@ if enabled libdc1394; then
+     die "ERROR: No version of libdc1394 found "
+ fi
+ 
+-SDL_CONFIG="${cross_prefix}sdl-config"
+-if check_pkg_config sdl SDL_events.h SDL_PollEvent; then
+-    check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) >= 0x010201" $sdl_cflags &&
+-    check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) < 0x010300" $sdl_cflags &&
+-    enable sdl
+-else
+-  if "${SDL_CONFIG}" --version > /dev/null 2>&1; then
+-    sdl_cflags=$("${SDL_CONFIG}" --cflags)
+-    sdl_libs=$("${SDL_CONFIG}" --libs)
+-    check_func_headers SDL_version.h SDL_Linked_Version $sdl_cflags $sdl_libs &&
+-    check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) >= 0x010201" $sdl_cflags &&
+-    check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) < 0x010300" $sdl_cflags &&
+-    enable sdl
+-  fi
++if enabled ffplay; then
++    SDL_CONFIG="${cross_prefix}sdl-config"
++    if check_pkg_config sdl SDL_events.h SDL_PollEvent; then
++        check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) >= 0x010201" $sdl_cflags &&
++        check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) < 0x010300" $sdl_cflags &&
++        enable sdl
++    else
++      if "${SDL_CONFIG}" --version > /dev/null 2>&1; then
++        sdl_cflags=$("${SDL_CONFIG}" --cflags)
++        sdl_libs=$("${SDL_CONFIG}" --libs)
++        check_func_headers SDL_version.h SDL_Linked_Version $sdl_cflags $sdl_libs &&
++        check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) >= 0x010201" $sdl_cflags &&
++        check_cpp_condition SDL.h "(SDL_MAJOR_VERSION<<16 | SDL_MINOR_VERSION<<8 | SDL_PATCHLEVEL) < 0x010300" $sdl_cflags &&
++        enable sdl
++      fi
++    fi
++    enabled sdl && add_cflags $sdl_cflags && add_extralibs $sdl_libs
+ fi
+-enabled sdl && add_cflags $sdl_cflags && add_extralibs $sdl_libs
+ 
+ makeinfo --version > /dev/null 2>&1 && enable makeinfo  || disable makeinfo
+ enabled makeinfo && (makeinfo --version | \
+
+From 27fa565a9ec4a4e1b1f28e83e17a9aa7bf795fe7 Mon Sep 17 00:00:00 2001
+From: Hendrik Leppkes <h.leppkes@gmail.com>
+Date: Sun, 21 Sep 2014 02:29:27 +0200
+Subject: [PATCH 16/17] mlpdec: support major sync headers with optional
+ extension blocks
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/mlp_parser.c | 29 ++++++++++++++++++++++++-----
+ libavcodec/mlp_parser.h |  1 +
+ libavcodec/mlpdec.c     |  7 ++++++-
+ 3 files changed, 31 insertions(+), 6 deletions(-)
+
+diff --git a/libavcodec/mlp_parser.c b/libavcodec/mlp_parser.c
+index 4bb82ee..deaa844 100644
+--- a/libavcodec/mlp_parser.c
++++ b/libavcodec/mlp_parser.c
+@@ -119,6 +119,23 @@ uint64_t ff_truehd_layout(int chanmap)
+     return layout;
+ }
+ 
++static int ff_mlp_get_major_sync_size(const uint8_t * buf, int bufsize)
++{
++    int has_extension, extensions = 0;
++    int size = 28;
++    if (bufsize < 28)
++        return -1;
++
++    if (AV_RB32(buf) == 0xf8726fba) {
++        has_extension = buf[25] & 1;
++        if (has_extension) {
++            extensions = buf[26] >> 4;
++            size += 2 + extensions * 2;
++        }
++    }
++    return size;
++}
++
+ /** Read a major sync info header - contains high level information about
+  *  the stream - sample rate, channel arrangement etc. Most of this
+  *  information is not actually necessary for decoding, only for playback.
+@@ -127,18 +144,19 @@ uint64_t ff_truehd_layout(int chanmap)
+ 
+ int ff_mlp_read_major_sync(void *log, MLPHeaderInfo *mh, GetBitContext *gb)
+ {
+-    int ratebits, channel_arrangement;
++    int ratebits, channel_arrangement, header_size;
+     uint16_t checksum;
+ 
+     av_assert1(get_bits_count(gb) == 0);
+ 
+-    if (gb->size_in_bits < 28 << 3) {
++    header_size = ff_mlp_get_major_sync_size(gb->buffer, gb->size_in_bits >> 3);
++    if (header_size < 0 || gb->size_in_bits < header_size << 3) {
+         av_log(log, AV_LOG_ERROR, "packet too short, unable to read major sync\n");
+         return -1;
+     }
+ 
+-    checksum = ff_mlp_checksum16(gb->buffer, 26);
+-    if (checksum != AV_RL16(gb->buffer+26)) {
++    checksum = ff_mlp_checksum16(gb->buffer, header_size - 2);
++    if (checksum != AV_RL16(gb->buffer+header_size-2)) {
+         av_log(log, AV_LOG_ERROR, "major sync info header checksum error\n");
+         return AVERROR_INVALIDDATA;
+     }
+@@ -147,6 +165,7 @@ int ff_mlp_read_major_sync(void *log, MLPHeaderInfo *mh, GetBitContext *gb)
+         return AVERROR_INVALIDDATA;
+ 
+     mh->stream_type = get_bits(gb, 8);
++    mh->header_size = header_size;
+ 
+     if (mh->stream_type == 0xbb) {
+         mh->group1_bits = mlp_quants[get_bits(gb, 4)];
+@@ -199,7 +218,7 @@ int ff_mlp_read_major_sync(void *log, MLPHeaderInfo *mh, GetBitContext *gb)
+ 
+     mh->num_substreams = get_bits(gb, 4);
+ 
+-    skip_bits_long(gb, 4 + 11 * 8);
++    skip_bits_long(gb, 4 + (header_size - 17) * 8);
+ 
+     return 0;
+ }
+diff --git a/libavcodec/mlp_parser.h b/libavcodec/mlp_parser.h
+index 5d1d2e7..0c0109e 100644
+--- a/libavcodec/mlp_parser.h
++++ b/libavcodec/mlp_parser.h
+@@ -32,6 +32,7 @@
+ typedef struct MLPHeaderInfo
+ {
+     int stream_type;                        ///< 0xBB for MLP, 0xBA for TrueHD
++    int header_size;                        ///< Size of the major sync header, in bytes
+ 
+     int group1_bits;                        ///< The bit depth of the first substream
+     int group2_bits;                        ///< Bit depth of the second substream (MLP only)
+diff --git a/libavcodec/mlpdec.c b/libavcodec/mlpdec.c
+index ed6a7fb..fddeb14 100644
+--- a/libavcodec/mlpdec.c
++++ b/libavcodec/mlpdec.c
+@@ -132,6 +132,9 @@ typedef struct MLPDecodeContext {
+     /// Current access unit being read has a major sync.
+     int         is_major_sync_unit;
+ 
++    /// Size of the major sync unit, in bytes
++    int         major_sync_header_size;
++
+     /// Set if a valid major sync block has been read. Otherwise no decoding is possible.
+     uint8_t     params_valid;
+ 
+@@ -349,6 +352,8 @@ static int read_major_sync(MLPDecodeContext *m, GetBitContext *gb)
+         return AVERROR_PATCHWELCOME;
+     }
+ 
++    m->major_sync_header_size = mh.header_size;
++
+     m->access_unit_size      = mh.access_unit_size;
+     m->access_unit_size_pow2 = mh.access_unit_size_pow2;
+ 
+@@ -1142,7 +1147,7 @@ static int read_access_unit(AVCodecContext *avctx, void* data,
+         if (read_major_sync(m, &gb) < 0)
+             goto error;
+         m->is_major_sync_unit = 1;
+-        header_size += 28;
++        header_size += m->major_sync_header_size;
+     }
+ 
+     if (!m->params_valid) {
+
+From 265630307d5b36e87ac2879ce9852364ce1f6a8b Mon Sep 17 00:00:00 2001
+From: Hendrik Leppkes <h.leppkes@gmail.com>
+Date: Sun, 21 Sep 2014 02:29:28 +0200
+Subject: [PATCH 17/17] mlpdec: support TrueHD streams with an Atmos substream
+
+The fourth substream is being discarded, since its not raw audio data,
+but an encoded Atmos stream which needs a specialized decoder.
+
+Fixes decoding of the true hd stream from Transformers\ -\ Age\ of\ Extinction\ 2014\ 1080P-003.mkv
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/mlp.h    | 2 +-
+ libavcodec/mlpdec.c | 4 +++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/mlp.h b/libavcodec/mlp.h
+index bb9ca26..05d8dba 100644
+--- a/libavcodec/mlp.h
++++ b/libavcodec/mlp.h
+@@ -45,7 +45,7 @@
+ /** Maximum number of substreams that can be decoded.
+  *  MLP's limit is 2. TrueHD supports at least up to 3.
+  */
+-#define MAX_SUBSTREAMS      3
++#define MAX_SUBSTREAMS      4
+ 
+ /** which multiple of 48000 the maximum sample rate is */
+ #define MAX_RATEFACTOR      4
+diff --git a/libavcodec/mlpdec.c b/libavcodec/mlpdec.c
+index fddeb14..e443f81 100644
+--- a/libavcodec/mlpdec.c
++++ b/libavcodec/mlpdec.c
+@@ -358,7 +358,9 @@ static int read_major_sync(MLPDecodeContext *m, GetBitContext *gb)
+     m->access_unit_size_pow2 = mh.access_unit_size_pow2;
+ 
+     m->num_substreams        = mh.num_substreams;
+-    m->max_decoded_substream = m->num_substreams - 1;
++
++    /* limit to decoding 3 substreams, as the 4th is used by Dolby Atmos for non-audio data */
++    m->max_decoded_substream = FFMIN(m->num_substreams - 1, 2);
+ 
+     m->avctx->sample_rate    = mh.group1_samplerate;
+     m->avctx->frame_size     = mh.access_unit_size;
-- 
1.7.10.4
