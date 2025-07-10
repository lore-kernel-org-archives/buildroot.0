Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986E8C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CC62816E0;
	Thu, 10 Jul 2025 20:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZIAOmUaW-W7; Thu, 10 Jul 2025 20:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8E4B817B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8E4B817B0;
	Thu, 10 Jul 2025 20:23:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28400D7E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BBBA41027;
 Thu, 10 Jul 2025 20:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIhYEUqTPBHR; Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FB0E410A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FB0E410A2
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FB0E410A2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450cb2ddd46so8393315e9.2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178988; x=1752783788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aXaVGCVe9Nuqxx/zOnitCtR+K7SY3jeOuPj29dp40xE=;
 b=Z4bX3MZnvN1wfNMjMIH0zeh6UhpKWFS8W04Wa1x2uKIF+GZ1bT53WmCuJhoQDIH5k7
 PV5+pIDfqwWfepwlk67REFwbJO2s0caOQxo2II7yi1Criw+Gx6DRO9RnNQAi4KuPNgHQ
 8XWq27/Q9ACJl0RR6ocFoGuT4fjitzaPc9im69HaY1WHZEZe1htTcDZDHvNdg4WgbkX3
 XZHsfdiN8i+NhMXMY0LEEoLnqVZTnreGGXLd7a3JKUR8kDsbooI4LZ4Rw0pDvTi4ILgC
 nzoKxIaoU0SH6r/STbtpr669uJu9hBQhSJ3Mxg2+63l9nxoU9P5oHN9ZqP5pFIKts54y
 7FOg==
X-Gm-Message-State: AOJu0Yx4ij+roAMD0y+54mWkIV4Ya7+sZ1tqhLSaPvdJpZSJZneN50IV
 +on/uRDdLXLlwV79wFbcTHl0K8KiLTIQpn+4C4ORye3exSX4Me6/qCkXnmJJMg==
X-Gm-Gg: ASbGnct4qMPdgIj/iNpyVRPQAh4vr2Mh/VmqU/cNzuPW57JC2Ki5jg3ZyzTki8f8NXT
 +p1O7IYTLwbKRgLzj7Cxg8oAuY1n5a95v69mL7Zq64eXic7MPAGPDHWbvwlD6oyE+qiytmokcn/
 ojsX14Cz2OvuimgPyZL2q5kH2fnH5tEFStF6sH3ELKM1HugNbiU4fPeOeBKGYSFkdvLVmdgykk2
 uKwxtiuGnSBsE444k9imqerhg9+wbIRtFIZ0vG/KsaGVY0bs9fHfIxJhAA/5yZCIL2JgWjupUgX
 HFKoG+1d3dNwrAIMzUrngd1+tSRb4+RfknhTI0YSA1OHoJDOvEtrS0jyv6JkeWlu/k+qQksQ
X-Google-Smtp-Source: AGHT+IFrzFYtXuxAVuByVronqYmOsSqKxIri3fqJSk8HlI5eDpfsG4kkVmg+23zc2fhnVqv8yLWB5A==
X-Received: by 2002:a05:600c:1e26:b0:453:99f:b1b0 with SMTP id
 5b1f17b1804b1-454fe0f944emr1281985e9.20.1752178988014; 
 Thu, 10 Jul 2025 13:23:08 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 22:22:56 +0200
Message-ID: <8f3984d0a1b0c3fd896fddf91f03e777a59bb65a.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178988; x=1752783788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXaVGCVe9Nuqxx/zOnitCtR+K7SY3jeOuPj29dp40xE=;
 b=jFW/XK3itCT516zU+8woMvJmpzQSFYOBeR/FewKM9lFa9CFmRgn1+l+w+LrmD5zyAi
 WqQIqNQBkKR9DCa98skA4T9psJ8ceexZi18Fbj1EFtdDSX2Xp5t5X37OTMB9HBiwDyBr
 SwZt1l1Q2TwFVb5zlOz6penWb0+/hvKqRLIa8Fmr6fR8sZ5/xXifLCFLb9ppqxcT13s+
 9S321k38XGyC9pEhM9cpACu/401+KV5KLBwdt+Y8S51dLxK/HLD24NDSYkpVN5x+qGf1
 82QTh6YinXoAB3hohNt4NDtxedkqgrJoTKyCFSz/PcItA2soZJFUBg14JtB34Ralf7Mq
 fEQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jFW/XK3i
Subject: [Buildroot] [PATCH 14/17 v2] package/kmod: adjust paths for
 merged-bin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/kmod/kmod.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index dfdd17b955..cbf89bca9d 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -68,16 +68,24 @@ ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
 KMOD_LICENSE += , GPL-2.0+ (tools)
 KMOD_LICENSE_FILES += COPYING
 
-# /sbin is really /usr/sbin with merged /usr, so adjust relative symlink
+# /sbin is really /usr/sbin with merged /usr, and /usr/sbin is
+# really /usr/bin with merged-bin, so adjust relative symlink
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
+KMOD_BIN_PATH = kmod
+KMOD_SBIN_DIR = bin
+else
 KMOD_BIN_PATH = ../bin/kmod
+KMOD_SBIN_DIR = sbin
+endif
 else
 KMOD_BIN_PATH = ../usr/bin/kmod
+KMOD_SBIN_DIR = sbin
 endif
 
 define KMOD_INSTALL_TOOLS
 	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
-		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/sbin/$$i; \
+		ln -sf $(KMOD_BIN_PATH) $(TARGET_DIR)/$(KMOD_SBIN_DIR)/$$i; \
 	done
 endef
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
