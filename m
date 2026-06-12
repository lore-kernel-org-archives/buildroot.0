Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D4CCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 09:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6FF60EB2;
	Fri, 12 Jun 2026 09:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYwWeHMfWrem; Fri, 12 Jun 2026 09:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DC9960E17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781255645;
	bh=Idu/NtsD1mfF2TzToXdm9WwG/YUFi+TIiqN2DXY+hoM=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zsem01UW2T9dNR5JqogI8qd0WvJ0omdV5TVMxgPMvLLdHRn8+RJXtMGaRPN0ZeTF4
	 rBTkljOOE0xL6BY7t3bwgjKSmTvcmt7ELK572NP1cfIp6Xv5EJLhV20GkatmmJfRZP
	 t3cOuswIq6uObxWjRHzY3ocRPHNbQHUBHG0iEukgCa8FNSdXYlYwPA9TF+/It0Hr00
	 hqICyTdKUM6tKjjZ/WLgelsm9FwTtoNqS6nZNEW6HwNekL7aN9bHKVBX1VxheocVr8
	 5pvkbutOKqUny+ZosA836xZy/wSIolBV3zcRlB+VA/UOsMHYfAEGQgklScBtoIAfQP
	 sibipk+P0USOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DC9960E17;
	Fri, 12 Jun 2026 09:14:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 874E3F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 09:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84EF98329E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 09:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOrn42CmXDpZ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 09:14:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.181.117.226;
 helo=mail.actia.se; envelope-from=john.ernberg@actia.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8D3382FCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8D3382FCE
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8D3382FCE
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 09:14:01 +0000 (UTC)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 12 Jun
 2026 11:13:56 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.061; Fri, 12 Jun 2026 11:13:56 +0200
To: "Frager, Neal" <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: "alistair@alistair23.me" <alistair@alistair23.me>, "Stabellini, Stefano"
 <stefano.stabellini@amd.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "Saleab, Micheal" <Micheal.Saleab@amd.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "matthew.l.weber3@boeing.com" <matthew.l.weber3@boeing.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "brian.j.wood2@boeing.com" <brian.j.wood2@boeing.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Hildebrand, Stewart"
 <Stewart.Hildebrand@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 2/3] package/xen: add custom tarball
 support
Thread-Index: AQHc+YuYO2eQ0ByyBESvOQ7ZF6bAKrY6a6qAgAAFbICAABHhgA==
Date: Fri, 12 Jun 2026 09:13:56 +0000
Message-ID: <017575f0-c375-4391-aff3-0f9a923bb532@actia.se>
References: <20260611101734.1968785-1-neal.frager@amd.com>
 <20260611101734.1968785-2-neal.frager@amd.com>
 <ae37c770-9619-4af8-9b24-d946bea672cc@actia.se>
 <BL1PR12MB5032D8E3A6E7652CA8F5CC85F0182@BL1PR12MB5032.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5032D8E3A6E7652CA8F5CC85F0182@BL1PR12MB5032.namprd12.prod.outlook.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B1445F62756A
Content-ID: <638C1A516E7284419D01A43977A14327@actia.se>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
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

On 6/12/26 10:09 AM, Frager, Neal wrote:
> AMD General
> 
> Hi John,
> 
>> Add support for custom tarballs such as tarballs from vendor Xen trees.
>>
>> To test this feature, add the following configs to any zynqmp or versal
>> defconfig, so that they can build the latest release of the Xilinx Xen vendor
>> tree.
>>
>> Add to zynqmp_*_defconfig or versal_*_defconfig:
>> BR2_PACKAGE_XEN=y
>> BR2_PACKAGE_XEN_CUSTOM_TARBALL=y
>> BR2_PACKAGE_XEN_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,xen,xlnx_rebase_4.20_2025.2)/xlnx_rebase_4.20_2025.2.tar.gz"
>>
>> Add to package/xen/xen.hash:
>> sha256  3453d17402d2d1417fa86ec7f959bbe5ccdf63312224679ef51e4f97d0a32870  xlnx_rebase_4.20_2025.2.tar.gz
>>
> 
>> Should this add the same scaffolding we have for e.g. Linux were we can
>> get the .hash file from other locations?
> 
> I didn't put it in my commit message, but I believe this is already supported.
> 
> If you put the hash here:
> board/xilinx/patches/xen/xen.hash
> 
> and set this in your config:
> BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
> 
> The hash is found in other locations.
> 
> Is there anything I am missing?
No, I overlooked that it's automatic.

Reviewed-by: John Ernberg <john.ernberg@actia.se>

Thanks! // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
