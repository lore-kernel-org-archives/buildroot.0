Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879A4C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 07:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C82BD81DE7;
	Mon, 20 Feb 2023 07:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C82BD81DE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 655yfOvj8Jrt; Mon, 20 Feb 2023 07:25:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ED0F81C58;
	Mon, 20 Feb 2023 07:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ED0F81C58
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CCF01BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 07:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53ECA60DFF
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 07:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53ECA60DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdfwFYPj2DmP for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 07:25:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46DE360BD7
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46DE360BD7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 07:25:28 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f41so511000lfv.13
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 23:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P84wcU8notjZKMb9qnQcY7huMl5WmqQaICa391rfXxs=;
 b=ViemZImP+lgHm9vbVtVIA90KJhDkHLC47LqMdoeGufCpKlVMKvzYuUDoIwd/UEd0im
 w5dAQj3u+r1urO7aiVhTjOzBxE16zh9nyRYckOyLRT7+tZgUY5OuC7DHqj1pIZs/UhvT
 bNBDdSmxLw8oQpGlv1Z/VufbD/GhCzB2KrHMvihE9ENPWKswu7x1IqCs2eg07TYOX2vk
 Kvw4iVTTcoVCca//lh4pLMcEBF0TGvupFuUreSBcfIsYJ0IaOaG80uePSVB4DrnqRJ/L
 ZqBfGhxuX4DML+RBxTw2xG7LH/qojKVeUwzpehwpLeTBZcj/yoXPuy0mljd7nzb1DjHZ
 VPKg==
X-Gm-Message-State: AO0yUKWBNYnpr9l1ydJRELIlXeR+6NrBNhAZKs+PwP1AYBX1IqdspluB
 GAR/ZLhKri9HlwWZZ5giFKOvVnEwhxsz1A==
X-Google-Smtp-Source: AK7set8OUqLzwCHoRwMmh1Z2OjJPcM/sJDsU8Sq/RQaa8rp500RmxBhsCxFu05yNxuAht43AsMT2wg==
X-Received: by 2002:ac2:488f:0:b0:4d8:71dd:5c5e with SMTP id
 x15-20020ac2488f000000b004d871dd5c5emr270155lfc.37.1676877925533; 
 Sun, 19 Feb 2023 23:25:25 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 f25-20020ac25099000000b004cc8207741fsm1442445lfm.93.2023.02.19.23.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 23:25:25 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 08:25:13 +0100
Message-Id: <20230220072513.2336540-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P84wcU8notjZKMb9qnQcY7huMl5WmqQaICa391rfXxs=;
 b=o/ztbhUdduRcWO4aRTNyL12CxbfMjap4VUoPLkgUbEM0MxtqHjTjwmrbJAS5/rik11
 lZipd+IG5gU7NeoVf7Oz9vjpSWIDiOeU1WbF4XOoLCZoMOq3UM+e1Omlo8zZ6nDZchC8
 DpY5h0OU8kRTtuM6BkfbVs1+iSemCeq9yz0aeRLeV6mbpELdArSiUROLuMbDMpswfrUD
 Ssr+XKlSRrq0aQZZFFNQ5KfqCoscBlMf77cz3fzb8xVLX1FYvnMAuoixD/wIcy4Y4Kl9
 kySIf+p31GV57SDN1C+aOFp/1APGME/Po5zA5Nw1f7vRdNoGbgv6jmU/S2ubxBgRnMAh
 fvSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o/ztbhUd
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2023.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index ed31109fdb..3098cdd1fc 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8be2a9261c94e8b9ec4113380ffc480f8598245fb321a009bad4fae4b822411f  libostree-2022.7.tar.xz
+sha256	dd792b167693a1971c9f6e3168013d906ac035100ff6c719a3b322eb44b96f55  libostree-2023.1.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 8e8ec63213..4b17fcf391 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2022.7
+LIBOSTREE_VERSION = 2023.1
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
