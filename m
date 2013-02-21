From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:41 +0100
Subject: [Buildroot] [PATCH 11/13] libshairport: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <b0b591df9513c8714c641b591d64591e38dc554f.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libshairport is a client library that emulates an airplay server
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                                  |    1 +
 package/libshairport/Config.in                     |   12 +
 .../libshairport-1.2.0.20310_lib-001_add_ao.patch  |  270 +++++++
 ...rt-1.2.0.20310_lib-002_fix_install_header.patch |   12 +
 ...hairport-1.2.0.20310_lib-003_fix_deadlock.patch |   10 +
 ...irport-1.2.0.20310_lib-004_fix_bad_access.patch |   22 +
 ...hairport-1.2.0.20310_lib-005_fix_shutdown.patch |   10 +
 ...ibshairport-1.2.0.20310_lib-006_no_printf.patch |  843 ++++++++++++++++++++
 ...rt-1.2.0.20310_lib-007_fix_syslog_defines.patch |   24 +
 ...port-1.2.0.20310_lib-008-add-missing-libs.patch |   21 +
 ...libshairport-1.2.0.20310_lib-009_fix_ipv6.patch |   22 +
 package/libshairport/libshairport.mk               |   13 +
 12 files changed, 1260 insertions(+)
 create mode 100644 package/libshairport/Config.in
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-002_fix_install_header.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-003_fix_deadlock.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-004_fix_bad_access.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-005_fix_shutdown.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-006_no_printf.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-007_fix_syslog_defines.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-008-add-missing-libs.patch
 create mode 100644 package/libshairport/libshairport-1.2.0.20310_lib-009_fix_ipv6.patch
 create mode 100644 package/libshairport/libshairport.mk

diff --git a/package/Config.in b/package/Config.in
index 6e926bf..d798137 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -526,6 +526,7 @@ source "package/liboping/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
 source "package/librsync/Config.in"
+source "package/libshairport/Config.in"
 source "package/libsoup/Config.in"
 source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
