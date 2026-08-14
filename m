Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D947EC5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88028607DD;
	Fri, 14 Aug 2026 13:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwR-auqAsE0v; Fri, 14 Aug 2026 13:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A326606EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713409;
	bh=gtx2UdW7a/1fhtL3pJXi+8B40+m59ZBsN7jp3wpIj24=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Ua9NL6rf92Hg9EqzAoEorqOH620k2iBXdBhLpdgrz+Ac3thEYPjcapIM2NqoA6q63
	 p/92yCeNCfcMZ1Kom+sWFl0VBsE9MgE512PJv9a+OE9Wf3ikfrQ6htmUeM2yOjmx4r
	 xTGu8PfNHf1EacdW7yQH4yBthNHWmnaOeua1Ml0Gw3CPSdEDR/AuuJlovkDxaTGsrJ
	 r9xW/Ann5sBWARICrC/+3B8AQUn805kt1yxiM7jRKBwiM1/NYIN/Upp/5dKApMVV9A
	 rk5JmhssSYpHZ9xVlYBm3PEIxNm4nPTIrRA0NYmeQ0YUrI0vgaeXz7R/hA9y3UYCJL
	 tGsAc44XnzMXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A326606EC;
	Fri, 14 Aug 2026 13:16:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F9E923F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D570606EC
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFsNlMV4U4hS for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c107::3;
 helo=ph0pr06cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4520560602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4520560602
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c107::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4520560602
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:16:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAT88qpko8LIi1KRmAOonG2fsEQ5AVgWyKz5tBYl7u5VUXrNYtNiShvmfkcf6QUuHqN1H5oxIWwCrGHEmmNzH+TTD8yJ6blUsNJrU1sbKk4gCEbWerJZVQIgSxbWhMWH5oUULskcwJZkCNmLiqFJv1QDLW3rUUks17LuMY5ubF0azbNY6pJEnmQoG914CMDJc1o7svqJ9nqQas7ClQDYxNV6nXjgGgWPVk1NYUxAHQsYgpbzjkvN1p2t4/opL8qK6tNui4Yf1UP5X5Dt3AfMJ0y0zkjI/po/LRwwdlpesZQw06pJrGsh5W8cU+ylzCvvymdAilalaOFXWBtSTqSZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhVtoRozrMwx1MUp7jY1DtA9ipatnaP6BVqB/c0zCp8=;
 b=lcQeJQijMwp2ZyMWy43KCIwg/w4mn4vBZ2RLBAALEyCSZbX20OLQ3JhZ4I6yBdjvsdpJcHVDLNTQEXIRdBPXsvdskESgQjjBSNBP7iGvA8sEYYa30IYHA1I36VLKN+/Pn5/tOkwcKaP0iVGlGmrEg7+a6ZP1o7ae2rhQoOkMVLC2I8bUay7B+cE64qwrbWvw6t7SLD1RYnP73fZkvNOCqeYXf5K/a7kKM/bCPiEnhNgwAunYkAosA5YBBydudGgP++eeepfpxlkNwH165xejMJ7sRfrjnpWuHTPKJgdVemRiDmKYsylBYjf0ziszw8Aw0t8fY5iXuYvfiqCPnwfNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by IA0PPF8CAB220A1.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 13:16:38 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 13:16:38 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "romain.naour@gmail.com"
 <romain.naour@gmail.com>
Thread-Topic: [PATCH v1 1/1] board/qemu/microblazeel-mmu: fix run command for
 qemu 11.0.0
Thread-Index: AQHdK7tjPTpMeE0LJU2SajZjpDnEyLadW+rggAAqlSA=
Date: Fri, 14 Aug 2026 13:16:38 +0000
Message-ID: <BL1PR12MB50320D692F9913FF888C36A7F0DA2@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260814070557.245945-1-neal.frager@amd.com>
 <BL1PR12MB5032DF56C47A91F9916F47A6F0DA2@BL1PR12MB5032.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5032DF56C47A91F9916F47A6F0DA2@BL1PR12MB5032.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-14T10:43:06.0000000Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|IA0PPF8CAB220A1:EE_
