Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA99C48BC3
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 01:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99D854097A;
	Sun, 18 Feb 2024 01:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y3Kt-_FPdsfA; Sun, 18 Feb 2024 01:34:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CE64098E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95CE64098E;
	Sun, 18 Feb 2024 01:34:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7490B1BF275
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 01:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 615EA608CA
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 01:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPBo6RcoCzFs for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 01:33:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58607608BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58607608BD
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58607608BD
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 01:33:58 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5dbd519bde6so2726352a12.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 17:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708220037; x=1708824837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CsLQ6nHkoOa36yR7sIoMuu15v/YEC0mSrGs7n+jJ26E=;
 b=jj9TFiXjxdml5BD5nh8gBC9N9RgxHmabCm+DTKrr5zB7mLHx81Cy7WGokS+XaGZkMk
 mCTtS+/GJ/1HX+QPU93A+QqAeHOA9iCdpnROWGA5gZ2AeG3oRqnGiAPRTTUTOxkBHjF2
 e6/XpUy6nQ3m+Vlw0bFojQPipv7MHUnFEB78LYldyy1ysGhEIxNhd3tnPa83q20vbZhN
 RXJQaSRGWubGwyXAZptNboURNaQ0RdcgTPJ+CAhP/8qr3NtgMQ3vHlx+Wt9rQSNxmWkC
 sT3/qKvdbUIs9JhNTVDdbzcLoIKZRsK4O+bbkGMowCPow5KPll9zFsf0RstbicVXhxUq
 bCrQ==
X-Gm-Message-State: AOJu0YysVKct9ZKCCuxrL/vUOCkjQIlTmisY2XUdSYtuV9okO/2Ci20+
 8vpoVudu6Iqg6NZ54Y4WD77IBhcEQUdXBn6GoyPoPcutvD1hJ93oqjeFNf2dOU0=
X-Google-Smtp-Source: AGHT+IFUV9yOw9WPIZAqikEHVpBjVySju9dwi4lW+inkTBqUQ+Oa8qDEGQjGHj506EJ6sE0e94cTgw==
X-Received: by 2002:a05:6a21:31c8:b0:1a0:8a46:c3bf with SMTP id
 zb8-20020a056a2131c800b001a08a46c3bfmr4386611pzb.21.1708220037378; 
 Sat, 17 Feb 2024 17:33:57 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 jd3-20020a170903260300b001db604f41dcsm1988634plb.103.2024.02.17.17.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 17:33:57 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:33:53 -0800
Message-Id: <20240218013353.798627-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708220037; x=1708824837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CsLQ6nHkoOa36yR7sIoMuu15v/YEC0mSrGs7n+jJ26E=;
 b=hUux2Y4Xbh0+FILUCgGB0diFo7UUai3zA4wRbZeemkzrNylr73IfGJw61n1y+BB7TU
 4MKNnYgsEsCIhuG3sPmHS2fUBj1JR6Wa8RhqHQu5b++uWtj++qArK0HeN0mkZMbG4UnI
 vqd8I1fa+259ZZ/9jEoWkS6yhHxLAp+zBcXAwYn9AWuFpn9gN+XBG7FQbJEWxlpPSyzU
 yK4NN8+ZnTDxJjwBA/ZxQBGcRT+7oh2Of9ig7qoPjzGLZVgmtnO7zXSgzusCh/P0+iG6
 GmYEn9GukTOlj67OzwTkVCG26Rvd+FXUIcZ0KcyXT6a2BVJx8oISTxAqb6sYYXbGUOw9
 TwXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hUux2Y4X
Subject: [Buildroot] [PATCH 1/1] package dhcpdump: bump to version 1.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Change the site to a well maintained - https://github.com/bbonev/dhcpdump
- Fix some of the reported build failures - autobuild.buildroot.org/?reason=dhcpdump-1.8
- Build test results
  ./utils/test-pkg -d br_test -k -c dhcpdump.config  -p dhcpdump
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 ...Fix-build-with-gcc4.8-use-br-fortify.patch | 10 ++++++++
 .../0001-use-non-bsd-structures.patch         | 23 -------------------
 package/dhcpdump/Config.in                    |  2 +-
 package/dhcpdump/dhcpdump.hash                |  2 +-
 package/dhcpdump/dhcpdump.mk                  |  5 ++--
 5 files changed, 15 insertions(+), 27 deletions(-)
 create mode 100644 package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
 delete mode 100644 package/dhcpdump/0001-use-non-bsd-structures.patch

