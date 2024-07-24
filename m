Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B55CC3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 16:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 151F8401C2;
	Wed, 24 Jul 2024 16:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd19hH6pMduF; Wed, 24 Jul 2024 16:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDE19402F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDE19402F2;
	Wed, 24 Jul 2024 16:28:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3FEF1BF29C
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1CE3402F2
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 16:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caG-JwpXJbbN for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 16:28:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AB9B401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AB9B401C2
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AB9B401C2
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 16:28:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CFB5E0006;
 Wed, 24 Jul 2024 16:28:39 +0000 (UTC)
Date: Wed, 24 Jul 2024 18:28:38 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240724182838.4a9f1524@windsurf>
In-Reply-To: <20240724071904.1397662-1-fontaine.fabrice@gmail.com>
References: <20240724071904.1397662-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721838519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJr11nnZJNQX4XIr8/LEwwuvnomGVJlBJ+Xwm6whE28=;
 b=PZgHc2RBED5YjvTyfgGmNAnuw2WZTFcgr+gdpjXoTJDAK+U8G/0UscR33trMsVrLiMoLLP
 tmpi3Ah51GVpwB89nWA+BOd5TVNMnSFKf3Q9EZ4uxMewsCF7cs8lcWXnmOPVjE3BiUQ6Ir
 rA8uw5FM98TnwJW9IBqUrEzoC6Uk3YQ3gIThS5RRRYu/ZuzNwDIr833nqEsc9QgzWEsJek
 7CPU1xCqN0ezVO4f4TcDDcLm+1Qy8ID7vmR8cQvK+AcgJ4clRWcbbeaw8j9AS9RolCjLpR
 OOvsL6NJoPbzmiBcOh0jJu+ix1dE4LKncEFURD9ubRvUxYlkL98uJo29oLPjeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PZgHc2RB
Subject: Re: [Buildroot] [PATCH 1/1] package/ebtables: fix build with gcc >=
 14
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

Hello Fabrice,

Thanks for looking into this, it looks complicated. Question below.

On Wed, 24 Jul 2024 09:19:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch b/package/ebtables/0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
> similarity index 85%
> rename from package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
> rename to package/ebtables/0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
> index cb57b39569..7e481606e7 100644
> --- a/package/ebtables/0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
> +++ b/package/ebtables/0002-configure.ac-add-option-enable-kernel-64-userland-32.patch

So why do we have that adds an option to enable kernel-64-userland-32, if...

> -# for 0003-configure.ac-add-option-enable-kernel-64-userland-32.patch
> +# for 0002-configure.ac-add-option-enable-kernel-64-userland-32.patch
>  EBTABLES_AUTORECONF = YES
> -ifeq ($(BR2_KERNEL_64_USERLAND_32),y)
> -EBTABLES_CONF_OPTS += --enable-kernel-64-userland-32
> -endif
> +# kernel-64-userland-32 is broken (spotted with gcc >= 14)
> +EBTABLES_CONF_OPTS += --disable-kernel-64-userland-32

... we always disable it? Doesn't this make the patch entirely useless?

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
