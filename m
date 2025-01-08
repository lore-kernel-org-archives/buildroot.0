Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1491E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC3681397;
	Wed,  8 Jan 2025 21:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwuItKCV9gx8; Wed,  8 Jan 2025 21:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A92813E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A92813E9;
	Wed,  8 Jan 2025 21:59:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EC431FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D61381397
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6HPjLHDePLO for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A113813E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A113813E9
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A113813E9
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:59:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1917011295; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:59:03 +0000 (UTC)
Message-ID: <09afbc22-8563-4074-b9a4-a114cc8395e8@korsgaard.com>
Date: Wed, 8 Jan 2025 22:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250104213844.825123-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20250104213844.825123-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ViIvTucF+IICU4OCQxWBko7S+nbM3bEQAACGPNgWXCogg/1UGbRL3nkmo7Dj1I18yEGZqNct++J1BKdXWu3SwGltBNnX+12Bf67/El9JPTRf8XbK9gVllrkS9ARqt1+jjvyJCyHVyFhgq/x2+2OhGuf3QcxJmm/78W1I1O3+D8nTgYGO9FFXFLIl2yHzM8SIdMRWSUW5b/BAuAAsRgsL15X6AwAay09loe0psFW7UL1g6n7qJv73ki1E9Sf+e1UJh7iJEnuojJaN2Y8tWYrT05Q15gMx2J17J3ArcAfIA5xUY28AZcIimjc1YhH8a9Hna3e941bzf7dfPStfxGoDqw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=MOKvZjg1CQp+UFs8nKTm8MG5qShh3PQVfyDwx0AjluQ=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ViIvTucF
Subject: Re: [Buildroot] [PATCH 1/2] package/cryptodev-linux: ensure
 <pkg>_LINUX_CONFIG_FIXUPS has an effect
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 1/4/25 22:38, Thomas Petazzoni via buildroot wrote:
> The variable <pkg>_LINUX_CONFIG_FIXUPS defined in the
> cryptodev-linux... has no effect. Indeed, the variable is only named
> CRYPTODEV_LINUX_CONFIG_FIXUPS.
> 
> But the variable name being <pkg>_LINUX_CONFIG_FIXUPS and the package
> name being CRYPTODEV_LINUX, the correct variable name is
> CRYPTODEV_LINUX_LINUX_CONFIG_FIXUPS.
> 
> Prior to this commit, a configuration with cryptodev-linux enabled
> would result in:
> 
> $ make VARS=PACKAGES_LINUX_CONFIG_FIXUPS printvars
> $
> 
> Aka, empty, while PACKAGES_LINUX_CONFIG_FIXUPS collects in
> package/pkg-generic.mk the value of the <pkg>_LINUX_CONFIG_FIXUPS
> variables from all enabled packages.
> 
> With this patch applied:
> 
> $ make VARS=PACKAGES_LINUX_CONFIG_FIXUPS printvars
> PACKAGES_LINUX_CONFIG_FIXUPS=		@if ! grep -q '^CONFIG_CRYPTO=[my]' /; then 	/usr/bin/sed -i -e '/^\(# \)\?CONFIG_CRYPTO\>/d' / && echo 'CONFIG_CRYPTO=y' >> /; fi
> 		@if ! grep -q '^CONFIG_CRYPTO_USER_API_AEAD=[my]' /; then 	/usr/bin/sed -i -e '/^\(# \)\?CONFIG_CRYPTO_USER_API_AEAD\>/d' / && echo 'CONFIG_CRYPTO_USER_API_AEAD=y' >> /; fi
> $
> 
> As one would expect.
> 
> Fixes: 4b12336d1fad12fbb82b4d9144e6cb5636a12256 ("package/cryptodev-linux: needs CONFIG_CRYPTO_USER_API_AEAD")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
