Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDEEBD767F2
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 826ED403BD;
	Thu, 31 Oct 2024 18:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBNj8FNeYbYF; Thu, 31 Oct 2024 18:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FEB0402A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FEB0402A0;
	Thu, 31 Oct 2024 18:07:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7671C5E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6307C40204
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:07:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7jGAdmTiZkx for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:07:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1EC7240141
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC7240141
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EC7240141
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:07:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AB1F20007;
 Thu, 31 Oct 2024 18:07:38 +0000 (UTC)
Date: Thu, 31 Oct 2024 19:07:37 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com, Lothar
 Felten <lothar.felten@gmail.com>
Message-ID: <20241031190737.645f1103@windsurf>
In-Reply-To: <20241031171536.575419-1-dario.binacchi@amarulasolutions.com>
References: <20241031171536.575419-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730398058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfJxXNLG8DOabAVTLz03ItV38GS2WdSw+YWXfMB+6xs=;
 b=DgoYkZpClnFXAhsFAYd+Zs7HcCAriT7FZl3g6Hh8j4PhsVs6g7eHLtvzH32YFVKh/EyPOw
 H8HQMLQ/oGVHvF5ogxBUY41xpiZzQG5SyBjEHuszXEEkNsrnRIyWh3DUs+T15j/rn1Zr2y
 0Qx7eaUQq0vLUo77nlVN2L85ApepXjEQ6oi2zLiuvdav0ZzKkd5nnSySdeUmgRBr5Ns8tJ
 3/QfoO/hf7njOokdxdIYSArhJg0QHTpgqLTeqtFjaUEmDVRdh2WK3wKC7jMQH5YX9Kzchb
 MKqzZmU70xfGr/jIp+o7OLU/4KWV809K4ZqQ0SdWmw5bUUKBL4ybSSi24NUo1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DgoYkZpC
Subject: Re: [Buildroot] [PATCH 1/1] configs/beaglebone: bump U-Boot to
 2024.10
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

On Thu, 31 Oct 2024 18:15:36 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The patch bumps U-Boot to version 2024.10. The new version has added EFI
> Capsule support, which depends on GnuTLS, thus requiring the activation of
> BR2_TARGET_UBOOT_NEEDS_GNUTLS.
> 
> Tested on beaglebone black.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
>  configs/beaglebone_defconfig                          | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
