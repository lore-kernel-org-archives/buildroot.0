Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E568C54791
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 16:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F70281DE4;
	Thu, 22 Feb 2024 16:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-JsOyoc_BZ8; Thu, 22 Feb 2024 16:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 273BE81E5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 273BE81E5D;
	Thu, 22 Feb 2024 16:35:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C88CA1BF2CE
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 16:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2F2481CA3
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 16:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flNlLzcAbNc8 for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 16:35:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2407::601;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD76D8196E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD76D8196E
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD76D8196E
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 16:35:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ih2+mzmynuTpKNPkUZtQpbi2DX28NND8uMY+wT1Y7SmxRdtGYQnpH9yi490u8/nagmSOPF1p2MejZ3vuPOOpVouJc2JZCf8PXgnLGd37DMytPTKISOktt5WCuodA5UuQaSxP5aERt5B9eYaHd7NZFmaTHLncjB6QL7eyE+lsxgU3ySRW6ST6I39J+c3xoHkxiITGxSMHAPYZ3y+JaH3JOt813MxJ1rdbgQkIQHmmA28Vlw7gKqnw/I9qWic7tJS0ojJ42KwtH5/0kE8V0CmPtr8gUGmen2//XNYMt1CnLFg+cLgOrGlIPhozRI35FcHIchetiSS1whpG861wAEqK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByZiHcLX322y8+M7MSZCQd7xyACoujrn6r/AfMwxz3M=;
 b=BSK/2T3P+W9PVcZAI+u6NbWW5h4AUxcxMMxQMZp2LWdBj95Tm3iNbptNtkcaxZQHPWSsCUl9tae6NMcNfsNwU51fvqVzHu4/9QaBqvRGws5in8GrAROnjt5MP4toLdi2z3fIkTIQOrq+Py0RFXCd9k9A7m8s3VQxfLzU7X+WPmr0AAmwk8H0ygCOGuSlS3oDm//BGv7bQq7qqvaDIhZY6O1DU5bGKpNx0fa73mHbUIeb8s8IU0tIwSACvATondFfIg2JbjWu+0aJx3wD9dDZhHPi/s392t0HghCg6JEYd/acZhX28gLKPhe9q5mMDji7C+j08H6FfvKXA3Qne6CQfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 16:35:21 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::843f:50be:2b44:457]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::843f:50be:2b44:457%3]) with mapi id 15.20.7316.023; Thu, 22 Feb 2024
 16:35:21 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "peter@korsgaard.com" <peter@korsgaard.com>
Thread-Topic: [PATCH v9 06/11] boot/zynqmp-firmware: new boot firmware
Thread-Index: AQHaVDf3iO37MvF83Eai9PgMImmRJrD+nZWAgBgT8RA=
Date: Thu, 22 Feb 2024 16:35:21 +0000
Message-ID: <CH2PR12MB5004F29862E7DA6B163B2C97F0562@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240131112223.2175855-1-neal.frager@amd.com>
 <20240131112223.2175855-6-neal.frager@amd.com>
 <CH2PR12MB5004CB6FA7EA005C4F36C796F0452@CH2PR12MB5004.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB5004CB6FA7EA005C4F36C796F0452@CH2PR12MB5004.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MW4PR12MB6974:EE_
