Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4264DC6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 20 Mar 2023 17:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97137605A4;
	Mon, 20 Mar 2023 17:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97137605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKB9kVHkCdN8; Mon, 20 Mar 2023 17:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC24D607A4;
	Mon, 20 Mar 2023 17:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC24D607A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE1FA1BF307
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 17:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 989A040A18
 for <buildroot@lists.busybox.net>; Mon, 20 Mar 2023 17:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 989A040A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id taqmyILZt8Kc for <buildroot@lists.busybox.net>;
 Mon, 20 Mar 2023 17:15:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B0DE404A5
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B0DE404A5
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 17:15:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id l27so2793469wrb.2
 for <buildroot@buildroot.org>; Mon, 20 Mar 2023 10:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679332546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/V4Yp1cazEeAs9Qa45V3pTPlvLjrqpJVDAfagD4jpFo=;
 b=z9TN5ydht36g1fkUcJoNqmSd/8ynI/KT5taTQlbVLpl7fGcxS63SnKibIVgICM3/+0
 XeewZ8TvvVI6XWfgfwYCp0HTArD5fywpRMxKQwaM0KFZOLisDamD4NQOV2bt9+kDllKr
 gTKkolirbRg1UjND5mGco+hzJDFk14BXo97XsvrTETGTqV3tutP/WvEd3Zv1pckd7Ot7
 NjbMCrgNNcqEJQ7f6i2vCv/CEjEghilgUE/sjH7pilRaUXv+sVXyH+g+WJITatgZ3+ic
 1Db0/VZ6YImkuEfiuUZVfTAtYxlApFlWofWqDLeq13hC59zjM8d6Rasznlumm95NhbGD
 cvyw==
X-Gm-Message-State: AO0yUKWgOCyK8yiESfYlLaROt350FrqDdjlso1vatSxGKstp91q15l26
 9TYw9Y5tP3s5VvtRFNlEG5zwKoWIt68=
X-Google-Smtp-Source: AK7set+n/J69/4fzYCzQx9sgZ7FREM+8UkB907RdZn7ii76+B/UmdQA9gd6mF6mdhSIiNnHk9udWzg==
X-Received: by 2002:adf:e98f:0:b0:2ce:aa69:c9a7 with SMTP id
 h15-20020adfe98f000000b002ceaa69c9a7mr113410wrm.8.1679332545868; 
 Mon, 20 Mar 2023 10:15:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b002c70851fdd8sm9414327wrt.75.2023.03.20.10.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 10:15:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Mar 2023 18:15:43 +0100
Message-Id: <20230320171543.1076609-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679332546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/V4Yp1cazEeAs9Qa45V3pTPlvLjrqpJVDAfagD4jpFo=;
 b=UIOr9SE6PdiB3c4FPTPlkKeOQdzqaeliZzr0MWK3rOrc5tCDHv0Dut155UN/oyzmec
 Bwhhp/B6z5yayMl6aMqG0Mlj7LACwx6DvYGvQsuFR+p5HAtN+shtwE9uQ4vubCXBMGkE
 0jD/FIqzE4vpL3dSra00YTiaiudGmfF+lrKRoxC+yc3EpH8da1TOSmjRuUG3D3UJJm+l
 ER2ptIKCdzQqTU34g++496fCTwDIKjJzEXXJAbIvRMkQyhTj3H7ARSHoenD1+z0Oavti
 7i1MHiHLvetMGlp61VzCnHKg4o05BYkRLWhvwB/fPsCqR21Ho/oLX8PqsSQOoE5Ulrj1
 O26g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UIOr9SE6
Subject: [Buildroot] [PATCH 1/1] package/sudo: security bump to version
 1.9.13p3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2023-27320: Sudo before 1.9.13p3 has a double free in the
  per-command chroot feature.
