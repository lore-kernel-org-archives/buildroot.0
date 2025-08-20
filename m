Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7EACA0EF8
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 02:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ECF38121E;
	Wed, 20 Aug 2025 02:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWoX8MzDwL3b; Wed, 20 Aug 2025 02:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CD3280CB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CD3280CB7;
	Wed, 20 Aug 2025 02:08:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00166DE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 02:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB1426090C
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 02:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rh2OJ54fbqO1 for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 02:08:45 +0000 (UTC)
X-Greylist: delayed 580 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 20 Aug 2025 02:08:45 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17E5360FDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17E5360FDA
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=dlemoal@kernel.org; receiver=<UNKNOWN> 
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17E5360FDA
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 02:08:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B42155C5E34;
 Wed, 20 Aug 2025 01:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A840BC4CEF1;
 Wed, 20 Aug 2025 01:59:02 +0000 (UTC)
Message-ID: <ac3aa9b6-109f-45ac-a7e5-8b049668f9bd@kernel.org>
Date: Wed, 20 Aug 2025 10:56:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Michel Stempin <michel.stempin@wanadoo.fr>
References: <20250819172830.3350159-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250819172830.3350159-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1755655143;
 bh=Uevy6nhAyh0YokmOfW8uqVwNIMiCOFHbj62wc+PmMJQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WhL87xiDZIhG7Uce1dSLKC8sR+GmP72napO9LIzKYXab/uE0lmSgRLqyH6QvnETZH
 DprFDVup2gqcCu2okU/o7EtWWIb6MYf9zx9Qacu6DVEOOjdO2qvagqJX0Mfyib7R0s
 4J2NiEnqaEtLm8+9eEYzh+j4Tw9ruf9kalXOXX6iK6ldPDd7EcRr3hY0CtF24LAlXO
 J7JZinPhBizcvZmqVRRwfdRWUbg6ChgbqjWEHCqZlRONHtGnGdvHC2sUG9kbkeR0Dl
 k05ZfDNRkfdtMZBHfxp1mVQ+tCS/M8W8KkM66Ttii4k7HZ81id11MUKVg2aXDyX2cm
 YcYBPm+/j8KuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WhL87xiD
Subject: Re: [Buildroot] [PATCH] configs/sipeed_licheepi_zero: remove
 defconfig, broken
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/20/25 2:28 AM, Thomas Petazzoni wrote:
> This defconfig no longer builds:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001
> 
> It has been broken for over 2 months:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dsipeed_licheepi_zero&kind=BUILD
> 
> It uses Linux 5.8.3, which is not even an LTS maintained kernel.
> 
> Unless a fix is provided, this defconfig will be removed.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001
> 
> Cc: Michel Stempin <michel.stempin@wanadoo.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I di dnot write this one, never used it...
But nevertheless:

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
