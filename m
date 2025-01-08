Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0891DE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 20:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C042380D6B;
	Wed,  8 Jan 2025 20:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N34kuMyXJQ4I; Wed,  8 Jan 2025 20:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFED080E02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFED080E02;
	Wed,  8 Jan 2025 20:36:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 471667AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 340DF40324
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MpkkcLNVp76w for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 20:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F2B75402E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B75402E6
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2B75402E6
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 20:36:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1193641571; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 20:36:40 +0000 (UTC)
Message-ID: <b65dd030-2f49-492e-9875-2d71fd093763@korsgaard.com>
Date: Wed, 8 Jan 2025 21:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20241229123751.639378-1-thomas.petazzoni@bootlin.com>
 <20241229123751.639378-4-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241229123751.639378-4-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WEAjQIDpJDQiCVv15Dymaa3EQR1UErNfrY6S3GN1rn4w/eB9BsC1KbidcB3XVJER0oPtreeJj4K47Y011O4f5cu+qrNNdMoY6ffGTU583W8HZAgrwshBjYUqKynyxtWf6aXa+LW23LuG45sFrE/iEGVjACVchBVYD/d6PP7Rkzrn0fd3XDuuykcP0+q5taFI/5gnoobYF8E7Zwfug+K2gPX1Dq9bpOulR1zxtYN2jqU6eo2eEDe9wrIujtBVgUUsW8F2vh1ckaNDBTN2mzkgppHW5riU9bjwWiPyYQLKBP6byw+hsLs/c/cSnHj2qVPgzET6pwA33K8dn4qKFmtD0A==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ym0YesFpICckr0dNtEcDmGqpBHaq4D6Umt60B1qoXOs=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=WEAjQIDp
Subject: Re: [Buildroot] [PATCH 3/4] linux: select proper defconfig on
 PowerPC
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

On 12/29/24 13:37, Thomas Petazzoni wrote:
> The handling of BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG is currently
> not doing a proper job: it is selecting ppc64le_defconfig if
> BR2_powerpc64le, and using the default of "defconfig" for everything
> else.
> 
> However:
> 
> - Since upstream commit 22f17b02f88b48c01d3ac38d40d2b0b695ab2d10,
>    which landed in Linux 6.8, the default defconfig is
>    ppc64le_defconfig and no longer ppc64_defconfig. This means that
>    despite the condition in linux.mk, we are in fact now always
>    building ppc64le_defconfig.
> 
> - It doesn't handle the 32-bit case, as a 64-bit defconfig gets used
>    by default. This causes build failures in the autobuilders.
> 
> To fix this we explicitly handle BR2_powerpc64le, BR2_powerpc64 and
> BR2_powerpc, and use appropriate defconfigs for each case.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/c15eaf2e7455aa265cc045e6d8be7cac5348d925/ (powerpc)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