diff --git a/package/libshairport/Config.in b/package/libshairport/Config.in
new file mode 100644
index 0000000..23ba5ed
--- /dev/null
+++ b/package/libshairport/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBSHAIRPORT
+	bool "libshairport"
+	select BR2_PACKAGE_OPENSSL
+	depends on BR2_INET_IPV6
+	help
+	  libshaiport is a client library that emulates an airplay
+	  server
+
+	  https://github.com/albertz/shairport
+
+comment "libshairport requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch b/package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch
new file mode 100644
index 0000000..b2debed
--- /dev/null
+++ b/package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch
@@ -0,0 +1,270 @@
+diff -uP libshairport-1.2.0.20310_lib/src/ao.h ../../../../../libshairport-1.2.0.20310_lib/src/ao.h
+--- libshairport-1.2.0.20310_lib-org/src/ao.h	1970-01-01 01:00:00.000000000 +0100
++++ libshairport-1.2.0.20310_lib-mod/src/ao.h	2011-09-25 20:36:36.000000000 +0200
+@@ -0,0 +1,156 @@
++/*
++ *
++ *  ao.h 
++ *
++ *  Original Copyright (C) Aaron Holtzman - May 1999
++ *      Modifications Copyright (C) Stan Seibert - July 2000, July 2001
++ *      More Modifications Copyright (C) Jack Moffitt - October 2000
++ *
++ *  This file is part of libao, a cross-platform audio outputlibrary.  See
++ *  README for a history of this source code.
++ *
++ *  libao is free software; you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation; either version 2, or (at your option)
++ *  any later version.
++ *
++ *  libao is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with GNU Make; see the file COPYING.  If not, write to
++ *  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
++ *
++ */
++#ifndef __AO_H__
++#define __AO_H__
++
++#ifdef __cplusplus
++extern "C"
++{
++#endif /* __cplusplus */
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <stdint.h>
++#include <errno.h>
++
++/* --- Constants ---*/
++
++#define AO_TYPE_LIVE 1
++#define AO_TYPE_FILE 2
++
++
++#define AO_ENODRIVER   1
++#define AO_ENOTFILE    2
++#define AO_ENOTLIVE    3
++#define AO_EBADOPTION  4
++#define AO_EOPENDEVICE 5
++#define AO_EOPENFILE   6
++#define AO_EFILEEXISTS 7
++#define AO_EBADFORMAT  8
++
++#define AO_EFAIL       100
++
++
++#define AO_FMT_LITTLE 1
++#define AO_FMT_BIG    2
++#define AO_FMT_NATIVE 4
++
++/* --- Structures --- */
++
++typedef struct ao_info {
++  int  type; /* live output or file output? */
++  char *name; /* full name of driver */
++  char *short_name; /* short name of driver */
++        char *author; /* driver author */
++  char *comment; /* driver comment */
++  int  preferred_byte_format;
++  int  priority;
++  char **options;
++  int  option_count;
++} ao_info;
++
++typedef struct ao_functions ao_functions;
++typedef struct ao_device ao_device;
++
++typedef struct ao_sample_format {
++  int  bits; /* bits per sample */
++  int  rate; /* samples per second (in a single channel) */
++  int  channels; /* number of audio channels */
++  int  byte_format; /* Byte ordering in sample, see constants below */
++        char *matrix; /* input channel location/ordering */
++} ao_sample_format;
++
++typedef struct ao_option {
++  char *key;
++  char *value;
++  struct ao_option *next;
++} ao_option;
++
++#if defined(AO_BUILDING_LIBAO)
++#include "ao_private.h"
++#endif
++
++/* --- Functions --- */
++
++/* library setup/teardown */
++void ao_initialize(void);
++void ao_shutdown(void);
++
++/* device setup/playback/teardown */
++int   ao_append_global_option(const char *key,
++                              const char *value);
++int          ao_append_option(ao_option **options,
++                              const char *key,
++                              const char *value);
++void          ao_free_options(ao_option *options);
++
++char* ao_get_option(ao_option *options, const char* key);
++
++ao_device*       ao_open_live(int driver_id,
++                              ao_sample_format *format,
++                              ao_option *option);
++ao_device*       ao_open_file(int driver_id,
++                              const char *filename,
++                              int overwrite,
++                              ao_sample_format *format,
++                              ao_option *option);
++
++int                   ao_play(ao_device *device,
++                              char *output_samples,
++                              uint32_t num_bytes);
++int                  ao_close(ao_device *device);
++
++/* driver information */
++int              ao_driver_id(const char *short_name);
++int      ao_default_driver_id(void);
++ao_info       *ao_driver_info(int driver_id);
++ao_info **ao_driver_info_list(int *driver_count);
++char       *ao_file_extension(int driver_id);
++
++/* miscellaneous */
++int          ao_is_big_endian(void);
++
++
++#ifdef __cplusplus
++}
++#endif /* __cplusplus */
++
++#endif  /* __AO_H__ */
++
++extern struct AudioOutput g_ao;
++struct AudioOutput                                                                                                                                                                                              
++  {                                                                                                                                                                                                              
++      void (*ao_initialize)(void);                                                                                                                                                                               
++      int (*ao_play)(ao_device *, char *, uint32_t);                                                                                                                                                             
++      int (*ao_default_driver_id)(void);                                                                                                                                                                         
++      ao_device* (*ao_open_live)( int, ao_sample_format *, ao_option *);                                                                                                                                         
++      int (*ao_close)(ao_device *);                                                                                                                                                                              
++      /* -- Device Setup/Playback/Teardown -- */                                                                                                                                                                 
++      int (*ao_append_option)(ao_option **, const char *, const char *);                                                                                                                                         
++      void (*ao_free_options)(ao_option *);                                                                                                                                                                      
++      char* (*ao_get_option)(ao_option *, const char* );                                                                                                                                                         
++  }; 
+diff -uP libshairport-1.2.0.20310_lib/src/hairtunes.c ../../../../../libshairport-1.2.0.20310_lib/src/hairtunes.c
+--- libshairport-1.2.0.20310_lib-org/src/hairtunes.c	2011-09-23 21:55:48.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/hairtunes.c	2011-09-25 20:37:49.000000000 +0200
+@@ -25,7 +25,7 @@
+  */
+ 
+ #define XBMC
+-//#defined HAS_AO
++#define HAS_AO
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -45,7 +45,7 @@
+ #include <sys/signal.h>
+ #include <fcntl.h>
+ #ifdef HAS_AO
+-#include <ao/ao.h>
++#include "ao.h"
+ #endif
+ 
+ #ifdef FANCY_RESAMPLING
+@@ -881,7 +881,7 @@
+             }
+ #ifdef HAS_AO
+         } else {
+-            ao_play(dev, (char *)outbuf, play_samples*4);
++            g_ao.ao_play(dev, (char *)outbuf, play_samples*4);
+ #endif
+         }
+     }
+@@ -906,7 +906,7 @@
+ ao_device *dev;
+ 
+ void* init_ao() {
+-    ao_initialize();
++    g_ao.ao_initialize();
+ 
+     int driver;
+ #ifndef XBMC
+@@ -921,7 +921,7 @@
+ #endif
+     {
+         // otherwise choose the default
+-        driver = ao_default_driver_id();
++        driver = g_ao.ao_default_driver_id();
+     }
+ 
+     ao_sample_format fmt;
+@@ -944,9 +944,9 @@
+     }
+ #endif
+ 
+-    ao_append_option(&ao_opts, "name", "Streaming...");
++    g_ao.ao_append_option(&ao_opts, "name", "Streaming...");
+ 
+-    dev = ao_open_live(driver, &fmt, ao_opts);
++    dev = g_ao.ao_open_live(driver, &fmt, ao_opts);
+     if (dev == NULL) {
+         die("Could not open ao device");
+     }
+@@ -985,7 +985,7 @@
+   audio_running = 0;
+   pthread_join(audio_thread, NULL);
+ #ifdef HAS_AO
+-  ao_close(dev);
++  g_ao.ao_close(dev);
+ #endif
+ }
+ 
+diff -uP libshairport-1.2.0.20310_lib/src/shairport.c ../../../../../libshairport-1.2.0.20310_lib/src/shairport.c
+--- libshairport-1.2.0.20310_lib-org/src/shairport.c	2011-08-21 01:57:56.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/shairport.c	2011-09-25 20:44:40.000000000 +0200
+@@ -92,6 +92,14 @@
+ static char tPassword[56] = "";
+ static char tHWID[HWID_SIZE] = {0,51,52,53,54,55};
+ 
++#ifdef XBMC
++struct AudioOutput g_ao;
++void shairport_set_ao(struct AudioOutput *ao)
++{
++ g_ao=*ao;
++}
++#endif
++
+ #ifndef XBMC
+ int main(int argc, char **argv)
+ #else
+diff -uP libshairport-1.2.0.20310_lib/src/shairport.h ../../../../../libshairport-1.2.0.20310_lib/src/shairport.h
+--- libshairport-1.2.0.20310_lib-org/src/shairport.h	2011-08-21 01:58:11.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/shairport.h	2011-09-25 20:36:43.000000000 +0200
+@@ -11,6 +11,7 @@
+ #include <regex.h>
+ #include <sys/types.h>
+ #include <regex.h>
++#include "ao.h"
+ 
+ 
+ #define HWID_SIZE 6
+@@ -62,9 +63,11 @@
+ void shairport_exit(void);
+ int shairport_loop(void);
+ int shairport_is_running(void);
++void shairport_set_ao(struct AudioOutput *ao);
+ 
+ #ifdef __cplusplus
+ }
+ #endif /* __cplusplus */
+ 
+ #endif
++
diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-002_fix_install_header.patch b/package/libshairport/libshairport-1.2.0.20310_lib-002_fix_install_header.patch
new file mode 100644
index 0000000..0563f6b
--- /dev/null
+++ b/package/libshairport/libshairport-1.2.0.20310_lib-002_fix_install_header.patch
@@ -0,0 +1,12 @@
+--- libshairport-1.2.0.20310_lib-org/src/Makefile.am.old	2011-09-23 23:14:39.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/Makefile.am	2011-09-25 21:38:08.000000000 +0200
+@@ -1,7 +1,7 @@
+ lib_LTLIBRARIES=libshairport.la
+ 
+-library_includedir=$(includedir)
+-library_include_HEADERS = shairport.h
++library_includedir=$(includedir)/shairport
++library_include_HEADERS = shairport.h ao.h socketlib.h
+ 
+ libshairport_la_SOURCES=shairport.c hairtunes.c socketlib.c alac.c
+ libshairport_la_LDFLAGS=-dynamiclib
diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-003_fix_deadlock.patch b/package/libshairport/libshairport-1.2.0.20310_lib-003_fix_deadlock.patch
new file mode 100644
index 0000000..e419ffb
--- /dev/null
+++ b/package/libshairport/libshairport-1.2.0.20310_lib-003_fix_deadlock.patch
@@ -0,0 +1,10 @@
+--- libshairport-1.2.0.20310_lib-org/src/hairtunes.c.orig	2011-09-25 21:58:08.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/hairtunes.c	2011-09-25 21:58:12.000000000 +0200
+@@ -991,6 +991,7 @@
+ 
+ void hairtunes_cleanup(void)
+ {
++  pthread_cond_signal(&ab_buffer_ready);
+   clean_output();
+   clean_rtp();
+   clean_buffer();
diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-004_fix_bad_access.patch b/package/libshairport/libshairport-1.2.0.20310_lib-004_fix_bad_access.patch
new file mode 100644
index 0000000..f61bdef
--- /dev/null
+++ b/package/libshairport/libshairport-1.2.0.20310_lib-004_fix_bad_access.patch
@@ -0,0 +1,22 @@
+--- libshairport-1.2.0.20310_lib-org/src/hairtunes.c.orig	2011-09-25 23:26:56.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/hairtunes.c	2011-09-25 23:29:27.000000000 +0200
+@@ -89,7 +89,6 @@
+ // maximal resampling shift - conservative
+ #define OUTFRAME_BYTES (4*(frame_size+3))
+ 
+-
+ alac_file *decoder_info;
+ 
+ #ifdef FANCY_RESAMPLING
+@@ -849,6 +848,11 @@
+             inbuf = buffer_get_frame();
+         } while (!inbuf && audio_running);
+ 
++        if(!audio_running)
++        {
++          return 0; //don't access inbuf if audio stopped
++        }
++
+ #ifdef FANCY_RESAMPLING
+         if (fancy_resampling) {
+ 	        int i;
diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-005_fix_shutdown.patch b/package/libshairport/libshairport-1.2.0.20310_lib-005_fix_shutdown.patch
new file mode 100644
index 0000000..8cb0d88
--- /dev/null
+++ b/package/libshairport/libshairport-1.2.0.20310_lib-005_fix_shutdown.patch
@@ -0,0 +1,10 @@
+--- libshairport-1.2.0.20310_lib-org/src/shairport.c	2011-09-25 23:58:06.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/shairport.c.new	2011-09-25 23:57:54.000000000 +0200
+@@ -368,6 +368,7 @@
+ void shairport_exit(void)
+ {
+   m_running = 0;
++  close(tServerSock);
+ }
+ 
+ int shairport_is_running(void)
diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-006_no_printf.patch b/package/libshairport/libshairport-1.2.0.20310_lib-006_no_printf.patch
new file mode 100644
index 0000000..653b255
--- /dev/null
+++ b/package/libshairport/libshairport-1.2.0.20310_lib-006_no_printf.patch
@@ -0,0 +1,843 @@
+--- libshairport-1.2.0.20310_lib-org/src/alac.c	2011-08-21 00:06:21.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/alac.c	2011-10-01 04:12:09.000000000 +0200
+@@ -804,7 +804,7 @@
+             }
+             else
+             {
+-                fprintf(stderr, "FIXME: unhandled predicition type: %i\n", prediction_type);
++                xprintf("FIXME: unhandled predicition type: %i\n", prediction_type);
+                 /* i think the only other prediction type (or perhaps this is just a
+                  * boolean?) runs adaptive fir twice.. like:
+                  * predictor_decompress_fir_adapt(predictor_error, tempout, ...)
+@@ -885,7 +885,7 @@
+         }
+         case 20:
+         case 32:
+-            fprintf(stderr, "FIXME: unimplemented sample size %i\n", alac->setinfo_sample_size);
++            xprintf("FIXME: unimplemented sample size %i\n", alac->setinfo_sample_size);
+             break;
+         default:
+             break;
+@@ -1004,7 +1004,7 @@
+             }
+             else
+             { /* see mono case */
+-                fprintf(stderr, "FIXME: unhandled predicition type: %i\n", prediction_type_a);
++                xprintf("FIXME: unhandled predicition type: %i\n", prediction_type_a);
+             }
+ 
+             /* channel 2 */
+@@ -1029,7 +1029,7 @@
+             }
+             else
+             {
+-                fprintf(stderr, "FIXME: unhandled predicition type: %i\n", prediction_type_b);
++                xprintf("FIXME: unhandled predicition type: %i\n", prediction_type_b);
+             }
+         }
+         else
+@@ -1106,7 +1106,7 @@
+         }
+         case 20:
+         case 32:
+-            fprintf(stderr, "FIXME: unimplemented sample size %i\n", alac->setinfo_sample_size);
++            xprintf("FIXME: unimplemented sample size %i\n", alac->setinfo_sample_size);
+             break;
+         default:
+             break;
+--- libshairport-1.2.0.20310_lib-org/src/hairtunes.c	2011-10-01 17:45:08.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/hairtunes.c	2011-10-01 17:42:07.000000000 +0200
+@@ -121,8 +121,8 @@
+ pthread_cond_t ab_buffer_ready;
+ 
+ static void die(char *why) {
+-    fprintf(stderr, "FATAL: %s\n", why);
+-    exit(1);
++    xprintf("FATAL: %s\n", why);
++    //exit(1);
+ }
+ 
+ static int hex2bin(unsigned char *buf, char *hex) {
+@@ -245,13 +245,13 @@
+             continue;
+         }
+         if (!strcmp(line, "exit\n")) {
+-            exit(0);
++            ;//exit(0);
+         }
+         if (!strcmp(line, "flush\n")) {
+             hairtunes_flush();
+         }
+     }
+-    fprintf(stderr, "bye!\n");
++    xprintf("bye!\n");
+     fflush(stderr);
+ #endif
+ 
+@@ -262,7 +262,7 @@
+ {
+   assert(f<=0);
+   if (debug)
+-      fprintf(stderr, "VOL: %lf\n", f);
++      xprintf("VOL: %lf\n", f);
+   volume = pow(10.0,0.05*f);
+   fix_volume = 65536.0 * volume;
+ }
+@@ -273,7 +273,7 @@
+   ab_resync();
+   pthread_mutex_unlock(&ab_mutex);
+   if (debug)
+-      fprintf(stderr, "FLUSH\n");
++      xprintf("FLUSH\n");
+ }
+ 
+ #ifdef HAIRTUNES_STANDALONE
+@@ -423,7 +423,7 @@
+     } else if (seq_order(ab_read, seqno)) {     // late but not yet played
+         abuf = audio_buffer + BUFIDX(seqno);
+     } else {    // too late.
+-        fprintf(stderr, "\nlate packet %04X (%04X:%04X)\n", seqno, ab_read, ab_write);
++        xprintf("\nlate packet %04X (%04X:%04X)\n", seqno, ab_read, ab_write);
+     }
+     buf_fill = ab_write - ab_read;
+     pthread_mutex_unlock(&ab_mutex);
+@@ -520,7 +520,7 @@
+     if (seq_order(last, first))
+         return;
+ 
+-    fprintf(stderr, "requesting resend on %d packets (port %d)\n", last-first+1, controlport);
++    xprintf("requesting resend on %d packets (port %d)\n", last-first+1, controlport);
+ 
+     char req[8];    // *not* a standard RTCP NACK
+     req[0] = 0x80;
+@@ -604,8 +604,8 @@
+         port += 3;
+     }
+ 
+-    printf("port: %d\n", port); // let our handler know where we end up listening
+-    printf("cport: %d\n", port+1);
++    xprintf("port: %d\n", port); // let our handler know where we end up listening
++    xprintf("cport: %d\n", port+1);
+ 
+     rtp_sockets[0] = sock;
+     rtp_sockets[1] = csock;
+@@ -708,7 +708,7 @@
+     bf_est_drift = biquad_filt(&bf_drift_lpf, CONTROL_B*(bf_est_err*CONTROL_A + err_deriv) + bf_est_drift);
+ 
+     if (debug)
+-        fprintf(stderr, "bf %d err %f drift %f desiring %f ed %f estd %f\r", fill, bf_est_err, bf_est_drift, desired_fill, err_deriv, err_deriv + CONTROL_A*bf_est_err);
++        xprintf("bf %d err %f drift %f desiring %f ed %f estd %f\r", fill, bf_est_err, bf_est_drift, desired_fill, err_deriv, err_deriv + CONTROL_A*bf_est_err);
+     bf_playback_rate = 1.0 + CONTROL_A*bf_est_err + bf_est_drift;
+ 
+     bf_last_err = bf_est_err;
+@@ -724,7 +724,7 @@
+     buf_fill = ab_write - ab_read;
+     if (buf_fill < 1 || !ab_synced || ab_buffering) {    // init or underrun. stop and wait
+         if (ab_synced)
+-          fprintf(stderr, "\nunderrun\n");
++          xprintf("\nunderrun\n");
+ 
+         ab_buffering = 1;
+         pthread_cond_wait(&ab_buffer_ready, &ab_mutex);
+@@ -736,7 +736,7 @@
+         return 0;
+     }
+     if (buf_fill >= BUFFER_FRAMES) {   // overrunning! uh-oh. restart at a sane distance
+-        fprintf(stderr, "\noverrun.\n");
++        xprintf("\noverrun.\n");
+         ab_read = ab_write - START_FILL;
+     }
+     read = ab_read;
+@@ -748,7 +748,7 @@
+ 
+     volatile abuf_t *curframe = audio_buffer + BUFIDX(read);
+     if (!curframe->ready) {
+-        fprintf(stderr, "\nmissing frame.\n");
++        xprintf("\nmissing frame.\n");
+         memset(curframe->data, 0, FRAME_BYTES);
+     }
+     curframe->ready = 0;
+@@ -775,13 +775,13 @@
+     if (stuff) {
+         if (stuff==1) {
+             if (debug)
+-                fprintf(stderr, "+++++++++\n");
++                xprintf("+++++++++\n");
+             // interpolate one sample
+             *outptr++ = dithered_vol(((long)inptr[-2] + (long)inptr[0]) >> 1);
+             *outptr++ = dithered_vol(((long)inptr[-1] + (long)inptr[1]) >> 1);
+         } else if (stuff==-1) {
+             if (debug)
+-                fprintf(stderr, "---------\n");
++                xprintf("---------\n");
+             inptr++;
+             inptr++;
+         }
+--- libshairport-1.2.0.20310_lib-org/src/shairport.c	2011-10-01 17:45:08.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/shairport.c	2011-10-01 17:41:04.000000000 +0200
+@@ -31,6 +31,27 @@
+ #include "shairport.h"
+ #include "hairtunes.h"
+ 
++static struct printfPtr g_printf={NULL};
++
++int xprintf(const char *format, ...)
++{
++  char dbg[2048];
++  va_list args;
++  va_start(args, format);
++  vsnprintf(dbg, sizeof(dbg), format, args);
++  va_end(args);
++  if(g_printf.extprintf)
++  {
++    g_printf.extprintf(dbg, sizeof(dbg));
++  }
++  else 
++  {
++    printf(dbg);
++  }
++
++  return 1;
++}
++
+ #ifndef TRUE
+ #define TRUE (-1)
+ #endif
+@@ -98,6 +119,11 @@
+ {
+  g_ao=*ao;
+ }
++
++void shairport_set_printf(struct printfPtr *funcPtr)
++{
++  g_printf = *funcPtr;
++}
+ #endif
+ 
+ #ifndef XBMC
+@@ -106,7 +132,7 @@
+ int shairport_main(int argc, char **argv)
+ #endif
+ {
+-  printf("initializing shairport\n");
++  xprintf("initializing shairport\n",NULL);
+   char tHWID_Hex[HWID_SIZE * 2 + 1];
+   char tKnownHwid[32];
+ 
+@@ -185,22 +211,22 @@
+     }    
+     else if(!strcmp(arg, "-h") || !strcmp(arg, "--help"))
+     {
+-      slog(LOG_INFO, "ShairPort version 0.05 C port - Airport Express emulator\n");
+-      slog(LOG_INFO, "Usage:\nshairport [OPTION...]\n\nOptions:\n");
+-      slog(LOG_INFO, "  -a, --apname=AirPort    Sets Airport name\n");
+-      slog(LOG_INFO, "  -p, --password=secret   Sets Password (not working)\n");
+-      slog(LOG_INFO, "  -o, --server_port=5000  Sets Port for Avahi/dns-sd\n");
+-      slog(LOG_INFO, "  -b, --buffer=282        Sets Number of frames to buffer before beginning playback\n");
+-      slog(LOG_INFO, "  -d                      Daemon mode\n");
+-      slog(LOG_INFO, "  -q, --quiet             Supresses all output.\n");
+-      slog(LOG_INFO, "  -v,-v2,-v3,-vv          Various debugging levels\n");
+-      slog(LOG_INFO, "\n");
++      xprintf("ShairPort version 0.05 C port - Airport Express emulator\n");
++      xprintf("Usage:\nshairport [OPTION...]\n\nOptions:\n");
++      xprintf("  -a, --apname=AirPort    Sets Airport name\n");
++      xprintf("  -p, --password=secret   Sets Password (not working)\n");
++      xprintf("  -o, --server_port=5000  Sets Port for Avahi/dns-sd\n");
++      xprintf("  -b, --buffer=282        Sets Number of frames to buffer before beginning playback\n");
++      xprintf("  -d                      Daemon mode\n");
++      xprintf("  -q, --quiet             Supresses all output.\n");
++      xprintf("  -v,-v2,-v3,-vv          Various debugging levels\n");
++      xprintf("\n");
+       return 0;
+     }    
+   }
+ 
+   if ( buffer_start_fill < 30 || buffer_start_fill > BUFFER_FRAMES ) { 
+-     fprintf(stderr, "buffer value must be > 30 and < %d\n", BUFFER_FRAMES);
++     xprintf("buffer value must be > 30 and < %d\n", BUFFER_FRAMES);
+      return(0);
+   }
+ 
+@@ -209,11 +235,11 @@
+     int tPid = fork();
+     if(tPid < 0)
+     {
+-      exit(1); // Error on fork
++      //exit(1); // Error on fork
+     }
+     else if(tPid > 0)
+     {
+-      exit(0);
++      //exit(0);
+     }
+     else
+     {
+@@ -254,10 +280,10 @@
+     sscanf(tHWID_Hex, "%02X%02X%02X%02X%02X%02X", &tHWID[0], &tHWID[1], &tHWID[2], &tHWID[3], &tHWID[4], &tHWID[5]);
+   }
+ 
+-  slog(LOG_INFO, "LogLevel: %d\n", kCurrentLogLevel);
+-  slog(LOG_INFO, "AirName: %s\n", tServerName);
+-  slog(LOG_INFO, "HWID: %.*s\n", HWID_SIZE, tHWID+1);
+-  slog(LOG_INFO, "HWID_Hex(%d): %s\n", strlen(tHWID_Hex), tHWID_Hex);
++  xprintf("LogLevel: %d\n", kCurrentLogLevel);
++  xprintf("AirName: %s\n", tServerName);
++  xprintf("HWID: %.*s\n", HWID_SIZE, tHWID+1);
++  xprintf("HWID_Hex(%d): %s\n", strlen(tHWID_Hex), tHWID_Hex);
+ 
+   if(tSimLevel >= 1)
+   {
+@@ -271,12 +297,12 @@
+ #ifndef XBMC
+     startAvahi(tHWID_Hex, tServerName, tPort);
+ #endif
+-    slog(LOG_DEBUG_V, "Starting connection server: specified server port: %d\n", tPort);
++    xprintf("Starting connection server: specified server port: %d\n", tPort);
+     tServerSock = setupListenServer(&tAddrInfo, tPort);
+     if(tServerSock < 0)
+     {
+       freeaddrinfo(tAddrInfo);
+-      slog(LOG_INFO, "Error setting up server socket on port %d, try specifying a different port\n", tPort);
++      xprintf("Error setting up server socket on port %d, try specifying a different port\n", tPort);
+       return 0;
+     }
+ 
+@@ -303,7 +329,7 @@
+ 
+     int readsock;
+ 
+-    slog(LOG_DEBUG_V, "Waiting for clients to connect\n");
++    xprintf("Waiting for clients to connect\n");
+ 
+     while(m_running)
+     {
+@@ -335,7 +361,7 @@
+         {
+           freeaddrinfo(tAddrInfo);
+           tAddrInfo = NULL;
+-          slog(LOG_DEBUG, "...Accepted Client Connection..\n");
++          xprintf("...Accepted Client Connection..\n");
+           close(tServerSock);
+           handleClient(tClientSock, tPassword, tHWID);
+           //close(tClientSock);
+@@ -343,11 +369,11 @@
+         }
+         else
+         {
+-          slog(LOG_DEBUG_VV, "Child now busy handling new client\n");
++          xprintf("Child now busy handling new client\n");
+           close(tClientSock);
+         }
+ #else
+-      slog(LOG_DEBUG, "...Accepted Client Connection..\n");
++      xprintf("...Accepted Client Connection..\n");
+       handleClient(tClientSock, tPassword, tHWID);
+ #endif
+       }
+@@ -357,7 +383,7 @@
+       }
+   }
+ 
+-  slog(LOG_DEBUG_VV, "Finished\n");
++  xprintf("Finished\n");
+   if(tAddrInfo != NULL)
+   {
+     freeaddrinfo(tAddrInfo);
+@@ -416,7 +442,7 @@
+ 
+ void handleClient(int pSock, char *pPassword, char *pHWADDR)
+ {
+-  slog(LOG_DEBUG_VV, "In Handle Client\n");
++  xprintf("In Handle Client\n");
+   fflush(stdout);
+ 
+   socklen_t len;
+@@ -435,7 +461,7 @@
+ 
+   // deal with both IPv4 and IPv6:
+   if (addr.ss_family == AF_INET) {
+-      slog(LOG_DEBUG_V, "Constructing ipv4 address\n");
++      xprintf("Constructing ipv4 address\n");
+       struct sockaddr_in *s = (struct sockaddr_in *)&addr;
+       port = ntohs(s->sin_port);
+       inet_ntop(AF_INET, &s->sin_addr, ipstr, sizeof ipstr);
+@@ -455,20 +481,20 @@
+       if(memcmp(&addr.bin[0], "\x00\x00\x00\x00" "\x00\x00\x00\x00" "\x00\x00\xff\xff", 12) == 0)
+       {
+         // its ipv4...
+-        slog(LOG_DEBUG_V, "Constructing ipv4 from ipv6 address\n");
++        xprintf("Constructing ipv4 from ipv6 address\n");
+         memcpy(ipbin, &addr.bin[12], 4);
+         ipbinlen = 4;
+       }
+       else
+       {
+-        slog(LOG_DEBUG_V, "Constructing ipv6 address\n");
++        xprintf("Constructing ipv6 address\n");
+         memcpy(ipbin, &s->sin6_addr, 16);
+         ipbinlen = 16;
+       }
+   }
+ 
+-  slog(LOG_DEBUG_V, "Peer IP address: %s\n", ipstr);
+-  slog(LOG_DEBUG_V, "Peer port      : %d\n", port);
++  xprintf("Peer IP address: %s\n", ipstr);
++  xprintf("Peer port      : %d\n", port);
+ 
+   int tMoreDataNeeded = 1;
+   struct keyring     tKeys;
+@@ -489,16 +515,16 @@
+       tError = readDataFromClient(pSock, &(tConn.recv));
+       if(!tError && strlen(tConn.recv.data) > 0)
+       {
+-        slog(LOG_DEBUG_VV, "Finished Reading some data from client\n");
++        xprintf("Finished Reading some data from client\n");
+         // parse client request
+         tMoreDataNeeded = parseMessage(&tConn, ipbin, ipbinlen, pHWADDR);
+         if(1 == tMoreDataNeeded)
+         {
+-          slog(LOG_DEBUG_VV, "\n\nNeed to read more data\n");
++          xprintf("\n\nNeed to read more data\n");
+         }
+         else if(-1 == tMoreDataNeeded) // Forked process down below ended.
+         {
+-          slog(LOG_DEBUG_V, "Forked Process ended...cleaning up\n");
++          xprintf("Forked Process ended...cleaning up\n");
+           cleanup(&tConn);
+           // pSock was already closed
+           return;
+@@ -507,13 +533,13 @@
+       }
+       else
+       {
+-        slog(LOG_DEBUG, "Error reading from socket, closing client\n");
++        xprintf("Error reading from socket, closing client\n");
+         // Error reading data....quit.
+         cleanup(&tConn);
+         return;
+       }
+     }
+-    slog(LOG_DEBUG_VV, "Writing: %d chars to socket\n", tConn.resp.current);
++    xprintf("Writing: %d chars to socket\n", tConn.resp.current);
+     //tConn->resp.data[tConn->resp.current-1] = '\0';
+     writeDataToClient(pSock, &(tConn.resp));
+    // Finished reading one message...
+@@ -526,9 +552,9 @@
+ 
+ void writeDataToClient(int pSock, struct shairbuffer *pResponse)
+ {
+-  slog(LOG_DEBUG_VV, "\n----Beg Send Response Header----\n%.*s\n", pResponse->current, pResponse->data);
++  xprintf("\n----Beg Send Response Header----\n%.*s\n", pResponse->current, pResponse->data);
+   send(pSock, pResponse->data, pResponse->current,0);
+-  slog(LOG_DEBUG_VV, "----Send Response Header----\n");
++  xprintf("----Send Response Header----\n");
+ }
+ 
+ int readDataFromClient(int pSock, struct shairbuffer *pClientBuffer)
+@@ -541,7 +567,7 @@
+   while(tRetval > 0 && tEnd < 0)
+   {
+      // Read from socket until \n\n, \r\n\r\n, or \r\r is found
+-      slog(LOG_DEBUG_V, "Waiting To Read...\n");
++      xprintf("Waiting To Read...\n");
+       fflush(stdout);
+       tRetval = read(pSock, tReadBuf, MAX_SIZE);
+       // if new buffer contains the end of request string, only copy partial buffer?
+@@ -552,40 +578,40 @@
+         {
+           pClientBuffer->marker = tEnd+1; // Marks start of content
+         }
+-        slog(SOCKET_LOG_LEVEL, "Found end of http request at: %d\n", tEnd);
++        xprintf("Found end of http request at: %d\n", tEnd);
+         fflush(stdout);        
+       }
+       else
+       {
+         tEnd = MAX_SIZE;
+-        slog(SOCKET_LOG_LEVEL, "Read %d of data so far\n%s\n", tRetval, tReadBuf);
++        xprintf("Read %d of data so far\n%s\n", tRetval, tReadBuf);
+         fflush(stdout);
+       }
+       if(tRetval > 0)
+       {
+         // Copy read data into tReceive;
+-        slog(SOCKET_LOG_LEVEL, "Read %d data, using %d of it\n", tRetval, tEnd);
++        xprintf("Read %d data, using %d of it\n", tRetval, tEnd);
+         addNToShairBuffer(pClientBuffer, tReadBuf, tRetval);
+-        slog(LOG_DEBUG_VV, "Finished copying data\n");
++        xprintf("Finished copying data\n");
+       }
+       else
+       {
+-        slog(LOG_DEBUG, "Error reading data from socket, got: %d bytes", tRetval);
++        xprintf("Error reading data from socket, got: %d bytes", tRetval);
+         return tRetval;
+       }
+   }
+   if(tEnd + 1 != tRetval)
+   {
+-    slog(SOCKET_LOG_LEVEL, "Read more data after end of http request. %d instead of %d\n", tRetval, tEnd+1);
++    xprintf("Read more data after end of http request. %d instead of %d\n", tRetval, tEnd+1);
+   }
+-  slog(SOCKET_LOG_LEVEL, "Finished Reading Data:\n%s\nEndOfData\n", pClientBuffer->data);
++  xprintf("Finished Reading Data:\n%s\nEndOfData\n", pClientBuffer->data);
+   fflush(stdout);
+   return 0;
+ }
+ 
+ char *getFromBuffer(char *pBufferPtr, const char *pField, int pLenAfterField, int *pReturnSize, char *pDelims)
+ {
+-  slog(LOG_DEBUG_V, "GettingFromBuffer: %s\n", pField);
++  xprintf("GettingFromBuffer: %s\n", pField);
+   char* tFound = strstr(pBufferPtr, pField);
+   int tSize = 0;
+   if(tFound != NULL)
+@@ -606,7 +632,7 @@
+     }
+     
+     tSize = (int) (tShortest - tFound);
+-    slog(LOG_DEBUG_VV, "Found %.*s  length: %d\n", tSize, tFound, tSize);
++    xprintf("Found %.*s  length: %d\n", tSize, tFound, tSize);
+     if(pReturnSize != NULL)
+     {
+       *pReturnSize = tSize;
+@@ -614,7 +640,7 @@
+   }
+   else
+   {
+-    slog(LOG_DEBUG_V, "Not Found\n");
++    xprintf("Not Found\n");
+   }
+   return tFound;
+ }
+@@ -648,10 +674,10 @@
+   {
+     char tTrim[tFoundSize + 2];
+     getTrimmed(tFound, tFoundSize, TRUE, TRUE, tTrim);
+-    slog(LOG_DEBUG_VV, "HeaderChallenge:  [%s] len: %d  sizeFound: %d\n", tTrim, strlen(tTrim), tFoundSize);
++    xprintf("HeaderChallenge:  [%s] len: %d  sizeFound: %d\n", tTrim, strlen(tTrim), tFoundSize);
+     int tChallengeDecodeSize = 16;
+     char *tChallenge = decode_base64((unsigned char *)tTrim, tFoundSize, &tChallengeDecodeSize);
+-    slog(LOG_DEBUG_VV, "Challenge Decode size: %d  expected 16\n", tChallengeDecodeSize);
++    xprintf("Challenge Decode size: %d  expected 16\n", tChallengeDecodeSize);
+ 
+     int tCurSize = 0;
+     unsigned char tChalResp[38];
+@@ -673,7 +699,7 @@
+     }
+ 
+     char *tTmp = encode_base64((unsigned char *)tChalResp, tCurSize);
+-    slog(LOG_DEBUG_VV, "Full sig: %s\n", tTmp);
++    xprintf("Full sig: %s\n", tTmp);
+     free(tTmp);
+ 
+     // RSA Encrypt
+@@ -722,10 +748,10 @@
+     {
+       if(isLogEnabledFor(HEADER_LOG_LEVEL))
+       {
+-        slog(HEADER_LOG_LEVEL, "Content-Length: %s value -> %d\n", tContent, tContentSize);
++        xprintf("Content-Length: %s value -> %d\n", tContent, tContentSize);
+         if(pConn->recv.marker != 0)
+         {
+-          slog(HEADER_LOG_LEVEL, "ContentPtr has %d, but needs %d\n", 
++          xprintf("ContentPtr has %d, but needs %d\n", 
+                   strlen(pConn->recv.data+pConn->recv.marker), tContentSize);
+         }
+       }
+@@ -735,7 +761,7 @@
+   }
+   else
+   {
+-    slog(LOG_DEBUG_VV, "No content, header only\n");
++    xprintf("No content, header only\n");
+   }
+ 
+   // "Creates" a new Response Header for our response message
+@@ -748,7 +774,7 @@
+     {
+       tLen = 20;
+     }
+-    slog(LOG_INFO, "********** RECV %.*s **********\n", tLen, pConn->recv.data);
++    xprintf("********** RECV %.*s **********\n", tLen, pConn->recv.data);
+   }
+ 
+   if(pConn->password != NULL)
+@@ -758,7 +784,7 @@
+ 
+   if(buildAppleResponse(pConn, pIpBin, pIpBinLen, pHWID)) // need to free sig
+   {
+-    slog(LOG_DEBUG_V, "Added AppleResponse to Apple-Challenge request\n");
++    xprintf("Added AppleResponse to Apple-Challenge request\n");
+   }
+ 
+   // Find option, then based on option, do different actions.
+@@ -778,14 +804,14 @@
+       int tKeySize = 0;
+       char tEncodedAesIV[tSize + 2];
+       getTrimmed(tHeaderVal, tSize, TRUE, TRUE, tEncodedAesIV);
+-      slog(LOG_DEBUG_VV, "AESIV: [%.*s] Size: %d  Strlen: %d\n", tSize, tEncodedAesIV, tSize, strlen(tEncodedAesIV));
++      xprintf("AESIV: [%.*s] Size: %d  Strlen: %d\n", tSize, tEncodedAesIV, tSize, strlen(tEncodedAesIV));
+       char *tDecodedIV =  decode_base64((unsigned char*) tEncodedAesIV, tSize, &tSize);
+ 
+       // grab the key, copy it out of the receive buffer
+       tHeaderVal = getFromContent(tContent, "a=rsaaeskey", &tKeySize);
+       char tEncodedAesKey[tKeySize + 2]; // +1 for nl, +1 for \0
+       getTrimmed(tHeaderVal, tKeySize, TRUE, TRUE, tEncodedAesKey);
+-      slog(LOG_DEBUG_VV, "AES KEY: [%s] Size: %d  Strlen: %d\n", tEncodedAesKey, tKeySize, strlen(tEncodedAesKey));
++      xprintf("AES KEY: [%s] Size: %d  Strlen: %d\n", tEncodedAesKey, tKeySize, strlen(tEncodedAesKey));
+       // remove base64 coding from key
+       char *tDecodedAesKey = decode_base64((unsigned char*) tEncodedAesKey,
+                               tKeySize, &tKeySize);  // Need to free DecodedAesKey
+@@ -794,7 +820,7 @@
+       int tFmtpSize = 0;
+       char *tFmtp = getFromContent(tContent, "a=fmtp", &tFmtpSize);  // Don't need to free
+       tFmtp = getTrimmedMalloc(tFmtp, tFmtpSize, TRUE, FALSE); // will need to free
+-      slog(LOG_DEBUG_VV, "Format: %s\n", tFmtp);
++      xprintf("Format: %s\n", tFmtp);
+ 
+       RSA *rsa = loadKey();
+       // Decrypt the binary aes key
+@@ -803,11 +829,11 @@
+       if(RSA_private_decrypt(tKeySize, (unsigned char *)tDecodedAesKey, 
+       (unsigned char*) tDecryptedKey, rsa, RSA_PKCS1_OAEP_PADDING) >= 0)
+       {
+-        slog(LOG_DEBUG, "Decrypted AES key from RSA Successfully\n");
++        xprintf("Decrypted AES key from RSA Successfully\n");
+       }
+       else
+       {
+-        slog(LOG_INFO, "Error Decrypting AES key from RSA\n");
++        xprintf("Error Decrypting AES key from RSA\n");
+       }
+       free(tDecodedAesKey);
+       RSA_free(rsa);
+@@ -823,13 +849,13 @@
+ //    struct comms *tComms = pConn->hairtunes;
+ //   if (! (pipe(tComms->in) == 0 && pipe(tComms->out) == 0))
+ //    {
+-//      slog(LOG_INFO, "Error setting up hairtunes communications...some things probably wont work very well.\n");
++//      xprintf("Error setting up hairtunes communications...some things probably wont work very well.\n");
+ //    }
+     
+     // Setup fork
+     char tPort[8] = "6000";  // get this from dup()'d stdout of child pid
+ 
+-    printf("******** SETUP!!!!!\n");
++    xprintf("******** SETUP!!!!!\n",NULL);
+ #ifndef XBMC
+     int tPid = fork();
+     if(tPid == 0)
+@@ -845,11 +871,11 @@
+       tFound = getFromSetup(pConn->recv.data, "timing_port", &tSize);
+       getTrimmed(tFound, tSize, 1, 0, tTPortStr);
+ 
+-      slog(LOG_DEBUG_VV, "converting %s and %s from str->int\n", tCPortStr, tTPortStr);
++      xprintf("converting %s and %s from str->int\n", tCPortStr, tTPortStr);
+       int tControlport = atoi(tCPortStr);
+       int tTimingport = atoi(tTPortStr);
+ 
+-      slog(LOG_DEBUG_V, "Got %d for CPort and %d for TPort\n", tControlport, tTimingport);
++      xprintf("Got %d for CPort and %d for TPort\n", tControlport, tTimingport);
+       char *tRtp = NULL;
+       char *tPipe = NULL;
+       char *tAoDriver = NULL;
+@@ -884,7 +910,7 @@
+                       tDataport, tRtp, tPipe, tAoDriver, tAoDeviceName, tAoDeviceId);
+ #ifndef XBMC
+       // Quit when finished.
+-      slog(LOG_DEBUG, "Returned from hairtunes init....returning -1, should close out this whole side of the fork\n");
++      xprintf("Returned from hairtunes init....returning -1, should close out this whole side of the fork\n");
+       return -1;
+     }
+     else if(tPid >0)
+@@ -897,7 +923,7 @@
+       int tRead = read(tComms->out[0], tFromHairtunes, 80);
+       if(tRead <= 0)
+       {
+-        slog(LOG_INFO, "Error reading port from hairtunes function, assuming default port: %d\n", tPort);
++        xprintf("Error reading port from hairtunes function, assuming default port: %d\n", tPort);
+       }
+       else
+       {
+@@ -909,7 +935,7 @@
+         }
+         else
+         {
+-          slog(LOG_INFO, "Read %d bytes, Error translating %s into a port\n", tRead, tFromHairtunes);
++          xprintf("Read %d bytes, Error translating %s into a port\n", tRead, tFromHairtunes);
+         }
+       }
+ 
+@@ -930,7 +956,7 @@
+     }
+     else
+     {
+-      slog(LOG_INFO, "Error forking process....dere' be errors round here.\n");
++      xprintf("Error forking process....dere' be errors round here.\n");
+       return -1;
+     }
+ #endif
+@@ -942,7 +968,7 @@
+     propogateCSeq(pConn);
+ #ifndef XBMC
+     close(pConn->hairtunes->in[1]);
+-    slog(LOG_DEBUG, "Tearing down connection, closing pipes\n");
++    xprintf("Tearing down connection, closing pipes\n");
+ #else
+     hairtunes_cleanup();
+ #endif
+@@ -964,7 +990,7 @@
+     propogateCSeq(pConn);
+     int tSize = 0;
+     char *tVol = getFromHeader(pConn->recv.data, "volume", &tSize);
+-    slog(LOG_DEBUG_VV, "About to write [vol: %.*s] data to hairtunes\n", tSize, tVol);
++    xprintf("About to write [vol: %.*s] data to hairtunes\n", tSize, tVol);
+     // TBD VOLUME
+ #ifndef XBMC
+     write(pConn->hairtunes->in[1], "vol: ", 5);
+@@ -973,11 +999,11 @@
+ #else
+     hairtunes_setvolume(atof(tVol));
+ #endif
+-    slog(LOG_DEBUG_VV, "Finished writing data write data to hairtunes\n");
++    xprintf("Finished writing data write data to hairtunes\n");
+   }
+   else
+   {
+-    slog(LOG_DEBUG, "\n\nUn-Handled recv: %s\n", pConn->recv.data);
++    xprintf("\n\nUn-Handled recv: %s\n", pConn->recv.data);
+     propogateCSeq(pConn);
+   }
+   addToShairBuffer(&(pConn->resp), "\r\n");
+@@ -1056,7 +1082,7 @@
+     char tName[100 + HWID_SIZE + 3];
+     if(strlen(pServerName) > tMaxServerName)
+     {
+-      slog(LOG_INFO,"Hey dog, we see you like long server names, "
++      xprintf("Hey dog, we see you like long server names, "
+               "so we put a strncat in our command so we don't buffer overflow, while you listen to your flow.\n"
+               "We just used the first %d characters.  Pick something shorter if you want\n", tMaxServerName);
+     }
+@@ -1067,7 +1093,7 @@
+     strcat(tName, pHWStr);
+     strcat(tName, "@");
+     strncat(tName, pServerName, tMaxServerName);
+-    slog(AVAHI_LOG_LEVEL, "Avahi/DNS-SD Name: %s\n", tName);
++    xprintf("Avahi/DNS-SD Name: %s\n", tName);
+     
+     execlp("avahi-publish-service", "avahi-publish-service", tName,
+          "_raop._tcp", tPort, "tp=UDP","sm=false","sv=false","ek=1","et=0,1",
+@@ -1079,12 +1105,12 @@
+             perror("error");
+     }
+ 
+-    slog(LOG_INFO, "Bad error... couldn't find or failed to run: avahi-publish-service OR dns-sd\n");
+-    exit(1);
++    xprintf("Bad error... couldn't find or failed to run: avahi-publish-service OR dns-sd\n");
++    //exit(1);
+   }
+   else
+   {
+-    slog(LOG_DEBUG_VV, "Avahi/DNS-SD started on PID: %d\n", tPid);
++    xprintf("Avahi/DNS-SD started on PID: %d\n", tPid);
+   }
+   return tPid;
+ }
+@@ -1092,7 +1118,7 @@
+ 
+ void printBufferInfo(struct shairbuffer *pBuf, int pLevel)
+ {
+-  slog(pLevel, "Buffer: [%s]  size: %d  maxchars:%d\n", pBuf->data, pBuf->current, pBuf->maxsize/sizeof(char));
++  xprintf("Buffer: [%s]  size: %d  maxchars:%d\n", pBuf->data, pBuf->current, pBuf->maxsize/sizeof(char));
+ }
+ 
+ int getAvailChars(struct shairbuffer *pBuf)
+@@ -1173,7 +1199,8 @@
+   {
+     va_list argp;
+     va_start(argp, pFormat);
+-    vprintf(pFormat, argp);
++    xprintf(pFormat, argp);
++    //vprintf(pFormat, argp);
+     va_end(argp);
+   }
+   //#endif
+@@ -1227,9 +1254,9 @@
+ {
+   if(pBuf->data != NULL)
+   {
+-    slog(LOG_DEBUG_VV, "Hrm, buffer wasn't cleaned up....trying to free\n");
++    xprintf("Hrm, buffer wasn't cleaned up....trying to free\n");
+     free(pBuf->data);
+-    slog(LOG_DEBUG_VV, "Free didn't seem to seg fault....huzzah\n");
++    xprintf("Free didn't seem to seg fault....huzzah\n");
+   }
+   pBuf->current = 0;
+   pBuf->marker = 0;
+@@ -1287,6 +1314,6 @@
+   BIO *tBio = BIO_new_mem_buf(AIRPORT_PRIVATE_KEY, -1);
+   RSA *rsa = PEM_read_bio_RSAPrivateKey(tBio, NULL, NULL, NULL); //NULL, NULL, NULL);
+   BIO_free(tBio);
+-  slog(RSA_LOG_LEVEL, "RSA Key: %d\n", RSA_check_key(rsa));
++  xprintf("RSA Key: %d\n", RSA_check_key(rsa));
+   return rsa;
+ }
+--- libshairport-1.2.0.20310_lib-org/src/shairport.h	2011-10-01 17:45:08.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/shairport.h	2011-10-01 17:19:43.000000000 +0200
+@@ -59,11 +59,17 @@
+ {
+ #endif /* __cplusplus */
+ 
++struct printfPtr
++{
++  int (*extprintf)(const char* msg, size_t msgSize);
++};
++
+ int shairport_main(int argc, char **argv);
+ void shairport_exit(void);
+ int shairport_loop(void);
+ int shairport_is_running(void);
+ void shairport_set_ao(struct AudioOutput *ao);
++void shairport_set_printf(struct printfPtr *funcPtr);
+ 
+ #ifdef __cplusplus
+ }
+--- libshairport-1.2.0.20310_lib-org/src/socketlib.c	2011-09-23 22:00:48.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/socketlib.c	2011-10-01 17:42:39.000000000 +0200
+@@ -82,7 +82,7 @@
+       delay(RETRY_DELAY, &tRes);
+     }
+   }
+-  printf("%d Retry attempts exceeded\n", RETRY_COUNT);
++  xprintf("%d Retry attempts exceeded\n", RETRY_COUNT);
+   return ERROR;
+ }
+ 
+@@ -102,7 +102,7 @@
+   tError = getaddrinfo(pHostname, pService, &hints, pAddrInfo);
+   if(tError != 0)
+   {
+-    printf("Error getting address info\n");
++    xprintf("Error getting address info\n");
+   }
+   return tError;
+ }
+@@ -200,7 +200,7 @@
+   else
+   {
+     // Invalid encoded data, no other cases are possible.
+-    printf("Unrecoverable error....base64 values are incorrectly encoded\n");
++    xprintf("Unrecoverable error....base64 values are incorrectly encoded\n");
+     return pSize;
+   }
+ }
+@@ -226,7 +226,7 @@
+     memset(input, 0, length);
+     memcpy(input, pInput, pLength);
+     memset(input+pLength, '=', length-pLength);
+-    printf("Fixed value: [%.*s]\n", length, input);
++    xprintf("Fixed value: [%.*s]\n", length, input);
+   }
+   char *buffer = (char *)malloc(length);
+   memset(buffer, 0, length);
diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-007_fix_syslog_defines.patch b/package/libshairport/libshairport-1.2.0.20310_lib-007_fix_syslog_defines.patch
new file mode 100644
index 0000000..c394bbd
--- /dev/null
+++ b/package/libshairport/libshairport-1.2.0.20310_lib-007_fix_syslog_defines.patch
@@ -0,0 +1,24 @@
+--- libshairport-1.2.0.20310_lib-org/src/shairport.h	2011-10-01 04:09:16.000000000 +0200
++++ libshairport-1.2.0.20310_lib-mod/src/shairport.h	2011-11-07 18:05:05.000000000 +0100
+@@ -16,10 +16,17 @@
+ 
+ #define HWID_SIZE 6
+ #define SHAIRPORT_LOG 1
+-#define LOG_INFO     1
+-#define LOG_DEBUG    5
+-#define LOG_DEBUG_V  6
+-#define LOG_DEBUG_VV 7
++
++#ifndef LOG_INFO
++#define LOG_INFO     5
++#endif
++
++#ifndef LOG_DEBUG
++#define LOG_DEBUG    6
++#endif
++
++#define LOG_DEBUG_V  7
++#define LOG_DEBUG_VV 8
+ 
+ struct shairbuffer
+ {
diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-008-add-missing-libs.patch b/package/libshairport/libshairport-1.2.0.20310_lib-008-add-missing-libs.patch
new file mode 100644
index 0000000..0396923
--- /dev/null
+++ b/package/libshairport/libshairport-1.2.0.20310_lib-008-add-missing-libs.patch
@@ -0,0 +1,21 @@
+--- libshairport-1.2.0.20310_lib-org/configure.in-org	2011-11-08 11:53:42.802419355 -0500
++++ libshairport-1.2.0.20310_lib-mod/configure.in	2011-11-08 11:55:38.082419413 -0500
+@@ -11,8 +11,9 @@ AC_PROG_LIBTOOL
+ 
+ # Checks for libraries.
+ #AC_CHECK_LIB([c],   [main])
+-#AC_CHECK_LIB([m],   [main])
++AC_CHECK_LIB([m],   [main])
+ AC_CHECK_LIB([ssl], [main],, AC_MSG_ERROR($missing_library))
++AC_CHECK_LIB([crypto], [main],, AC_MSG_ERROR($missing_library))
+ AC_CHECK_LIB([pthread], [main],, AC_MSG_ERROR($missing_library))
+ 
+ OUTPUT_FILES="Makefile"
+@@ -21,4 +22,4 @@ LIBDIR=$PREFIX
+ 
+ AC_CONFIG_FILES([${OUTPUT_FILES}])
+ AC_OUTPUT(Makefile src/Makefile)
+-AC_OUTPUT
+\ No newline at end of file
++AC_OUTPUT
+
diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-009_fix_ipv6.patch b/package/libshairport/libshairport-1.2.0.20310_lib-009_fix_ipv6.patch
new file mode 100644
index 0000000..ea2b2e4
--- /dev/null
+++ b/package/libshairport/libshairport-1.2.0.20310_lib-009_fix_ipv6.patch
@@ -0,0 +1,22 @@
+--- libshairport-1.2.0.20310_lib-org/src/socketlib.c	2012-01-04 20:41:05.000000000 +0100
++++ libshairport-1.2.0.20310_lib-mod/src/socketlib.c	2012-01-04 20:35:53.000000000 +0100
+@@ -48,7 +48,7 @@
+   if((tSock==-1) && (pAddrInfo->ai_family == AF_INET6) && (errno == EAFNOSUPPORT))
+   {
+     //Fallback to ipv4
+-    perror("Failed to create ipv6 socket. Trying ipv4");
++    xprintf("Failed to create ipv6 socket. Trying ipv4");
+     pAddrInfo->ai_family = AF_INET;
+     tSock = socket(pAddrInfo->ai_family, pAddrInfo->ai_socktype, 0);
+   }
+@@ -158,8 +158,8 @@
+     sprintf(tService, "%d", pPort); // copies port to string
+     int tFamily = AF_INET;
+     #ifdef AF_INET6
+-    //printf("Listening on IPv6 Socket\n");
+-    //tFamily = AF_INET6;
++    xprintf("Listening on IPv6 Socket\n");
++    tFamily = AF_INET6;
+     #else
+     //printf("Listening on IPv4 Socket");
+     #endif
diff --git a/package/libshairport/libshairport.mk b/package/libshairport/libshairport.mk
new file mode 100644
index 0000000..6c3491c
--- /dev/null
+++ b/package/libshairport/libshairport.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libshairport
+#
+#############################################################
+
+LIBSHAIRPORT_VERSION = 1.2.0.20310_lib
+LIBSHAIRPORT_SITE = http://mirrors.xbmc.org/build-deps/darwin-libs
+LIBSHAIRPORT_INSTALL_STAGING = YES
+LIBSHAIRPORT_AUTORECONF = YES
+LIBSHAIRPORT_DEPENDENCIES = openssl
+
+$(eval $(autotools-package))
-- 
1.7.10.4
