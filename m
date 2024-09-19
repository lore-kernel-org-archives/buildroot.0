Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D44CE8D49
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 03:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA6238490B;
	Thu, 19 Sep 2024 03:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kWSWb_IUXx5; Thu, 19 Sep 2024 03:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206818491E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 206818491E;
	Thu, 19 Sep 2024 03:59:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7C1A1BF3DD
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6DD1611D5
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obh2yWhtpOq9 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:59:50 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@helium.openadk.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D01A607DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D01A607DA
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D01A607DA
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:59:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5B3B13537472; Thu, 19 Sep 2024 05:53:37 +0200 (CEST)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 05:53:07 +0200
Message-Id: <20240919035308.2622723-9-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240919035308.2622723-1-wbx@openadk.org>
References: <20240919035308.2622723-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726718018; bh=J7+VGSsND8ulxqJKdWABrgHUplduDiI0DQYfxnH/0q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s3OFYDf4VW3u0zpwuZJdduC2mOvo9KwTXxGezJr6XDgBJ3GIXseo0QGvaaDaDC/7Y
 J3zIZz5oktOu7b/ml+SrcR4/tJIHFHvBXRQUBjJgJNZ605xB04A57iSkPvA/BzRZr3
 Bgo1CD/2+YyIAEy9tVeporPRHyJ06+MHZJIkx0d1KpVHP/nRf+/toPbeDxM9ivJlyc
 2DJxlTT7K80GpN3ucCtvm9RsHFEXLczNrdN68P7fHk97cHP5fEjmU4rTUX9OfZQWlO
 z61a/gNYiq3CjwfV5iZFag2IJJoKSuhlk0Jynxtxb9axA4YIV4ipuQN7VXIuCufrU2
 Gyud2nad13wjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=s3OFYDf4
Subject: [Buildroot] [PATCH 8/9] package/busybox: remove STATIC from
 busybox-minimal.config
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With FDPIC we want a shared busybox executable even with noMMU.
Static is already handled by busybox.mk for static toolchains.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/busybox/busybox-minimal.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 5d2a30806a..9733dd2156 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -40,7 +40,7 @@ CONFIG_FEATURE_SYSLOG=y
 #
 # Build Options
 #
-CONFIG_STATIC=y
+# CONFIG_STATIC is not set
 # CONFIG_PIE is not set
 # CONFIG_NOMMU is not set
 # CONFIG_BUILD_LIBBUSYBOX is not set
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
