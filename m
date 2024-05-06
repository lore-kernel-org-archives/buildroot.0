Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F89C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 19:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6208940B9D;
	Mon,  6 May 2024 19:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3x1khIkOEWDL; Mon,  6 May 2024 19:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CF0140BE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CF0140BE2;
	Mon,  6 May 2024 19:06:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFA6A1BF28B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB7AF8201B
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 19:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNs3NzKkLC7R for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 19:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 833EC81F63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 833EC81F63
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 833EC81F63
 for <buildroot@busybox.net>; Mon,  6 May 2024 19:06:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0E1940006;
 Mon,  6 May 2024 19:06:23 +0000 (UTC)
Date: Mon, 6 May 2024 21:06:23 +0200
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Message-ID: <20240506210623.7c3b3065@windsurf>
In-Reply-To: <20240506144555.31709-8-ps.report@gmx.net>
References: <20240506144555.31709-1-ps.report@gmx.net>
 <20240506144555.31709-8-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715022384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHZdpKREWosDYAaVz59dkK5hha1bk4xZ0RhFn7zJnwQ=;
 b=fhJAnDR50IG+QC4ZY43MqwDM/UvQ27D0ltkB/qOg5pwmlMxbb5XvjvUr5k0vpRZlKbmBdS
 zpGyw5MT1I+fkCgXi7N13VGh57ASertVOEPVAvdXCFYuBUYxKgc3Rp/WuGVaP9m6D0hoW7
 DsvE2gcfky5wmSENTQaHl9PumRixrAn+UakU96wxAKqumeO7xEBF7xwuJF+E9XGAcAvIaa
 C2g/4+Ksq5HKBuVWx2qkTsgU1WgjshSVwqfdK85qzbXPfaeUlkJeBF6iZwKMXHd0cD1LsR
 ydVKbd7rcoI9jOwbbzJ/EHEuaV3w3ULC8HZzMtZFSV4NjopbtfXk0dMIVbpALw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fhJAnDR5
Subject: Re: [Buildroot] [PATCH v1 7/8] support/kconfig: reference
 environment variables directly (remove 'option env=')
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
Cc: buildroot@busybox.net, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 May 2024 16:45:50 +0200
Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:


>  config BR2_DEFCONFIG
>  	string "Location to save buildroot config"
> -	default BR2_DEFCONFIG_FROM_ENV if BR2_DEFCONFIG_FROM_ENV != ""
> +	default "$(BR2_DEFCONFIG)" if "$(BR2_DEFCONFIG)" != ""
>  	default "$(CONFIG_DIR)/defconfig"
>  	help
>  	  When running 'make savedefconfig', the defconfig file will be
> @@ -197,7 +176,7 @@ config BR2_DEFCONFIG
>  
>  config BR2_DL_DIR
>  	string "Download dir"
> -	default "$(TOPDIR)/dl"
> +	default "\$(TOPDIR)/dl"

So here the "\$(TOPDIR)" is because we actually don't want the "new"
feature to kick in, and we want the value of this variable to be
expanded not by kconfig, but by the makefile machinery?

So this also means that when we do $(BR2_EXTERNAL_BLABLA_PATH) in our
.config, it now also need to be \$(BR2_EXTERNAL_BLABLA_PATH) ? If so
that's going to break a *lot* of things...

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