x-ms-office365-filtering-correlation-id: c3d8eed4-f170-4c6e-be97-08defa0645ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|3023799007|22082099003|18002099003|4143699003|11063799006|38070700021|41080700001;
x-microsoft-antispam-message-info: ZEROQNrBAjxsv0T6fZMuNawxLCYeJ9EGuhPnrssbbY+xe99LWgJ0cRUMhiwNEtViFIarvZ/CGD6m1+X1meOtjL8HetPaS9I09xJguy1q1zU9moOgzG7VhhC32QgsD6xKB1nivtJLoxAiGeQ2ZXqOIVPyc4AxWkobjGINVj0gqQGmKF+MfPstciatf1Zt354EuXxrJA5eTjd+kZ2TfXnxzfRXp8xxEmig4rOkE2v3Eg8axXu3w7bF7jq0YThkAdw0NsLjEyN05zSCqEyieSNjSXMalbnTF3l00OZYOG4gPqHZuA/aSK21qhp7VyUbLQtvsfcqXUPNiLHad9GuVT12QzkIyA7UhPfPEFPBwhBsUWQJ017bBiIhoZssYJlmc5CSgkxbiX/BRIeW392jEk1SchzzQI+kUCKiEZ9+Db97MgAgXS9F7U01OIA7IciVpoBLvQsX4HmZ+eGpSn/cYKRAsFleHEbyk3JRe61bWqaCkCutFMSzenNFS/n4akTKVJlKgjkgwPQPnjc6XdI1I8IxhWjh5Am7c48VbPgT/OuxqowNQ0idtQ8PHfV/IgYkzaZpmrQWtFdKUakB5g0k7IaM3LeXUCk9rOXanHxZ4i2ju3EGQOz23SoZ/H4uxofEQEQfVVe2wkmKMShkGSHhnMZ8DLz2JJaAw9wJuWeSyiYDOJFolR32yxeYQyphXXZUhZ7g3JWigrQmyON2SSNQLtTgA6xDQVyiIHwHPn4OjXVxOvKid4uuUaOiq5A57+G1yYer
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lU4B8MKw8tzBpllLifofJ0CFpiyQwexRytIi1OwI4x+T1u6TxyrhSV5T11Bp?=
 =?us-ascii?Q?RhQMbSuvfOARURZVVJfX8pxudtKo7lnufVwynE6ni5x+GQyfvwgsDhlSo3XY?=
 =?us-ascii?Q?qJx53YJe/qvwuxadndhbFhqgQbU7RruG8KHh5e3rRfTtL/37AsOf3vq8I1Nv?=
 =?us-ascii?Q?OHBO6ReSRWqjQ8Y4caC2YvGV5XdLqI+VkQNs5lxqgsi+QtDbQ/E0em+JUklm?=
 =?us-ascii?Q?/STQAWBwyRNmItk+XbJ9hQYfXO2XCaQ6eGffjRdm7r2RwBkNNYH+3oTcoHQN?=
 =?us-ascii?Q?fiko8x3ohJG1vyAJ3tOI/8GzJ0vdy5lOTTo8ad8tYBr4heRMJpvGRO64/ie7?=
 =?us-ascii?Q?snc92wm0R4KJs9g9KJzQyXo/i3DQkL/JRh0fd/DtXVI0OrQuWB+3zBaIG6hO?=
 =?us-ascii?Q?kj4+6pdgGHZE+/YUoly1qg/tsACAA4W6BbaCUuVKs18rIRBKU/85MHdOAPJs?=
 =?us-ascii?Q?2C1eOGE+lLnP2biMJ43a5ZOEWJ4jNfBAM/2HvwKxdqUWCr+cDp5T4hPgszxQ?=
 =?us-ascii?Q?ALJHhFdZgNCVUecdjoE3qDV2N2L2eur5msjKdmHVfKaPQwXq2nTp9W3xKRhk?=
 =?us-ascii?Q?q1boJVeMAgbDKdVI0YTqZsuZ7k1rP3zmerJydvGY2/5/bmK4Ib/mOM8L7qfF?=
 =?us-ascii?Q?pOurB6yQbfM8IlzfQtf/Ugw6ulz+yDbkneG/3P0CaCb3YWNtp0q4cxtZRFxs?=
 =?us-ascii?Q?tnax4sVtn0itJMyBoolISDE1KYm3IqqFtjLkQ5d6U6dRnuW6U5UP1fLzu/xu?=
 =?us-ascii?Q?nGhBRmJ5SPTmHHDN3yc/VWlGJeU6YHoPaq5oKhjYW5hy/uyS9XwshngGt1ru?=
 =?us-ascii?Q?24qC3CTsK9hed0HZaqGdUtJD4Z3lfGV4cTNe2Qnzi4hznSp0Xxp2aYaEkY8m?=
 =?us-ascii?Q?kc+T/8LDAxxVqN/vvzjEsKUx0d9Dm2372DvJTl4YX6xDwIRf6T7nhJeqWo2L?=
 =?us-ascii?Q?nYzKOBFDfhVk/3J1UbZuCJju7LwEaQ1mXDcHAPIe95NS4qPwlcworZHs7OMy?=
 =?us-ascii?Q?0VLLNQGUPEgqsUuE1ZL6hvKJ+8M6crl6fD9wF3u8bobsTxmJenu1GS6DABnR?=
 =?us-ascii?Q?C5LycdUV7qMpKuGLVFGXORvkvXlJwg6BjrUJevDk83+16s2R64sfZiIJFzke?=
 =?us-ascii?Q?H048vhVivKmbh1vvFXaVDj70SGtzrPmOEUWolzxTjWOFnliW7F2bvwGvDA1O?=
 =?us-ascii?Q?BD7fAX0XKjVdGtiVYfvpBD6Rqu4624vdgkxGpATgiT5Z0a48nscCxu5fEFO+?=
 =?us-ascii?Q?JdK4dvFNPCRL8CN7zQQx8MjEVUVmUv6S2wEDMrgDXsNcgtwx6b8VaiHyiv7x?=
 =?us-ascii?Q?SqNFuk1yTy0FPhr9LVuciCrDYzR6jJanHwboJzMdJc/3xVxbWELfF+PByF+Y?=
 =?us-ascii?Q?K4l1zqgvBhHw/c+3MGWoCAw1TTogHqIotgfuMDJFwWWHvE5YPvA+gXZq1zYs?=
 =?us-ascii?Q?SJKsMxRvqe3pxdUJ68Bd3DYQN8hOY4i12Y0U0t8IgwndUdJTXox7lW8wyfcM?=
 =?us-ascii?Q?vb83PO+y+IcpixovKMh/SpLRZg4Dsyc6Veqcn6ju2b8Bju1o0g3W2o2H//BC?=
 =?us-ascii?Q?T4ZtDT0jp6EsawBNQJasfV3/KhJ2MbIq8d2boy0b8MlQ8DBRPQ9Gay0oTVRj?=
 =?us-ascii?Q?HLm37EuQaoAVhTHXBuebIMGFeXIctvMuJsF5u1cEudNa0x6Fc8J4gt8pPotG?=
 =?us-ascii?Q?KSfD29Qn0Ub5u28pxrE/j5f2rRv3H3N4GQyZZGlsnwMuvaL/?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d8eed4-f170-4c6e-be97-08defa0645ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 13:16:38.2768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5zo4+p2WR6R6MpsqrRI6834AVieaJrqbcrimSeK2AQhCHDBQXiaIWkrlb0UZDro9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8CAB220A1