x-ms-office365-filtering-correlation-id: 815cac8c-a4b7-4765-5b7f-08dc33c4435d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XkcQGD2EUsB2D6em2Q+/R1mTE7Jv6RwMMXc35y8x3Dj1lrm3h9ejXXuqCNN8dvg/iyrOSW/qYk2UTbceESLuLUth/CgSbg/x2FMLt28dZA9o1MvBYHk5W3ELAHV+x2PRKJaeJXjuQ3QuD6ww9kT7XtIiO+xWH2VlF5zSYZkGoZDu0TMyqmUC0E1yi5njkYhPL0rWOVG+GUMfeplMxc8XwdfL8UFxMtI49tVdx7Fia/yqQzMq8ntRchW/Ssc7sDsBrx2K7n1h4tQN3mkJXWA2oB9aU0dUavXCRdP+dSK25ZH0tOteLlHZup2EXOuqmbGWKY0jw4DSd7uGpg+owRO5VywoUwW16OMRWOYOgZY8ddOMlgHR450xbxABcZGcDVsRVj+R9ieaXhU9/SzAcMtWP8/zCZPnT37A6rFMsCUgjWcnu4tB5byXvT1ZetTOsIR8eLiK13Wpk2uXiG4kRdKmfyzcuYVU9ZT5Xt7n+Sj91DTd6ZIKWG8H3Ryta02dze6ZkjnRT0tWWMlTWDWfdL3H3JfNJh/8liveoTxCEtUNmamRqDUTB88065tLRgRJbGQOFKHicp+tzYMyI48x1ethXVwfRmT8WxhPlTQVClxDPDHx1fOCzQjJJA3XAGedVUGM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0sWPO+xpCT0OB2spwgZX2QI5VWsezm2AJjGilJKqfg+Glf8WtC/AxUCIXq70?=
 =?us-ascii?Q?C1HyLnqBrAKkIgKhEa7oiFz0fK7IyXc6z52JnWFCO6PCR1ARbpJgpHq4g/P0?=
 =?us-ascii?Q?5TE+3Jt7trFRIrKlTGVS6ZB7ufDbYDvg8LE1hxPjqTTXtaEME5GERKgfmL1H?=
 =?us-ascii?Q?+4kYXgJqzgWTQjT1lrK+pMzohth64tm9D/A3pDsyoq3IvWjXOhXCYURKtZLd?=
 =?us-ascii?Q?HnasbxUYomyQEB6UOUJCVK+juUAkhtNsvEQyIFiFQfc/KB8mt87oq/d/bF8N?=
 =?us-ascii?Q?DEF7InLFBFgwcMzWB6SJrFcF97C/yd4jD62RLMOXdC1se+tklnOOU7IPJLlB?=
 =?us-ascii?Q?JWkeG5ws5oZLXef3EleWzmNmoujwoBRZMXnYRnUlx5Ee8ZzdP428iGRkB2KD?=
 =?us-ascii?Q?Zda/rASvvF54DXDwtRDUhtGEppECZvh7emev2bAAWNRAXTZ0cufsnmIHq+1T?=
 =?us-ascii?Q?JeJpnn7dcRUZVpuwA9cjDd5qbPK7EzuSGda4Wq7JPbDzJ/mxEMU2ZYmkhlWF?=
 =?us-ascii?Q?L1X2EltzKkNbTASODwOfUSDuoSmWZJbRb5lw4hApPgixdaHc7TwJLOZRfti6?=
 =?us-ascii?Q?apViiigeu4IBsLpxofXPbRikw+u2zWJj9mIkA+XsG9JrGx8Tl0vvnCBmEDZM?=
 =?us-ascii?Q?+ogNwTWXQ0Hiapm374fN2MZCgvkzjzveCM6H1QRXQRdE0Wls4nrksg2ZLuII?=
 =?us-ascii?Q?cf+z/YGj4K4NRr+MohGexBP0q6I2SpePpugjAZrfwDUUUcCEw0ZiyF0fLf4v?=
 =?us-ascii?Q?lQSGVCOqe8DaII7P3A9cbOOHC6C+eRrXEwlMQYRYaDdhPKKBXbZjKImhvpUi?=
 =?us-ascii?Q?stSwfdmcOX4ZnfKH9xy6H5qKCdrXd08a5PAdBmOM6v+z1CqDFmuzNsbngUd/?=
 =?us-ascii?Q?JpDGVPq/uvElfJTQYhzg8qGqYlljRZTV683meQHDyJWw8GbnCL0/uB0ZfaTw?=
 =?us-ascii?Q?zkUULUP6o9QRl45Ww8PAZCZC3PBAPFSr6eO1MuRc+V0uyyU2hen27qGqCoqe?=
 =?us-ascii?Q?el2NYn1XqOkCTFu9liD/sNslR/QjM+tO3xV6b2UZ/7vKpUqr2HDbT7aenv/E?=
 =?us-ascii?Q?90yPKbFp0ox3+aIlrdWLXTKjLtXVY7Zcp+OduYwVOgQ2rhph3QL8RFR86d64?=
 =?us-ascii?Q?Wg5pJjBUnhRvf8IPN0vhKVJk7yLo4dQ8xd8CZ6MtThGuttf7TMTC/G4/ks3x?=
 =?us-ascii?Q?l0V5fxccYSYBJ/vdfzqFFh5/rbMscXLl31e6uKQlHVd3acPC+CBYniyQJvBR?=
 =?us-ascii?Q?nb8x9oVgIgDLDUru2Fi04McNKNzq/axryzc4wBDaeF6ExJHsKoPr/lbg6wXw?=
 =?us-ascii?Q?TWolkQ2G7gg4pOuJBjF0pA6Uk59cmf8iSdrDc4ZyJMh4DDMiZzSOoxfe/5Zw?=
 =?us-ascii?Q?Emq0gSK0tXe/MF9vXGIUn92fii0JWChWnL/X5vIjx3YG4V2ITxz6WI3IZw6T?=
 =?us-ascii?Q?SaJeql/WFfrIltbNjqthHIiO1wHGuTrRG3/OwY6qxdWpeajlscZthT4pykwe?=
 =?us-ascii?Q?1TtWEOZgFP13qFy3tjYvDH3HNpLF4IQlvANAvh8Cw8EERPiOg0sRbXEIgqH/?=
 =?us-ascii?Q?pvbzGnaN5MqoypcmJ0/9sIW+LxYsMd8/U7qR77b/txjlgetWQFKosX0fFXe/?=
 =?us-ascii?Q?VeCyabTkIGeliS3TKrFurL4=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815cac8c-a4b7-4765-5b7f-08dc33c4435d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 16:35:21.6130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kHShDSXXZGlZq3uJEWlaxXQNsK/mQBtfuXq4gE6svWdhnzmGWqj1ggtBL4HCGL32
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByZiHcLX322y8+M7MSZCQd7xyACoujrn6r/AfMwxz3M=;
 b=VbD/fYmVcWTbk9WfF0+PTa1TPXiFXldjfrmcRv/qphwc/WnAQ9KKWpNiZoTG/Cz76X0G0x5fvuOhq/ocXRAhxbNWZkmav6tIVV3FLiqZ+G6gB2Kx9/xeBtnTgGK+pGCvhJVmd8eMiItq6twguAA2pSeBR19W0YuBiku0luYM/5Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=VbD/fYmV
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v9 06/11] boot/zynqmp-firmware: new boot
 firmware
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

Just a friendly reminder.  Any updates?

> Now that the toolchain-bare-metal-buildroot has been applied, do you have any
> feedback regarding the remainder of the patch set?

> One open question I have is regarding the patches for zynqmp-firmware and
> versal-firmware.  These patches are no longer neeeded since being applied to
> release version xilinx_v2023.2.  I kept them with the idea that users may
> still be using older versions of software, so the patches enable users to
> work with versions as old as 2022.2 for zynqmp and 2023.1 for versal.

> Do you agree with keeping the patches or do you think it is better not to
> include them and to say that support begins starting with version
> xilinx_v2023.2?

What are your thoughts?

> create mode 120000 boot/zynqmp-firmware/xilinx_v2022.2/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch
> create mode 100644 boot/zynqmp-firmware/xilinx_v2023.1/0001-pmufw-misc-Makefile-specify-sequential-Makefiles.patch

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
