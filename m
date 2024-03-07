Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B1AC48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 10:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2894660639;
	Thu,  7 Mar 2024 10:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwsWeJmTbKxv; Thu,  7 Mar 2024 10:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F02F607A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F02F607A7;
	Thu,  7 Mar 2024 10:40:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB4A31BF2C2
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8AB3607A7
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3JzOhj_DZRm for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 10:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA17960639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA17960639
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA17960639
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 10:40:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5134d7e16a8so580958e87.3
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 02:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709808011; x=1710412811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9KAdmg+plLu52t7rrtuLGhSzqmXhc0GhtQVl4FyMZSo=;
 b=HosPzSTDQLEb7fXzncceJpjGfVvf/YWipkx9ipJPTBn2cK9JUGP/UGkkFhtqz9WxD+
 zC6Ns5LKb/3YD7n9gocgcLjS9snlOvazMkumlToS3gEKIBGlqwKynMqsJz/5329/2S+f
 8WBWd6z+aTZLfVORzLbGlV6Ty5rS8nobal46lTO5+BFUfnc8wl3E32mUxMDxk7QtsWvU
 z28Rq16Q488QAwIAzR6tXnjs1w8Biz2n7efNppJB4Wn2zbVYekry9NKUrdSbtkNdnYKJ
 +ncX17XWASS8RAy1mNMiJFHzqKZNwWSSjh4TTgkeVmn6ePgrZ1Q6vtsu64/IJ2/vSFzN
 ChXA==
X-Gm-Message-State: AOJu0YxI90HKuUok/iXR1kcAb7CcwsOb+O8lmjAyoLCBctrPlfoOCxkT
 MTJTd4V1CfWQFED2P0ZF2+PweLsGaesYmWGACfQpqsvdhBZVNZYbhZVBCz/c
X-Google-Smtp-Source: AGHT+IFQDkj764j4kYmLwzSV9rTEYXvFT+8Ucrc1Dj4E6aOelBtUu/UogfilmH0KaD4QJhQQ34CXHQ==
X-Received: by 2002:a05:6512:b94:b0:513:3435:5120 with SMTP id
 b20-20020a0565120b9400b0051334355120mr1487838lfv.32.1709808011237; 
 Thu, 07 Mar 2024 02:40:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a5d5b0a000000b0033df46f70dbsm20703197wrb.9.2024.03.07.02.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:40:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 11:40:08 +0100
Message-ID: <20240307104008.28932-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709808011; x=1710412811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9KAdmg+plLu52t7rrtuLGhSzqmXhc0GhtQVl4FyMZSo=;
 b=WxSLUm8aDW/4kCvoD1RcM5xNVH8LYz+TpxvSwuZDdue4iu2eWL0cyh9+JgrCUwfeOQ
 tuaKuYH+a0gPzNyuWeIhRT0AZDZhGxE+HKO9UaaATp369BHgSu8L1JdArKuGiQwT80Bq
 8KqXmRpQd7LJ2i2LncxwFw7QbfHMQNa3+JqWXNp0fRz6cR9pQCr61TEtgkeqlCOZCrjQ
 7IGKF61igQT5NWLbzLGxwAx0bBexH6HhJQ7+3jUNK1+9zfGK8fge7xDR8d+lu4bkdQc8
 y5lgtvBLWU/KCyakZ+UveoAcqCPCad+B1CDbobQ+BQ7g7iy0VyczbRxl6tDUpEsq4js4
 wGew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WxSLUm8a
Subject: [Buildroot] [PATCH 1/1] package/gcc-bare-metal: add CPE variables
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
Cc: Neal Frager <neal.frager@amd.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:gnu:gcc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/A30F1DE7-139B-4296-AA87-A516462A1A81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index f391f094fe..0dfc8d7a5c 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -11,6 +11,8 @@ HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
 
 HOST_GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
 HOST_GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
+HOST_GCC_BARE_METAL_CPE_ID_VENDOR = gnu
+HOST_GCC_BARE_METAL_CPE_ID_PRODUCT = gcc
 
 HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-binutils-bare-metal \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
