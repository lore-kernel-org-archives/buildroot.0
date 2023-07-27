Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1B5C00528
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 08:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34A24417D1;
	Thu, 27 Jul 2023 08:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34A24417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzhJBi-9jsd1; Thu, 27 Jul 2023 08:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 683FC40948;
	Thu, 27 Jul 2023 08:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 683FC40948
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D68931BF59C
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 08:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFC4460B8E
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 08:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFC4460B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBBCIPgD7-VR for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 08:48:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7084606C6
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7084606C6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57488E0007;
 Thu, 27 Jul 2023 08:48:22 +0000 (UTC)
Date: Thu, 27 Jul 2023 10:48:21 +0200
To: Antoine Tenart <atenart@kernel.org>
Message-ID: <20230727104821.496f8f0b@windsurf>
In-Reply-To: <169044563315.6100.13848963115642161448@kwain>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
 <169044563315.6100.13848963115642161448@kwain>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690447704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MIE00NGOZjsHUWnbXYfHs/U//S+Ai7P+CHQsEQOVhvM=;
 b=ii6hVMU2zAOHKRtec1IMmkW4p9Ha7rHvIv9cp2qOq6bSi1d67V8BvAu1E3ZLtiZ4QbLuqe
 9BmfT1wjCFsQC6r+vaSzkQcJOyCSSNcwv9neHrIIpGLMVP/hs+39jTZ+klwFTzy2BhUWr5
 haVFhTj8W3T5IlfhnhCL2oCHEWeu5/dVSUv/RWP/ZaR22MHcTxgqLCClxxE7O5Nxu/YMC3
 ijvjOAyJtkF4lJ95EbgsSvn//wzhm6utdvY6PuE6YJn7lpuoSql7pYelpq5BfBv1MQel1g
 i5/4UKJP1LkEsfpvLNHx9P4nRRme3S4YCJ9V6d3/PalR5BXWgw8Li3D6uPZJwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ii6hVMU2
Subject: Re: [Buildroot] [PATCH RFC 1/2] utils/docker-run: make it
 compatible with SELinux
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Antoine,

On Thu, 27 Jul 2023 10:13:53 +0200
Antoine Tenart <atenart@kernel.org> wrote:

> > +    --volume "${MAIN_DIR}:${MAIN_DIR}:Z"
> > +    --volume "${GIT_DIR}:${GIT_DIR}:Z"  
> 
> Using Z will label all the files in MAIN_DIR and GIT_DIR with a private
> label and IIRC that means relabeling all files each time a new container
> is started; which can take quite some time if there are lots if files in
> there. However z can be used to label files with a shared label and they
> won't be relabeled after the first run.

Thanks for the hint, makes sense!

Do you know why --mount, which is apparently "superior" and recommended
over --volume, does not support this SELinux labeling mechanism?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
