Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F588ECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 22:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CA734019E;
	Fri, 28 Oct 2022 22:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA734019E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DdeWG1lokI1d; Fri, 28 Oct 2022 22:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C57A40327;
	Fri, 28 Oct 2022 22:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C57A40327
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D20701BF855
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 22:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD67160BCB
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 22:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD67160BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NehsYiJU_-q6 for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 22:02:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8986360BC7
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8986360BC7
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 22:02:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z14so8225373wrn.7
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 15:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UM5V7KUqjmEqntpp2U6BvSjIZx/ZTMpr4C3BsXhlyGc=;
 b=bp347HrGNtEIJ/+Lw9jVB+I2R7kpgdzWbqjd5gcuomvdINh6YvvKqERzIKZLMJcHRm
 BDu35s4+T6HPn1evIyg9EQ7HE3B1iNfqFxnjjv0sWxboKD3yAP8wtiqAbOZzz6KXqoET
 7We0kD01xBxluc/KTjrC8pmB3TqAywTkd5yP87hv8odHZEV7Cg/jVzeTXygm9AN58bsT
 ibZxUvoFvHdp+Akfr5MY9bJQErTUYHZI4y/b0mM+qn7JIdQPMrhauUbjnOn0imIJSWcC
 qm5Mab9J+oys1OL2bgS8vw58hCRbCsx9wKW8jBM9ex2IgUIuHMV3rHnHIjmcpvvPCy4M
 3AWQ==
X-Gm-Message-State: ACrzQf08GuJnZkODxw7mK7wWVWvGfipKREuKqyjzC7Zw8QYmHCVWLXJr
 x6nSWG0KS2FN5pMMHybnQAkd65ELiYo=
X-Google-Smtp-Source: AMsMyM5vArQIWGUuo3bTxNTgVy0Ogv+uUFMJB13iq3XUVPVIhFAVfA6pZwKn2qWSey531TbZ6OIK7Q==
X-Received: by 2002:a5d:4acc:0:b0:236:6665:b471 with SMTP id
 y12-20020a5d4acc000000b002366665b471mr758371wrs.633.1666994546350; 
 Fri, 28 Oct 2022 15:02:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c500700b003b47ff307e1sm5805424wmr.31.2022.10.28.15.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 15:02:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 00:02:23 +0200
Message-Id: <20221028220223.286949-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UM5V7KUqjmEqntpp2U6BvSjIZx/ZTMpr4C3BsXhlyGc=;
 b=qqw6UinOhvgkPJtX5Nry2HzNpCuiBatdNlrh5ZVRDcxiI8MgDDO2+Rh5sUv4VcbF9l
 wW360RBo2NQ6lWEKuXJzy2koJusSyx0L/WvkgHOk1lJBIo4QO0e2oN0+4FcM4cznCm3l
 8LS4fFlW23k8VTHEx479LyaqhuT4uMe7rcc4FEKvIRIhvXX4/mIGLDiuFG7/BBvYgr/W
 eRtJY/ZJBw1l5qtgKPWIyCv6n+mavcRYI71BSWeDqQJaWwfLUaWVDKdTwaZuP4KsvR9E
 v7bfR8Ae8rzMuk2dTATRXPTo6j48fVx5gw+ikeJe63pkzLOOkob4qNoZ400Q3IGHaFcL
 Mndw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qqw6UinO
Subject: [Buildroot] [PATCH 1/1] package/taglib: bump to version 1.13
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Use WITH_ZLIB which is available since
  https://github.com/taglib/taglib/commit/1644c0dd87f40a2492bde4011fe72257fc72ee0e

https://github.com/taglib/taglib/releases/tag/v1.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-on-systems-without-HAVE_GCC_ATOMIC.patch | 34 -------------------
 package/taglib/taglib.hash                    |  2 +-
 package/taglib/taglib.mk                      |  5 ++-
 3 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch

diff --git a/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch b/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
deleted file mode 100644
index d8af73cb08..0000000000
--- a/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1d24bd3399f2284104cbe87d017f87325b1797ab Mon Sep 17 00:00:00 2001
-From: Oleg Antonyan <oleg.b.antonyan@gmail.com>
-Date: Thu, 13 May 2021 16:41:35 +0200
-Subject: [PATCH] =?UTF-8?q?Fix=20"error:=20duplicate=20=E2=80=98volatile?=
- =?UTF-8?q?=E2=80=99"=20on=20systems=20without=20HAVE=5FGCC=5FATOMIC=20in?=
- =?UTF-8?q?=201.12=20(#1012)?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* fix error: duplicate volatile
-
-* fix volatile ATOMIC_INT in constructor
-
-[Retrieved from:
-https://github.com/taglib/taglib/commit/1d24bd3399f2284104cbe87d017f87325b1797ab]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- taglib/toolkit/trefcounter.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/taglib/toolkit/trefcounter.cpp b/taglib/toolkit/trefcounter.cpp
-index 18cb596c0..5b089abf9 100644
---- a/taglib/toolkit/trefcounter.cpp
-+++ b/taglib/toolkit/trefcounter.cpp
-@@ -52,7 +52,7 @@
- # define ATOMIC_INC(x) __sync_add_and_fetch(&x, 1)
- # define ATOMIC_DEC(x) __sync_sub_and_fetch(&x, 1)
- #else
--# define ATOMIC_INT volatile int
-+# define ATOMIC_INT int
- # define ATOMIC_INC(x) (++x)
- # define ATOMIC_DEC(x) (--x)
- #endif
diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 38a44b41a5..7d1b2e8422 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703  taglib-1.12.tar.gz
+sha256  58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0  taglib-1.13.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 9513e0d0e1..c687891002 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.12
+TAGLIB_VERSION = 1.13
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
@@ -13,6 +13,9 @@ TAGLIB_CPE_ID_VENDOR = taglib
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 TAGLIB_DEPENDENCIES += zlib
+TAGLIB_CONF_OPTS += -DWITH_ZLIB=ON
+else
+TAGLIB_CONF_OPTS += -DWITH_ZLIB=OFF
 endif
 
 define TAGLIB_REMOVE_DEVFILE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
