Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B35C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4511740201;
	Sat, 20 Jul 2024 21:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVwJ4OKZ3vV5; Sat, 20 Jul 2024 21:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09832404EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09832404EF;
	Sat, 20 Jul 2024 21:17:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A97B1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECABD60731
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUzublvDmBi1 for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:17:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D684F605E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D684F605E3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D684F605E3
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:17:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D58E420002;
 Sat, 20 Jul 2024 21:17:43 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:17:43 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720231743.0727d3af@windsurf>
In-Reply-To: <20240720153113.1371411-1-fontaine.fabrice@gmail.com>
References: <20240720153113.1371411-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721510264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dj2/na3RvXzwHAvchUhFie+OoSUTASqtzXtFi4t/ldo=;
 b=CyKWRXXH9uu4GWzA0KsEohPT+3qHG7y00COO/GJEqBkQZwQCbM5rCswnLcCypG+ddRr41v
 7omVCtJSJOEELWkz+fsxJxpGaORu43fKzoEAfMS1A8S1VnbewwoH3sRaEXxMWEXVpRkFPI
 0GaTcwL99QEYA/0DXJHDETZlg/7yo4+egsHXWqbpynKnuz9tNQgQ006R1iWxjPtnfoAZ6P
 clnYZyC484E75SykV4uMbjsolRl9B59RwGtThfokB71l9SfHajIxfM2pyE74c1maoM5BHV
 SHSBUVCuvI0Z0x7oO9v52oO9PoNhpO9q6RkhH/uMpNdWzA8399HQCiuB/vFg2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CyKWRXXH
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: fix patch fuzz
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 17:31:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix patch fuzz to avoid the following build failure raised since commit
> 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016 which reduced the fuzz factor:
> 
> Applying 0002-fix-build-with-libressl-3.5.0.patch using patch:
> patching file include/zbxcomms.h
> Hunk #1 succeeded at 210 (offset -43 lines).
> patching file src/libs/zbxcomms/tls.c
> Hunk #1 FAILED at 30.
> 1 out of 1 hunk FAILED -- saving rejects to file src/libs/zbxcomms/tls.c.rej
> 
> While at it, also fix Upstream tags
> 
> Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
>  - http://autobuild.buildroot.org/results/75dfe12312b5479669fcdfea623d93880c675e13
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks applied. Please note that the URL from which we download this
tarball no longer works:

--2024-07-20 23:15:29--  https://cdn.zabbix.com/zabbix/sources/stable/6.2/zabbix-6.2.7.tar.gz
Resolving cdn.zabbix.com (cdn.zabbix.com)... 2606:4700:20::ac43:4504, 2606:4700:20::681a:694, 2606:4700:20::681a:794, ...
Connecting to cdn.zabbix.com (cdn.zabbix.com)|2606:4700:20::ac43:4504|:443... connected.
HTTP request sent, awaiting response... 404 Not Found

> -[Upstream status: not sent (no feedback on first patch)]
> +Upstream: not sent (no feedback on first patch)

Zabbix is one of those not really open-source projects. It's driven by
a company, released under AGPLv3 so that they can create a business
incentive for their customers to purchase a commercial license. It
looks like if you want to contribute you need to sign a Contributor
License Agreement. See the details
at https://www.zabbix.com/developers, if you're brave enough.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
