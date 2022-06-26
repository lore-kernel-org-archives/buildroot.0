Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914ACC43334
	for <buildroot@archiver.kernel.org>; Sun, 26 Jun 2022 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3466561035;
	Sun, 26 Jun 2022 19:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3466561035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OoV9NG1zchQs; Sun, 26 Jun 2022 19:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23B1360FE4;
	Sun, 26 Jun 2022 19:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23B1360FE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 910221BF983
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 19:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 794CA4161A
 for <buildroot@lists.busybox.net>; Sun, 26 Jun 2022 19:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794CA4161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4HiJqUej7tEk for <buildroot@lists.busybox.net>;
 Sun, 26 Jun 2022 19:52:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6648241603
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6648241603
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 19:52:03 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 i67-20020a1c3b46000000b003a03567d5e9so4624448wma.1
 for <buildroot@buildroot.org>; Sun, 26 Jun 2022 12:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4jlbL30+PPE4+e/tacb+9OKeq4JpsS/YbwP6ThYzVrM=;
 b=ki+2wl7o7ypjihcJ7MAHJZxJStcu/vG0nZQPdik+RLFSfKC/hTihH/eYEKFXEdeaxj
 hFQT3Ujzs2HIQU5dhV6eG9yuop1npMYwQEoYBYnkY9935e+I1fqHjnzRNpcWW8TPTcE0
 9fwqije6FVEn0xBc7Q5XODbvg77o83YpYSA3rFrYTFNBZohtxRNAzlUpmWai4fSV4IXV
 E2MfYJwgzKyhvehfjj3OWGh1h6FRL0Uga/PDnCFnqhbUBks8JWUabcN+YliR0n+lk+wY
 bIGZR0MzRAOqahZrVmOOCtJhR3I1U8VTCTPzd+P9kB2MIOWpM+LlLwtduElIomb0/kFF
 eLLw==
X-Gm-Message-State: AJIora/oZyEuotMHbUN2Hgt0M0YfrvV+998FYGZRj3bKEDwsKsYuuOnf
 VKHClK9USSfE7Nvf5urQeNJbIsTmROs=
X-Google-Smtp-Source: AGRyM1sjA0c75RZeZrMj+oHPKAfRdGDhK+Fz+DH4KrVoUi8AZAhYZHmeJ5C8kr24zFRuAOjXklvQGw==
X-Received: by 2002:a05:600c:4ec7:b0:39c:84a7:3762 with SMTP id
 g7-20020a05600c4ec700b0039c84a73762mr11162924wmq.153.1656273121247; 
 Sun, 26 Jun 2022 12:52:01 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a5d6145000000b0020cdcb0efa2sm8410576wrt.34.2022.06.26.12.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 12:52:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jun 2022 21:49:07 +0200
Message-Id: <20220626194907.1569568-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220626194907.1569568-1-fontaine.fabrice@gmail.com>
References: <20220626194907.1569568-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4jlbL30+PPE4+e/tacb+9OKeq4JpsS/YbwP6ThYzVrM=;
 b=pPjAZnag89qcU9MBBk9hy2UIRZfxrp/n7MBmBeq6apF00NPH3GnZRPmBxeoRa4us2w
 iEgINHJZvg9aYMBpVE15W7UdTeWsT1rZ9gdJETmLQwRzj3N0SWfdF7pY3EO9TlXw5VuW
 vJ2BDaGUqOfqZeAg3YcrMSgKY6H2GUhEnCqEayCQfz67+SqrMrW/EKy1R51isl4huQTx
 01NxJ/kffD03wpnvXGF3iKdeCZr0xUWULRhJUhgVamJrsPjlJt2tcWjqd1z8aJtLrZp0
 gXe03oNCOr+13wlviPl57O8QbKBGGlj2RHxfXj6C+Ton2PXnAuwcHj1uXCPBOkNVwR+G
 F7Yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pPjAZnag
Subject: [Buildroot] [PATCH 2/2] package/speexdsp: bump to version 1.2.1
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

- Use official tarball and so drop autoreconf
- Update hash of COPYING (trailing white space removed:
  https://gitlab.xiph.org/xiph/speexdsp/-/commit/68311d46785be76d2a186c75578d51108bff6dfb)

https://gitlab.xiph.org/xiph/speexdsp/-/tags/SpeexDSP-1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/speexdsp/speexdsp.hash | 6 ++++--
 package/speexdsp/speexdsp.mk   | 6 ++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/speexdsp/speexdsp.hash b/package/speexdsp/speexdsp.hash
index 82e054d4d4..b46df791b4 100644
--- a/package/speexdsp/speexdsp.hash
+++ b/package/speexdsp/speexdsp.hash
@@ -1,3 +1,5 @@
+# From https://ftp.osuosl.org/pub/xiph/releases/speex/SHA256SUMS.txt
+sha256  8c777343e4a6399569c72abc38a95b24db56882c83dbdb6c6424a5f4aeb54d3d  speexdsp-1.2.1.tar.gz
+
 # Locally computed
-sha256  0fe0e31be215f820bed0f9c913c673997773fce3a03a4555658e7b73a54eed7b  speexdsp-SpeexDSP-1.2.0.tar.bz2
-sha256  671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
+sha256  2654a4264b2bfe298dedc508748d140111840c315cc8eb646a3a68c13fa75b01  COPYING
diff --git a/package/speexdsp/speexdsp.mk b/package/speexdsp/speexdsp.mk
index 8e886b2b21..8edad7c0d2 100644
--- a/package/speexdsp/speexdsp.mk
+++ b/package/speexdsp/speexdsp.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-SPEEXDSP_VERSION = 1.2.0
-SPEEXDSP_SOURCE = speexdsp-SpeexDSP-$(SPEEXDSP_VERSION).tar.bz2
-SPEEXDSP_SITE = https://gitlab.xiph.org/xiph/speexdsp/-/archive/SpeexDSP-$(SPEEXDSP_VERSION)
+SPEEXDSP_VERSION = 1.2.1
+SPEEXDSP_SITE = https://downloads.xiph.org/releases/speex
 SPEEXDSP_LICENSE = BSD-3-Clause
 SPEEXDSP_LICENSE_FILES = COPYING
 SPEEXDSP_INSTALL_STAGING = YES
 SPEEXDSP_DEPENDENCIES = host-pkgconf
-SPEEXDSP_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
