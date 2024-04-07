Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D84ECD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7987D606BB;
	Sun,  7 Apr 2024 12:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyVKRWyOY5jZ; Sun,  7 Apr 2024 12:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 852046077E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 852046077E;
	Sun,  7 Apr 2024 12:07:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9331B1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D13C405FF
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmFbMbhY4u7o for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:07:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A122407B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A122407B4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A122407B4
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:07:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41649860cecso3616315e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 05:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712491617; x=1713096417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9v9zmOde/Eq/2Ez1LL+t/e1/aHbtNONqCuw0EzkjQL8=;
 b=BLal7XPvgUIFLe1sK9xRMmS6nq8iEAtW8Cp5Pl+ikkGsFh3ErZELiiQEdDhpfL3sPs
 Bi4LgwpNMLtnTJeLdoxXd4PuseTCpmQIzs/RnusKB9RY8sUn6ouT7cbOKwvzR54l9aHH
 XXtcD/F0y+tzeUeLQpOi0nqnp7TNDJTStqFmC6erTSlC7ydHmgGm0OfoYZDPaGMgwJvh
 6uJRrS9dosr9g+s1F8TCBR+peSmLpToM4Yw4n0BzcTFxhKmbpnqKVJDqmlULfAEvY25K
 MEyAxNqMfdPLGxIRcTZEFeGXnjdFyuzz8mry411JC4NaWIsJw80hgr1psgk+2Nrp/L+6
 cYEg==
X-Gm-Message-State: AOJu0YxrSwa+vzb+8e+8OTZ1bnUBeIj9YThfox8D/Pt9HrMYj9l++CsQ
 JKlKhBOWqy3gPqgTuDaPppJL2QH5UPBwhvlT70XRxk974JW8DmNoltkoUcCx
X-Google-Smtp-Source: AGHT+IF7L344KXjO1SvEw0Iqss3IJqYR7Wl2ACnz/SGeAgEtFJPCPcchlIw1HGGjNPB5ItyV8d3P3g==
X-Received: by 2002:a05:600c:1d0a:b0:415:6d51:8e53 with SMTP id
 l10-20020a05600c1d0a00b004156d518e53mr5804073wms.4.1712491617088; 
 Sun, 07 Apr 2024 05:06:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b004162ce49719sm10654574wmb.6.2024.04.07.05.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 05:06:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 14:06:52 +0200
Message-ID: <20240407120652.888743-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712491617; x=1713096417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9v9zmOde/Eq/2Ez1LL+t/e1/aHbtNONqCuw0EzkjQL8=;
 b=Nd5yXSD03uhl2j4aUQv3U71sxhcmH6VSF0Age5MOZtangAVWb3vN28wpadhpMAcAZx
 V7An94mxE/5Ri3FVB54vUj648n8ghDKcxnGXlYTCvrg+J980bHyeF8guaXU+KtvIWUA9
 hOwzEWhmKqyw/KrezOmzZz4yrQPGM9T+zDbHAGIsaWVqW7OgHped76AR4HZ+wK88mf4T
 kufHtWACVMN380h0mFJfBEhj8G0hnBbXTDfJS5n+XOGK8FGlaZITdPCvwwLjv2TYnn3l
 2orvlQiDfjLZ5UrwTNFtcx/j5SmuKZG+E3uuj+TrIUhzTXSLaeqcJn5epTQHTBif4akI
 iM1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Nd5yXSD0
Subject: [Buildroot] [PATCH 1/1] package/libxcrypt: use official tarball
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use official tarball and so drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 4 +++-
 package/libxcrypt/libxcrypt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index f021436b71..9bcf119077 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,6 @@
+# From https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz.sha256sum
+sha256  e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943  libxcrypt-4.4.36.tar.xz
+
 # Locally calculated
-sha256  b979838d5f1f238869d467484793b72b8bca64c4eae696fdbba0a9e0b6c28453  libxcrypt-4.4.36.tar.gz
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 8cb6751442..d39186eecb 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 LIBXCRYPT_VERSION = 4.4.36
-LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
+LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
+LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
 LIBXCRYPT_INSTALL_STAGING = YES
-LIBXCRYPT_AUTORECONF = YES
 
 # Some warnings turn into errors with some sensitive compilers
 LIBXCRYPT_CONF_OPTS = --disable-werror
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
