Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9D1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 09:18:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661E861268
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 09:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 661E861268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D94605CD;
	Thu, 11 Nov 2021 09:18:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ry864fAe2S9; Thu, 11 Nov 2021 09:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72DB8606A3;
	Thu, 11 Nov 2021 09:18:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 483A71BF2E3
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 09:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 446FD605CD
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 09:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_qMu3gEuvTG for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 09:18:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36B02605C8
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 09:18:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w29so8611336wra.12
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 01:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EgUwoDy46+3aOFPA5E+pANUetksVzyFSGSHJBTFGJVo=;
 b=qBO7tQj3GMnMMuLRNjgx4X1ZE41Eq/1ELUlbX5pF5XKnNYXSp5Oi0i720eEklW71vc
 T7TzH0FIn4+bEKUQkYvqG512IA0Z8HP7Dw+ewhWGccs6qDYV1B5Fdjl46D1vkBrMuyJ3
 SHbrh1EzuWYfVH2qj3WDCXWIHCOeeXqiXTSuoc5kMO0CXcDs1ZT14KlREqOxOp2bx+dv
 k7Wm5Qz0FWmQhInw+Vt22HjGn3dYzi8qd9JnpMoIeMyhTO7Kc8Dtas9eP0R25BWHdInF
 dGO+mR74mr3oWM2NY2Te/SXuZcTh8qddPPwJR6vputUdg+mjaXfsAGZVM/HlVanIACP4
 IN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EgUwoDy46+3aOFPA5E+pANUetksVzyFSGSHJBTFGJVo=;
 b=pGfNOgkWxggAz+T3CW5grnmsBmLIuzqYLjnL2xYUK+6FQwFiUqDo5kDb6BarczNNU/
 DuY2B2u/Bp7JVgF6/Ja5V5QbbUgYhEX+28LgkniaMJuFCC5lCLgQAdpI56AzzlQMcwbs
 wg8ajhazgUnq0GSKbxa71mZv7tJQ2GVwleLWDdAFUhQrkZ6r0BVoWkeSxzvrXKOp98oy
 DOCybFGkzyL3HhdHLuOROPsDLuuJ+WX2D2PfIKw3dKfyrODiG5dZZ9wiBakNhqLIMh5g
 pzW5MH2T+JAd/ggQS+7iXsrXGQnNdAsLf5nH4Vj0HG/taeXtcpIUopVuc4d2CofTHW99
 O7pQ==
X-Gm-Message-State: AOAM530uam2zgTnk9mLVd0nZ5aMqQlTSGbv/ftZ//aT1DZN6iJ5upRzm
 xDpzuGim8Lcfr7rgnvxTECKtXz9pjlw=
X-Google-Smtp-Source: ABdhPJy339rJGOfh3DMWYA3HJ/Ns5B+nn5mNLuBAZbUHrDzEYRLYFVlijcKpaaWaa1hPu1IqEg1BiA==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr6936795wrn.135.1636622315988; 
 Thu, 11 Nov 2021 01:18:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id s24sm2101134wmj.26.2021.11.11.01.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 01:18:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 10:16:38 +0100
Message-Id: <20211111091638.2307787-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.3582
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

- Fix CVE-2021-3928: vim is vulnerable to Stack-based Buffer Overflow
- Drop patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...for-nanosecond-resolution-timestamps.patch | 56 -------------------
 package/vim/vim.hash                          |  2 +-
 package/vim/vim.mk                            |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch

diff --git a/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch b/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch
deleted file mode 100644
index 2e78a8d594..0000000000
--- a/package/vim/0001-Fix-config-of-old-systems-for-nanosecond-resolution-timestamps.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From b5db1ebf06d2904522ebf246f9c6a8bbf8fca398 Mon Sep 17 00:00:00 2001
-From: Gary Johnson <garyjohn@spocom.com>
-Date: Tue, 26 Oct 2021 13:50:19 -0700
-Subject: [PATCH] Fix config of old systems for nanosecond-resolution
- timestamps
-
-On old systems (e.g. 32-bit systems running Ubuntu 10.4), defining
-_XOPEN_SOURCE causes _BSD_SOURCE and _SVID_SOURCE not to be defined,
-which causes nanosecond-resolution timestamps not to be included in
-struct stat, which causes the build of fileio.c to fail.
-
-_XOPEN_SOURCE is defined for some systems in vim.h.
-
-A solution is to define _BSD_SOURCE and _SVID_SOURCE whenever
-_XOPEN_SOURCE is defined.
-
-On new systems, defining either _BSD_SOURCE or _SVID_SOURCE causes
-/usr/include/features.h to issue a warning message about _BSD_SOURCE and
-_SVID_SOURCE being deprecated and to use _DEFAULT_SOURCE instead.
-
-A solution for that is to also define _DEFAULT_SOURCE when _BSD_SOURCE
-and _SVID_SOURCE are defined.
-
-[Retrieved from:
-https://github.com/vim/vim/pull/9054/commits/b5db1ebf06d2904522ebf246f9c6a8bbf8fca398]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/vim.h | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/src/vim.h b/src/vim.h
-index 31d4bdefe87..f62ad88c7a1 100644
---- a/src/vim.h
-+++ b/src/vim.h
-@@ -43,6 +43,21 @@
- // 700 is needed for mkdtemp().
- #  ifndef _XOPEN_SOURCE
- #   define _XOPEN_SOURCE    700
-+
-+// On old systems, defining _XOPEN_SOURCE causes _BSD_SOURCE and/or
-+// _SVID_SOURCE not to be defined, so do that here.  Those are needed to
-+// include nanosecond-resolution timestamps in struct stat.  On new systems,
-+// _DEFAULT_SOURCE is needed to avoid warning messages about using deprecated
-+// _BSD_SOURCE or _SVID_SOURCE.
-+#   ifndef _BSD_SOURCE
-+#    define _BSD_SOURCE 1
-+#   endif
-+#   ifndef _SVID_SOURCE
-+#    define _SVID_SOURCE 1
-+#   endif
-+#   ifndef _DEFAULT_SOURCE
-+#    define _DEFAULT_SOURCE 1
-+#   endif
- #  endif
- # endif
- 
diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index bbe65c4dda..e07e48c68f 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ac2264c45684218232ec49a6ae8b88b9a68312b664b93b811868d24c39d8dc11  vim-8.2.3565.tar.gz
+sha256  363a90e45eb93c73340a711223c7ce5e564432f9eb34624e1a545f4fd57dd49d  vim-8.2.3582.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 960759aab4..0eb96dc835 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.3565
+VIM_VERSION = 8.2.3582
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
