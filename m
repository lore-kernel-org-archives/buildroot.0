From: Martin Kepplinger <martink@posteo.de>
Date: Wed,  1 Jul 2020 12:50:41 +0200
Subject: [Buildroot] [PATCH] package/tslib: update to 1.22
Message-ID: <20200701105041.2075-1-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The removed patches are of course part of this release and
https://github.com/libts/tslib/releases has a very short changelog.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 386 ------------------
 ...-with-input_event_sec-for-old-kernel.patch |  28 --
 package/tslib/tslib.hash                      |   4 +-
 package/tslib/tslib.mk                        |   2 +-
 4 files changed, 3 insertions(+), 417 deletions(-)
 delete mode 100644 package/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 delete mode 100644 package/tslib/0002-Fix-build-error-with-input_event_sec-for-old-kernel.patch

diff --git a/package/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/package/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
deleted file mode 100644
index 70a3f25f59..0000000000
--- a/package/tslib/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ /dev/null
@@ -1,386 +0,0 @@
-From 09eeff8c90a82e7aa9ff215320d558c1147982f6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Nov 2019 19:59:29 -0800
-Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
-
-time element is deprecated on new input_event structure in kernel's
-input.h [1]
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/libts/tslib/commit/a7a39a67f9a7f7fab9765d412ab42869a5c5c858]
----
- plugins/input-raw.c | 59 +++++++++++++++++++++++++++-------------
- tools/ts_uinput.c   | 66 ++++++++++++++++++++++++++++++---------------
- 2 files changed, 85 insertions(+), 40 deletions(-)
-
-diff --git a/plugins/input-raw.c b/plugins/input-raw.c
-index 64f0156..f030836 100644
---- a/plugins/input-raw.c
-+++ b/plugins/input-raw.c
-@@ -40,6 +40,11 @@
- # include <linux/input.h>
- #endif
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- #ifndef EV_SYN /* 2.4 kernel headers */
- # define EV_SYN 0x00
- #endif
-@@ -384,7 +389,8 @@ static int ts_input_read(struct tslib_module_info *inf,
- 						samp->y = i->current_y;
- 						samp->pressure = i->current_p;
- 					}
--					samp->tv = ev.time;
-+					samp->tv.tv_sec = ev.input_event_sec;
-+					samp->tv.tv_usec = ev.input_event_usec;
- 			#ifdef DEBUG
- 				fprintf(stderr,
- 					"RAW---------------------> %d %d %d %ld.%ld\n",
-@@ -519,7 +525,8 @@ static int ts_input_read(struct tslib_module_info *inf,
- 					samp->pressure = i->current_p = ev.value;
- 					break;
- 				}
--				samp->tv = ev.time;
-+				samp->tv.tv_sec = ev.input_event_sec;
-+				samp->tv.tv_usec = ev.input_event_usec;
- 	#ifdef DEBUG
- 				fprintf(stderr,
- 					"RAW---------------------------> %d %d %d\n",
-@@ -536,7 +543,8 @@ static int ts_input_read(struct tslib_module_info *inf,
- 						samp->x = 0;
- 						samp->y = 0;
- 						samp->pressure = 0;
--						samp->tv = ev.time;
-+						samp->tv.tv_sec = ev.input_event_sec;
-+						samp->tv.tv_usec = ev.input_event_usec;
- 						samp++;
- 						total++;
- 					}
-@@ -651,7 +659,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 				switch (i->ev[it].code) {
- 				case BTN_TOUCH:
- 					i->buf[total][i->slot].pen_down = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					if (i->ev[it].value == 0)
- 						pen_up = 1;
-@@ -751,7 +760,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					// fall through
- 				case ABS_MT_POSITION_X:
- 					i->buf[total][i->slot].x = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_Y:
-@@ -760,7 +770,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					// fall through
- 				case ABS_MT_POSITION_Y:
- 					i->buf[total][i->slot].y = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_PRESSURE:
-@@ -769,12 +780,14 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					// fall through
- 				case ABS_MT_PRESSURE:
- 					i->buf[total][i->slot].pressure = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_TOOL_X:
- 					i->buf[total][i->slot].tool_x = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					/* for future use
- 					 * i->buf[total][i->slot].valid |= TSLIB_MT_VALID_TOOL;
-@@ -782,7 +795,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					break;
- 				case ABS_MT_TOOL_Y:
- 					i->buf[total][i->slot].tool_y = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					/* for future use
- 					 * i->buf[total][i->slot].valid |= TSLIB_MT_VALID_TOOL;
-@@ -790,7 +804,8 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					break;
- 				case ABS_MT_TOOL_TYPE:
- 					i->buf[total][i->slot].tool_type = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					/* for future use
- 					 * i->buf[total][i->slot].valid |= TSLIB_MT_VALID_TOOL;
-@@ -798,12 +813,14 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					break;
- 				case ABS_MT_ORIENTATION:
- 					i->buf[total][i->slot].orientation = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_DISTANCE:
- 					i->buf[total][i->slot].distance = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 
- 					if (i->special_device == EGALAX_VERSION_210) {
-@@ -816,34 +833,40 @@ static int ts_input_read_mt(struct tslib_module_info *inf,
- 					break;
- 				case ABS_MT_BLOB_ID:
- 					i->buf[total][i->slot].blob_id = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_TOUCH_MAJOR:
- 					i->buf[total][i->slot].touch_major = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					if (i->ev[it].value == 0)
- 						i->buf[total][i->slot].pressure = 0;
- 					break;
- 				case ABS_MT_WIDTH_MAJOR:
- 					i->buf[total][i->slot].width_major = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_TOUCH_MINOR:
- 					i->buf[total][i->slot].touch_minor = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_WIDTH_MINOR:
- 					i->buf[total][i->slot].width_minor = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					break;
- 				case ABS_MT_TRACKING_ID:
- 					i->buf[total][i->slot].tracking_id = i->ev[it].value;
--					i->buf[total][i->slot].tv = i->ev[it].time;
-+					i->buf[total][i->slot].tv.tv_sec = i->ev[it].input_event_sec;
-+					i->buf[total][i->slot].tv.tv_usec = i->ev[it].input_event_usec;
- 					i->buf[total][i->slot].valid |= TSLIB_MT_VALID;
- 					if (i->ev[it].value == -1)
- 						i->buf[total][i->slot].pressure = 0;
-diff --git a/tools/ts_uinput.c b/tools/ts_uinput.c
-index 6ca4c3d..1832a07 100644
---- a/tools/ts_uinput.c
-+++ b/tools/ts_uinput.c
-@@ -170,14 +170,16 @@ static int send_touch_events(struct data_t *data, struct ts_sample_mt **s,
- 				continue;
- 
- 			if (s[j][i].pen_down == 1) {
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_KEY;
- 				data->ev[c].code = BTN_TOUCH;
- 				data->ev[c].value = s[j][i].pen_down;
- 				c++;
- 			}
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_SLOT;
- 			data->ev[c].value = s[j][i].slot;
-@@ -190,111 +192,129 @@ static int send_touch_events(struct data_t *data, struct ts_sample_mt **s,
- 			 * we should use slot 1 and so on.
- 			 */
- 			if (i == 0) {
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_ABS;
- 				data->ev[c].code = ABS_X;
- 				data->ev[c].value = s[j][i].x;
- 				c++;
- 
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_ABS;
- 				data->ev[c].code = ABS_Y;
- 				data->ev[c].value = s[j][i].y;
- 				c++;
- 
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_ABS;
- 				data->ev[c].code = ABS_PRESSURE;
- 				data->ev[c].value = s[j][i].pressure;
- 				c++;
- 			}
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_POSITION_X;
- 			data->ev[c].value = s[j][i].x;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_POSITION_Y;
- 			data->ev[c].value = s[j][i].y;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_PRESSURE;
- 			data->ev[c].value = s[j][i].pressure;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOUCH_MAJOR;
- 			data->ev[c].value = s[j][i].touch_major;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_WIDTH_MAJOR;
- 			data->ev[c].value = s[j][i].width_major;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOUCH_MINOR;
- 			data->ev[c].value = s[j][i].touch_minor;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_WIDTH_MINOR;
- 			data->ev[c].value = s[j][i].width_minor;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOOL_TYPE;
- 			data->ev[c].value = s[j][i].tool_type;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOOL_X;
- 			data->ev[c].value = s[j][i].tool_x;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TOOL_Y;
- 			data->ev[c].value = s[j][i].tool_y;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_ORIENTATION;
- 			data->ev[c].value = s[j][i].orientation;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_DISTANCE;
- 			data->ev[c].value = s[j][i].distance;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_BLOB_ID;
- 			data->ev[c].value = s[j][i].blob_id;
- 			c++;
- 
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_ABS;
- 			data->ev[c].code = ABS_MT_TRACKING_ID;
- 			data->ev[c].value = s[j][i].tracking_id;
- 			c++;
- 
- 			if (data->mt_type_a == 1) {
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_SYN;
- 				data->ev[c].code = SYN_MT_REPORT;
- 				data->ev[c].value = 0;
-@@ -302,7 +322,8 @@ static int send_touch_events(struct data_t *data, struct ts_sample_mt **s,
- 			}
- 
- 			if (s[j][i].pen_down == 0) {
--				data->ev[c].time = s[j][i].tv;
-+				data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+				data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 				data->ev[c].type = EV_KEY;
- 				data->ev[c].code = BTN_TOUCH;
- 				data->ev[c].value = s[j][i].pen_down;
-@@ -312,7 +333,8 @@ static int send_touch_events(struct data_t *data, struct ts_sample_mt **s,
- 		}
- 
- 		if (c > 0) {
--			data->ev[c].time = s[j][i].tv;
-+			data->ev[c].input_event_sec = s[j][i].tv.tv_sec;
-+			data->ev[c].input_event_usec = s[j][i].tv.tv_usec;
- 			data->ev[c].type = EV_SYN;
- 			data->ev[c].code = SYN_REPORT;
- 			data->ev[c].value = 0;
diff --git a/package/tslib/0002-Fix-build-error-with-input_event_sec-for-old-kernel.patch b/package/tslib/0002-Fix-build-error-with-input_event_sec-for-old-kernel.patch
deleted file mode 100644
index 5dca3a009c..0000000000
--- a/package/tslib/0002-Fix-build-error-with-input_event_sec-for-old-kernel.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 050bf24c16e95f63a76e13156346a072035d45b4 Mon Sep 17 00:00:00 2001
-From: Evan Harvey <evanwork1234@gmail.com>
-Date: Thu, 19 Mar 2020 01:32:03 -0700
-Subject: [PATCH] Fix build error with input_event_sec for old kernel
-
-[Retrieved from:
-https://github.com/libts/tslib/commit/050bf24c16e95f63a76e13156346a072035d45b4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/ts_uinput.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/tools/ts_uinput.c b/tools/ts_uinput.c
-index 1832a07..9c40bb3 100644
---- a/tools/ts_uinput.c
-+++ b/tools/ts_uinput.c
-@@ -51,6 +51,11 @@
- #include <linux/fb.h>
- #endif
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- #define RESET   "\033[0m"
- #define RED     "\033[31m"
- #define GREEN   "\033[32m"
diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 521e6c94bf..762fbebb26 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/libts/tslib/releases/download/1.21/tslib-1.21.tar.xz.sha256
-sha256  d2a57b823ea59e53a3b130eef05dfed1190b857854f886eec764e1ca1957cf56  tslib-1.21.tar.xz
+# https://github.com/libts/tslib/releases/download/1.22/tslib-1.22.tar.xz.sha256
+sha256  aaf0aed410a268d7b51385d07fe4d9d64312038e87c447ec8a24c8db0a15617a  tslib-1.22.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 3a1b7a2188..45e29808bd 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.21
+TSLIB_VERSION = 1.22
 TSLIB_SITE = https://github.com/libts/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
-- 
2.20.1