Subject: Re: [Buildroot] [PATCH v1 1/1] board/qemu/microblazeel-mmu: fix run
 command for qemu 11.0.0
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "joseph@anodize.com" <joseph@anodize.com>,
 Sam Price <thesamprice@gmail.com>, "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

AMD General

Hi everyone,

> With qemu version 11.0.0, support for microblazeel has been folded into the
> microblaze target. This means that the run command for microblazeel-mmu needs
> to be changed to reflect this.

> See the notes in the qemu bump commit to 11.0.0 for more details:
> https://github.com/buildroot/buildroot/commit/9a5369effd22011b52b82c91f702bacde690c41a

> Run command for qemu versions prior to 11.0.0:
> qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

> New run command since qemu version 11.0.0:
> qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> board/qemu/microblazeel-mmu/readme.txt | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
> index 20fa0072ed..a9f832e91e 100644
> --- a/board/qemu/microblazeel-mmu/readme.txt
> +++ b/board/qemu/microblazeel-mmu/readme.txt
> @@ -1,5 +1,5 @@
> Run the emulation with:

> - qemu-system-microblazeel -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig
> + qemu-system-microblaze -M petalogix-s3adsp1800 -kernel output/images/linux.bin -serial stdio # qemu_microblazeel_mmu_defconfig

> The login prompt will appear in the terminal that started Qemu.
> --
> 2.43.0

> Unfortunately, the qemu_microblazeel_mmu_defconfig seems to be completely
> broken since the qemu 11.0.0 version bump.

> While the qemu release notes claim that qemu-system-microblaze supports
> both endian types, it does not seem to start properly when I build for little
> endian.

> For me, it hangs here:

> $ output/images/start-qemu.sh
> VNC server running on 127.0.0.1:5900

> Running the same build with the qemu_microblazebe_mmu_defconfig works fine.

I figured it out.  I was missing 'endianness=little'.

I have fixed this with a v2 submission which works.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
