Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35482CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 11:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0492861C8F;
	Sat, 30 May 2026 11:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Xkhey4P55wu; Sat, 30 May 2026 11:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13F3E61C91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780139039;
	bh=KSjGCJhjQx1FOGPLcTPJ4yXcC7OWZSokSx7glXnraAs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b3iw9y3AGsAGplblL2Y+qUxTfzgCK6J0DDa+Oq77/hu+w1DGViAAxObipmD9uPq+k
	 bHaSOfShnyknIEkelt5we7nIr9vcYuZc2rhE8m27tpuReRMham0eph5Lyue56oUbKL
	 haY1Owkgadpr6NabxE4I7x5lX50PE8Td4y0CosJ271/s69xOvgpGfBjOuJzvp85F8n
	 rqQOFyFOYHgnfh/17tjVXUywgeKynG6jTaGJ31AE2V6rL4FmMk7J7gg/oFJ346F/GJ
	 bkm09Tq0m0Y9KyyGl+SC5dI9sP40aCMT/TvdOz9Y+xtuJXooRInHyzgHhpPL4wd9Dq
	 SoGtKJXIQQ3iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13F3E61C91;
	Sat, 30 May 2026 11:03:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D919212F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA83F4081F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6h03UJnh618 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 11:03:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B09D9407DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B09D9407DB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B09D9407DB
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:03:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F351CA4C2D33
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:03:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43634)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTHTu-000000000qw-03CB
 for buildroot@buildroot.org; Sat, 30 May 2026 11:03:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 13:03:53 +0200
Message-ID: <20260530110353.615220-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780139034;
 bh=LlkQYLbkkOCXu3WYSbtxhOUq21doGpPbp86LWfkeFSQ=;
 h=From:To:Subject:Date:From;
 b=EbteRUh5qQVbWwuBoJjmHPgb2xBFnRiSLSkzGIFX3M2McfM7bkA69K+ZcwNmdjwtx
 Srf/eI5ASJv0EiSWT8xzmFByfHLq9eGf/BIZXPVjVYI+4XO0y6NMYt+XH/ybdDeWxh
 cKxqLmxe76/gxybSIvjvDUgEVsjR2xiT8Y3+p3ep7BN+2CXJnfDZRpaqLPyUioBhqw
 lHVcmyWTWtpEwEwteAfwXnS8oODO/gQ2DVRfPW9oLyAt3QCRfCiJBiCwGSY4qggFRy
 NSATo5P9MtKqOsXEEn7A2Vm+cmxdx4OyAiw+4yAUZU0PF3Lzw6V8I9K/jw6DfD+BzG
 1AnNdx2NTxo1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=EbteRUh5
Subject: [Buildroot] [PATCH/next v3 1/1] package/rtptools: bump version
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

Switched _SITE to github, previous site is offline.

https://github.com/irtlab/rtptools/commit/26f6daeeaa3217a98cb63e9463d60286f7fb90d8
replaced the autotools-based build system with a hand-written script
which is broken when cross-compiling due to runtime tests:
https://github.com/irtlab/rtptools/blob/master/configure#L115

Added various options to configure.local which is read by the configure
script: https://github.com/irtlab/rtptools/blob/master/configure#L68

Fixes:
https://autobuild.buildroot.net/results/136/13649109c910f3a278baf63fbe99df1041907ede/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/cf31214dbc2c14e7c37dde476552507683d83403

v2: added more options to configure.local to fix cross builds (Thomas)

 package/rtptools/Config.in     |  2 +-
 package/rtptools/rtptools.hash |  2 +-
 package/rtptools/rtptools.mk   | 22 +++++++++++++++++++---
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/package/rtptools/Config.in b/package/rtptools/Config.in
index 80bbb7a7a0..1aa803e60e 100644
--- a/package/rtptools/Config.in
+++ b/package/rtptools/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_RTPTOOLS
 	  The rtptools distribution consists of a number of small
 	  applications that can be used for processing RTP data.
 
-	  http://www.cs.columbia.edu/irt/software/rtptools/
+	  https://github.com/irtlab/rtptools
diff --git a/package/rtptools/rtptools.hash b/package/rtptools/rtptools.hash
index 6988483b81..a2e7e627e6 100644
--- a/package/rtptools/rtptools.hash
+++ b/package/rtptools/rtptools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c76b2a423fb943820c91194372133a44cbdc456ebf69c51616ec50eeb068c28  rtptools-1.22.tar.gz
+sha256  c78c5b60bfddfc3505670230ff2b92514f62766c5bdf53e78c3ad88a12bbc27a  rtptools-520c0a3722f37cd243d6908063d86a0306ace088.tar.gz
 sha256  f864592065e232c0b444ae9682a7a1a2c6aafe96712999f794bec24d4441a6a9  LICENSE
diff --git a/package/rtptools/rtptools.mk b/package/rtptools/rtptools.mk
index 2148b759ac..d42360c486 100644
--- a/package/rtptools/rtptools.mk
+++ b/package/rtptools/rtptools.mk
@@ -4,10 +4,26 @@
 #
 ################################################################################
 
-RTPTOOLS_VERSION = 1.22
-RTPTOOLS_SITE = http://www.cs.columbia.edu/irt/software/rtptools/download
+RTPTOOLS_VERSION = 520c0a3722f37cd243d6908063d86a0306ace088
+RTPTOOLS_SITE = $(call github,irtlab,rtptools,$(RTPTOOLS_VERSION))
 RTPTOOLS_LICENSE = BSD-3-Clause
 RTPTOOLS_LICENSE_FILES = LICENSE
-RTPTOOLS_CONF_ENV = ac_cv_prog_FOUND_CLANG=no
+
+define RTPTOOLS_CONFIGURE_LOCAL
+	( \
+	echo 'PREFIX="$(TARGET_DIR)"'; \
+	echo 'HAVE_BIGENDIAN=$(if $(filter "BIG",$(BR2_ENDIAN)),1,0)'; \
+	echo 'HAVE_ERR=1'; \
+	echo 'HAVE_GETOPT=1'; \
+	echo 'HAVE_GETTIMEOFDAY=1'; \
+	echo 'HAVE_MSGCONTROL=1'; \
+	echo 'HAVE_LNSL=0'; \
+	echo 'HAVE_LSOCKET=0'; \
+	echo 'HAVE_PROGNAME=1'; \
+	echo 'HAVE_STRTONUM=1'; \
+	echo 'HAVE_WINDOWS=0'; \
+	) > $(@D)/configure.local
+endef
+RTPTOOLS_PRE_CONFIGURE_HOOKS += RTPTOOLS_CONFIGURE_LOCAL
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
