Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618F7D767FA
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 19:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CBA0819B4;
	Thu, 31 Oct 2024 19:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smEzZRSbhEU0; Thu, 31 Oct 2024 19:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14629819BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14629819BC;
	Thu, 31 Oct 2024 19:58:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3173A5E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1268F819BC
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UkQ35kbmv-L for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 19:58:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E43ED819B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E43ED819B4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E43ED819B4
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:58:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 291A540003;
 Thu, 31 Oct 2024 19:58:35 +0000 (UTC)
Date: Thu, 31 Oct 2024 20:58:35 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241031205835.13b00d20@windsurf>
In-Reply-To: <20241031193809.711402-1-bernd@kuhls.net>
References: <20241031193809.711402-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730404716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwqyePMGxQ4XjA7cWUSGbre8J86ejNGtd9SkJ4WLRDs=;
 b=B6SdmlsZ0XxZhbQ6oLfROIDtdQkRkhb80XACVJ2kKmhr4q7lCToXQZY65YxejbeUjT4QYl
 xaVFnx+OpmkWW1kWXQ3p4cjDq8GVgKxM40d23TyJ9uexxHDlVDAYGgrSVBupJcpPRLwi+t
 nr3Btpl4/rxc+FXcVjStVkNewV7hL0VCnA0RTVR+D0eg6KckZPEYbUNuLkZ1JR1/Fl+9FG
 4/ehrLdCWSMIH3lMJtmdTgKWE28ZvcPAHmWGZHm3+EhBXQbRiuiAnTAQP5VMeT5l4PHotK
 0/279yHStCD/SBQQY6EFi/LWByY/xsIt8LRXAjmwho3vol8UxtNLdNeJu97AYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B6SdmlsZ
Subject: Re: [Buildroot] [PATCH 1/1] package/netstat-nat: bump version to 2a
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Thu, 31 Oct 2024 20:38:09 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
> index 0d16579a6a..7e954bb456 100644
> --- a/package/netstat-nat/netstat-nat.mk
> +++ b/package/netstat-nat/netstat-nat.mk
> @@ -4,9 +4,19 @@
>  #
>  ################################################################################
>  
> -NETSTAT_NAT_VERSION = 1.4.10
> -NETSTAT_NAT_SITE = http://tweegy.nl/download
> +NETSTAT_NAT_VERSION = 2a
> +NETSTAT_NAT_SOURCE = $(NETSTAT_NAT_VERSION).tar.gz
> +NETSTAT_NAT_SITE = https://git.sr.ht/~nabijaczleweli/netstat-nat-ng/archive

Could you switch to Git download instead? Indeed we're not sure those
tarballs are stable, and a tarball named 2a.tar.gz isn't exactly nice.

> -$(eval $(autotools-package))

So they are switching back from autotools to a hand-written Makefile...
not really an improvement, but OK.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