- Update patch
- Update hash of LICENSE.md (year and indentation updated:
  https://github.com/sudo-project/sudo/commit/dd934d6a218c05d2df61b5306e38c71edaa6ac59
  https://github.com/sudo-project/sudo/commit/e5634ae99184d50afbdcb8a69dd4018b1a14871d)

https://www.sudo.ws/security/advisories/double_free
https://www.sudo.ws/releases/stable/#1.9.13p3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...onfigure.ac-fix-openssl-static-build.patch | 42 +++++++++----------
 package/sudo/sudo.hash                        |  4 +-
 package/sudo/sudo.mk                          |  6 +--
 3 files changed, 25 insertions(+), 27 deletions(-)

diff --git a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
index 32edd148a0..dc91af6119 100644
--- a/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
+++ b/package/sudo/0001-configure.ac-fix-openssl-static-build.patch
@@ -1,6 +1,6 @@
-From 5cfc7e277d0b262a1d12e867c47a36301fb7edb7 Mon Sep 17 00:00:00 2001
+From 1fed5adc166d5f2190a6b6ad048ec2d803316327 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 22 Feb 2023 10:01:25 +0100
+Date: Wed, 22 Feb 2023 10:13:30 +0100
 Subject: [PATCH] configure.ac: fix openssl static build
 
 Do not use AX_APPEND_FLAG as it will break static builds by removing
@@ -24,26 +24,24 @@ Fixes:
  - http://autobuild.buildroot.org/results/8be59dd94e4916f9457cb435104e36e62a28373b
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/sudo-project/sudo/pull/244]
+[Retrieved from:
+https://github.com/sudo-project/sudo/commit/1fed5adc166d5f2190a6b6ad048ec2d803316327]
 ---
- configure.ac | 4 +++-
+ m4/openssl.m4 | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 8eccad7e4..523d8e56b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3082,7 +3082,9 @@ if test "${enable_openssl-no}" != no; then
- 		    SUDO_APPEND_LIBPATH([LIBTLS], [$f])
- 		    ;;
- 		*)
--		    AX_APPEND_FLAG([$f], [LIBTLS])
-+		    # Do not use AX_APPEND_FLAG as it will break static builds by removing
-+		    # duplicates such as -lz or -latomic which are needed by -lssl and -lcrypto
-+		    LIBTLS="$LIBTLS $f"
- 		    ;;
- 	    esac
- 	done
--- 
-2.39.0
-
+diff --git a/m4/openssl.m4 b/m4/openssl.m4
+index a2e4941ae8..b4cbd821db 100644
+--- a/m4/openssl.m4
++++ b/m4/openssl.m4
+@@ -44,7 +44,9 @@ AC_DEFUN([SUDO_CHECK_OPENSSL], [
+ 			SUDO_APPEND_LIBPATH([LIBTLS], [$f])
+ 			;;
+ 		    *)
+-			AX_APPEND_FLAG([$f], [LIBTLS])
++			# Do not use AX_APPEND_FLAG as it will break static builds by removing
++			# duplicates such as -lz or -latomic which are needed by -lssl and -lcrypto
++		        LIBTLS="$LIBTLS $f"
+ 			;;
+ 		esac
+ 	    done
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index c920b9fe74..720b21d849 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,4 +1,4 @@
 # From: https://www.sudo.ws/getting/download/
-sha256  b9a0b1ae0f1ddd9be7f3eafe70be05ee81f572f6f536632c44cd4101bb2a8539  sudo-1.9.12p2.tar.gz
+sha256  92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b  sudo-1.9.13p3.tar.gz
 # Locally calculated
-sha256  d2f93a3b17ed5586fddd07be33ad767146c1a81a22682baa68bb4360a31d020a  LICENSE.md
+sha256  ea33b3971e8e4d9657cd6794a952aaa71b22bd16745f1645455b6ead010e0a28  LICENSE.md
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 4c900ba10b..73b3503e6a 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUDO_VERSION_MAJOR = 1.9.12
-SUDO_VERSION_MINOR = p2
+SUDO_VERSION_MAJOR = 1.9.13
+SUDO_VERSION_MINOR = p3
 SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
@@ -13,7 +13,7 @@ SUDO_LICENSE_FILES = LICENSE.md
 SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
 SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
 SUDO_SELINUX_MODULES = sudo
-# We're patching configure.ac
+# We're patching m4/openssl.m4
 SUDO_AUTORECONF = YES
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