diff --git a/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch b/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
new file mode 100644
index 0000000000..a5c1218c99
--- /dev/null
+++ b/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
@@ -0,0 +1,10 @@
+diff -Naur a/Makefile b/Makefile
+--- a/Makefile	2024-02-17 13:57:08.166161973 -0800
++++ b/Makefile	2024-02-17 13:57:45.055153969 -0800
+@@ -1,5 +1,5 @@
+ CFLAGS+=${CPPFLAGS}
+-CFLAGS+=-Wall -Wextra -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -O3 -fPIE
++CFLAGS+=-Wall -Wextra -Wformat -Werror=format-security -g -O3 -fPIE
+ LDFLAGS+=-g -Wl,-z,relro -Wl,-z,now -fPIE -pie
+ LIBS+=-lpcap
+ 
diff --git a/package/dhcpdump/0001-use-non-bsd-structures.patch b/package/dhcpdump/0001-use-non-bsd-structures.patch
deleted file mode 100644
index 40115fb640..0000000000
--- a/package/dhcpdump/0001-use-non-bsd-structures.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-The udphdr structure has uh_* fields when _FAVOR_BSD is
-defined. Otherwise, the fields are just named source, dest, len and
-check. See <netinet/udp.h>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: dhcpdump-1.8/dhcpdump.c
-===================================================================
---- dhcpdump-1.8.orig/dhcpdump.c	2011-05-17 20:20:46.506980003 +0200
-+++ dhcpdump-1.8/dhcpdump.c	2011-05-17 20:20:59.338979999 +0200
-@@ -163,10 +163,10 @@
- 	strcpy(ip_origin, (u_char *)inet_ntoa(ip->ip_src));
- 	strcpy(ip_destination, (u_char *)inet_ntoa(ip->ip_dst));
- 
--	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->uh_ulen)))
-+	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->len)))
- 		return;
- 
--	printdata((u_char *)(sp + offset), ntohs(udp->uh_ulen));
-+	printdata((u_char *)(sp + offset), ntohs(udp->len));
- }
- 
- // check for matching CHADDR (Peter Apian-Bennewitz <apian@ise.fhg.de>)
diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
index e0abe040fc..30e42928e4 100644
--- a/package/dhcpdump/Config.in
+++ b/package/dhcpdump/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_DHCPDUMP
 	help
 	  A tool for monitoring dhcp requests using tcpdump.
 
-	  http://www.mavetju.org/unix/general.php
+	  https://github.com/bbonev/dhcpdump
diff --git a/package/dhcpdump/dhcpdump.hash b/package/dhcpdump/dhcpdump.hash
index a24db5b275..fdf3243ad1 100644
--- a/package/dhcpdump/dhcpdump.hash
+++ b/package/dhcpdump/dhcpdump.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6d5eb9418162fb738bc56e4c1682ce7f7392dd96e568cc996e44c28de7f77190  dhcpdump-1.8.tar.gz
+sha256  3658ac21cc33e79e72bed070454e49c543017991cb6c37f4253c85e9176869d1  dhcpdump-1.9.tar.xz
 sha256  bab6ca76b7e93885396513689b1248dfb0e8fd662695b8bd1b26784ef71a0192  LICENSE
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index ec9571c0af..4ce5047b2e 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE = http://www.mavetju.org/download
+DHCPDUMP_VERSION = 1.9
+DHCPDUMP_SITE = https://github.com/bbonev/dhcpdump/releases/download/v$(DHCPDUMP_VERSION)
+DHCPDUMP_SOURCE = dhcpdump-$(DHCPDUMP_VERSION).tar.xz
 DHCPDUMP_DEPENDENCIES = libpcap
 DHCPDUMP_LICENSE = BSD-2-Clause
 DHCPDUMP_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
