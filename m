Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71935CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 450804155C;
	Mon,  1 Sep 2025 09:01:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myh1oL5DXWlB; Mon,  1 Sep 2025 09:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D988F41540
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D988F41540;
	Mon,  1 Sep 2025 09:01:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACD4ED2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D86E83C5B;
 Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJFh3f5ONP8W; Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 007B383C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 007B383C44
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 007B383C44
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b7d485204so31662285e9.0
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717296; x=1757322096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9j5hnKHrSG8uwHX/OKc3KK2XaxyzGRM9wQJNOHVs4qE=;
 b=gbNrufOotVOA5S+JRqRm4F97OMYEx4qpYfySRR1+EYcuo/3j6NO5kNg7XOu9/qm6T0
 /bvEDlWON9/Hsdh15RbeLQHG8nJhrSHp6d1uAZfQXu7L7NDdl/l0OziOAhXxUYCuGcqo
 NXMLjmoChOqp6/xR59YbxaEOE0U5or2bnE1fm+JIJoGbadlGoCbVl+Ut3c4v4KoO2D6r
 yTMqcvUi9LuC8/KQIHOcCLdlA5EeT8t3Q0ZFe4+v8PGUr03ljIcLcCqmb38XD7/pLK5M
 eYDPZxR6/k94fmI0Q+k2tENHUbvGeZ6pMO6g1gfOS87tTH+q0Ca0ZITVpkknuHhLTQfE
 nF5Q==
X-Gm-Message-State: AOJu0YyISbOlpkvWHCsXqcTfuLL+XGaHLDQbBEd4rGjHufnAo+SVmsxp
 mT0m9iMhkQOUY4l3pu90rtnIvyzDUY7YddugEliauc+ttqwgfY8dlQ4AWehNyA==
X-Gm-Gg: ASbGncsDjtFHkWYjq9s2k/HX8p8pFM/e+YzQRQcbpTuES2y8JD5YOp2aKc654Oo99e1
 BqMWdOHgpoksjqQ0HMzaz1PEnDWI8KYu8rxLM2UuxL36LSF/sgRo3VlX0sHQbxojlJIpLiPX8KE
 Pe8NshEKHdHdMZnBs+5HjzycndY3N1xWO/eVB8oeEEwqw3xvr9cwf6mzaxHuZ49NvLr8fVxzfQa
 IW3TbFOFQWlKnWcNloJz4DhlgKeoYcy+v3PWVKxjp7lcdoy/tmtxx1/LhT7ib6NsT/ahPdRtfFx
 na0P4c2wpRUbnrx8NtRMu1kjTzMtjt5eagIo6iUyFojs5kmUycucAOUOtDRz6wSULVFF1p7uuWk
 s9gOzyr9sGQoJZMR5pen1aqjemItPyCyiccT8o1BLTo0=
X-Google-Smtp-Source: AGHT+IEhc0wZ2TFD7w1ay/Py/9Q7CDnaJwLaBek0qc6PdVM3rHIrX4iFke9XtGQYSchGR/44YKxnpw==
X-Received: by 2002:a05:600c:4587:b0:45b:8f38:8d3c with SMTP id
 5b1f17b1804b1-45b8f4dbeddmr8543335e9.25.1756717295836; 
 Mon, 01 Sep 2025 02:01:35 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 11:01:23 +0200
Message-ID: <76a6721a1557f6a635ca0918a328220d8c818065.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717296; x=1757322096; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9j5hnKHrSG8uwHX/OKc3KK2XaxyzGRM9wQJNOHVs4qE=;
 b=KYLPZ6LqMk3xrb4qrFsPS2SVaVANyboGscE9QrglNLT6yGo9trnKSmnmGLp6IKNdMa
 iNZKaUQt+Bg8So1pDCcI7TlCm2zBFyXCFjxwiaq5hyzHRSgUq76GzJakR2bqan7fN+9D
 JF+E1yi5dOieeqb2Fb0urE6AE790izFju9oBDkkkdAYXR6bNtKFAG8xASvU0X3TMUerQ
 NLGXjBO9uKQ46Aqw2l6gCQjavZQ6Uqo2VLCE+LWQpNrIW00NPNSmZ+A0+2CEridWKqBL
 dskhg9ra8bkRCthpzbIFCT8PCxlvEOZ8MRtSSPTJM5kUOcQDGKloHht9Q0fuw2QAbToS
 Rt5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KYLPZ6Lq
Subject: [Buildroot] [PATCH 14/18 v3] package/kmod: adjust paths for
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
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
