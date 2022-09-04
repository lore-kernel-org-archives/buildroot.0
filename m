Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4368BECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 19:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8D460F3E;
	Sun,  4 Sep 2022 19:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC8D460F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_nXrYp_NK_J; Sun,  4 Sep 2022 19:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B539E60F2C;
	Sun,  4 Sep 2022 19:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B539E60F2C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6D281BF303
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF3174024B
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 19:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF3174024B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7mBeES2cJNpK for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 19:07:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97C54401A3
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97C54401A3
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 19:07:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b16so8739991wru.7
 for <buildroot@buildroot.org>; Sun, 04 Sep 2022 12:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=xQ72amWpPdyHYz/TsWzanSw0O4YiaAM9Z7GYc15OTE0=;
 b=qihLa463DATRepNL0yNfHB2gObEod/iMBtoYN7p6CFfc0HCDydbn2/ina1teCALDGL
 Z10vIqMRj7PGAQctl21J58khmal950R+C++HdXTAeYYFRNXsUBXPwzXzPpnm4WlaNxZL
 KOTQQAl7JD8BBDhxTX7l+TmUYz/33ft/A8EfPvJr0RUbHnPmP6IGoSUHVpos/XEmu6M3
 hLTcgfvSL/7UjYOwREbikM7qJYvuQRU6Tr1N4c31cMVpf0JreCgbx3zWdGJLgzroDjAx
 hHD+qJwOjKbCgtXErP3Z63J+9OWs9pFDzY7u7Po8ZA8DfAKbyY6iT+8Cg+45RfMj/TO4
 li0Q==
X-Gm-Message-State: ACgBeo2P/uM2a3YP2WKJ3KGmzMzbSmQSDqcUt+W8R91NaopJcZpEveko
 IdsuzLabXUm1WN+cS3JyqKGyy8IAqFA=
X-Google-Smtp-Source: AA6agR72nFsB6ICBYszclnK5bDyaK7CBwMyTAuqz0yNVe3rknUYXuljtLdnow+hkGiVvaehlelQ8pQ==
X-Received: by 2002:a05:6000:a16:b0:228:4a6c:59c8 with SMTP id
 co22-20020a0560000a1600b002284a6c59c8mr4261797wrb.524.1662318470731; 
 Sun, 04 Sep 2022 12:07:50 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 bs30-20020a056000071e00b002287513f169sm1680377wrb.55.2022.09.04.12.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 12:07:49 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 21:07:45 +0200
Message-Id: <20220904190745.2798457-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=xQ72amWpPdyHYz/TsWzanSw0O4YiaAM9Z7GYc15OTE0=;
 b=eTW/+Plsge+NH644DFgUmVxtz/+p3ltvLaEmrzZCVscwsLBSLyjW51Tqs4gbD6bXmD
 S9K+faERW8EUNjK5GjNcbxy0pPnQbYZBJAed9SFUCC3sZXoDD4tQuECE6tLMoycoGmrA
 mpWCEUg3R9ELYkueVE2cALLgDOn6Q17B5K09pT2DeVRdRbnPnh11+llSMqdap2CvFsaG
 3VH3D991korsG4piIg5b+hJnbrjf+RS2Nwq7UDemxLiPk8VtpT5fDh7IizMNEBPG0Nvf
 DMHHV/EPOIMgup1GWFrPslg8ZnbnINWM/iUhfjV05Qkd59Ivpi/tNHl1/WJYzJzX4l3f
 4XXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eTW/+Pls
Subject: [Buildroot] [for-next] package/qemu: bump to version 7.1.0
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove upstream commit:
0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch

Changes log:
https://wiki.qemu.org/ChangeLog/7.1

vnc-png option renamed to png:
https://gitlab.com/qemu-project/qemu/-/commit/95f8510ef428f988897176b9585b8ba1432f939f

linux-user has been fixed to build with glibc >= 2.36 (sys/mount.h):
https://gitlab.com/qemu-project/qemu/-/commit/3cd3df2a9584e6f753bb62a0028bd67124ab5532

Runtime tested in gitlab:
https://gitlab.com/kubu93/buildroot/-/pipelines/630473210

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...ll.c-fix-build-without-RLIMIT_RTTIME.patch | 48 -------------------
 package/qemu/qemu.hash                        |  2 +-
 package/qemu/qemu.mk                          |  8 ++--
 3 files changed, 5 insertions(+), 53 deletions(-)
 delete mode 100644 package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch

diff --git a/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch b/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
deleted file mode 100644
index 729c2e9be8..0000000000
--- a/package/qemu/0003-linux-user-syscall.c-fix-build-without-RLIMIT_RTTIME.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 84863e007d4ef0858e74a1250e2472954924c617 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 14 May 2022 16:10:16 +0200
-Subject: [PATCH] linux-user/syscall.c: fix build without RLIMIT_RTTIME
-
-RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
-1.2.0 and
-https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
-resulting in the following build failure since
-https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:
-
-../linux-user/syscall.c: In function 'target_to_host_resource':
-../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
- 1057 |         return RLIMIT_RTTIME;
-      |                ^~~~~~~~~~~~~
-      |                RLIMIT_NOFILE
-
-Fixes:
- - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://patchwork.ozlabs.org/project/qemu-devel/patch/20220523105239.1499162-1-fontaine.fabrice@gmail.com]
----
-Changes v1 -> v2 (after review of Laurent Vivier):
- - Use an ifdef block instead of defining RLIMIT_RTTIME
-
- linux-user/syscall.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index dd0d92ba4e..488facb356 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -1053,8 +1053,10 @@ static inline int target_to_host_resource(int code)
-         return RLIMIT_RSS;
-     case TARGET_RLIMIT_RTPRIO:
-         return RLIMIT_RTPRIO;
-+#ifdef RLIMIT_RTTIME
-     case TARGET_RLIMIT_RTTIME:
-         return RLIMIT_RTTIME;
-+#endif
-     case TARGET_RLIMIT_SIGPENDING:
-         return RLIMIT_SIGPENDING;
-     case TARGET_RLIMIT_STACK:
--- 
-2.35.1
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 9c1a85a347..06d090bd1d 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  f6b375c7951f728402798b0baabb2d86478ca53d44cedbefabbe1c46bf46f839  qemu-7.0.0.tar.xz
+sha256  a0634e536bded57cf38ec8a751adb124b89c776fe0846f21ab6c6728f1cbbbe6  qemu-7.1.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9e1bec3836..57d7e31cb6 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 7.0.0
+QEMU_VERSION = 7.1.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
@@ -124,10 +124,10 @@ QEMU_OPTS += \
 	--disable-vnc-sasl
 QEMU_DEPENDENCIES += libvncserver
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-QEMU_OPTS += --enable-vnc-png
+QEMU_OPTS += --enable-png
 QEMU_DEPENDENCIES += libpng
 else
-QEMU_OPTS += --disable-vnc-png
+QEMU_OPTS += --disable-png
 endif
 ifeq ($(BR2_PACKAGE_JPEG),y)
 QEMU_OPTS += --enable-vnc-jpeg
@@ -388,7 +388,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vhost-user-blk-server \
 		--disable-virtiofsd \
 		--disable-vnc-jpeg \
-		--disable-vnc-png \
+		--disable-png \
 		--disable-vnc-sasl \
 		--enable-tools \
 		$(HOST_QEMU_OPTS)
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
