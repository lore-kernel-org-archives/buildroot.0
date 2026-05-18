Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4454ECD343F
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E5F405DA;
	Mon, 18 May 2026 20:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mig1N5X4HsMp; Mon, 18 May 2026 20:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A15405DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779135957;
	bh=zll3YN32wxcsDWgFRWpAKpbxjKi4Csre+PCN3zC9qBw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e8k6XWidcbgMW35LsQs4fVjVw5x2mrEmKakqp9IDzEaKaSmgE5IpmVtJ9pOVxqieg
	 WdOd12ZdE5k/1B89Gq2NFP8JPd+n+cgiJ2Ceqe5zUSCYdjkmxI9Oo20128j/hTfZbv
	 TQebZr9DrkynqMZgumYhdk9ZkmNtxRmB1Vf03RxQ+Jc0rT+6/E61v0tlm/wLpuGrFY
	 H7mEXsHCcu1YkDW7mrY8X3jU2rDYANmbQJPz3yDmzZqj69PtiO9bidy26VemeVZD2Q
	 iBC9aV8Kt3ShPQZZmwrrDDfQogBbEwnpwr7j2Bev73jS7ctOmpKeXc3K+lij9LlR4d
	 86g9ktf3atorw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48A15405DC;
	Mon, 18 May 2026 20:25:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C6DA1B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DEF3401C7
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A00fxapTCkZQ for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89D90401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89D90401C2
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89D90401C2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:25:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 86EDEB97BB03; Mon, 18 May 2026 22:25:48 +0200 (CEST)
Message-ID: <5143eaaa-0c17-4071-ac0b-cb2d894e9049@rnout.be>
Date: Mon, 18 May 2026 22:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>,
 Paul Cercueil <paul@crapouillou.net>, Refik Tuzakli
 <tuzakli.refik@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779135952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EKtQUVeIV3mCswB/gjrc0zWzPHXeeUQg9bcY0Lqmqfw=;
 b=cGtY802cg/Rz91peIIuPrX+ZdbIBNy3aX+1j0ZDXRnSa8nIpA4GaUv3ibVOKkeTWynVxYC
 o0JUuFZ3Rw2wEIqfAhQ0EaL190irNRiAy3QOPbRVees/OMSxL2vMsMoHNneR1XPWg4/k0d
 1zj2hXzfNOizc2GBAsPNh9xKt/keWbw8tB3puVQ9la+3mjXlDO2mcshvuXnLV4ayU/FVMG
 2PN0cob5bGF3YLDSSDuziorgXEa4FBRS6X04+3HfHD3Q0jz4gxj668+bNTTCICVgWA10bc
 LfP/M/zfLpzP7LnSV/ENXeYkY9OMzWz36r3g2RI666zGDaVYmWP/7SMvjJXMpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cGtY802c
Subject: Re: [Buildroot] [PATCH 01/40] package/arptables: preserve /usr/sbin
 symlink
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/05/2026 00:33, James Hilliard wrote:
> With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
> Using install -D for files below $(TARGET_DIR)/usr/sbin can create
> the parent directory path and replace that symlink with a real
> directory.

  Which version of install are you using? It shouldn't do that...

  Regards,
  Arnout

> 
> With per-package directories, this can later make rsync fail when a
> package target directory contains a non-empty usr/sbin directory and
> the skeleton provides usr/sbin -> bin.
> 
> The skeleton dependency has already created /usr/sbin, either as a
> directory or as the merged-bin symlink, so use plain install and let it
> follow the existing path.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/arptables/arptables.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/arptables/arptables.mk b/package/arptables/arptables.mk
> index 320a33bb3c..ec65201c86 100644
> --- a/package/arptables/arptables.mk
> +++ b/package/arptables/arptables.mk
> @@ -15,7 +15,7 @@ define ARPTABLES_BUILD_CMDS
>   endef
>   
>   define ARPTABLES_INSTALL_TARGET_CMDS
> -	$(INSTALL) -m 755 -D $(@D)/arptables-legacy \
> +	$(INSTALL) -m 755 $(@D)/arptables-legacy \
>   		$(TARGET_DIR)/usr/sbin/arptables-legacy
>   endef
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
