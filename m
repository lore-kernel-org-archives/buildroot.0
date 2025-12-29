Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487A7E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 08:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F416A40418;
	Mon, 29 Dec 2025 08:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgkj42DFPzeF; Mon, 29 Dec 2025 08:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D648440451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766997473;
	bh=628I6QrPFj39nuB2xN/cWO9fRx8IaxWnYjnsM4Ngex0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=laoHfMljNHx3UB10dN58osWbog6ig+uQLxQIoUmtnk9e0z6oThVZvWY7lDKFEcohY
	 x+qpWztXMWhxaLRv9+QZjFNzmgVWfeDHiRCwdpMgaN9w6oW991PtHLObn7MtP8KBkA
	 u0d4/tyvMCuBwm9G+WxgUTWTRA7IbD+1ppFh6cs3PY+tpO9OzJ1+LOX9dMkp2Ie8GC
	 yzFHaBDvOphoYJEgIx17UyYrWYPPw7X5U0fKHbWRwsrH3/gPWbnGITuJbjawPCZdjc
	 ncQi48FImEpqfxx32XC+SZ2eNX0O8yY/izDfEchCSEWqUEFJg9yNmNCcnnlBRF5eer
	 JGbNG0a7iagbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D648440451;
	Mon, 29 Dec 2025 08:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACB6B1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F57840451
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Le9893pCDUHy for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 08:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B10D40418
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B10D40418
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B10D40418
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 08:37:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36835A4C051D;
 Mon, 29 Dec 2025 09:37:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47342)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1va8lA-0000000014p-19TF;
 Mon, 29 Dec 2025 08:37:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 29 Dec 2025 09:37:48 +0100
Message-ID: <20251229083748.835336-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766997469;
 bh=GscwJx8hCbzRYcdrZPD58huUPnfQUpPLwBTZvWuufRw=;
 h=From:To:Cc:Subject:Date:From;
 b=Xvq5n4F7r7gE6TzdNbGTAT1QSyLa+SGSOmSTvCOyn1mdndSpQ86jMcV9tRZ5cdPLn
 RrkKjN3B28iDVjS1rewTginlA2zEgP5dwvXCbAa1hF4vmKsScgbq5S/rXaaIjrC33r
 G9h65mINXCHzhib2G1V+63mgIMVfTIOWsqaNDffDmHKTxCI4YCUMWdVPmZYvtfXeDQ
 tGvLilmbAMQfbL7Fn6pswEgT8XKqsOVx9cNLZ300t5mwi4oxMA4JVaMGS3jS0F4J00
 E4L/NOnrSoKSDiuWQadd8PZnK1j67QezKepQZMDjUuNL4XXU2iIa3kveYXDPEOaJg2
 EdanmAW1apGlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Xvq5n4F7
Subject: [Buildroot] [PATCH 1/1] package/gpsd: security bump version to
 3.27.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.com/gpsd/gpsd/-/blob/release-3.27.2/NEWS

Removed all patches which are included in this release.

Fixes CVE-2025-67268 & CVE-2025-67269.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ile-and-dumpfile-options-for-gpsprof.patch | 40 ----------
 ...02-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch | 78 -------------------
 ...t-force-_TIME_BITS-on-a-32-bit-syste.patch | 49 ------------
 ...e.c-Make-client-UDP-socket-non-block.patch | 32 --------
 package/gpsd/gpsd.hash                        |  2 +-
 package/gpsd/gpsd.mk                          |  2 +-
 6 files changed, 2 insertions(+), 201 deletions(-)
 delete mode 100644 package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch
 delete mode 100644 package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch
 delete mode 100644 package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch
 delete mode 100644 package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch

