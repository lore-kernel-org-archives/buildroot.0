Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A22C5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 08:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28D2541A10;
	Tue, 10 Jun 2025 08:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-0JcO4YGaXA; Tue, 10 Jun 2025 08:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8BF641A4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8BF641A4B;
	Tue, 10 Jun 2025 08:16:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9427F1F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 08:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A9940129
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 08:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAENDPuTzA0I for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 08:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43CE4400AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43CE4400AA
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43CE4400AA
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 08:15:57 +0000 (UTC)
X-CSE-ConnectionGUID: qh4yKqHUTFWLDi28AukvuA==
X-CSE-MsgGUID: j/TncE+VR/qgXxUpehz6rA==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 10:15:55 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2025 10:15:55 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 10 Jun 2025 10:15:53 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 10 Jun 2025 10:15:53 +0200
X-CSE-ConnectionGUID: 0JUA8yfIQpO7jEuitY6A6w==
X-CSE-MsgGUID: vWsqp0QTQG2wQ5YxRKjCvw==
X-IronPort-AV: E=Sophos;i="6.16,224,1744063200"; d="scan'208";a="299917194"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Tue, 10 Jun 2025 10:15:53 +0200
Message-ID: <2ae7c81545bc25987c31d5cc3dc4619cc964b2ef.1749543353.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1749543358; x=1781079358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OQlB1rpAQozxrNXgVf0rfa/acZpqH2X90DW21InNBQk=;
 b=jxJ7Xtgtehuv3M7NNdPEyYMSIMrAhId6YuU8ITOPJpbbdaeEsnR/zvPJ
 DQAnw3tGCOHFM2TwTLxrUVUKR5aCiMpnArBerT2h9w+bYpUiWU0pky5jk
 4BIhV8L8ij4Yc8QRrrjTKm69NYnCedO7ZzZcimCJ/nkCzYEKDTbKIKeVY
 +PdXkhcChR8nykVpq/SmIwkBi3HFbeK6AGsiR0n8tAKCuHCkKOJHefure
 eDtBsyEZOw8UFIcwMUqOJAQ0n7L+6RlD8hDweyyxRbRCJNeVDypMDMB45
 FgBAVHyW6RH4AD97UhAb+V3vExoz54sz6bP8gciNm8/fcXEEwDDcEVCS8
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=jxJ7Xtgt
Subject: [Buildroot] [PATCH] package/gpsd: backport upstream fixes
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

From: "Yann E. MORIN" <yann.morin@orange.com>

Back port four upstream fixes for those issues:

  - gpsrprof could not log or dump GNSS messages; gpsprof is useful
    to calbrate a GNSS receiver, especially when building a static
    RTK base;

  - the JSON blurb reported by gpsd was sometimes broken, causing
    decoding errors in clients;

  - the detection of 64-bit time on 32-bit systems was borked;

  - UDP mode was borked;

The runtime test is extended to test all known transports: TPC, DUP,
and PTY.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 ...ile-and-dumpfile-options-for-gpsprof.patch | 40 ++++++++++
 ...02-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch | 78 +++++++++++++++++++
 ...t-force-_TIME_BITS-on-a-32-bit-syste.patch | 49 ++++++++++++
 ...e.c-Make-client-UDP-socket-non-block.patch | 32 ++++++++
 support/testing/tests/package/test_gpsd.py    | 62 +++++++++------
 .../test_gpsd/rootfs-overlay/root/nmea.log    |  1 -
 6 files changed, 237 insertions(+), 25 deletions(-)
 create mode 100644 package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch
 create mode 100644 package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch
 create mode 100644 package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch
 create mode 100644 package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch

