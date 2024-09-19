Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B68CE8D46
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 03:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA0E684911;
	Thu, 19 Sep 2024 03:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rZnCZqoo2iHK; Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B736B8490B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B736B8490B;
	Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5A061BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 958678490B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56lWMF9Iw59H for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:59:50 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@helium.openadk.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 880E9848C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 880E9848C0
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 880E9848C0
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:59:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 319EF353746D; Thu, 19 Sep 2024 05:53:36 +0200 (CEST)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 05:53:01 +0200
Message-Id: <20240919035308.2622723-3-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240919035308.2622723-1-wbx@openadk.org>
References: <20240919035308.2622723-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726718017; bh=YWSNTNrWASrKONSOLTMyUZTtyIeNs4ML7LKyKoG/uRE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C+T5UyVzJKx3SANzqkuvSGofijC0rKkz9K4fhGPjkC+dQq7WKQLXbUSNHdaDGqry3
 dHe/l3UYAe9aXDi/SJ4xbqYZciK3F5p2JMowogTqmTLigXV3P5TUpE4t/fGaJ6QwR/
 gXHQ9pObRWXo3cX9oncLWLQBsaG6DomPdtEEQZN4MPeMBd2by6YlgCd7qk+OG3u500
 DnQkBIaP519djw4ifsKp81xdR/hGZ3ahG4SWojglkzOBsi5cPCmxu5y/1Wkp1w+SFT
 60n/gQAq9Pt699CLm62m/cTa9kGLlQkDMzmJ98h5+EPa5x2Eyqci+Vf9z6ECKLuoR0
 TYZqhOfCBhOvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=C+T5UyVz
Subject: [Buildroot] [PATCH 2/9] arch: don't enable FDPIC binaries by default
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

FDPIC support is being added as a new option for an existing
architecture (ARM), so we don't want to suddenly change the default.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index bd5f9ce470..e57f4b2baa 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -433,7 +433,6 @@ endif
 choice
 	prompt "Target Binary Format"
 	default BR2_BINFMT_ELF if BR2_USE_MMU
-	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
 	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
