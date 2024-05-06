Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB556C25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 11:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B0F740604;
	Mon,  6 May 2024 11:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqxyDZhqoila; Mon,  6 May 2024 11:35:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3704D40606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3704D40606;
	Mon,  6 May 2024 11:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E88881BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 11:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D509E402A7
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 11:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-ShE0W9jKkP for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 11:35:05 +0000 (UTC)
X-Greylist: delayed 422 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 06 May 2024 11:35:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED7A54019E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED7A54019E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::101; helo=mout-p-101.mailbox.org;
 envelope-from=socks-in.space@mailbox.org; receiver=<UNKNOWN> 
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED7A54019E
 for <buildroot@buildroot.org>; Mon,  6 May 2024 11:35:04 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4VXzfg3GD8z9smq;
 Mon,  6 May 2024 13:27:55 +0200 (CEST)
Date: Mon, 6 May 2024 13:27:53 +0200
To: Artur Rojek <contact@artur-rojek.eu>
Message-ID: <qo3cktolxcupc5ck6ozvbfnqyf3qyhetkasu546fh7v5x3xa2f@7loksbkslbw4>
References: <20240504195407.1409466-1-contact@artur-rojek.eu>
 <20240504195407.1409466-2-contact@artur-rojek.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240504195407.1409466-2-contact@artur-rojek.eu>
X-MBO-RS-META: hdpb1nckg4w8agnnw53bfgz34e75nqch
X-MBO-RS-ID: a7e3bad8a017a2f6163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbox.org; s=mail20150812; 
 t=1714994875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZLqs8wmQkCp557aXGhi266jZpb8N7HktBju+arrYbjI=;
 b=dLN/O0xZDi6RV4T9dYqmbqC1eCY9aobGnK436AKivQ0zfcYd+AMY3Kg8re3+knTCeHGPnk
 KTbY8pE8W1oGoswrPEcC65n1fpKGJzPe1C6Y+aBmieYlRBZi9h3rFF7SeWVKI/VNhUg4mV
 g00uYHa3ZnLlCQ9AqBSp17j2FU/h0fPdwwugWPdjrTwhidMoIWqg2ygjaG81tWbHikhLm4
 guBx4buSw6l+VXM4RTxMDAItJAXQKF+g+rk1q5dYuIPrie3gvAIJySPYIXI2Qp/sr+S+1G
 6msXmCh5Usi3sLpS4Y3EbvWe94gbgWh/f2xEIpcc93+J0Qmzeyofx6jb+W8J7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=mailbox.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256
 header.s=mail20150812 header.b=dLN/O0xZ
Subject: Re: [Buildroot] [PATCH 1/4] arch: reintroduce sh3 support
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
From: socksinspace via buildroot <buildroot@buildroot.org>
Reply-To: socksinspace <socks-in.space@mailbox.org>
Cc: buildroot@buildroot.org, Paul Cercueil <paul@crapouillou.net>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, May 04, 2024 at 09:54:04PM GMT, Artur Rojek wrote:
> This restores support for the little-endian SH3 based CPUs.
> 
> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>  arch/Config.in.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/Config.in.sh b/arch/Config.in.sh
> index d3acc8ccf8e6..686789265e04 100644
> --- a/arch/Config.in.sh
> +++ b/arch/Config.in.sh
> @@ -13,9 +13,13 @@ config BR2_sh4a
>  	bool "sh4a (SH4A little endian)"
>  config BR2_sh4aeb
>  	bool "sh4aeb (SH4A big endian)"
> +config BR2_sh3
> +	bool "sh3 (SH3 little endian)"
> +	select BR2_SOFT_FLOAT
>  endchoice
>  
>  config BR2_ARCH
> +	default "sh3"		if BR2_sh3
>  	default "sh4"		if BR2_sh4
>  	default "sh4eb"		if BR2_sh4eb
>  	default "sh4a"		if BR2_sh4a
> @@ -25,7 +29,7 @@ config BR2_NORMALIZED_ARCH
>  	default "sh"
>  
>  config BR2_ENDIAN
> -	default "LITTLE"	if BR2_sh4 || BR2_sh4a
> +	default "LITTLE"	if BR2_sh3 || BR2_sh4 || BR2_sh4a
>  	default "BIG"		if BR2_sh4eb || BR2_sh4aeb
>  
>  config BR2_READELF_ARCH_NAME

As requested on IRC I gave it a spin on my HP Jornada 680, seems to run
just fine, tested with linux 6.9-rc7, musl, gcc13, it ran htop, busybox
vi, perl without problems. Building was done on amd64.

Tested-by: socksinspace <socks-in.space@mailbox.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
