Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D62CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 07:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A516260EC8;
	Fri, 12 Jun 2026 07:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMG7vbIxfdNj; Fri, 12 Jun 2026 07:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45C0060A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781250638;
	bh=M5YCtox95njAoI2x6yfni2bpjtLuEwKFxWZkZq6pJdE=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o50grUJlRDy5iYvmqToFphn+Qkc11N99AuGvyYdjWaLBq/fN7RKVggNN3l+Jix0IT
	 xYrtdruEUeQGbtSW5JqT+HjwrNu86ha6ZubkqCNZUN7tQ8JlmWRXgvkPCBf81o3uSq
	 rGko5AlNEb56dYVXSVyGLh7qpIA6TOFjLpuufjl++wYvxmsJ/td7wHxKm25Oz95Dy/
	 JyZPo7ES73a04tcuiJXw406qss303h/Zwn2aT+KIBFHQeInDzzkR/eJKHSj1wspa5g
	 dstIo5SEFLrcfNJo0NB7zP2Df36kwKuUqGuvW2HsnF5ymkUWobAX4nkJuSsVqGVq30
	 wXNj8/EPd2dvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45C0060A4A;
	Fri, 12 Jun 2026 07:50:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 717FCF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 07:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5756960A4A
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 07:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIJhu5z-WQYb for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 07:50:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B19D36088D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B19D36088D
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B19D36088D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 07:50:35 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S035ANL.actianordic.se
 (10.12.31.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 12 Jun
 2026 09:50:32 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Fri, 12 Jun 2026 09:50:32 +0200
To: Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>,
 "stefano.stabellini@amd.com" <stefano.stabellini@amd.com>,
 "ibai.erkiaga-elorza@amd.com" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "micheal.saleab@amd.com" <micheal.saleab@amd.com>, "yann.morin@orange.com"
 <yann.morin@orange.com>, "matthew.l.weber3@boeing.com"
 <matthew.l.weber3@boeing.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "brian.j.wood2@boeing.com"
 <brian.j.wood2@boeing.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "michal.simek@amd.com"
 <michal.simek@amd.com>, "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v1 2/3] package/xen: add custom tarball
 support
Thread-Index: AQHc+YuYO2eQ0ByyBESvOQ7ZF6bAKrY6a6qA
Date: Fri, 12 Jun 2026 07:50:32 +0000
Message-ID: <ae37c770-9619-4af8-9b24-d946bea672cc@actia.se>
References: <20260611101734.1968785-1-neal.frager@amd.com>
 <20260611101734.1968785-2-neal.frager@amd.com>
In-Reply-To: <20260611101734.1968785-2-neal.frager@amd.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2956B1445F62756A
Content-ID: <F38C5C3C0CC4A9438CBDF6F178701A4C@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=actia.se
Subject: Re: [Buildroot] [PATCH v1 2/3] package/xen: add custom tarball
 support
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
From: John Ernberg via buildroot <buildroot@buildroot.org>
Reply-To: John Ernberg <john.ernberg@actia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 6/11/26 12:17 PM, Neal Frager via buildroot wrote:
> Add support for custom tarballs such as tarballs from vendor Xen trees.
> 
> To test this feature, add the following configs to any zynqmp or versal
> defconfig, so that they can build the latest release of the Xilinx Xen vendor
> tree.
> 
> Add to zynqmp_*_defconfig or versal_*_defconfig:
> BR2_PACKAGE_XEN=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
> BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx_rebase_4.20_2025.2)/xlnx_rebase_4.20_2025.2.tar.gz"
> 
> Add to package/xen/xen.hash:
> sha256  3453d17402d2d1417fa86ec7f959bbe5ccdf63312224679ef51e4f97d0a32870  xlnx_rebase_4.20_2025.2.tar.gz
> 

Should this add the same scaffolding we have for e.g. Linux were we can 
get the .hash file from other locations?

Best regards // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
