Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747FFC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 07:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22CF483BE3;
	Thu, 14 Dec 2023 07:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22CF483BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d949ARznF8CY; Thu, 14 Dec 2023 07:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 565B5821DE;
	Thu, 14 Dec 2023 07:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 565B5821DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 149D21BF5B5
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1180821DE
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1180821DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNk-L2PjHdw1 for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 07:57:45 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D655881AC1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 07:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D655881AC1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJg34f+FSm8DSP1n0QyHLJdTabHHG0fG/k+tKbQwhpDqamEAh7nFdRrlmAxoSpE9IZgZRC6PtuQgHL/BoQXySCWsaQWYbYw71XmMc4m4m/kO3mSstXbZu0pMs4yPrUIvMSvFEQw1SbZf5tAYWq79YzeDtF0+irjJ9vh52hPu33kJR5kclOFXheSzo10KU4v1Miyb2YRFWDMEP4z5AbzwZcIhgPxXQuUFSIJwMgoGRN1hqZRSCMj6yGba2F0EemHnqCjUjcOUoCiiHVf55kBVFCrP0HCK/YhBN/OV4OF5wh0/dakIKHeUxtHewCxPZQ1S42cEeLg2bsQjekpTZLCeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdNYw6obyX6YzLz0tYdrq3T0vutv3dYMNDPnhnWxHYE=;
 b=hUFvjzWIGKMx+uxluPnTTmCbtFtH0sRwroVZlXPvkPzL4KwYIRyleSbtF9kaj9J5AAie+7ocGhxcksF83NVtNqlxLQOCKcFtgdejbjrXy6nspC0RmLbZ4aLldTR+tzrhCeFTjCnwaM4jcy/6tLmkUaYCHpfUn0KhMsA9kwqqix6d0OtrTlDdAMWWLlSmjmbqadJ93MKwECtyKTASB5SXpjmHLF6dsTsmbgKWg5Y3NEIORALKQ7ZNHZL5OEXlNXXj/deCbPkpfL/YX+eeGyS0LWTjE2zYaUAiSohDPETOrJd4EG7J35FYrL5JRrzeDw5Z4HtepcaiVx3u98csDq26og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 07:57:39 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::cd8a:4814:157c:bbe%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 07:57:38 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
Thread-Index: AQHaJoRsxU6mz5uOtESx1TgKL/L3BLCn2nkAgACQB+CAAAw2AIAAAUMw
Date: Thu, 14 Dec 2023 07:57:37 +0000
Message-ID: <CH2PR12MB5004B52E4AD61746EBDD8A64F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231204073443.1543587-1-neal.frager@amd.com>
 <20231213232854.5242117f@windsurf>
 <CH2PR12MB5004A76EDFB561312927A1D4F08CA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231214084806.329afc53@windsurf>
