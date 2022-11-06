Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC46C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E277C81A73;
	Sun,  6 Nov 2022 15:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E277C81A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ao3TBb7uUd0j; Sun,  6 Nov 2022 15:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19DF881A58;
	Sun,  6 Nov 2022 15:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19DF881A58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AFDB1BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12E8C81A58
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E8C81A58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7KICQ6-2ISZ for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:48:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F9B5819ED
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F9B5819ED
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:48:36 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y6so7119675iof.9
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 07:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=46YEeqMd3GIhTDJ01cQtW77oZIWZCaUP8IN1WInBbQw=;
 b=TW7Jvuie9X362oO1UjKqeGipg9/9FkmuBCASHo5YD4aXJoeK08RD2FkE2WxUd2yYtd
 pBDmgvH9WJGLZImRUis+L1XPNE1YaKpzZG/KLOsqyhZyusQmPQY4YHgyH803NwbiCEfo
 3/IPWo8MKCCffF1y3z+Rv/j5JuChGDJBNLEMGf7LFce3ZbEv0inchMw/fQJ1ToIlOe59
 OjWsQsSPZQI9EWiR9Ta5+XBdpHc2FZH83qnSizwKm0jnERSyns/eCCeRpUlELztCSGF4
 U5B6bWTL8nPA9T097qz01LkC2mf9ua7hxoPEOYoJYWgjBtCGB7at7c0pT8mhhxNLPPpN
 o4Ig==
X-Gm-Message-State: ACrzQf3FSUGrjtWVs91XBR+RxMPTnW8eZmBqBuJ6xVabvfQM+9Ay03R4
 tzoyvM4bu3InWAS+R0P2l9yTSadtnI+7Sw==
X-Google-Smtp-Source: AMsMyM7TCGAoxLKRtOE1sHCadSLtFyqdcWgFUT+kJK2OtLVx9AdCCGEe8wuMm95VqZOoTaU0NsHBdA==
X-Received: by 2002:a05:6638:4784:b0:349:ec6c:e133 with SMTP id
 cq4-20020a056638478400b00349ec6ce133mr27204622jab.1.1667749714616; 
 Sun, 06 Nov 2022 07:48:34 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p3-20020a0566380e8300b00374f99a3de5sm1806890jas.63.2022.11.06.07.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:48:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 08:48:32 -0700
Message-Id: <20221106154832.310618-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=46YEeqMd3GIhTDJ01cQtW77oZIWZCaUP8IN1WInBbQw=;
 b=PGDvV5hl9X8Mm+/U/0DaL3HjwSLh3cPBPGgLbC4VBHwOac5VfdweIQU7whjzR7MZrT
 398dsgQJgzy8cNKPM50mh9XWX0zaX14vcaU6ipbKf62KRRqv/ioJ5y727PDTRz25eoDR
 y5k0grG4dlHH/r8DKjba+74fl+j/lstQ/RxPDGmWTLoJkNvjaYujQrcJ7gskD/pWcB/9
 rXZCCpVjRq42FD24MJwIOA8M36/zVbfa86IfRP7rHcmVmOQ+WLopyKhBrmb8KMvuxG97
 XR6EuForxdEc+LPtBSM6pZcD8cadsnt2N/pmcdrIgFKRLLcq/dvtXnuIwRgVdxbpGa+m
 8dEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PGDvV5hl
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.64.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 60d9ae9436..2a76f32874 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.63.3/meson-0.63.3.tar.gz.asc
-sha256  519c0932e1a8b208741f0fdce90aa5c0b528dd297cf337009bf63539846ac056  meson-0.63.3.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.64.0/meson-0.64.0.tar.gz.asc
+sha256  c5e27e091c2a35b9049e152a6535045ebbd057253aeb67856de6ecbb7b917bab  meson-0.64.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 3ca483c289..06ca555d12 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.63.3
+MESON_VERSION = 0.64.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
