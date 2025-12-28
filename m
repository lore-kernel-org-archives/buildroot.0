Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CE3E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 11:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC6A540625;
	Sun, 28 Dec 2025 11:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXV__dslM8Ow; Sun, 28 Dec 2025 11:23:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C991405E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766920988;
	bh=5pQQvjGcHqOATjTwtBsh/9APPDf3Rz9URcVKJ9HIN1w=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BgtrbrFzkJzomAuvFRmj8JEEaAj11QIBToHpfpDnt4mBIIIgVy43GxuNtI+y91DqY
	 n9yAnOeDzBRYAL9sJKYpd+CQ+Odgi3kZEG+ojv1Uh1NGuKwKN+bj78uiQSl1lk6Mo2
	 b+QKLdziLY+/L1KNuZiIElHWU8d1DYKRwrcM1rjDxf4iTfV5JFUdJR7Dj8RfYTssSb
	 7ep4hCFZMg8nEONbB6FlDXpoYnGpvruxKdSr41V93unoIrmCmookI0UoyciKu7ePMY
	 nNmojWA75C2eKcBmUSR5dY9gEB9sBTZYO326kKRQdGiLYoPx3k66Fn732OrJLFvBzh
	 oGRQPAXJFfoKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C991405E7;
	Sun, 28 Dec 2025 11:23:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88DABB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 11:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F78940287
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 11:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXvarvoyqChy for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 11:23:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7E3740087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7E3740087
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7E3740087
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 11:23:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 49265A4C06F6
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 12:23:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59558)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZorU-000000004nV-2psU
 for buildroot@buildroot.org; Sun, 28 Dec 2025 11:23:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 12:23:00 +0100
Message-ID: <20251228112300.3041062-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766920981;
 bh=TKiEzUVoRocSOc1GEx7KyFpcr/HtMF5gb4J3b5qFiFE=;
 h=From:To:Subject:Date:From;
 b=p6/gw2a14uj28WuYN+rrshuzcUuo5re8ILPNrqSPCLLjfrYq5PhSzQocXd3gsOtSG
 3zLZGiA15QSD9lIhQN2NDlX0d8NyhWLk4S0awrzWpvRR7hV4361QoRPuVfOkgDtGrU
 hgP8O+E2AJYkBJv66L/V8mmaceR/rOJvptlyL21R/OO5BCQgAQ4UcG/8kZnY4gME+v
 X6kF5SVWR/66mV50NOxn9Zf87Y5LYTQuI98MhNG2au2MNuRGrduPzs+EJb2ph4iSb4
 Ojkl8k7tH/2Xl4EYOsni3AwKrHc0itV7FSosk528fg0Zxp6sXekw32Tvf0UcJnNBak
 NFC1kpwHJVFvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=p6/gw2a1
Subject: [Buildroot] [PATCH v2 1/1] package/rtptools: bump version
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
