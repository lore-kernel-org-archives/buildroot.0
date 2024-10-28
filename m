Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AFCD33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 15:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5858280C2A;
	Mon, 28 Oct 2024 15:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRIqQycBagra; Mon, 28 Oct 2024 15:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 613B280E5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 613B280E5A;
	Mon, 28 Oct 2024 15:43:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36E87112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1868180EAE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmgbwU4wG5dW for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 15:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9E3580E5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9E3580E5A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9E3580E5A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:43:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6DB3240003;
 Mon, 28 Oct 2024 15:43:27 +0000 (UTC)
Date: Mon, 28 Oct 2024 16:43:27 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Carlo Caione <carlo.caione@gmail.com>
Message-ID: <20241028164327.3e494f48@windsurf>
In-Reply-To: <20241025180523.118939-1-ju.o@free.fr>
References: <20241025180523.118939-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730130208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dha6bnvHnbHFEo/Kv5FhdaR7kzPUvVRAMMMFZ7xNilc=;
 b=I9J7dPo99s7+ZdIJEn78Q3J49TW2H9Q6rFTi2+ey+NKBRVq+kH+ZcbbEfU4R9Olqz3R5+q
 2S7/HBXRBtevLijRbsPwVz6S0wBpIJEbLaFsASXZUEP3TatJV3zYVHuj8vdNeADnSFIzDo
 a2uflb6XPdlLYU+4Vj2xQtzU03CVLiGn91NoSymP+JzdlcDHPRsjsuBR/gZgjuFjtD3BZq
 jN+mjNGjtVkuIgU/lFYZSd6ctKdJ8P1ydHaw9MmgcR85MyJQpEJrZySRVojHUyGCHU+ppU
 MyIycXvAHy7HqKbHNYjXj9ZD9SDNPjDQD6CR069dBLTZmCSCtdkI9BRppQsgHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I9J7dPo9
Subject: Re: [Buildroot] [PATCH 1/1] package/jailhouse: fix build when
 python helper scripts are enabled
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

On Fri, 25 Oct 2024 20:05:23 +0200
Julien Olivain <ju.o@free.fr> wrote:

> When compiling jailhouse with BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS=y,
> build is failing with error:
> 
>     Traceback (most recent call last):
>       File "/buildroot/output/build/jailhouse-e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560/setup.py", line 18, in <module>
>         setup(name="pyjailhouse", version=version,
>       File "/buildroot/output/host/lib/python3.12/site-packages/setuptools/__init__.py", line 108, in setup
>         return distutils.core.setup(**attrs)
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>       ...
>       File "/buildroot/output/host/lib/python3.12/sysconfig.py", line 549, in _init_posix
>         _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     ValueError: Empty module name
> 
> This is due to a missing dependency on the target python3 package.
> 
> This commit fixes the issue by adding this missing dependency.

This error message is quite unclear... how is this error message
related to having or not having python3 installed on the target?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