diff --git a/package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch b/package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch
deleted file mode 100644
index d466c9fc58..0000000000
--- a/package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f18e52dad4eeba2434a988bc899f6c7fe973f4ba Mon Sep 17 00:00:00 2001
-Message-Id: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-From: Richard Lindsley <rich.lindsley@gmail.com>
-Date: Fri, 23 May 2025 18:48:57 -0700
-Subject: [PATCH] Fix the --logfile and --dumpfile options for gpsprof
-
-The open() function requires that the "encoding" argument is a str or
-None.
-
-Upstream: https://gitlab.com/gpsd/gpsd/-/commit/bad9973b8e73e9e2cc0af2555edc9c8a0855d203
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- clients/gpsprof.py.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
-index 8b1a5234b..e5e448a53 100644
---- a/clients/gpsprof.py.in
-+++ b/clients/gpsprof.py.in
-@@ -1208,7 +1208,7 @@ if __name__ == '__main__':
-     options = parser.parse_args()
- 
-     if options.logfile:
--        options.logfp = open(options.logfile, "w", encoding=ascii)
-+        options.logfp = open(options.logfile, "w", encoding="ascii")
-     else:
-         options.logfp = None
- 
-@@ -1255,7 +1255,7 @@ if __name__ == '__main__':
-         plot.postprocess()
-         # Save the timing data (only) for post-analysis if required.
-         if options.dumpfile:
--            with open(options.dumpfile, "w", encoding=ascii) as fp:
-+            with open(options.dumpfile, "w", encoding="ascii") as fp:
-                 fp.write(plot.dump())
-         if options.logfp:
-             options.logfp.close()
--- 
-2.34.1
-
diff --git a/package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch b/package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch
deleted file mode 100644
index d07a8970f4..0000000000
--- a/package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 98e61729d84b3e3698cde4ec7fe446b932d333fc Mon Sep 17 00:00:00 2001
-Message-Id: <98e61729d84b3e3698cde4ec7fe446b932d333fc.1749533625.git.yann.morin@orange.com>
-In-Reply-To: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-References: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Thu, 5 Jun 2025 17:40:56 -0700
-Subject: [PATCH] gpsd/gpsd.c: Fix empty gst[,] in POLL.
-
-Fix issue 336.
-
-Upstream: https://gitlab.com/gpsd/gpsd/-/commit/3185c5790c3e7e31c6cc80174940f0385cba2617
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- gpsd/gpsd.c | 30 ++++++++++++++++++++++--------
- 1 file changed, 22 insertions(+), 8 deletions(-)
-
-diff --git a/gpsd/gpsd.c b/gpsd/gpsd.c
-index 5a98a4470..3797ace13 100644
---- a/gpsd/gpsd.c
-+++ b/gpsd/gpsd.c
-@@ -1555,10 +1555,15 @@ static void handle_request(struct subscriber_t *sub, const char *buf,
-         for (devp = devices; devp < devices + MAX_DEVICES; devp++) {
-             if (allocated_device(devp) && subscribed(sub, devp)) {
-                 if (0 != (devp->observed & GPS_TYPEMASK)) {
-+                    size_t rlen = strnlen(reply, replylen);
-+
-                     json_tpv_dump(NAVDATA_SET, devp, &sub->policy,
--                                  reply + strnlen(reply, replylen),
--                                  replylen - strnlen(reply, replylen));
-+                                  reply + rlen, replylen - rlen);
-                     rstrip(reply, replylen);
-+                    if (strnlen(reply, replylen) == rlen) {
-+                        // no data
-+                        continue;
-+                    }
-                     (void)strlcat(reply, ",", replylen);
-                 }
-             }
-@@ -1568,10 +1573,15 @@ static void handle_request(struct subscriber_t *sub, const char *buf,
-         for (devp = devices; devp < devices + MAX_DEVICES; devp++) {
-             if (allocated_device(devp) && subscribed(sub, devp)) {
-                 if (0 != (devp->observed & GPS_TYPEMASK)) {
--                    json_noise_dump(&devp->gpsdata,
--                                    reply + strnlen(reply, replylen),
--                                    replylen - strnlen(reply, replylen));
-+                    size_t rlen = strnlen(reply, replylen);
-+
-+                    json_noise_dump(&devp->gpsdata, reply + rlen,
-+                                    replylen - rlen);
-                     rstrip(reply, replylen);
-+                    if (strnlen(reply, replylen) == rlen) {
-+                        // no data
-+                        continue;
-+                    }
-                     (void)strlcat(reply, ",", replylen);
-                 }
-             }
-@@ -1581,10 +1591,14 @@ static void handle_request(struct subscriber_t *sub, const char *buf,
-         for (devp = devices; devp < devices + MAX_DEVICES; devp++) {
-             if (allocated_device(devp) && subscribed(sub, devp)) {
-                 if (0 != (devp->observed & GPS_TYPEMASK)) {
--                    json_sky_dump(devp,
--                                  reply + strnlen(reply, replylen),
--                                  replylen - strnlen(reply, replylen));
-+                    size_t rlen = strnlen(reply, replylen);
-+
-+                    json_sky_dump(devp, reply + rlen, replylen - rlen);
-                     rstrip(reply, replylen);
-+                    if (strnlen(reply, replylen) == rlen) {
-+                        // no data
-+                        continue;
-+                    }
-                     (void)strlcat(reply, ",", replylen);
-                 }
-             }
--- 
-2.34.1
-
diff --git a/package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch b/package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch
deleted file mode 100644
index 16a0ca6f88..0000000000
--- a/package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a1f36cf216861ac6499654b4e6e4d54107142cfc Mon Sep 17 00:00:00 2001
-Message-Id: <a1f36cf216861ac6499654b4e6e4d54107142cfc.1749533625.git.yann.morin@orange.com>
-In-Reply-To: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-References: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Thu, 5 Jun 2025 18:14:55 -0700
-Subject: [PATCH] SConscript: Do not force _TIME_BITS on a 32 bit system.
-
-The build assumed that if _TIME_BITS existed on a system then it was OK
-to set it.  Turns out that is a bad assumption.
-
-Leave it to the builds to decide when _TIME_BITS should be used.
-
-Upstream: https://gitlab.com/gpsd/gpsd/-/commit/95814d22276c34abe72a35b89065b1190d34f9bf
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- SConscript | 16 +++-------------
- 1 file changed, 3 insertions(+), 13 deletions(-)
-
-diff --git a/SConscript b/SConscript
-index 28105fa7b..357c53f2b 100644
---- a/SConscript
-+++ b/SConscript
-@@ -1335,19 +1335,9 @@ if not cleaning and not helping:
-     # check for 64 bit time_t.  Needed for 2038.
-     sizeof_time_t = config.CheckTypeSize("time_t", "#include <time.h>",
-                                          expect=8)
--    if 0 == sizeof_time_t:
--        # see if we can force time64_t
--        # this needs glibc 2.34 or later, and a compatible kernel
--        sizeof_time_t = config.CheckTypeSize("time_t",
--                                             "#define _TIME_BITS 64\n"
--                                             "#define _FILE_OFFSET_BITS 64\n"
--                                             "#include <time.h>",
--                                             expect=8)
--        if 0 != sizeof_time_t:
--            # force time64_t
--            confdefs.append("// Forcing 64-bit time_t\n"
--                            "#define _TIME_BITS 64\n"
--                            "#define _FILE_OFFSET_BITS 64\n")
-+    # do not try to  force time64_t, that is a distro decision.
-+    # it needs glibc 2.34 or later, and a compatible kernel
-+    # CFLAGS += "-D_TIME_BITS 64 -D_FILE_OFFSET_BITS 64"
- 
-     if 0 == sizeof_time_t:
-         announce("WARNING: time_t is too small.  It will fail in 2038")
--- 
-2.34.1
-
diff --git a/package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch b/package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch
deleted file mode 100644
index 73ecce5b8b..0000000000
--- a/package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0b1769a3abe386c139a8b4d4967b57a00f0f286a Mon Sep 17 00:00:00 2001
-Message-Id: <0b1769a3abe386c139a8b4d4967b57a00f0f286a.1749533625.git.yann.morin@orange.com>
-In-Reply-To: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-References: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
-From: Miroslav Lichvar <mlichvar@redhat.com>
-Date: Tue, 10 Jun 2025 00:21:52 +0200
-Subject: [PATCH] gpsd/libgpsd_core.c: Make client UDP socket non-blocking.
-
-Resolving issue #337
-
-Upstream: https://gitlab.com/gpsd/gpsd/-/commit/992a90e6a50b4d3dcb091fff4658e7892c985c7f
-Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
----
- gpsd/libgpsd_core.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gpsd/libgpsd_core.c b/gpsd/libgpsd_core.c
-index f328648f7..6b77e2b97 100644
---- a/gpsd/libgpsd_core.c
-+++ b/gpsd/libgpsd_core.c
-@@ -614,7 +614,7 @@ int gpsd_open(struct gps_device_t *session)
-                  "CORE: opening UDP feed at %s, port %s.\n", host,
-                  port);
-         if (0 > (dsock = netlib_connectsock1(AF_UNSPEC, host, port, "udp",
--                                             0, true, NULL, 0))) {
-+                                             1, true, NULL, 0))) {
-             // cast for 32-bit ints.
-             GPSD_LOG(LOG_ERROR, &session->context->errout,
-                      "CORE: UDP device open error %s(%ld).\n",
--- 
-2.34.1
-
diff --git a/package/gpsd/gpsd.hash b/package/gpsd/gpsd.hash
index 984ddab125..a7b76afbc6 100644
--- a/package/gpsd/gpsd.hash
+++ b/package/gpsd/gpsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990  gpsd-3.26.1.tar.gz
+sha256  ebb66ed92018b79cec88efb60e35a596925eef46502cf03d6ff0aea636ee7461  gpsd-3.27.2.tar.gz
 sha256  fdf339997bbca9eaf507476b82fbcac608fc39a3d89b86b51e16db4c9f933716  COPYING
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index c5c4dad296..f52c00ee17 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 3.26.1
+GPSD_VERSION = 3.27.2
 GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd
 GPSD_LICENSE = BSD-2-Clause
 GPSD_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
