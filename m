From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Jul 2016 15:32:14 +0200
Subject: [Buildroot] [PATCH v4 2/7] package/ffmpeg: bump to version 3.1.1
In-Reply-To: <1467466339-19422-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467466339-19422-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467466339-19422-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

- Remove non-existing configure options:
  - --disable-mips32r2
  - --disable-libvo-aacenc
  - --enable-libdcadec
    (https://github.com/FFmpeg/FFmpeg/commit/e259dc86a80398d56d1aabcf6203f80616a4d04d)

- Amend renamed configure options:
  - --disable-mipsdspr1 has been renamed to --disable-mipsdsp

Remove all Kodi-related patches according to upstream repo:
https://github.com/xbmc/FFmpeg/commits/release/3.1-xbmc

Kodi now uses an unpatched ffmpeg.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: bump to version 3.1.1
v3: bump to version 3.0.2
v2: bump to version 3.0.1

 ...-dvdsub-palette-as-stored-on-normal-dvd-s.patch |  63 -------------
 ...packet-returns-AVERROR_IO-we-are-done.-ff.patch |  32 -------
 ...t-7187-TV-Teletext-support-for-DVB-EBU-Te.patch |  47 ---------
 ...on-t-accept-mpegts-PMT-that-isn-t-current.patch |  46 ---------
 ...parse-PMT-unless-it-s-version-has-changed.patch |  48 ----------
 ...mestamps-as-well-as-PCR-timestamps-to-fin.patch | 105 ---------------------
 ...Get-stream-durations-using-read_timestamp.patch |  74 ---------------
 ...ow-4-second-skew-between-streams-in-mov-b.patch |  33 -------
 ...ak-in-mpegts-demuxer-on-some-malformed-mp.patch |  44 ---------
 .../0011-Speed-up-mpegts-av_find_stream_info.patch |  30 ------
 ...ix-dxva-playback-of-streams-that-don-t-st.patch |  77 ---------------
 package/ffmpeg/ffmpeg.hash                         |   2 +-
 package/ffmpeg/ffmpeg.mk                           |  20 +---
 13 files changed, 3 insertions(+), 618 deletions(-)
 delete mode 100644 package/ffmpeg/0001-Support-raw-dvdsub-palette-as-stored-on-normal-dvd-s.patch
 delete mode 100644 package/ffmpeg/0003-if-av_read_packet-returns-AVERROR_IO-we-are-done.-ff.patch
 delete mode 100644 package/ffmpeg/0004-added-Ticket-7187-TV-Teletext-support-for-DVB-EBU-Te.patch
 delete mode 100644 package/ffmpeg/0005-Don-t-accept-mpegts-PMT-that-isn-t-current.patch
 delete mode 100644 package/ffmpeg/0006-Don-t-reparse-PMT-unless-it-s-version-has-changed.patch
 delete mode 100644 package/ffmpeg/0007-Read-PID-timestamps-as-well-as-PCR-timestamps-to-fin.patch
 delete mode 100644 package/ffmpeg/0008-Get-stream-durations-using-read_timestamp.patch
 delete mode 100644 package/ffmpeg/0009-changed-allow-4-second-skew-between-streams-in-mov-b.patch
 delete mode 100644 package/ffmpeg/0010-fixed-memleak-in-mpegts-demuxer-on-some-malformed-mp.patch
 delete mode 100644 package/ffmpeg/0011-Speed-up-mpegts-av_find_stream_info.patch
 delete mode 100644 package/ffmpeg/0012-dxva-h264-Fix-dxva-playback-of-streams-that-don-t-st.patch

diff --git a/package/ffmpeg/0001-Support-raw-dvdsub-palette-as-stored-on-normal-dvd-s.patch b/package/ffmpeg/0001-Support-raw-dvdsub-palette-as-stored-on-normal-dvd-s.patch
deleted file mode 100644
index a51a7d3..0000000
--- a/package/ffmpeg/0001-Support-raw-dvdsub-palette-as-stored-on-normal-dvd-s.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 74f1c9b43b191a9d6b494e90a4a11677fca33c13 Mon Sep 17 00:00:00 2001
-From: Joakim Plate <elupus@ecce.se>
-Date: Sun, 11 Sep 2011 19:04:51 +0200
-Subject: [PATCH 01/13] Support raw dvdsub palette as stored on normal dvd's
-
-This is how the palette is stored on dvd's. Currently
-only xbmc passes the palette information to libavcodec
-this way.
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavcodec/dvdsubdec.c | 24 ++++++++++++++++++++++++
- 1 file changed, 24 insertions(+)
-
-diff --git a/libavcodec/dvdsubdec.c b/libavcodec/dvdsubdec.c
-index 39604f3..a711e16 100644
---- a/libavcodec/dvdsubdec.c
-+++ b/libavcodec/dvdsubdec.c
-@@ -64,6 +64,24 @@ static void yuv_a_to_rgba(const uint8_t *ycbcr, const uint8_t *alpha, uint32_t *
-     }
- }
- 
-+static void ayvu_to_argb(const uint8_t *ayvu, uint32_t *argb, int num_values)
-+{
-+    uint8_t *cm = ff_crop_tab + MAX_NEG_CROP;
-+    uint8_t r, g, b;
-+    int i, y, cb, cr, a;
-+    int r_add, g_add, b_add;
-+
-+    for (i = num_values; i > 0; i--) {
-+        a = *ayvu++;
-+        y = *ayvu++;
-+        cr = *ayvu++;
-+        cb = *ayvu++;
-+        YUV_TO_RGB1_CCIR(cb, cr);
-+        YUV_TO_RGB2_CCIR(r, g, b, y);
-+        *argb++ = (a << 24) | (r << 16) | (g << 8) | b;
-+    }
-+}
-+
- static int decode_run_2bit(GetBitContext *gb, int *color)
- {
-     unsigned int v, t;
-@@ -697,6 +715,12 @@ static av_cold int dvdsub_init(AVCodecContext *avctx)
-         parse_ifo_palette(ctx, ctx->ifo_str);
-     if (ctx->palette_str)
-         parse_palette(ctx, ctx->palette_str);
-+
-+    if (!ctx->has_palette && avctx->extradata_size == 64) {
-+        ayvu_to_argb((uint8_t*)avctx->extradata, ctx->palette, 16);
-+        ctx->has_palette = 1;
-+    }
-+
-     if (ctx->has_palette) {
-         int i;
-         av_log(avctx, AV_LOG_DEBUG, "palette:");
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0003-if-av_read_packet-returns-AVERROR_IO-we-are-done.-ff.patch b/package/ffmpeg/0003-if-av_read_packet-returns-AVERROR_IO-we-are-done.-ff.patch
deleted file mode 100644
index 0344134..0000000
--- a/package/ffmpeg/0003-if-av_read_packet-returns-AVERROR_IO-we-are-done.-ff.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 54200b3e6009c6870e33c02c8bbcf023fcd92cac Mon Sep 17 00:00:00 2001
-From: Cory Fields <theuni-nospam-@xbmc.org>
-Date: Mon, 28 Jun 2010 01:55:31 -0400
-Subject: [PATCH 03/13] if av_read_packet returns AVERROR_IO, we are done.
- ffmpeg's codecs might or might not handle returning any completed demuxed
- packets correctly
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/utils.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libavformat/utils.c b/libavformat/utils.c
-index ae6347a..3e8af50 100644
---- a/libavformat/utils.c
-+++ b/libavformat/utils.c
-@@ -1304,6 +1304,8 @@ static int read_frame_internal(AVFormatContext *s, AVPacket *pkt)
-         if (ret < 0) {
-             if (ret == AVERROR(EAGAIN))
-                 return ret;
-+            if (ret == AVERROR(EIO))
-+                return ret;
-             /* flush the parsers */
-             for (i = 0; i < s->nb_streams; i++) {
-                 st = s->streams[i];
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0004-added-Ticket-7187-TV-Teletext-support-for-DVB-EBU-Te.patch b/package/ffmpeg/0004-added-Ticket-7187-TV-Teletext-support-for-DVB-EBU-Te.patch
deleted file mode 100644
index bc6a2d4..0000000
--- a/package/ffmpeg/0004-added-Ticket-7187-TV-Teletext-support-for-DVB-EBU-Te.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e9236f6fe3fae1ad4a3a2b6b63db493b083f0b21 Mon Sep 17 00:00:00 2001
-From: Cory Fields <theuni-nospam-@xbmc.org>
-Date: Mon, 28 Jun 2010 02:10:50 -0400
-Subject: [PATCH 04/13] added: Ticket #7187, TV Teletext support for DVB EBU
- Teletext streams
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavcodec/avcodec.h | 4 ++++
- libavformat/mpegts.c | 2 ++
- 2 files changed, 6 insertions(+)
-
-diff --git a/libavcodec/avcodec.h b/libavcodec/avcodec.h
-index dabae1b..dd6ef3f 100644
---- a/libavcodec/avcodec.h
-+++ b/libavcodec/avcodec.h
-@@ -520,6 +520,10 @@ enum AVCodecID {
-     AV_CODEC_ID_PJS        = MKBETAG('P','h','J','S'),
-     AV_CODEC_ID_ASS        = MKBETAG('A','S','S',' '),  ///< ASS as defined in Matroska
- 
-+    /* data codecs */
-+    AV_CODEC_ID_VBI_DATA= 0x17500,
-+    AV_CODEC_ID_VBI_TELETEXT,
-+
-     /* other specific kind of codecs (generally used for attachments) */
-     AV_CODEC_ID_FIRST_UNKNOWN = 0x18000,           ///< A dummy ID pointing at the start of various fake codecs.
-     AV_CODEC_ID_TTF = 0x18000,
-diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
-index 97da0a3..5dd28f1 100644
---- a/libavformat/mpegts.c
-+++ b/libavformat/mpegts.c
-@@ -729,6 +729,8 @@ static const StreamType DESC_types[] = {
-     { 0x7b, AVMEDIA_TYPE_AUDIO,    AV_CODEC_ID_DTS          },
-     { 0x56, AVMEDIA_TYPE_SUBTITLE, AV_CODEC_ID_DVB_TELETEXT },
-     { 0x59, AVMEDIA_TYPE_SUBTITLE, AV_CODEC_ID_DVB_SUBTITLE }, /* subtitling descriptor */
-+    { 0x45, AVMEDIA_TYPE_DATA,         AV_CODEC_ID_VBI_DATA }, /* VBI Data descriptor */
-+    { 0x46, AVMEDIA_TYPE_DATA,     AV_CODEC_ID_VBI_TELETEXT }, /* VBI Teletext descriptor */
-     { 0 },
- };
- 
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0005-Don-t-accept-mpegts-PMT-that-isn-t-current.patch b/package/ffmpeg/0005-Don-t-accept-mpegts-PMT-that-isn-t-current.patch
deleted file mode 100644
index feb58f7..0000000
--- a/package/ffmpeg/0005-Don-t-accept-mpegts-PMT-that-isn-t-current.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 1f48ee2290e9041b0371eb9a9cb742e9568930a1 Mon Sep 17 00:00:00 2001
-From: Joakim Plate <elupus@ecce.se>
-Date: Sun, 18 Sep 2011 19:16:34 +0200
-Subject: [PATCH 05/13] Don't accept mpegts PMT that isn't current
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/mpegts.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
-index 5dd28f1..9f85aed 100644
---- a/libavformat/mpegts.c
-+++ b/libavformat/mpegts.c
-@@ -572,6 +572,7 @@ typedef struct SectionHeader {
-     uint8_t tid;
-     uint16_t id;
-     uint8_t version;
-+    uint8_t current;
-     uint8_t sec_num;
-     uint8_t last_sec_num;
- } SectionHeader;
-@@ -643,6 +644,7 @@ static int parse_section_header(SectionHeader *h,
-     val = get8(pp, p_end);
-     if (val < 0)
-         return val;
-+    h->current = val & 0x1;
-     h->version = (val >> 1) & 0x1f;
-     val = get8(pp, p_end);
-     if (val < 0)
-@@ -1968,6 +1970,8 @@ static void pat_cb(MpegTSFilter *filter, const uint8_t *section, int section_len
-         return;
-     if (ts->skip_changes)
-         return;
-+    if (!h->current)
-+        return;
- 
-     ts->stream->ts_id = h->id;
- 
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0006-Don-t-reparse-PMT-unless-it-s-version-has-changed.patch b/package/ffmpeg/0006-Don-t-reparse-PMT-unless-it-s-version-has-changed.patch
deleted file mode 100644
index 0418f25..0000000
--- a/package/ffmpeg/0006-Don-t-reparse-PMT-unless-it-s-version-has-changed.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From db98fbe37f2f7175ff03b8d582e940518ddf3642 Mon Sep 17 00:00:00 2001
-From: Joakim Plate <elupus@ecce.se>
-Date: Sun, 18 Sep 2011 19:17:23 +0200
-Subject: [PATCH 06/13] Don't reparse PMT unless it's version has changed
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/mpegts.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
-index 9f85aed..25007a6 100644
---- a/libavformat/mpegts.c
-+++ b/libavformat/mpegts.c
-@@ -88,6 +88,7 @@ struct MpegTSFilter {
-     int es_id;
-     int last_cc; /* last cc code (-1 if first packet) */
-     int64_t last_pcr;
-+    int last_version; /* last version of data on this pid */
-     enum MpegTSFilterType type;
-     union {
-         MpegTSPESFilter pes_filter;
-@@ -450,6 +451,7 @@ static MpegTSFilter *mpegts_open_filter(MpegTSContext *ts, unsigned int pid,
-     filter->es_id   = -1;
-     filter->last_cc = -1;
-     filter->last_pcr= -1;
-+    filter->last_version = -1;
- 
-     return filter;
- }
-@@ -1972,6 +1974,10 @@ static void pat_cb(MpegTSFilter *filter, const uint8_t *section, int section_len
-         return;
-     if (!h->current)
-         return;
-+    if (h->version == filter->last_version)
-+        return;
-+    filter->last_version = h->version;
-+    av_dlog(ts->stream, "version=%d\n", filter->last_version);
- 
-     ts->stream->ts_id = h->id;
- 
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0007-Read-PID-timestamps-as-well-as-PCR-timestamps-to-fin.patch b/package/ffmpeg/0007-Read-PID-timestamps-as-well-as-PCR-timestamps-to-fin.patch
deleted file mode 100644
index 259b359..0000000
--- a/package/ffmpeg/0007-Read-PID-timestamps-as-well-as-PCR-timestamps-to-fin.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From fdd8caea6535434a877587f5325e914ba50ed17f Mon Sep 17 00:00:00 2001
-From: Cory Fields <theuni-nospam-@xbmc.org>
-Date: Fri, 9 Jul 2010 16:43:31 -0400
-Subject: [PATCH 07/13] Read PID timestamps as well as PCR timestamps to find
- location in mpegts stream
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/mpegts.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 46 insertions(+), 2 deletions(-)
-
-diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
-index 25007a6..d5a8a45 100644
---- a/libavformat/mpegts.c
-+++ b/libavformat/mpegts.c
-@@ -2459,6 +2459,44 @@ static void seek_back(AVFormatContext *s, AVIOContext *pb, int64_t pos) {
-         av_log(s, pb->seekable ? AV_LOG_ERROR : AV_LOG_INFO, "Unable to seek back to the start\n");
- }
- 
-+static int parse_timestamp(int64_t *ts, const uint8_t *buf)
-+{
-+    int afc, flags;
-+    const uint8_t *p;
-+
-+    if(!(buf[1] & 0x40)) /* must be a start packet */
-+        return -1;
-+
-+    afc = (buf[3] >> 4) & 3;
-+    p = buf + 4;
-+    if (afc == 0 || afc == 2) /* invalid or only adaption field */
-+        return -1;
-+    if (afc == 3)
-+        p += p[0] + 1;
-+    if (p >= buf + TS_PACKET_SIZE)
-+        return -1;
-+
-+    if (p[0] != 0x00 || p[1] != 0x00 || p[2] != 0x01)  /* packet_start_code_prefix */
-+        return -1;
-+
-+    flags = p[3] | 0x100; /* stream type */
-+    if (!((flags >= 0x1c0 && flags <= 0x1df) ||
-+          (flags >= 0x1e0 && flags <= 0x1ef) ||
-+          (flags == 0x1bd) || (flags == 0x1fd)))
-+        return -1;
-+
-+    flags = p[7];
-+    if ((flags & 0xc0) == 0x80) {
-+        *ts = ff_parse_pes_pts(p+9);
-+        return 0;
-+    } else if ((flags & 0xc0) == 0xc0) {
-+        *ts = ff_parse_pes_pts(p+9+5);
-+        return 0;
-+    }
-+    return -1;
-+}
-+
-+
- static int mpegts_read_header(AVFormatContext *s)
- {
-     MpegTSContext *ts = s->priv_data;
-@@ -2658,6 +2696,7 @@ static av_unused int64_t mpegts_get_pcr(AVFormatContext *s, int stream_index,
-     uint8_t buf[TS_PACKET_SIZE];
-     int pcr_l, pcr_pid =
-         ((PESContext *)s->streams[stream_index]->priv_data)->pcr_pid;
-+    int pid = ((PESContext*)s->streams[stream_index]->priv_data)->pid;
-     int pos47 = ts->pos47_full % ts->raw_packet_size;
-     pos =
-         ((*ppos + ts->raw_packet_size - 1 - pos47) / ts->raw_packet_size) *
-@@ -2679,6 +2718,11 @@ static av_unused int64_t mpegts_get_pcr(AVFormatContext *s, int stream_index,
-             *ppos = pos;
-             return timestamp;
-         }
-+        if ((pid < 0 || (AV_RB16(buf + 1) & 0x1fff) == pid) &&
-+            parse_timestamp(&timestamp, buf) == 0) {
-+            *ppos = pos;
-+            return timestamp;
-+        }
-         pos += ts->raw_packet_size;
-     }
- 
-@@ -2778,7 +2822,7 @@ AVInputFormat ff_mpegts_demuxer = {
-     .read_header    = mpegts_read_header,
-     .read_packet    = mpegts_read_packet,
-     .read_close     = mpegts_read_close,
--    .read_timestamp = mpegts_get_dts,
-+    .read_timestamp = mpegts_get_pcr,
-     .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
-     .priv_class     = &mpegts_class,
- };
-@@ -2790,7 +2834,7 @@ AVInputFormat ff_mpegtsraw_demuxer = {
-     .read_header    = mpegts_read_header,
-     .read_packet    = mpegts_raw_read_packet,
-     .read_close     = mpegts_read_close,
--    .read_timestamp = mpegts_get_dts,
-+    .read_timestamp = mpegts_get_pcr,
-     .flags          = AVFMT_SHOW_IDS | AVFMT_TS_DISCONT,
-     .priv_class     = &mpegtsraw_class,
- };
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0008-Get-stream-durations-using-read_timestamp.patch b/package/ffmpeg/0008-Get-stream-durations-using-read_timestamp.patch
deleted file mode 100644
index 0b80c11..0000000
--- a/package/ffmpeg/0008-Get-stream-durations-using-read_timestamp.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From c57e5b8154f5fe1457f4c64e04885a2cdfb37f51 Mon Sep 17 00:00:00 2001
-From: Joakim Plate <elupus@ecce.se>
-Date: Sat, 22 Oct 2011 19:01:38 +0200
-Subject: [PATCH 08/13] Get stream durations using read_timestamp
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/utils.c | 39 +++++++++++++++++++++++++++++++++++++++
- 1 file changed, 39 insertions(+)
-
-diff --git a/libavformat/utils.c b/libavformat/utils.c
-index 3e8af50..f4fb172 100644
---- a/libavformat/utils.c
-+++ b/libavformat/utils.c
-@@ -2356,6 +2356,41 @@ static void estimate_timings_from_bit_rate(AVFormatContext *ic)
- #define DURATION_MAX_READ_SIZE 250000LL
- #define DURATION_MAX_RETRY 4
- 
-+static void av_estimate_timings_from_pts2(AVFormatContext *ic, int64_t old_offset)
-+{
-+    AVStream *st;
-+    int i, step= 1024;
-+    int64_t ts, pos;
-+
-+    for(i=0;i<ic->nb_streams;i++) {
-+        st = ic->streams[i];
-+
-+        pos = 0;
-+        ts = ic->iformat->read_timestamp(ic, i, &pos, DURATION_MAX_READ_SIZE);
-+        if (ts == AV_NOPTS_VALUE)
-+            continue;
-+        if (st->start_time > ts || st->start_time == AV_NOPTS_VALUE)
-+            st->start_time = ts;
-+
-+        pos = avio_size(ic->pb) - 1;
-+        do {
-+            pos -= step;
-+            ts = ic->iformat->read_timestamp(ic, i, &pos, pos + step);
-+            step += step;
-+        } while (ts == AV_NOPTS_VALUE && pos >= step && step < DURATION_MAX_READ_SIZE);
-+
-+        if (ts == AV_NOPTS_VALUE)
-+            continue;
-+
-+        if (st->duration < ts - st->start_time || st->duration == AV_NOPTS_VALUE)
-+            st->duration = ts - st->start_time;
-+    }
-+
-+    fill_all_stream_timings(ic);
-+
-+    avio_seek(ic->pb, old_offset, SEEK_SET);
-+}
-+
- /* only usable for MPEG-PS streams */
- static void estimate_timings_from_pts(AVFormatContext *ic, int64_t old_offset)
- {
-@@ -2506,6 +2541,10 @@ static void estimate_timings(AVFormatContext *ic, int64_t old_offset)
-          * the components */
-         fill_all_stream_timings(ic);
-         ic->duration_estimation_method = AVFMT_DURATION_FROM_STREAM;
-+    } else if (ic->iformat->read_timestamp && 
-+        file_size && ic->pb->seekable) {
-+        /* get accurate estimate from the PTSes */
-+        av_estimate_timings_from_pts2(ic, old_offset);
-     } else {
-         /* less precise: use bitrate info */
-         estimate_timings_from_bit_rate(ic);
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0009-changed-allow-4-second-skew-between-streams-in-mov-b.patch b/package/ffmpeg/0009-changed-allow-4-second-skew-between-streams-in-mov-b.patch
deleted file mode 100644
index fb0aad1..0000000
--- a/package/ffmpeg/0009-changed-allow-4-second-skew-between-streams-in-mov-b.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4bcec3ef0042244b0ade00d132368d0872f73c72 Mon Sep 17 00:00:00 2001
-From: Joakim Plate <elupus@ecce.se>
-Date: Wed, 8 Dec 2010 14:03:43 +0000
-Subject: [PATCH 09/13] changed: allow 4 second skew between streams in mov
- before attempting to seek
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/mov.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libavformat/mov.c b/libavformat/mov.c
-index 8d66c0a..127ffd9 100644
---- a/libavformat/mov.c
-+++ b/libavformat/mov.c
-@@ -4028,8 +4028,8 @@ static AVIndexEntry *mov_find_next_sample(AVFormatContext *s, AVStream **st)
-             if (!sample || (!s->pb->seekable && current_sample->pos < sample->pos) ||
-                 (s->pb->seekable &&
-                  ((msc->pb != s->pb && dts < best_dts) || (msc->pb == s->pb &&
--                 ((FFABS(best_dts - dts) <= AV_TIME_BASE && current_sample->pos < sample->pos) ||
--                  (FFABS(best_dts - dts) > AV_TIME_BASE && dts < best_dts)))))) {
-+                 ((FFABS(best_dts - dts) <= 4*AV_TIME_BASE && current_sample->pos < sample->pos) ||
-+                  (FFABS(best_dts - dts) > 4*AV_TIME_BASE && dts < best_dts)))))) {
-                 sample = current_sample;
-                 best_dts = dts;
-                 *st = avst;
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0010-fixed-memleak-in-mpegts-demuxer-on-some-malformed-mp.patch b/package/ffmpeg/0010-fixed-memleak-in-mpegts-demuxer-on-some-malformed-mp.patch
deleted file mode 100644
index d13d073..0000000
--- a/package/ffmpeg/0010-fixed-memleak-in-mpegts-demuxer-on-some-malformed-mp.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From cb7c19124165508ae5f38a385a14f9c13b096a27 Mon Sep 17 00:00:00 2001
-From: Joakim Plate <elupus@ecce.se>
-Date: Fri, 26 Nov 2010 20:56:48 +0000
-Subject: [PATCH 10/13] fixed: memleak in mpegts demuxer on some malformed (??)
- mpegts files with too large pes packets
-
-at-visions sample file brokenStream.mpg
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/mpegts.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
-index d5a8a45..e070f1f 100644
---- a/libavformat/mpegts.c
-+++ b/libavformat/mpegts.c
-@@ -832,6 +832,10 @@ static void reset_pes_packet_state(PESContext *pes)
- 
- static void new_pes_packet(PESContext *pes, AVPacket *pkt)
- {
-+    if(pkt->data) {
-+      av_log(pes->stream, AV_LOG_ERROR, "ignoring previously allocated packet on stream %d\n", pkt->stream_index);
-+      av_free_packet(pkt);
-+    }
-     av_init_packet(pkt);
- 
-     pkt->buf  = pes->buffer;
-@@ -2649,6 +2653,8 @@ static int mpegts_read_packet(AVFormatContext *s, AVPacket *pkt)
- 
-     pkt->size = -1;
-     ts->pkt = pkt;
-+    ts->pkt->data = NULL;
-+
-     ret = handle_packets(ts, 0);
-     if (ret < 0) {
-         av_free_packet(ts->pkt);
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0011-Speed-up-mpegts-av_find_stream_info.patch b/package/ffmpeg/0011-Speed-up-mpegts-av_find_stream_info.patch
deleted file mode 100644
index 7c81f1d..0000000
--- a/package/ffmpeg/0011-Speed-up-mpegts-av_find_stream_info.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c315a758a292200c22925603682e259849d6d558 Mon Sep 17 00:00:00 2001
-From: Joakim Plate <elupus@ecce.se>
-Date: Mon, 28 Jun 2010 21:26:54 +0000
-Subject: [PATCH 11/13] Speed up mpegts av_find_stream_info
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavformat/mpegts.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libavformat/mpegts.c b/libavformat/mpegts.c
-index e070f1f..dd9e129 100644
---- a/libavformat/mpegts.c
-+++ b/libavformat/mpegts.c
-@@ -994,7 +994,7 @@ static int mpegts_push_data(MpegTSFilter *filter,
-                         goto skip;
- 
-                     /* stream not present in PMT */
--                    if (!pes->st) {
-+                    if (ts->auto_guess && !pes->st) {
-                         if (ts->skip_changes)
-                             goto skip;
- 
--- 
-2.1.0
-
diff --git a/package/ffmpeg/0012-dxva-h264-Fix-dxva-playback-of-streams-that-don-t-st.patch b/package/ffmpeg/0012-dxva-h264-Fix-dxva-playback-of-streams-that-don-t-st.patch
deleted file mode 100644
index f346da1..0000000
--- a/package/ffmpeg/0012-dxva-h264-Fix-dxva-playback-of-streams-that-don-t-st.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 939ebbbc46ca9995637415594f1815633587104f Mon Sep 17 00:00:00 2001
-From: marc <mhocking@ubuntu-desktop.(none)>
-Date: Mon, 18 Feb 2013 17:18:18 +0000
-Subject: [PATCH 12/13] dxva-h264 Fix dxva playback of streams that don't start
- with an I-Frame.
-
-Patch part of the XBMC patch set for ffmpeg, downloaded from
-https://github.com/xbmc/FFmpeg/.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libavcodec/dxva2_h264.c | 8 ++++++++
- libavcodec/h264.c       | 1 +
- libavcodec/h264.h       | 2 ++
- libavcodec/h264_slice.c | 1 +
- 4 files changed, 12 insertions(+)
-
-diff --git a/libavcodec/dxva2_h264.c b/libavcodec/dxva2_h264.c
-index 6deccc3..85b25fd 100644
---- a/libavcodec/dxva2_h264.c
-+++ b/libavcodec/dxva2_h264.c
-@@ -451,6 +451,14 @@ static int dxva2_h264_end_frame(AVCodecContext *avctx)
- 
-     if (ctx_pic->slice_count <= 0 || ctx_pic->bitstream_size <= 0)
-         return -1;
-+
-+    // Wait for an I-frame before start decoding. Workaround for ATI UVD and UVD+ GPUs
-+    if (!h->got_first_iframe) {
-+        if (!(ctx_pic->pp.wBitFields & (1 << 15)))
-+            return -1;
-+        h->got_first_iframe = 1;
-+    }
-+
-     ret = ff_dxva2_common_end_frame(avctx, h->cur_pic_ptr->f,
-                                     &ctx_pic->pp, sizeof(ctx_pic->pp),
-                                     &ctx_pic->qm, sizeof(ctx_pic->qm),
-diff --git a/libavcodec/h264.c b/libavcodec/h264.c
-index 222bf58..ea2ec17 100644
---- a/libavcodec/h264.c
-+++ b/libavcodec/h264.c
-@@ -1085,6 +1085,7 @@ void ff_h264_flush_change(H264Context *h)
-     h->mmco_reset = 1;
-     for (i = 0; i < h->nb_slice_ctx; i++)
-         h->slice_ctx[i].list_count = 0;
-+    h->got_first_iframe = 0;
- }
- 
- /* forget old pics after a seek */
-diff --git a/libavcodec/h264.h b/libavcodec/h264.h
-index b94f06b..bc9458b 100644
---- a/libavcodec/h264.h
-+++ b/libavcodec/h264.h
-@@ -741,6 +741,8 @@ typedef struct H264Context {
-     int luma_weight_flag[2];    ///< 7.4.3.2 luma_weight_lX_flag
-     int chroma_weight_flag[2];  ///< 7.4.3.2 chroma_weight_lX_flag
- 
-+    int got_first_iframe;
-+
-     // Timestamp stuff
-     int sei_buffering_period_present;   ///< Buffering period SEI flag
-     int initial_cpb_removal_delay[32];  ///< Initial timestamps for CPBs
-diff --git a/libavcodec/h264_slice.c b/libavcodec/h264_slice.c
-index 53f61ca..b171d78 100644
---- a/libavcodec/h264_slice.c
-+++ b/libavcodec/h264_slice.c
-@@ -1189,6 +1189,7 @@ static int h264_slice_header_init(H264Context *h, int reinit)
-         ff_h264_free_tables(h, 0);
-     h->first_field           = 0;
-     h->prev_interlaced_frame = 1;
-+    h->got_first_iframe = 0;
- 
-     init_scan_tables(h);
-     ret = ff_h264_alloc_tables(h);
--- 
-2.1.0
-
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 3120a7a..61e1a3b 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	97be8a6c1cab2c52015544f76d40f6fd0babcb1b40cf601b4e57fb818564157c	ffmpeg-2.8.7.tar.xz
+sha256 71bc11f2a8202ef3fbe5e43a9a163b4b698855da39fb6216d9a4614eddd031db  ffmpeg-3.1.1.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a2026dc..a5511d4 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.7
+FFMPEG_VERSION = 3.1.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -41,7 +41,7 @@ FFMPEG_CONF_OPTS = \
 	--enable-runtime-cpudetect \
 	--disable-hardcoded-tables \
 	--disable-memalign-hack \
-	--disable-mipsdspr1 \
+	--disable-mipsdsp \
 	--disable-mipsdspr2 \
 	--disable-msa \
 	--enable-hwaccels \
@@ -58,7 +58,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-libnut \
 	--disable-libopenjpeg \
 	--disable-libschroedinger \
-	--disable-libvo-aacenc \
 	--disable-libvo-amrwbenc \
 	--disable-symver \
 	--disable-doc
@@ -218,13 +217,6 @@ FFMPEG_CONF_OPTS += --disable-openssl
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_LIBDCADEC),y)
-FFMPEG_CONF_OPTS += --enable-libdcadec
-FFMPEG_DEPENDENCIES += libdcadec
-else
-FFMPEG_CONF_OPTS += --disable-libdcadec
-endif
-
 ifeq ($(BR2_PACKAGE_LIBOPENH264),y)
 FFMPEG_CONF_OPTS += --enable-libopenh264
 FFMPEG_DEPENDENCIES += libopenh264
@@ -437,14 +429,6 @@ FFMPEG_CONF_OPTS += \
 	--enable-mipsfpu
 endif
 
-ifeq ($(BR2_mips_32r2),y)
-FFMPEG_CONF_OPTS += \
-	--enable-mips32r2
-else
-FFMPEG_CONF_OPTS += \
-	--disable-mips32r2
-endif
-
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 FFMPEG_CONF_OPTS += --enable-altivec
 else
-- 
2.8.1
