Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C770C07CA9
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 21:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1CBE81E21;
	Tue, 28 Nov 2023 21:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1CBE81E21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HzTvLCSeVLW; Tue, 28 Nov 2023 21:19:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 669C781AAD;
	Tue, 28 Nov 2023 21:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 669C781AAD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23FB01BF38A
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 21:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09D428149A
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 21:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09D428149A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxCEJEyt27zV for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 21:19:09 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D48F581EE7
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 21:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D48F581EE7
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-332ca7f95e1so4188346f8f.0
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 13:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701206346; x=1701811146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l2bw1t5F6N7GYcgAwVPbWLn4WIFeZ8Rqh6qnyg+XiLo=;
 b=nBRo1aCxjPgp9zXTdMl/i9WxAFA0/f3sQQgg4eIR1wFovfqvp2RMaFPofNg6nMkFzn
 snyrE7Yk6FtkpGE8M61LRAIhXPyL4cGFo2JV8k5KXvvf0lRwQHzLLVs5cxnQmDVE3vhx
 vfv3dqWu4eFEg2t2l6V8reBcYlWPne3x6TwwBqxobFpyZZxALDUNn8JSxWstrVwLCvZL
 YaFQLnAjeTtUQZcpP1GuGjNjCWAvNV0/eedgD439+4coOtk+tbYcLWJKa6cPYtWfPGd8
 qwRXTdwafBSQnj2NwNfXobd0ELUT1lEnbkzmvQ7XTxHhr2cHYZBXn8VU1sCVU09tonPP
 aN7Q==
X-Gm-Message-State: AOJu0YwtvjdaVhRgEClY3CP41cgK+d+bbivmDDcEGLAlpbtcv24h+RsU
 YfL6ey6I9CAUr8Esejl6KxV9lP5i91U=
X-Google-Smtp-Source: AGHT+IFbw55ox3kYH94ascusvSzLC6weEOVAYDnhAtPPdDvAKizDdxr5b9UlSynuoyg3y7GxmtNS/g==
X-Received: by 2002:a5d:4d01:0:b0:333:f03:4640 with SMTP id
 z1-20020a5d4d01000000b003330f034640mr2396064wrt.1.1701206345917; 
 Tue, 28 Nov 2023 13:19:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c1c0900b0040b3515cdf8sm19017595wms.7.2023.11.28.13.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 13:19:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 22:18:59 +0100
Message-ID: <20231128211859.898838-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701206346; x=1701811146; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l2bw1t5F6N7GYcgAwVPbWLn4WIFeZ8Rqh6qnyg+XiLo=;
 b=iAP9uBJueGOO5PC89P0Brj1iGVqItqdvNBcW1ddYetY8LQkU+QlPgXKAjE+pBM+qau
 Fjzg7NUGsBy0sPAf2hbdG4wDCwgp/ScWgDLol7kYMVP1fp8r2nKtWO8qBCgFXm1gniQ1
 1bZvFkw4pHtQ3/gnReI4TrYOpMsRsQS63QnvxQzAWPJCiE403xBd5drz3gCUcYgD7FLe
 8P4J66IgO7C46FG5KTtkxSiHfvYAkPUOYn0OnikSj4po+6nVa4avXwg/6yg+4qdY3mr4
 w6MmzmuWqHjkZqEM2fFucsrx8Mpq5cB2OrlWB6NlJN0GYeFc+3/KjTDscBjBaH2C0U3H
 cA0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iAP9uBJu
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix selinux module
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following refpolicy build failure raised since commit
aa8e38a51658723dafb8f05275d3a318058f0d6e:

policy.conf:2509:ERROR 'attribute virt_ptynode is not declared' at token ';' on line 2509:
type qemu_device_t;
type qemu_devpts_t, virt_ptynode;

Fixes:
 - http://autobuild.buildroot.org/results/210db01ac72cabd42e1478900cdbfa4cf4b19bcb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index afe0d8a196..ef406dc8e9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -9,7 +9,7 @@
 QEMU_VERSION = 8.1.1
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
-QEMU_SELINUX_MODULES = qemu
+QEMU_SELINUX_MODULES = qemu virt
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
 QEMU_LICENSE_FILES = COPYING COPYING.LIB
 # NOTE: there is no top-level license file for non-(L)GPL licenses;
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
