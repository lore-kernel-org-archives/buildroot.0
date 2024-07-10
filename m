Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D58C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 12:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAAAD81FF6;
	Wed, 10 Jul 2024 12:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfUv90S6o5s2; Wed, 10 Jul 2024 12:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 644E181FEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 644E181FEE;
	Wed, 10 Jul 2024 12:28:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB2241BF5A8
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A81CC402E1
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s-U3Oma2XBI for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 12:28:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 53C4C40190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53C4C40190
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53C4C40190
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 12:28:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E9D01BF20D;
 Wed, 10 Jul 2024 12:28:31 +0000 (UTC)
Date: Wed, 10 Jul 2024 14:28:30 +0200
To: Romain Naour via buildroot <buildroot@buildroot.org>
Message-ID: <20240710142830.70df375f@windsurf>
In-Reply-To: <20240627084039.44592-1-romain.naour@smile.fr>
References: <20240627084039.44592-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720614511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QgHmL715CD9usNiAvu1the1rzG4kwDbS0m8aRNSNh50=;
 b=duN3qaijrpz3pEfs+FEVdQLddrIoHhq8ImblLrtNUW9Do5OFjukMJ9OoCjJFrRD3Gy0jdt
 OcuQmzIzUTxk5Ih+gzLn7zCZPP1GCxwc6q6P5zxC7SOKcepY9TfstWSY/CtiwjBeLIckB9
 /D3Uqsl5yKT56L3s1bsj8MRIgRmq8/ZIpZK/dmDTxq2sHj0qlWbGiVmTLhkqB+p1VEoM/i
 0ig7MBwfW1R4zkCFqOYlk8xGe+XiylhEdxPvrgIEKDT7ijmXjg9VBAPYfQdchX5vWnQAkI
 ZlvnfWu5aQ+xZxayG7cyd2oq65XQzVtq8E/xiJOPW5o+4U1NK9yS9+8SN9epmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=duN3qaij
Subject: Re: [Buildroot] [PATCH] package/gnutls: add tpm2-tss optional
 dependency
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jun 2024 10:40:39 +0200
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> tpm2-tss support is available since gnutls 3.7.3 using
> --{with,without}-tpm2 configure option [1].
> 
> Since the option is not handled by gnutls package, tpm2-tss support
> can be enabled if tpm2-tss package is build before gnutls package.
> 
> Likewise, tpm2-tss support can be enabled for the gnutls host variant
> if tpm2-tss libraries are installed on the host.
> Make sure to disable tpm2-tss support for the host-gnutls.
> 
> [1] https://lists.gnupg.org/pipermail/gnutls-help/2022-January/004736.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/gnutls/gnutls.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

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
