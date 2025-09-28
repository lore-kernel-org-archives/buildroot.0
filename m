Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0E1CAC5B5
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 11:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41BBA60784;
	Sun, 28 Sep 2025 11:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7sHWBaF1XXm; Sun, 28 Sep 2025 11:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0360560768
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0360560768;
	Sun, 28 Sep 2025 11:52:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0AD111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E390560768
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXjDdivJqmeo for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 11:52:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF7F860765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7F860765
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF7F860765
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 11:52:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8ED4DB00563;
 Sun, 28 Sep 2025 13:52:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 13:52:32 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 13:52:32 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250830055531.2673026-1-thomas.petazzoni@bootlin.com>
References: <20250830055531.2673026-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4f2348ebfe50a0ea0d482f050588e036@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759060353;
 bh=YYIXZmJjkVq5kmEyj8QqoYnnDvc2tNUU0S9VCcxCpZ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yh7e2VfjEqvFR5ggf9QG/OHdsBmsayGD2jEbGmiZ1SgZ9ytVjDQ4xTst98cMKouh5
 YActUrkZEoYEc1xxEFidqh1vnLxVnBtqq8lnX8DwUbk7id8qkYMs5JBwmmuSrCr+Lw
 fDJWDhYOse8jGn5fAszM8/sKu5SRCe/2/llgmcsTB4ypvHaC0TgRBSEoL1yMnSBbdA
 j1ixCpE4KBLI0RzA9h6Kch2V2nguggQTFoB03+nae/GO8q/TtvzS12JZWibGR5i23r
 pgHHOi44u6EADWJnkvblxMpKEeZOyq46silC1j2I1O4RziCt9puGKwIXVHtRR/Tbyx
 A4/AHaCylCnqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yh7e2Vfj
Subject: Re: [Buildroot] [PATCH] configs/at91sam9260eknf: remove defconfig,
 broken
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/08/2025 07:55, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/11161167596
> 
> It is still based on the 4.8.6 kernel, which is not even an LTS
> kernel, so we cannot easily update to fix the issues which are most
> likely due to the newer gcc/binutils versions we're using now.
> 
> There is no DEVELOPERS entry attached to this configuration as well,
> and this defconfig has been broken for at least 2 months, probably
> more (our Gitlab CI history is only kept for ~2 months). So let's drop
> it, unles someone volunteers to resurrect it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