diff --git a/package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch b/package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch
new file mode 100644
index 0000000000..d466c9fc58
--- /dev/null
+++ b/package/gpsd/0001-Fix-the-logfile-and-dumpfile-options-for-gpsprof.patch
@@ -0,0 +1,40 @@
+From f18e52dad4eeba2434a988bc899f6c7fe973f4ba Mon Sep 17 00:00:00 2001
+Message-Id: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
+From: Richard Lindsley <rich.lindsley@gmail.com>
+Date: Fri, 23 May 2025 18:48:57 -0700
+Subject: [PATCH] Fix the --logfile and --dumpfile options for gpsprof
+
+The open() function requires that the "encoding" argument is a str or
+None.
+
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/bad9973b8e73e9e2cc0af2555edc9c8a0855d203
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ clients/gpsprof.py.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 8b1a5234b..e5e448a53 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -1208,7 +1208,7 @@ if __name__ == '__main__':
+     options = parser.parse_args()
+ 
+     if options.logfile:
+-        options.logfp = open(options.logfile, "w", encoding=ascii)
++        options.logfp = open(options.logfile, "w", encoding="ascii")
+     else:
+         options.logfp = None
+ 
+@@ -1255,7 +1255,7 @@ if __name__ == '__main__':
+         plot.postprocess()
+         # Save the timing data (only) for post-analysis if required.
+         if options.dumpfile:
+-            with open(options.dumpfile, "w", encoding=ascii) as fp:
++            with open(options.dumpfile, "w", encoding="ascii") as fp:
+                 fp.write(plot.dump())
+         if options.logfp:
+             options.logfp.close()
+-- 
+2.34.1
+
diff --git a/package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch b/package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch
new file mode 100644
index 0000000000..d07a8970f4
--- /dev/null
+++ b/package/gpsd/0002-gpsd-gpsd.c-Fix-empty-gst-in-POLL.patch
@@ -0,0 +1,78 @@
+From 98e61729d84b3e3698cde4ec7fe446b932d333fc Mon Sep 17 00:00:00 2001
+Message-Id: <98e61729d84b3e3698cde4ec7fe446b932d333fc.1749533625.git.yann.morin@orange.com>
+In-Reply-To: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
+References: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Thu, 5 Jun 2025 17:40:56 -0700
+Subject: [PATCH] gpsd/gpsd.c: Fix empty gst[,] in POLL.
+
+Fix issue 336.
+
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/3185c5790c3e7e31c6cc80174940f0385cba2617
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ gpsd/gpsd.c | 30 ++++++++++++++++++++++--------
+ 1 file changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/gpsd/gpsd.c b/gpsd/gpsd.c
+index 5a98a4470..3797ace13 100644
+--- a/gpsd/gpsd.c
++++ b/gpsd/gpsd.c
+@@ -1555,10 +1555,15 @@ static void handle_request(struct subscriber_t *sub, const char *buf,
+         for (devp = devices; devp < devices + MAX_DEVICES; devp++) {
+             if (allocated_device(devp) && subscribed(sub, devp)) {
+                 if (0 != (devp->observed & GPS_TYPEMASK)) {
++                    size_t rlen = strnlen(reply, replylen);
++
+                     json_tpv_dump(NAVDATA_SET, devp, &sub->policy,
+-                                  reply + strnlen(reply, replylen),
+-                                  replylen - strnlen(reply, replylen));
++                                  reply + rlen, replylen - rlen);
+                     rstrip(reply, replylen);
++                    if (strnlen(reply, replylen) == rlen) {
++                        // no data
++                        continue;
++                    }
+                     (void)strlcat(reply, ",", replylen);
+                 }
+             }
+@@ -1568,10 +1573,15 @@ static void handle_request(struct subscriber_t *sub, const char *buf,
+         for (devp = devices; devp < devices + MAX_DEVICES; devp++) {
+             if (allocated_device(devp) && subscribed(sub, devp)) {
+                 if (0 != (devp->observed & GPS_TYPEMASK)) {
+-                    json_noise_dump(&devp->gpsdata,
+-                                    reply + strnlen(reply, replylen),
+-                                    replylen - strnlen(reply, replylen));
++                    size_t rlen = strnlen(reply, replylen);
++
++                    json_noise_dump(&devp->gpsdata, reply + rlen,
++                                    replylen - rlen);
+                     rstrip(reply, replylen);
++                    if (strnlen(reply, replylen) == rlen) {
++                        // no data
++                        continue;
++                    }
+                     (void)strlcat(reply, ",", replylen);
+                 }
+             }
+@@ -1581,10 +1591,14 @@ static void handle_request(struct subscriber_t *sub, const char *buf,
+         for (devp = devices; devp < devices + MAX_DEVICES; devp++) {
+             if (allocated_device(devp) && subscribed(sub, devp)) {
+                 if (0 != (devp->observed & GPS_TYPEMASK)) {
+-                    json_sky_dump(devp,
+-                                  reply + strnlen(reply, replylen),
+-                                  replylen - strnlen(reply, replylen));
++                    size_t rlen = strnlen(reply, replylen);
++
++                    json_sky_dump(devp, reply + rlen, replylen - rlen);
+                     rstrip(reply, replylen);
++                    if (strnlen(reply, replylen) == rlen) {
++                        // no data
++                        continue;
++                    }
+                     (void)strlcat(reply, ",", replylen);
+                 }
+             }
+-- 
+2.34.1
+
diff --git a/package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch b/package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch
new file mode 100644
index 0000000000..16a0ca6f88
--- /dev/null
+++ b/package/gpsd/0003-SConscript-Do-not-force-_TIME_BITS-on-a-32-bit-syste.patch
@@ -0,0 +1,49 @@
+From a1f36cf216861ac6499654b4e6e4d54107142cfc Mon Sep 17 00:00:00 2001
+Message-Id: <a1f36cf216861ac6499654b4e6e4d54107142cfc.1749533625.git.yann.morin@orange.com>
+In-Reply-To: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
+References: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Thu, 5 Jun 2025 18:14:55 -0700
+Subject: [PATCH] SConscript: Do not force _TIME_BITS on a 32 bit system.
+
+The build assumed that if _TIME_BITS existed on a system then it was OK
+to set it.  Turns out that is a bad assumption.
+
+Leave it to the builds to decide when _TIME_BITS should be used.
+
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/95814d22276c34abe72a35b89065b1190d34f9bf
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ SConscript | 16 +++-------------
+ 1 file changed, 3 insertions(+), 13 deletions(-)
+
+diff --git a/SConscript b/SConscript
+index 28105fa7b..357c53f2b 100644
+--- a/SConscript
++++ b/SConscript
+@@ -1335,19 +1335,9 @@ if not cleaning and not helping:
+     # check for 64 bit time_t.  Needed for 2038.
+     sizeof_time_t = config.CheckTypeSize("time_t", "#include <time.h>",
+                                          expect=8)
+-    if 0 == sizeof_time_t:
+-        # see if we can force time64_t
+-        # this needs glibc 2.34 or later, and a compatible kernel
+-        sizeof_time_t = config.CheckTypeSize("time_t",
+-                                             "#define _TIME_BITS 64\n"
+-                                             "#define _FILE_OFFSET_BITS 64\n"
+-                                             "#include <time.h>",
+-                                             expect=8)
+-        if 0 != sizeof_time_t:
+-            # force time64_t
+-            confdefs.append("// Forcing 64-bit time_t\n"
+-                            "#define _TIME_BITS 64\n"
+-                            "#define _FILE_OFFSET_BITS 64\n")
++    # do not try to  force time64_t, that is a distro decision.
++    # it needs glibc 2.34 or later, and a compatible kernel
++    # CFLAGS += "-D_TIME_BITS 64 -D_FILE_OFFSET_BITS 64"
+ 
+     if 0 == sizeof_time_t:
+         announce("WARNING: time_t is too small.  It will fail in 2038")
+-- 
+2.34.1
+
diff --git a/package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch b/package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch
new file mode 100644
index 0000000000..73ecce5b8b
--- /dev/null
+++ b/package/gpsd/0004-gpsd-libgpsd_core.c-Make-client-UDP-socket-non-block.patch
@@ -0,0 +1,32 @@
+From 0b1769a3abe386c139a8b4d4967b57a00f0f286a Mon Sep 17 00:00:00 2001
+Message-Id: <0b1769a3abe386c139a8b4d4967b57a00f0f286a.1749533625.git.yann.morin@orange.com>
+In-Reply-To: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
+References: <f18e52dad4eeba2434a988bc899f6c7fe973f4ba.1749533625.git.yann.morin@orange.com>
+From: Miroslav Lichvar <mlichvar@redhat.com>
+Date: Tue, 10 Jun 2025 00:21:52 +0200
+Subject: [PATCH] gpsd/libgpsd_core.c: Make client UDP socket non-blocking.
+
+Resolving issue #337
+
+Upstream: https://gitlab.com/gpsd/gpsd/-/commit/992a90e6a50b4d3dcb091fff4658e7892c985c7f
+Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
+---
+ gpsd/libgpsd_core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gpsd/libgpsd_core.c b/gpsd/libgpsd_core.c
+index f328648f7..6b77e2b97 100644
+--- a/gpsd/libgpsd_core.c
++++ b/gpsd/libgpsd_core.c
+@@ -614,7 +614,7 @@ int gpsd_open(struct gps_device_t *session)
+                  "CORE: opening UDP feed at %s, port %s.\n", host,
+                  port);
+         if (0 > (dsock = netlib_connectsock1(AF_UNSPEC, host, port, "udp",
+-                                             0, true, NULL, 0))) {
++                                             1, true, NULL, 0))) {
+             // cast for 32-bit ints.
+             GPSD_LOG(LOG_ERROR, &session->context->errout,
+                      "CORE: UDP device open error %s(%ld).\n",
+-- 
+2.34.1
+
diff --git a/support/testing/tests/package/test_gpsd.py b/support/testing/tests/package/test_gpsd.py
index c232e97d7f..59b3fe7d3e 100644
--- a/support/testing/tests/package/test_gpsd.py
+++ b/support/testing/tests/package/test_gpsd.py
@@ -17,6 +17,40 @@ class TestGpsd(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
+    def _test_gpsd_one(self, transport=None):
+        # Start the "gpsfake" GPS emulator.
+        cmd = "gpsfake"
+        cmd += " --slow --cycle 0.1 --quiet"
+        if transport:
+            cmd += f" --{transport}"
+        cmd += " /root/nmea.log &> /dev/null &"
+        self.assertRunOk(cmd)
+
+        # Wait a bit, to let the gpsfake and gpsd to settle...
+        time.sleep(3 * self.timeout_multiplier)
+
+        # List the GPS devices. We should see our local UDP test GPS.
+        out, ret = self.emulator.run("gpsctl")
+        self.assertEqual(ret, 0)
+        self.assertIn("NMEA0183", out[0])
+        if transport:
+            self.assertTrue(out[0].startswith(f"{transport}://127.0.0.1"))
+        else:
+            self.assertTrue(out[0].startswith("/dev/pts/1 "))
+
+        # Collect some of our fake GPS data, and check we got the
+        # coordinates from our test data file.
+        # Our expected coordinates are:
+        # https://www.openstreetmap.org/#map=19/43.60439/1.44336
+        out, ret = self.emulator.run("gpscsv --header 0 --count 3")
+        self.assertEqual(ret, 0)
+        _, gps_lat, gps_long, _ = out[0].split(",")
+        self.assertAlmostEqual(float(gps_lat), 43.60439)
+        self.assertAlmostEqual(float(gps_long), 1.44336)
+
+        # Terminate gpsd, wait for it to finish.
+        self.assertRunOk("kill %1; sleep 1")
+
     def test_run(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
         self.emulator.boot(arch="armv5",
@@ -30,27 +64,7 @@ class TestGpsd(infra.basetest.BRTest):
         # Since gpsd needs a real GPS device, we stop the service.
         self.assertRunOk("/etc/init.d/S50gpsd stop")
 
-        # We start the "gpsfake" GPS emulator instead.
-        cmd = "gpsfake"
-        cmd += " --slow --cycle 0.1 --quiet"
-        cmd += " /root/nmea.log &> /dev/null &"
-        self.assertRunOk(cmd)
-
-        # Wait a bit, to let the gpsfake and gpsd to settle...
-        time.sleep(3 * self.timeout_multiplier)
-
-        # List the GPS devices. We should see our local UDP test GPS.
-        out, ret = self.emulator.run("gpsctl")
-        self.assertEqual(ret, 0)
-        self.assertTrue(out[0].startswith("tcp://127.0.0.1"))
-        self.assertIn("NMEA0183", out[0])
-
-        # Collect some of our fake GPS data, and check we got the
-        # coordinates from our test data file.
-        # Our expected coordinates are:
-        # https://www.openstreetmap.org/#map=19/43.60439/1.44336
-        out, ret = self.emulator.run("gpscsv --header 0 --count 3")
-        self.assertEqual(ret, 0)
-        _, gps_lat, gps_long, _ = out[0].split(",")
-        self.assertAlmostEqual(float(gps_lat), 43.60439)
-        self.assertAlmostEqual(float(gps_long), 1.44336)
+        # Test various transports for gpsd
+        self._test_gpsd_one()
+        self._test_gpsd_one("tcp")
+        self._test_gpsd_one("udp")
diff --git a/support/testing/tests/package/test_gpsd/rootfs-overlay/root/nmea.log b/support/testing/tests/package/test_gpsd/rootfs-overlay/root/nmea.log
index d063ef1ef9..da9fbf8b78 100644
--- a/support/testing/tests/package/test_gpsd/rootfs-overlay/root/nmea.log
+++ b/support/testing/tests/package/test_gpsd/rootfs-overlay/root/nmea.log
@@ -1,5 +1,4 @@
 # Name: NMEA 0183 messages for gpsd Buildroot test
-# Transport: TCP
 # For packet format, see:
 # https://gpsd.gitlab.io/gpsd/NMEA.html
 $GPGGA,123456.789,4336.2634,N,0126.6016,E,1,04,1.7,143.5,M,,,,*3A
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
