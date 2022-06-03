Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469BCC43334
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 17:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B944384354;
	Fri,  3 Jun 2022 17:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FeUfFfEWG6gA; Fri,  3 Jun 2022 17:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D236784348;
	Fri,  3 Jun 2022 17:16:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 135D61BF5E6
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 17:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0221C610A4
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 17:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHZROMv932Wu for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 17:16:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86C7E6109E
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 17:16:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 k36-20020a05600c1ca400b0039c2a3394caso3008140wms.2
 for <buildroot@buildroot.org>; Fri, 03 Jun 2022 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PXTVshQfKYiEAigMvYpxyeyN8VOmWY7eezxiNlCoOAE=;
 b=EHyaAfXVRwkTIEiM2qYtRRrhEQIZHxiCCO1w5vMHF+fDA3sErlPAXumMk6S9u/lYMa
 PtIqAoA1ouy7T4BCHR+IUGa29c8620EfBwvebsFwHni2Jixvv8FVwdCwFVSIqxzlcnFh
 y8bIXW3BMAf71wYY1HhcysMbo2HvCIQEfKCE6Gl4SZr2xTUgLPyj7zhYVQ6ylAt+Bjlu
 5X8Rx9QcT9mkYuZLY0ag9pc4eJEOJQLVdzN1wjgnng0QXjH7juu2PJjWqNYNiEKBbxwF
 ciLU3b73fIU2pzQdazegqfTAk0ivN/QheDKrHpZ3y5LZIwpDTPt78++QMX1bGfm+NVYJ
 j0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PXTVshQfKYiEAigMvYpxyeyN8VOmWY7eezxiNlCoOAE=;
 b=zUy3c+RzUCpKjxFqSNGYfNqBHhp+TNts8nkr8SplmxwqBk/duIzjUCri5x3eSdo80q
 DqbZyXe13XQsb89oR/Q9GaPpqL8DJPBGnycz4eze4vV8AsU9kL2rMX9frakuTNd8yLUE
 FV5/N2eFrQmQ3HXdJABVGbc1Upn114nCGk+LCbx28DZGUlInWWSL10Xu6wx94F/oPPue
 pG+WNBJumYRmUKucuF/VUj52PntlWliTw/cf3aEuLN53nEGxSbnZoTLVCtKUGkiu6Ffa
 x+MzSaHsVZq653guAXg0RRSQsEqJes1VOd04sesrnfXGIf/GMI/2CZPAzGg36dhfiESj
 Ya0Q==
X-Gm-Message-State: AOAM532SeZtVG1WhCB/f2alBNr9S1VtWvRAOqPYRtk/lib8brlxy3mnQ
 hMi0a6CHIfKryy2v8Dk32X+vvdx27Kk=
X-Google-Smtp-Source: ABdhPJwNvRP0RQdX3ULkkt+hreiibuzD56q5G2HNxRZ9nKlxqzzRLUVfALtT7rT+229EYT+xLUo4Ag==
X-Received: by 2002:a7b:c241:0:b0:397:4925:6d62 with SMTP id
 b1-20020a7bc241000000b0039749256d62mr9850303wmj.192.1654276565294; 
 Fri, 03 Jun 2022 10:16:05 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d560d000000b0020fe35aec4bsm8054872wrv.70.2022.06.03.10.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 10:16:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Jun 2022 19:12:53 +0200
Message-Id: <20220603171253.314118-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/memcached: fix uclibc build on
 aarch64
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

Fix the following uclibc build failure on aarch64:

crc32c.c:277:10: fatal error: sys/auxv.h: No such file or directory
  277 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/08591fbf9677ff126492c50c15170c641bcab56a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../memcached/0002-check-for-sys-auxv.h.patch | 50 +++++++++++++++++++
 package/memcached/memcached.mk                |  2 +
 2 files changed, 52 insertions(+)
 create mode 100644 package/memcached/0002-check-for-sys-auxv.h.patch

diff --git a/package/memcached/0002-check-for-sys-auxv.h.patch b/package/memcached/0002-check-for-sys-auxv.h.patch
new file mode 100644
index 0000000000..49b12ef7d7
--- /dev/null
+++ b/package/memcached/0002-check-for-sys-auxv.h.patch
@@ -0,0 +1,50 @@
+From 58b6de2135c10b64918f25c48f69f144d08a9c0d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Jun 2022 19:10:15 +0200
+Subject: [PATCH 2/2] check for sys/auxv.h
+
+Check for sys/auxv.h to avoid the following uclibc build failure on
+aarch64:
+
+crc32c.c:277:10: fatal error: sys/auxv.h: No such file or directory
+  277 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/08591fbf9677ff126492c50c15170c641bcab56a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ configure.ac | 1 +
+ crc32c.c     | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0985f07..3337fe7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -516,6 +516,7 @@ AH_BOTTOM([#ifdef HAVE_INTTYPES_H
+ #include <inttypes.h>
+ #endif
+ ])
++AC_CHECK_HEADERS([sys/auxv.h])
+ 
+ dnl **********************************************************************
+ dnl Figure out if this system has the stupid sasl_callback_ft
+diff --git a/crc32c.c b/crc32c.c
+index 26df879..05e61ff 100644
+--- a/crc32c.c
++++ b/crc32c.c
+@@ -273,7 +273,7 @@ void crc32c_init(void) {
+     }
+ }
+ 
+-#elif defined(__aarch64__) && defined(__linux__)
++#elif defined(__aarch64__) && defined(__linux__) && defined(HAVE_SYS_AUX_H)
+ #include <sys/auxv.h>
+ 
+ #if defined(HWCAP_CRC32)
+-- 
+2.35.1
+
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 8f3506f9d4..842c0b42fa 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -13,6 +13,8 @@ MEMCACHED_LICENSE = BSD-3-Clause
 MEMCACHED_LICENSE_FILES = COPYING
 MEMCACHED_CPE_ID_VENDOR = memcached
 MEMCACHED_SELINUX_MODULES = memcached
+# We're patching configure.ac
+MEMCACHED_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MEMCACHED_CONF_ENV += ac_cv_c_endian=big
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
