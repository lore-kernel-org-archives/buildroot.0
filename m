Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8728C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 18:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A27B284046;
	Thu, 11 Jan 2024 18:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A27B284046
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2vtblRklXVi; Thu, 11 Jan 2024 18:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE41F8404C;
	Thu, 11 Jan 2024 18:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE41F8404C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 646F81BF255
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 461CD421CE
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 461CD421CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FwWWWnD7SgFX for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 18:22:31 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1446E420E4
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 18:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1446E420E4
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so72436065e9.3
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:22:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704997348; x=1705602148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=548zfcTyNT40Gw6nilA16eLc9ODXFwXpYQSwdGkD9Qc=;
 b=rUt3Fwwdn9nLaBbcmDVSOx4k1btO/FC+nUHvQNDShcJr8c4qkOOU6UgnCS8iiySIQs
 /yQFwlpG5LlnXhrk3OKFlMKLQPs4uyFbl8986mTMd7lsBluttli463iX29GwfmZRmr68
 8a5OgckpePEPpqVgo8VnTgX7OWqshfvx4RQ1LOSa/wrkJPSgpRr9zwROpFeo/Voo29Qq
 24xNPKESvzA0L1TtGwcAk4Us4qslf9cCIh2pSt7eQBGc0AbV50q5P5kRWV/7nMdExiA5
 so/l1PG6Vdou3j8BfNhZGa9yYZGFu0j7yqwCEj2S11Yllqukn65cF9kfBY6tbPHzA5GS
 bTaQ==
X-Gm-Message-State: AOJu0Yzp1YL+IKLm7Na30/e/xdLj3z0ZPvgAmN90Ow8f0O5sieCC4gCa
 WosQFe6KIy18mYibKaqLmKJthEN5pbc=
X-Google-Smtp-Source: AGHT+IGyn8tWZd3gh3FvgZ6J+RSzUf3S950xZ+rGZX/xuYNmdHke6UGNpzJ7c8FEmRpQaBT4bSdEJw==
X-Received: by 2002:a05:600c:6012:b0:40e:4a2c:bdea with SMTP id
 az18-20020a05600c601200b0040e4a2cbdeamr109687wmb.150.1704997347721; 
 Thu, 11 Jan 2024 10:22:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c502600b0040e6245579csm1733191wmr.11.2024.01.11.10.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 10:22:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 19:22:25 +0100
Message-ID: <20240111182225.2420602-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704997348; x=1705602148; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=548zfcTyNT40Gw6nilA16eLc9ODXFwXpYQSwdGkD9Qc=;
 b=jv8f+hUouH8SQeaaK8o3fe6zNxgU9zVYHb+Ci5djWUDrp8Jv/QJhZ2zZY4DxQOlJ95
 6/C285r/G+bRXMM5/YoFaFdw4Gk5Vgn9FwcYtzY6t9fNEXtNMio2fwanKcl8AZgHtb2W
 /9SbpAtmMSF5ScFFQM0Bs7jLgUEZQdau+q9rRKZjW4+3/86j9WEMVbUSviT9dY6VDchC
 G7u8EDhB7iHQLOiCPYZdGDQg+PMOwFc+xV0DT/B/wJp0waCB8aCoN8G0Fc6y4e2/lJ3C
 udPqk0q/p7PqUa4GqXPG9PGVWxKGQfXdHNYnJDUuUT/HWyK0V1rkAL73KmkeJbiMuz+g
 UjZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jv8f+hUo
Subject: [Buildroot] [PATCH 1/1] package/criu: disable i386
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building for i386 raises the following build failure since the additon
of the package in commit 3e4b479f39c15ffdf307ec8395d856680c727204:

Makefile:23: *** "The architecture i386 isn't supported".  Stop.

Setting ARCH=x86 won't work either as it results in the following build
failure:

compel/arch/x86/plugins/std/memcpy.S: Assembler messages:
compel/arch/x86/plugins/std/memcpy.S:20: Error: bad register name `%rdi'
compel/arch/x86/plugins/std/memcpy.S:21: Error: bad register name `%rdx'
compel/arch/x86/plugins/std/memcpy.S:22: Error: `shrq' is only supported in 64-bit mode
compel/arch/x86/plugins/std/memcpy.S:24: Error: `movsq' is only supported in 64-bit mode
compel/arch/x86/plugins/std/syscalls/syscall-common-x86-64.S: Assembler messages:
compel/arch/x86/plugins/std/syscalls/syscall-common-x86-64.S:13: Error: bad register name `%rcx'
compel/arch/x86/plugins/std/syscalls/syscall-common-x86-64.S:19: Error: bad register name `%rax'

Fixes:
 - http://autobuild.buildroot.org/results/94cc463762b57efacf743d107a8dda7660a995a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/criu/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/criu/Config.in b/package/criu/Config.in
index ff3bf30229..b3bb830768 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	default y if BR2_ARM_CPU_ARMV7M
 	default y if BR2_ARM_CPU_ARMV8A
 	default y if BR2_aarch64
-	default y if BR2_i386
 	default y if BR2_mips
 	default y if BR2_x86_64
 	default y if BR2_powerpc64le # Only support powerpc64 with LE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
