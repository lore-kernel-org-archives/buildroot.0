Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75645C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:01:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BC660EE9
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 11:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30BC660EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F375E40241;
	Fri, 12 Nov 2021 11:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03zA9Itgh_J5; Fri, 12 Nov 2021 11:01:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E3AC401B7;
	Fri, 12 Nov 2021 11:01:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 542EF1BF325
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4262B60655
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 11:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPcAz13Lxlm7 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 11:00:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47FFE60600
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:00:16 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c4so14757148wrd.9
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 03:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nK1ABt4PUgxrqr64n/Z12aptB1yrVYKE3lYKwzBEK0A=;
 b=IkdLzAqqLLtwZWCvQ6dzpWAYQpI/IOy/mBoQiXTjBu31cBfbNLtJ0aWhfcfL4zHAHe
 4f2Z8LFv4R71+BX3FswtwalLbVpxYpz3XIWCZKxSkfZ/1iVbTosqy1dfpBpR530H/SNI
 KGZPXm2+qR8WyBbf6ZskAm7UKFnblbpbfbuQGrxsB2t8yvai7JEtxEfL7VUZBv+bKj1X
 nw48TupczueKpf9hBlw30y6c3dSccNburrLu9jute1jCUfXreRI9TNGi2gTR6AT513Zl
 0nyL+jVJ42pNZwbjmkKgrngKsOyMcDPlw8nCx96yq7CkCvquVba5xWqM/Kq0OyiUEU8m
 L9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nK1ABt4PUgxrqr64n/Z12aptB1yrVYKE3lYKwzBEK0A=;
 b=tJQa62V8xszXRzY7J/Wv9GvSf+/NFOTdCLEBOdzgOgE/YwaLdq8nuiiQ+LpBotFN9z
 bv8Lk7pSJ/FRrCoDXLqD5ATM1VkZGdeQtfzoI0oMoWX5t3f+pgA0dfN6faPWTSB8NGDV
 VlmFaBvcmsNvuwRQHBsqP1AM4Q9TPaFmN6Bi3NdMFPZW6YgzYszEmluzZBbSXaqMXZUJ
 sTRfvlFccrkqEv3mDgXBtkr08p9q4T2FVvtq8PMGEMt9f+3JBsKcKCoDtWzz1+XNgCxa
 93GcxVfCjTucY04bdOy7GZ55gO26rvag83CYzx3VTnqkayGiORGbL91FphtRELQWeXth
 oybQ==
X-Gm-Message-State: AOAM531nI8XsGaROXt30nKZy8rY9uYWZoMBtBB7hizjo6KySlY6BZ2Yi
 mTZ874kbjrzwK79QfvuA11L99383nWI=
X-Google-Smtp-Source: ABdhPJyQ3WSUc5nJH70qU7IYKB+rT/iDXIc/+zuFQsZU013JwKqo5ea7BRYbm40hmMOKezdmKI8/TQ==
X-Received: by 2002:adf:f20f:: with SMTP id p15mr17290791wro.187.1636714814665; 
 Fri, 12 Nov 2021 03:00:14 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id 8sm3748796wmg.24.2021.11.12.03.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 03:00:14 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 12:00:05 +0100
Message-Id: <20211112110007.787836-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112110007.787836-1-romain.naour@gmail.com>
References: <20211112110007.787836-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/6] package/luajit: building for 64-bit target
 requires a 64-bit host for all platform
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently only x86_64 target requires a 64-bit host but building
aarch64 target with a 32-bit host is allowed.

This constraint is for all architectures [1].

[1] http://lists.busybox.net/pipermail/buildroot/2021-November/628301.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luajit/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index f6d01ed09a..bf98260c31 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,13 +1,15 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_armeb || BR2_aarch64
-	default y if BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
+	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
 		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# -m32 flag is used for 32bit builds and host-luajit has
 	# limited architecture support
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# Building for 64-bit target requires a 64-bit host
+	depends on !BR2_ARCH_IS_64 || BR_HOST_ARCH="x86_64"
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
