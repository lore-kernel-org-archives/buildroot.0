Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B13C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 16:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77DE940644;
	Sun,  9 Oct 2022 16:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77DE940644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkaOnz_fXaW4; Sun,  9 Oct 2022 16:01:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8637840734;
	Sun,  9 Oct 2022 16:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8637840734
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 122051BF239
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1BC8813FC
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1BC8813FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mOLdOHbfgfpT for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 15:59:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6999C813F4
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6999C813F4
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 15:59:57 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z15so3098355ljq.11
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 08:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0dVE1tinRSrxzHS6TNYdP+3Fe9YgWdyPUauM3bj+5CQ=;
 b=Dk32zFQY/C9Htxri4r7OzI43CN77xxC8/lyNdNJBVSUIUQfSRJ12oGTmPEl6Y74/HH
 TU+V7FgbHA76hPJLU/NhmUEs8xke80jwUTjdPvKlcITRgMIyVT/GWka/LHVWyA97Qqf6
 lQr+wBFTTivplD4knKiP20MuGop2F+sDN6/leNt9bMVoquy2EeWOzZ9Y041vUOr1xyRz
 Ksnoi7ilIBrDOh7t92u5sfFJZ8dl5xmzRy2uc7YKHMFxCepPDlC0RuSADjuqHOu5qTJ+
 5tmdPQyxg5tQopK6jyd8ZTYHGb1ql4+QzCzDp1DKIjKLxNHl7XP3fqzvYhkHX8iVLRVw
 j65g==
X-Gm-Message-State: ACrzQf2SH+QewnqgtYHE+Jmg+EsWUycJmelRkEJ0UESORWfdDyaxGDrQ
 y0rTGZmBNxCeHnVfjLAOWhiCb+5+5OI=
X-Google-Smtp-Source: AMsMyM42YtIW7We/yg5+sn+MOLPhK4vqeX5DxN3XA4hNnWQc/8nvUE6fB9fcxOF1kMBhZJ6WwOUnog==
X-Received: by 2002:a05:651c:1609:b0:26e:93e8:b6e with SMTP id
 f9-20020a05651c160900b0026e93e80b6emr2301902ljq.456.1665331195207; 
 Sun, 09 Oct 2022 08:59:55 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.08.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 08:59:54 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:34 +0200
Message-Id: <20221009155938.2041695-7-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dVE1tinRSrxzHS6TNYdP+3Fe9YgWdyPUauM3bj+5CQ=;
 b=WmuDSVZ/02iiDQ96ZbRMi1r/dayD2jsPcFu+x0CSrdsoO4s38Tl2qNzwfgRzaq3AIF
 4JRxfGCE1d5QRcDcu/fXHACCeaP6A30slrbk+8bSO4jbUA0RCvZArlXuhRdx0jA1ZT2F
 J2jhD4GRN+62lzXprwCHguUObM2rL5LXdMVrAT2xu+k9sQZiquC/zvzAjR/hspnGXXa1
 h+eGZGmiCUrwbRykxPQkdhZOKSuT9GSUsGPUWGnzmUXL3cSXULVzxLgUR4jTp/Iafvw0
 UdtB4Ou2uQeIeTmnbVKwaV3r/QgqQVN2Tioe9SKYWUO5OWZG/2xTFpIpvsU2DO3Lmtof
 KgOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WmuDSVZ/
Subject: [Buildroot] [PATCH 6/9] package/s6-portable-utils: bump to v2.2.5.0
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
 Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/s6-portable-utils/s6-portable-utils.hash | 4 ++--
 package/s6-portable-utils/s6-portable-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-portable-utils/s6-portable-utils.hash b/package/s6-portable-utils/s6-portable-utils.hash
index dd9f7df4bd..aa38c8b5da 100644
--- a/package/s6-portable-utils/s6-portable-utils.hash
+++ b/package/s6-portable-utils/s6-portable-utils.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  6627a2d3ea263539e83512a36f10a587fa0dd5e899bc3612187e9e3b9faf769c  s6-portable-utils-2.2.3.2.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  ebb39f8934fd36f25d31352e61bbd94dc02b1e9f04411850d2fd9658bd916e36  s6-portable-utils-2.2.5.0.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index fb910320ea..8cdb4fa965 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_PORTABLE_UTILS_VERSION = 2.2.3.2
+S6_PORTABLE_UTILS_VERSION = 2.2.5.0
 S6_PORTABLE_UTILS_SITE = http://skarnet.org/software/s6-portable-utils
 S6_PORTABLE_UTILS_LICENSE = ISC
 S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
