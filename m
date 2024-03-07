Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B74C48BF6
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 10:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 541D360A5B;
	Thu,  7 Mar 2024 10:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2n8hXeUGmny; Thu,  7 Mar 2024 10:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68B2F60AA2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68B2F60AA2;
	Thu,  7 Mar 2024 10:29:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB2B71BF2C2
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7BF4825B9
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 10:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxr96AHKVW72 for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 10:29:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 962AF81BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962AF81BBD
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 962AF81BBD
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 10:29:42 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51340e89df1so716983e87.1
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 02:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709807379; x=1710412179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+TWcBXx8unO1l0DFUCauZjRt2spxrHyCD8eUusRG5Q=;
 b=fN78skk9LJl2ZMr037nMeiSKUMxTrP5JjV8n3lNwQcFCw5w4Sr3qGxMdNChc3O38iY
 fZKo6QkUiuQtHBFd/X71/uuKdIIUGHGG2fwLQGcik61WA0VqgX7HyGE7LI927qR+nO0G
 HfEoaj930Vx15rKdg3YPf0sYUwXYcby7lozBgpUf+ag/fW64WHJJUJcMIZJ/iDj0Hh0c
 MuqsduIrlCDdCxgM8A2S9YMz80CPLQ61x228nCzeHBbfcoWTsVo1XqJMJJbbsp5+ROSZ
 czAjqvTO2VX/qLaLnjSCJPD0Z6fTCtAgUmu+LIWGgSUrq9nvgsK1IJRmmSMQPasp93Y2
 Ippw==
X-Gm-Message-State: AOJu0YyfDzN4MvSIoZ1E4a6oF9Pk/TS1dgNKuM0ZIRzDyDYP4MVob/rG
 r0RJlcNtduVi66VBwM+W7j6GG2T3h/g7ffMsM7Bbv5L1mnyLXMlKfNhkilqO
X-Google-Smtp-Source: AGHT+IH8Y761wPoRxcf5cQnnUvxGR28treMdhzfhAwMnWerqeJBXdx4x/yWzIIARRGFSAPfinEWxBg==
X-Received: by 2002:a19:7614:0:b0:512:fc60:38e4 with SMTP id
 c20-20020a197614000000b00512fc6038e4mr1010429lff.54.1709807378881; 
 Thu, 07 Mar 2024 02:29:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d44d1000000b0033e5b28c97csm3043615wrr.37.2024.03.07.02.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 02:29:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 11:29:36 +0100
Message-ID: <20240307102936.22778-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709807379; x=1710412179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O+TWcBXx8unO1l0DFUCauZjRt2spxrHyCD8eUusRG5Q=;
 b=R5lcJbKyoXazPOZsmFym9RPfliMNRLA07TOMq8n2ZbaATbQr44sm6m+OI8vUObkiWB
 pbpFOf+0sZGAMyXANfwZAON8tUxwZrRgG9RrXsM4J2TI63EIc6ylvvAqjFNz4NBSfLr6
 vrh9n7qlM249DBNlhj101NxPzOC3edyasy9rdKJ4Oy0oNP7ARmdhjSazKsj4FhN+M+py
 of8DyMqpA2HP/GNMD3NjVRDku9LCYSJQH9Oz/ewbWGJwSoJ3cgZjPgnle9qpr6pCJYlz
 0Fy1tnvHkIymOWISUl2P9OKr5+V6VkMgpcPdRMvcO4v2nRQ3u88+3gWsbQ5mAILsddYR
 14MQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R5lcJbKy
Subject: [Buildroot] [PATCH 1/1] package/binutils-bare-metal: fix CPE ID
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

Commit 11b439ce1bd28506051fff14646f8bbdbbbe58d8 forgot to set
HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/binutils-bare-metal/binutils-bare-metal.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index d55c2d081e..f2503efb4d 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -10,6 +10,7 @@ HOST_BINUTILS_BARE_METAL_SOURCE = binutils-$(HOST_BINUTILS_BARE_METAL_VERSION).t
 
 HOST_BINUTILS_BARE_METAL_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 HOST_BINUTILS_BARE_METAL_LICENSE_FILES = COPYING3 COPYING.LIB
+HOST_BINUTILS_BARE_METAL_CPE_ID_PRODUCT = binutils
 HOST_BINUTILS_BARE_METAL_CPE_ID_VENDOR = gnu
 
 HOST_BINUTILS_BARE_METAL_DEPENDENCIES = host-zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
