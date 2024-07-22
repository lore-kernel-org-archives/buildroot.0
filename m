Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999CEC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 585B340182;
	Mon, 22 Jul 2024 16:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ww_kvhx8fCO; Mon, 22 Jul 2024 16:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C9C940188
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C9C940188;
	Mon, 22 Jul 2024 16:15:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D5EC1BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B0C76059E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KsjxwyZHj97 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:15:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A2E36059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2E36059A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A2E36059A
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:15:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDD7BE0008;
 Mon, 22 Jul 2024 16:15:34 +0000 (UTC)
Date: Mon, 22 Jul 2024 18:15:34 +0200
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Message-ID: <20240722181534.44a86e85@windsurf>
In-Reply-To: <20240722150833.360915-1-wdouglass@carnegierobotics.com>
References: <20240722143100.346659-1-wdouglass@carnegierobotics.com>
 <20240722150833.360915-1-wdouglass@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721664935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G0wLcLYTTuX33+BQxcrH+lLHyVqbsJsnGu4fVd5AZrs=;
 b=GAMuYvdhhTWJRnKj6Y+tuWEnZTKsZqcu2+R+bQNPDoxD+3Z5SM6EktYc7UYiinITBrZ5dB
 2CIzfEaNok9qh3lmJ4mdPVpAEthrqc+mwfnwiByPqw99ZkXema1W8e2kyz3GpZphy0PRoy
 w9n92PFQlI4CAkfbqe+CB7pD2IR3qeCKDJcQ5G/Y4YkKQgPh5GurGK0SHpcwK4MlAmqFID
 9Vw1dQHpJ2XkZuJ8dw5mT+TetPkXfMiOKIUO/05AKB3jRp082f6075cixM3bAqHIibVw6C
 HS80Xuqx0eW4KgQL21UkQS9wW8lz+NyvFffGNEtoYpH9JNOG1UZ2dlOcOXRTiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GAMuYvdh
Subject: Re: [Buildroot] [PATCH] package/chicken: move literals into text
 section for xtensa architecture
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Woodrow,

On Mon, 22 Jul 2024 11:08:33 -0400
Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:

> -# If ARCH is not set, it attempts to autodiscover. But it is anyway not used.
> +#Chicken only uses the "arch" variable for some special-case compile arguments
> +#If it's empty, it tries to detect the arch host
> +#x86-64 is spelled differently, but in most cases the normalized arch is fine here

You did not reply to my e-mail on an earlier version in which I asked
some questions. I would prefer if we were not blindly passing
$(BR2_NORMALIZED_ARCH) here, can we instead handle only the cases for
which chicken does something specific based on ARCH=, and for all other
cases, pass ARCH=unused, as we used to do?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
