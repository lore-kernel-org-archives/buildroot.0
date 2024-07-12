Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ADAC3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47FA8417DC;
	Fri, 12 Jul 2024 12:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHYlKdrIyCF8; Fri, 12 Jul 2024 12:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16B02417DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B02417DE;
	Fri, 12 Jul 2024 12:57:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD2D61BF40F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6BDB402C7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIjovtK8Ec5T for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5053D40240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5053D40240
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5053D40240
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:57:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 958BA60004;
 Fri, 12 Jul 2024 12:57:26 +0000 (UTC)
Date: Fri, 12 Jul 2024 14:57:25 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240712145725.68e9c3cc@windsurf>
In-Reply-To: <149238f4ea82fd91fc1a880025ab8b38954da518.1717352584.git.yann.morin.1998@free.fr>
References: <cover.1717352584.git.yann.morin.1998@free.fr>
 <149238f4ea82fd91fc1a880025ab8b38954da518.1717352584.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720789046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RO1+nw1eL1ciY/rHHv2afLIxRlebmT21nN6M1Af1UMY=;
 b=ZK7eIcVfqbv9ri6/yjebuh1PDfysgK5CgZoVJDFMhwdvZv90OXS9m/nYqcB5wEjx1TXgU8
 rfRBxDX9BaNeb87sW302/awK/+X5+Mt93AYmHEsDvxCth+3QytsaThkB8PFUMceeGrQk3p
 unTuxkWkrechDAx6dT0UWCr5FJMu2JeP9famxGoad8FlhrDsXhiZnGdhqoHPSWWQoKmxaP
 7F5IOltIxCBJo6GqAwfejhgl9yIOeYGJdOHbOtKL47ylWsxzKIGD57H4cPy75tnlDEkYT8
 uqwGX5DDwLKgIADBVtrMrP4xkwVpTXvHCqFNplvRHW/hpOJHOt/N5eYxb4H2kQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZK7eIcVf
Subject: Re: [Buildroot] [PATCH 1/2 v2] support/download: introduce curl
 backend for FTP transfers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Sun,  2 Jun 2024 20:23:07 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> diff --git a/Config.in b/Config.in
> index b5a94325c4..e0257ba3e8 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -103,9 +103,13 @@ menu "Build options"
>  
>  menu "Commands"
>  
> +config BR2_CURL
> +	string "Curl command"
> +	default "curl -q --ftp-pasv --retry 3"
> +
>  config BR2_WGET
>  	string "Wget command"
> -	default "wget --passive-ftp -nd -t 3"
> +	default "wget -nd -t 3"

This change was not really related to introducing curl support... and
in fact Peter already applied 1a61c1d9b1919120883b689c3767925bd91d3028
doing such a change.

> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index b838dda34d..b7d277105f 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -688,7 +688,7 @@ async def gen_config(args):
>          configlines += minimalf.readlines()
>  
>      # Allow hosts with old certificates to download over https
> -    configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"\n")
> +    configlines.append("BR2_WGET=\"wget -nd -t 3 --no-check-certificate\"\n")
>  
>      # Per-package folder
>      if randint(0, 15) == 0:

Also, this was not directly related to the introduction of curl
support, so I split this out into a separate commit.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
