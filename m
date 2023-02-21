Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF8EC6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 13:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F21082F32;
	Tue, 21 Feb 2023 13:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F21082F32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id im308LePxhPr; Tue, 21 Feb 2023 13:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A64882EF1;
	Tue, 21 Feb 2023 13:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A64882EF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CA751BF215
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 767F282EE1
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 13:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 767F282EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBxiGPLodJDA for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 13:05:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD8E827D9
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BD8E827D9
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 13:05:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p8so4488669wrt.12
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 05:05:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qhsYcULMgLQahzYkPE4kZKg93Tp9be0/E9N2xmOUTbc=;
 b=GZKZBY42FcnhXgH0brOJ7G97Cryla074ovtD3c0l8kvp7xrhA6jg22Zinhu6BtD2GF
 3/zCdD9bUCdJD+847HBdahLVVPudIWtfrSw6gzsHljmSIk/TrshmtMeiOPGbDXgIsI2I
 RQuQrfr+hHdmJ1sDNuB5rPfbHJ01WqMqmrKxSI9U0YrkoQZA/Ryt4KvbEILYqi1/4rHR
 qoAWcbYJhphHcnA/hQcDGgaKgoORQCy1q+dllwtobXliTfHt3Jq/I3aw51O/LBxYSdFK
 qkY/NEjvbBkf6r8lGfjTAj6eD/0DrAc7R9Pigg91AYsSx/fxyUAKV5qHsCBypTV47v2i
 Uh7Q==
X-Gm-Message-State: AO0yUKV2b1dhYtUG0eYcOwKVDHHsNYm18kMTk4uPlBT63RF/20gTbJru
 cbVBCAjB2Gd4kIynn3JAQPoPC7ynuto=
X-Google-Smtp-Source: AK7set/Yxo8GwM3kSivXgpcsJEGl1qDLPWejZN7gLtmwe9NZSC3dsJnzkeBVLMrRGJpGXRCKI72YJA==
X-Received: by 2002:a5d:6645:0:b0:2c3:db87:977c with SMTP id
 f5-20020a5d6645000000b002c3db87977cmr2699102wrw.12.1676984756842; 
 Tue, 21 Feb 2023 05:05:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w15-20020a5d680f000000b002c5a6f4aa53sm5956818wru.105.2023.02.21.05.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 05:05:56 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 14:05:54 +0100
Message-Id: <20230221130554.871679-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qhsYcULMgLQahzYkPE4kZKg93Tp9be0/E9N2xmOUTbc=;
 b=LnddgZh10iScpxma0+u2GQvJcVXvS78j5EtvpiABr738A1slfq3v0rmMzpPhECkYOn
 sEyRPQxS0Q9FLm36k0aJV1QoH5Kas2Z3iJN7kfrF1z328WSXVrSDK3LZrcknYDJRg3sc
 c2+SYLBqyp5YNBVcrAuFs/a3ozexa6H5Bz5Jp7oI1aXv7vANuV3Uc15qRB6gkOothy0m
 +WtL3guJx3XsCKHj055866RpecHdBvyskUa0kxtYjcAN6O4H82gsETyEwdJYyNyRTKQ7
 IuLfXezCXLlxkj/CWRUNW+luXOKrFfL6WLk85N7su+DcG64OJfQ08VVUu+fqKaHqkP1p
 NW2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LnddgZh1
Subject: [Buildroot] [PATCH 1/1] package/rdma-core: needs NPTL
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rdma-core unconditionally uses pthread_spin_lock since its addition in
commit ea47e177f093d7378e8e8e1f50d6f4e3fce0a088 resulting in the
following build failure:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/sh4-buildroot-linux-uclibc/12.2.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: CMakeFiles/hfi1verbs-rdmav34.dir/verbs.c.o: in function `post_recv':
verbs.c:(.text+0xc4): undefined reference to `pthread_spin_lock'

Fixes:
 - http://autobuild.buildroot.org/results/a943e03b79c4cc328b7712046ecff09706045f81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rdma-core/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rdma-core/Config.in b/package/rdma-core/Config.in
index 59f5ef63ae..3360e6873d 100644
--- a/package/rdma-core/Config.in
+++ b/package/rdma-core/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_RDMA_CORE
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4  # iproute2
 	depends on !BR2_STATIC_LIBS # dlopen()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_IPROUTE2  # runtime
 	select BR2_PACKAGE_LIBNL
 	help
@@ -13,8 +13,8 @@ config BR2_PACKAGE_RDMA_CORE
 
 	  https://github.com/linux-rdma/rdma-core
 
-comment "rdma-core needs a toolchain w/ headers >= 3.4, threads, dynamic library"
+comment "rdma-core needs a toolchain w/ headers >= 3.4, NPTL, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
