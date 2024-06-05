Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A67C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E107E423AA;
	Wed,  5 Jun 2024 17:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-rKNEWR7uRt; Wed,  5 Jun 2024 17:54:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF4EA423AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4EA423AD;
	Wed,  5 Jun 2024 17:54:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0ABCF1BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBF4381EAF
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9d6l97_gM3ES for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:53:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D226E84648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D226E84648
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D226E84648
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:53:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4213485697fso1273965e9.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 10:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717610006; x=1718214806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=41duCsHHGZoHGMxuV/Gm0MpQXhxgzasq31i8kRIrIsM=;
 b=jadGZOwzfCs+qVp+wKyhBUEXMK7ML7cXdBeUdPDzUlHnBG9dNdJBKLdzlL5ms6Ni2l
 sV6bRyyWO24WDvfI+q0IDkSKFYgeULddY5o863/q0J2rSbxEkjuv4CKMO/nWC1iWTA/G
 ym9GC/djHNrzWlyc+7zeerYUbPwX2ja5onRqnmFG36jAYpdOzjnFgBnPMa8rDVRqgSdk
 opryj+G8k/m0GbNMOyMID4YCO8rAeYamD8bzfuEQbBzPYuJ17z35qkdmeyvoCy8onnr+
 EilgIi9QMSmJf6qClFIC/vwM3yGAFsQMzvR/SYhGMmk24yGshlyp06fmMaSfd/NM/+Xb
 uPCw==
X-Gm-Message-State: AOJu0YypiY7qFgCVcVDKxhT0AXCNOojIdKcyjGphMAeWP67EIoc0g68v
 17LfdK8vRup5AGpbK9ul14V0/5xcTNK3tFpIafUmvRcOOu62qO/oTHP4tw==
X-Google-Smtp-Source: AGHT+IGcoEjeGU5tJ0sedsiUITqIBTzo5cjRtCDgwfm6Is14FHA2C+plZROCecZpI/rFQGMbsGuRjw==
X-Received: by 2002:a05:600c:a42:b0:421:205f:52de with SMTP id
 5b1f17b1804b1-42156340d05mr25996395e9.26.1717610005863; 
 Wed, 05 Jun 2024 10:53:25 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04d90a8sm15520821f8f.46.2024.06.05.10.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 10:53:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 19:53:21 +0200
Message-ID: <14bb90c566707dbbe9c66b7cf5ae2a05413eeb40.1717609998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717609998.git.yann.morin.1998@free.fr>
References: <cover.1717609998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717610006; x=1718214806; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41duCsHHGZoHGMxuV/Gm0MpQXhxgzasq31i8kRIrIsM=;
 b=hlFHHjvkcUAZ0fHpfjYpdBrqfZhBtqwaYRPTH3fj8VDPkGsliCVmYPaisweQEkooC2
 DW0Mm0OZoS2ySEghAVF9A9hm0HX3Pa+cyykwrNG/PqbajhQSyTdOnFXoc87in1WVrzST
 StP5p6KpGiCubY9ZJcITPgqVL4Yf42UCNEbETGUi78TVZm68IdClgUMfVIGifOofV2Yp
 BVrLa7NQH/aUya8Ho3G7QIdxVIuBZ+Seib4rakAkPwlMaLSyMx3kunFpjFZTaoS8DMcn
 N/jiIT48tbTbaeQgLTU8Il7dvJcs0Bhcnqe8ruuz8Mjws/wFviH18pDLK3snUTQyivh7
 BYCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hlFHHjvk
Subject: [Buildroot] [PATCH 09/10 v2] support/scripts/apply-patches: use
 appropriate TAR
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Maier,
 Brandon L Collins" <Brandon.Maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>

---
Changes v1 -> v2:
  - use ${TAR}, not $(TAR)  (Brandon)
---
 package/Makefile.in              | 2 +-
 support/scripts/apply-patches.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index f415e55f84..9dc66bc674 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -231,7 +231,7 @@ endif
 INSTALL := $(shell which install || type -p install)
 UNZIP := $(shell which unzip || type -p unzip) -q
 
-APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
+APPLY_PATCHES = TAR=$(TAR) PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/include
 HOST_CFLAGS   ?= -O2
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 6da83f6826..4e633b23be 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -146,7 +146,7 @@ function scan_patchdir {
                 unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
                 rm -rf "$unpackedarchivedir" 2> /dev/null
                 mkdir "$unpackedarchivedir"
-                tar -C "$unpackedarchivedir" -xaf "${path}/$i"
+                ${TAR} -C "$unpackedarchivedir" -xaf "${path}/$i"
                 scan_patchdir "$unpackedarchivedir"
             else
                 apply_patch "$path" "$i"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
