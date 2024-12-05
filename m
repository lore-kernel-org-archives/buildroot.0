Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7C6E7716E
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 19:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2072540302;
	Thu,  5 Dec 2024 19:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3i_P8WYaRyV; Thu,  5 Dec 2024 19:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03DBA406CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03DBA406CF;
	Thu,  5 Dec 2024 19:52:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9DA3AE8
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 19:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AECC605E4
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 19:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f57tBhkw_WYn for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 19:52:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 86D8560605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D8560605
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86D8560605
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 19:52:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 22E572003DA;
 Thu,  5 Dec 2024 20:52:49 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:55712])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 05 Dec 2024 20:52:49 +0100
MIME-Version: 1.0
Date: Thu, 05 Dec 2024 20:52:49 +0100
From: Julien Olivain <ju.o@free.fr>
To: Jannik Becher <becher.jannik@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241204155342.185278-1-becher.jannik@gmail.com>
References: <20241204155342.185278-1-becher.jannik@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9c29f5c3e3f898f616284edaac3d97c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733428371;
 bh=X5i5wuf/j55A6qfw0k3ynk0N4N5Be+h8kzbBpQ57nhY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SihA8paXJ1yjXugEEbPZl4fU6nvz+29fkNyv+5sR5+ukOMASqItjmdIdM/pisGpGP
 D6mXurRlAdhWcKxpuR1G17zHUIT1dD9EhB3N4E9uUfGgjnxhB9I0Pa2FERt8CVurtJ
 r/iP57FkRqgF2gKL5MSGI1SYP/+PVk3F6RAkFAiC8lb/GQkkYLBjoYmC2A2GaCD9hz
 bWy/j39eK6PPhdEYxotzjQF+1NGwV7Eni5wuHMe28o73PBpSI7cepjHyvmd6SX1wCa
 bnnAMwS940HIKyMUM/uRP7ZAn16WC8TrKF2AcZjcvhAmvsr5BU4SdleicL3SgtfOzE
 1+BrlJo0LbU4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SihA8paX
Subject: Re: [Buildroot] [PATCH 1/2] package/igh-ethercat: bump version to
 1.6.2
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

Hi Jannik,

On 04/12/2024 16:53, Jannik Becher wrote:
> Signed-off-by: Jannik Becher <becher.jannik@gmail.com>

Thanks for this updated patches.

I applied the series to the branch "next". I did minor rework:
I fixed the package hash and also removed the package patch (which was
included in this new release).

> ---
>  package/igh-ethercat/igh-ethercat.hash | 2 +-
>  package/igh-ethercat/igh-ethercat.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/igh-ethercat/igh-ethercat.hash 
> b/package/igh-ethercat/igh-ethercat.hash
> index 67a152c6ae..0c3a8bb07d 100644
> --- a/package/igh-ethercat/igh-ethercat.hash
> +++ b/package/igh-ethercat/igh-ethercat.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  
> 7e4d8f3497c0bc0b64a151c0d074349fe7614767563642d6fedb19567eafa1e1  
> igh-ethercat-f5dc109176400f540a8682a2c9ee20d411d14d61.tar.gz
> +sha256  
> 844e9846a30b8bed0ae7f1e9a70b724b8980a21ef61c2bdf8fa219c9745c1958  
> igh-ethercat-1.6.2.tar.gz
>  sha256  
> 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  
> COPYING
>  sha256  
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  
> COPYING.LESSER
> diff --git a/package/igh-ethercat/igh-ethercat.mk 
> b/package/igh-ethercat/igh-ethercat.mk
> index 5b618ab54a..374f8891e5 100644
> --- a/package/igh-ethercat/igh-ethercat.mk
> +++ b/package/igh-ethercat/igh-ethercat.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -IGH_ETHERCAT_VERSION = f5dc109176400f540a8682a2c9ee20d411d14d61
> +IGH_ETHERCAT_VERSION = 1.6.2
>  IGH_ETHERCAT_SITE = $(call 
> gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
>  IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 
> (libraries)
>  IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
> --
> 2.47.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
