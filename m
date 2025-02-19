Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EB7C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521F44F3BA;
	Wed, 19 Feb 2025 08:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVeWVzyegXZ3; Wed, 19 Feb 2025 08:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 289935041F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 289935041F;
	Wed, 19 Feb 2025 08:52:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB20F127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9943B411CE
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wImxKduh6yfu for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 824B140603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 824B140603
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 824B140603
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:51:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38f325dd90eso2746533f8f.3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955060; x=1740559860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nJq8nSNZCOYAl/JCVjJ8i/nXpSpRjds9OJk8asvQjK0=;
 b=abP0WMl4woqRn1STKxYNOUB1W/4UItNHF62KbhUNDftkdrdsqsqjbvjZv7R7nE3uvc
 MNllcXg3hY1NHfFgsqTiDDc63xyDk59SNqGI0nRd5dRjiI6wp0caXruBk7GQN62abcA7
 F3pML97ZR+BtZqXgmXtMke1OjIA//qxGYKZjCKMcwWI1whXqH5RkG69gftujAVHIV7Hx
 0dTQC88DjJnclAj5Cky3Hop+05E8sOtFbib8Pe1CMMzsIzM3vAi9WKtU0xkTQ+ZatsTW
 W4QES9dh5ydCfE34u0MN8dz/hgGRrNj73JpfjCgPDRzTmyWdpjdJYqnBoDmG2z498hze
 xdIw==
X-Gm-Message-State: AOJu0YyXqSwshPrA0bRYX+a9FmmQaeyXX/qzd99cOJsxSj1JNfHxqZ9u
 JZZB39dSSiqNzWvTrkP7TKrF7rDF5cRgTlM0Y4/JBugxDKl35lh2xg08XQ==
X-Gm-Gg: ASbGncvZkeaHCQIJK99cGFWkSjgDsb3fGUvzp4VWvxdbA+NMRgOfDcn+sU/uOR7CSEI
 TQCmyLmaRHYpX82NNVDvzRau7dS2D32wn1VPn9eIRzt343bCGtPvfPmC33EYbvKVB0NIbX8aNRK
 phlcHmu3I87kE9S2du+tXEZ81zFcuAKs7vN1JioiuPdG6ULxob1wd0UWLIuEuLnzOauXwXzM3JW
 UuAJNkfym/9G5bCCdQ7tMk8ifmAIUdoXspxqYX58nyJWpxqOtCJSAQQ5UUmfFl+r9D9o0Vc1hfJ
 dgr6opeptEGjubGcnt4ICjCURg==
X-Google-Smtp-Source: AGHT+IFYOOfrmGRgmk53D1aMZZjHf33iCOIjKbZ5Cg13j6n6inCQb2SJLcSuBs3QnUNwU9Uv0k7uPw==
X-Received: by 2002:adf:fed1:0:b0:38f:229a:b4d with SMTP id
 ffacd0b85a97d-38f33f4b81cmr14918153f8f.35.1739955060409; 
 Wed, 19 Feb 2025 00:51:00 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:51:00 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:41 +0100
Message-ID: <cff853777c06b4d3e41c5ee0ec50b39c4a7e752c.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955060; x=1740559860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nJq8nSNZCOYAl/JCVjJ8i/nXpSpRjds9OJk8asvQjK0=;
 b=IsKV1UlueuY6/DDgCCg1uGJ7WNyvQjavShLhyxYQZa1wpIEMqdpTuK7AUvxEpmVbtU
 F6Tkyv0Gp1+yqnXoYkKEQQxxs2U8zAKAo7xzw1n8Cr76owlurBRnfpe6dvFLUpSHt+L8
 9T6CL45CctGjOoakJjEVG2SE1YHmoZZCJ/hnKPXfySo7NdIoqu8x7421qhaMJXTKO9y9
 3BLm+QuCFVUfQH7sUPc0xxQ1IZ7irXFKLP4uuJtNQRIhCVPtmY34I0wC9IG1yqa+RLgO
 SAUAKv8wQumswtu2XFOAY9tpQxzktZ6xih9Px0/Plz6n3k307Z3htv33KHYbaQJp4kvX
 f0Gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IsKV1Ulu
Subject: [Buildroot] [PATCH 26/27] package/sdcc: add option for the device
 lib
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This enables the "stdlib"-like set of libraries for the enabled ports
and for the various memory models supported by each port.

For some ports, there are non-fee libraries (and includes) available.
However, their licensing terms are dubious, and they are only available
for the PIC ports which we currently do not enable in Buildroot. So we
do not enable those non-free stuff.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdcc/Config.in.host |  5 +++++
 package/sdcc/sdcc.mk        | 21 +++++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/sdcc/Config.in.host b/package/sdcc/Config.in.host
index 711da37444..56ac8c7ed1 100644
--- a/package/sdcc/Config.in.host
+++ b/package/sdcc/Config.in.host
@@ -36,4 +36,9 @@ config BR2_PACKAGE_HOST_SDCC_Z80
 	  mode, SM83, Rabbit 2000/3000, Rabbit 3000A , Toshiba TLCS-90,
 	  Zilog eZ80 in Z80 mode, ASCII R800),
 
+comment "libraries"
+
+config BR2_PACKAGE_HOST_SDCC_DEV_LIB
+	bool "device-lib"
+
 endif
diff --git a/package/sdcc/sdcc.mk b/package/sdcc/sdcc.mk
index 8e5032427f..0e2de37748 100644
--- a/package/sdcc/sdcc.mk
+++ b/package/sdcc/sdcc.mk
@@ -32,8 +32,6 @@ HOST_SDCC_DEPENDENCIES = \
 HOST_SDCC_CONF_OPTS = \
 	--without-ccache \
 	--disable-doc \
-	--disable-device-lib \
-	--disable-non-free \
 	--disable-libgc
 
 # Keep utilities separate, and alphabeticaly ordered.
@@ -72,4 +70,23 @@ HOST_SDCC_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_HOST_SDCC_Z80),--enable,--disable)-z80-port \
 	$(if $(BR2_PACKAGE_HOST_SDCC_Z80),--enable,--disable)-z80n-port
 
+ifeq ($(BR2_PACKAGE_HOST_SDCC_DEV_LIB),y)
+SDCC_LICENSE += \
+	, GPL-2.0-only with Library Exception (device libraries)
+
+HOST_SDCC_CONF_OPTS += \
+	--enable-device-lib \
+	--disable-non-free
+define HOST_SDCC_DEV_LIB_CLEAN
+	rm -rf $(HOST_DIR)/share/sdcc/lib/src
+	find $(HOST_DIR)/share/sdcc/include $(HOST_DIR)/share/sdcc/lib \
+		-depth -type d -empty -delete
+endef
+HOST_SDCC_POST_INSTALL_HOOKS += HOST_SDCC_DEV_LIB_CLEAN
+else
+HOST_SDCC_CONF_OPTS += \
+	--disable-device-lib \
+	--disable-non-free
+endif
+
 $(eval $(host-autotools-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