In-Reply-To: <20231214084806.329afc53@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|PH7PR12MB9174:EE_
x-ms-office365-filtering-correlation-id: f1da60f0-f7a7-452f-90ec-08dbfc7a56ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LkX2MMdroBzZwDzTEyq3e3czi1TjUKIIoRVuBrBZjAu8YnGjZS3j/+19Y0EdU6lOZVXe/V2VS9hnPRLwWKK2Kjl5nrVjcZhFfJuKj2jdtlDJEb6tUzpXO1EHPCv7PyJsjfdbY2fazO0f1Vj8YcxFjd0O+7BNeqgzVXcDbiytoUyJrLyDE4OX842FEo0WiQCes5lCOr2v/mv6cdFmTeeZoRKPFUiaL5dxE0AORyo5gKLmF+mg2fHTtn5IV5VNMshlfGoFqdY4BePxkOPJCpB2nfRDUeaK2lHB47d2uJICogol9FWE9Kea7Hd+ur2bJj+0SYZBDjclE+ZR8PjmUhn/iLEeOCNWv8pW5NEivgivClaGmpTtSypk8ezLpcfNBgGgtiFIxYZbDhCF7R7PdLW0ZI/c0PBKkPRwPdeq3Ju8W6rpY35HFhsC5DxxZTvsiESOSl925tApv6YTeTcPFP6dviFlXfCfERHQ6gVTww01/5WXlQOLKAbpQRyadAHj36eUr45TeWnX+NrEPK7kuhGr/r8rtvIw6p+WHx3Q8MD7+n5MK39un1+tWnun3s+r32MsKfVIrvV88SkJWn8mvalK//oEqNKFFU2F0fLjK6KLIdc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(366004)(39860400002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(122000001)(38100700002)(71200400001)(83380400001)(33656002)(86362001)(55016003)(38070700009)(966005)(478600001)(9686003)(7696005)(6506007)(76116006)(66946007)(66556008)(6916009)(316002)(66476007)(66446008)(64756008)(54906003)(8676002)(52536014)(4326008)(8936002)(2906002)(5660300002)(41300700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IUp7aAMdAhImAE6MAqLBrehXp8fQMhOVh1SVIAvSeKH9Eif5FmXH6U0LbzJs?=
 =?us-ascii?Q?JzMQcmlr2thElTIB4YYZxftcXphft26wo8Ff2DbhUheYathRtlAWtq+IgNi3?=
 =?us-ascii?Q?C1Ku5tj4tmZKJQMZ2HPf62J3gLucmy8Th4GE0aM0pFscEqLR4fRZqWIuQ/Fk?=
 =?us-ascii?Q?CmYjnC3OXBNk/zlAvB+WQwG9nUa3rn6HazCZKP83d8juOrUWpTp2O30KueNd?=
 =?us-ascii?Q?9VjJP3bXD9TbnlZnFxQaT+/N3byf/xs3VeEoMvZRs7053AgHqgEKZLPCWmFS?=
 =?us-ascii?Q?5B1YrMMk0NUWUi93wpsjN2Mv1WsjL7os8ipFuBc8Jnxz+J075ZrJCUkmTlhh?=
 =?us-ascii?Q?kPXzLhkWQ/Tj/20pgi6aQp6VPmx3J3PPRkUkvTC6/NY0E2N9vCtzHTxODyXR?=
 =?us-ascii?Q?tVIc2rmK+4jio4opemaWCGsbUc5QtqErAg7zojCC95UHPJrQuYI36/EVkakC?=
 =?us-ascii?Q?t0hWHqawBU+csgRLLlWUsMfmX6Z18IPH7DSnMVRNBiZVRSjmOmNZLBEA4sO4?=
 =?us-ascii?Q?d52Yn8CXIHzTh+Cvk+v3hQctEbJ0ADoswVUxIYmW1WqTc+6qomfPkSfXDNIo?=
 =?us-ascii?Q?3Tnau0SuC8V14gZuYjct7x387iGlt6YhBVnCLToTmTxIZ6RlQGDaw/FnQXZv?=
 =?us-ascii?Q?NlWfx7dIksJFi3VUUIgnBY6sPaCxh2ZB9s9ro4+3K/6WRBc5D3ak8PEDTbpu?=
 =?us-ascii?Q?l/5rkAP4GNcaI5SAEGRB9XqUGS06GxfT5lm5rpyEi2TzmQNNN41yCnDCrBs4?=
 =?us-ascii?Q?JrsccNViPF9mOQpEeJERBjGTobFFNaNXJzL9c1KdJjZlc12veYZI2TT/F4ba?=
 =?us-ascii?Q?eOZu0rwx71PYZ9wMW/JW4YZL4tmUdatrgNCQT30w9ZSquBe7M6hX8dVDzbXX?=
 =?us-ascii?Q?rpNnRuCjmTwu/zH0ZiVUIKlAWfThVEdmpN0CbG7PnhRD2/ENrpdLLcCv83hE?=
 =?us-ascii?Q?nKVxG6fW4XXTeQ2auTO/C/L+LhJs5RN+m1X9F5KmFvEbHkfkBmJ9JoFYoB1q?=
 =?us-ascii?Q?QQPq5cFjIhIHHjIUcOBSWiS4ydTtJ9MCXNvXd2l/iW6VG9nKwBUdICywqHBR?=
 =?us-ascii?Q?qNeG5YjbrxS3c7T62mY79rqqZAAy6RDYVVqbeP94P2xBEK/zS5xJOKQmtwA2?=
 =?us-ascii?Q?J/kqu/lQUUodjmQNteqoYr6r9IzlIQfsDn3ZnydazaFrT1ee/VZyQBKAtAGP?=
 =?us-ascii?Q?EBttOpjXWl6CJG6w9IBS7aIsGb4VTViDeAICQZRzbXmMhi5pRNqncHe4ygax?=
 =?us-ascii?Q?wzryjLiPwbfPyDahKqndSEV2ONpJtwMBS7XUZIp0mmt+T0IrM0rdvz4HfXJ3?=
 =?us-ascii?Q?sJP/r8VSuoIGSWz3Jz9KoacrmjzHWEMALFyYakkiwivYLfDtxyJrPWtClaJe?=
 =?us-ascii?Q?oUTxYUDOtBSmug2jv1o2gbzDIxEgdqx9fiXE8jqgoPVxVnOXUAs/d2T0Crc3?=
 =?us-ascii?Q?2HWzdZP9gNoTnQKzHT5B9/DoiHJRYV7DQZsg2n4/xuOYLj9Sb8RedldZworq?=
 =?us-ascii?Q?pbsDJTUh1zvXbpQNgnQM3MT5vqG/0c7VffKQu/+GpEaY3wwIszX8SAH7ei/c?=
 =?us-ascii?Q?ejWnbJ3I31c661gNwOiiT830JCpAiG8fB4d3yKS6i4pIWDprhQhlLWnGdFwt?=
 =?us-ascii?Q?DdbcCdxtY17WW6ktJJlctbk=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1da60f0-f7a7-452f-90ec-08dbfc7a56ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 07:57:37.7103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5hcnUcU/XE6qUSu/UUnI9pl/Gblb4GMjYyyyjScRIy0Jd7T8fUGAK8lwBOzseS4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9174
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdNYw6obyX6YzLz0tYdrq3T0vutv3dYMNDPnhnWxHYE=;
 b=v+31cjr8B8M6pj3ivDNk/Aehqa8WMEdl/oNRvkJ+Gm3Rc0ADXb3kHJGLeHDxu4B4BJttgF9P31g9IlPWMcyq36+8z+zTwqX7ZluW7inPJMRoJGb1sOesg4HHIy2UnmM6xP2IM+sDW4f2xbKiSeh9w8JZXRjzso4cVTmfWzwVcM4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=v+31cjr8
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v8 01/10] package/binutils-bare-metal: new
 package
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
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> I just made a patch which removes my post install fixup with the 
> newlib configure script patch.
> 
> Below you can find a pull request to apply it to your bare-metal
> branch: https://github.com/tpetazzoni/buildroot/pull/1

> As replied to another e-mail, the newlib patch will have to be improved to make tooldir configurable, as I don't think your patch can be acceptable as-is in newlib, as it would break things for existing users.

> Also, the way your formatted the patch is not correct: you have made yourself the author of the patch, but you kept the original author of the patch as the first Signed-off-by. Golden rule: the patch author must *always* match the first Signed-off-by line.

> So here two options:

> - You want to keep the original author: he must appear as From: and
>  first Signed-off-by, you add your Signed-off-by after, to indicate
>  that you're conveying the patch

> - You want to make yourself the author because you made substantial
>  changes: you must appear as From: and first Signed-off-by, and then
>  you can put a Co-Developed-By: or something like that to credit the
>  original author.

> Best regards,

> Thomas

Thank you for sharing this.  I was not aware of this golden rule.  Could you also correct the patches in your buildroot/bare-metal branch?  I broke this golden rule with patches 1-4 of the patch set as well.  Ibai is the original author, which is why I wanted to give him credit, but I made significant changes to the original toolchain patches and I was the one submitting the patches to buildroot in the From: location.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
