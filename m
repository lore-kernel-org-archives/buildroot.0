Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Jul 2022 15:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B2660EBB;
	Thu, 21 Jul 2022 15:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94B2660EBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c03gFoFfyX8A; Thu, 21 Jul 2022 15:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8188A60B94;
	Thu, 21 Jul 2022 15:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8188A60B94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20A121BF2B6
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF188405DC
 for <buildroot@lists.busybox.net>; Thu, 21 Jul 2022 15:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF188405DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bbon8OE3nOTH for <buildroot@lists.busybox.net>;
 Thu, 21 Jul 2022 15:05:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0C9D400E2
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0C9D400E2
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 15:05:52 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso980829wmm.5
 for <buildroot@buildroot.org>; Thu, 21 Jul 2022 08:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xaV3avL6gJLiNIVSEIdEUCSqYZCg3Q5raRYhMGlivY=;
 b=EUNwovyIZKlcoMHDvsBq34b+HL1SuxCKPKwu8AB7wB242Rks98v/g825nHd1SzgLZq
 mzJkHYPVBuC7Zl2srl/V+oDTqamZhffBnN9XaxUApPs2B/PGUQSsU+KFG2RDK0v472wX
 kPe9mKH95wEZVKppAYJ9TGDAt4rJ3uEei/LeACbCfo1xmI51A3tgSSmxWfw5XL2vof8o
 QXy4vCbca68ziRGzxuJAcY2m+k/VkFFmRsaN+exoiVuR7Qp2D2u8kb2AHwzLeqVODnBB
 6HbJPZUWxOrS+MTdmE7p4y3undWdUKbB13Sx11Ip/3KXwigCdZSJgjCNVyRKSDd7dEqo
 OvtQ==
X-Gm-Message-State: AJIora+y1OD4Dzurz5LEunuEEFl1y+n9SIso6wR1Q4SF73NTyL1BXAre
 dQhTM/2wd79dNvmaKD3xyNTdOWS2Mts=
X-Google-Smtp-Source: AGRyM1u4giDWbO2Vplx+0p3ITOtRDtIC6vf1CFWt05a8PZpus6MOmAEk61CbRVoPfPMUPtRtlmyVJg==
X-Received: by 2002:a05:600c:a42:b0:39c:9086:8a34 with SMTP id
 c2-20020a05600c0a4200b0039c90868a34mr8795227wmq.169.1658415950672; 
 Thu, 21 Jul 2022 08:05:50 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0021d69860b66sm2765423wrp.9.2022.07.21.08.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 08:05:50 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 21 Jul 2022 17:05:32 +0200
Message-Id: <20220721150534.68813-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7xaV3avL6gJLiNIVSEIdEUCSqYZCg3Q5raRYhMGlivY=;
 b=pYUFT43YF4uhKcsLs46x721t/qYcbSp8oyvEh+SWfGDWGX8pBVUMn6Uw/1yQ3ognoT
 s0YNV2LdopoHW3G+nHpnmT/+jwlOSGiAX2q2/Pj4sAAHksG9YlXozMs/hlA05X9+lORm
 Z7YT/rNHAf4GqIp69lsV25bWzCltmh5MuewM35ZvGMLxyI5qJI7mWA6tavPsakXgPRPs
 wsavO1X6NfHRWDNWkXEJExuw/hlzQcKGb4bUjWYbduhTtYgYE0zxDoiyop2MWJ0/rVcE
 rseTz/mkOMRU1ipPkU07TIGY0IivuOd7pJnyVejv0Ed5XHZLMw2wdnFG1QyvVpl+BAbz
 DGmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pYUFT43Y
Subject: [Buildroot] [PATCH v2 1/3] package/systemd: bump to version 251.3
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LICENSES/README.md hash updated, this line got added in
regards to files covered by CC0-1.0:

>   -config files and examples under /network

Add config option for the new sysupdate feature.

Remove upstreamed patch.

Update options: set new options to their default,
remove option not available anymore.

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
v1->v2:
*   note about changed LICENSES/README.md
*   always set default-user-shell to /bin/sh
*   always set default-locale to C-UTF-8
*   fix typos in commit message
---
 ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
 package/systemd/Config.in                     | 12 +++++++
 package/systemd/systemd.hash                  |  4 +--
 package/systemd/systemd.mk                    | 13 ++++++--
 4 files changed, 25 insertions(+), 37 deletions(-)
 delete mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch

diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
deleted file mode 100644
index 0934886acb..0000000000
--- a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 7 Jan 2022 22:25:23 +0100
-Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
-
-MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
-but it's defined in kernel headers since version 5.2.
-
-[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/basic/missing_syscall.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 8267b1a90c..793d111c55 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -569,6 +569,10 @@ static inline int missing_open_tree(
- #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
- #endif
- 
-+#ifndef MOVE_MOUNT_T_EMPTY_PATH
-+#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
-+#endif
-+
- static inline int missing_move_mount(
-                 int from_dfd,
-                 const char *from_pathname,
--- 
-2.31.1
-
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d5d88404de..9f1a778e59 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -475,6 +475,18 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
 
+config BR2_PACKAGE_SYSTEMD_SYSUPDATE
+	bool "enable sysupdate support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	  systemd-sysupdate atomically updates the host OS, container
+	  images, portable service images or other sources, based on
+	  the transfer configuration files described in sysupdate.d.
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysupdate.html
+
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
 	help
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 3572b25965..838ed13fd5 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
+sha256  11c9c3fcc13d689615dd2ea79161d1b992087cf1e2a23856d7d7ade0efbddc54  systemd-251.3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
@@ -11,4 +11,4 @@ sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
+sha256  177ff657698bc940f9888b7f69e5d734b0933c2859ea264fde8de1700cec40dd  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 46a4e8de2c..afee1cfc79 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 250.4
+SYSTEMD_VERSION = 251.3
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -62,6 +62,9 @@ SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
 	-Ddefault-hierarchy=unified \
+	-Ddefault-compression=auto \
+	-Ddefault-locale='C.UTF-8' \
+	-Ddefault-user-shell=/bin/sh \
 	-Didn=true \
 	-Dima=false \
 	-Dkexec-path=/usr/sbin/kexec \
@@ -472,6 +475,12 @@ else
 SYSTEMD_CONF_OPTS += -Dsysext=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
+SYSTEMD_CONF_OPTS += -Dsysupdate=true
+else
+SYSTEMD_CONF_OPTS += -Dsysupdate=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPTS += -Dnetworkd=true
 SYSTEMD_NETWORKD_USER = systemd-network -1 systemd-network -1 * - - - systemd Network Management
@@ -546,7 +555,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
 SYSTEMD_CONF_OPTS += \
 	-Defi=true \
 	-Dgnu-efi=true \
-	-Defi-cc=$(TARGET_CC) \
 	-Defi-ld=bfd \
 	-Defi-libdir=$(STAGING_DIR)/usr/lib \
 	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
@@ -797,6 +805,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dmachined=false \
 	-Dportabled=false \
 	-Dsysext=false \
+	-Dsysupdate=false \
 	-Duserdb=false \
 	-Dhomed=false \
 	-Dnetworkd=false \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
