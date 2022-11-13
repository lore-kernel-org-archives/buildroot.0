Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F76C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 18:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC0C480C1E;
	Sun, 13 Nov 2022 18:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC0C480C1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TwzA0j-6Qbjc; Sun, 13 Nov 2022 18:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4348980C01;
	Sun, 13 Nov 2022 18:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4348980C01
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5A171BF37E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 18:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80B8380C01
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 18:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80B8380C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPQ61cgEHe9Y for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 18:53:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 465DC80BAD
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::622])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 465DC80BAD
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 18:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1qYQ2f/LqR4Olre3qepC9Ch0b0aItsgWf9GPi3lSaaFoMFlWcBTROHHTtGq0Iz+bMx3iQGS9vIf90eg1wqEOe/wuO5JeGXMXiY4PCOtaPle++BfedZteQimD0UIMD6U+taQQBFU7fF5KZiQnYRF3F+HKkMiAioI7PGrhj5SXM2b4HCmEPUeSKIs6h/1/NYGPd+CNEZUSOwVMnIVwTdTNcb14X0rXOEW4GMD/O+gvGnhwN9l3STBRUT/Ofe6qiwg+AXuHtxdrNVA4lw0rCALGg8MvHjHGAxz65hBsfadODVCOXmNHsrWENnm5ycLFSjYhnPfBo5/yXT4WmsYIddgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqxI7BJbF0DdentWFLyRc/205NmK5etrHfp/i8cNidw=;
 b=jj+ORvvZy6fMk7w39sRBBMO7T/a7uFmXy3aPJeEFJSFBypAk+O8Kk2mPeJUNgk9lHLcAjFWsdEyCotxiXjpt3E3hB6673Cw7w2hDA9c+Dy1C6lhxLByBOa/WB1pDQc0kqYypStAmn01SxKYC/1HkBMEclyEAW/aF7QP6K2/PQj5pKM817/ZTcCDyCrVnNU/SPIqsELsilznooIY7QXd/gW9nVDKKvynicrH0OcFxMZrnf8mDPUJyaMtL8NUcbaw+1Iiu4xAgXK+CxcRNX0AA7c/Ct4hdgAbSnI1k0PFOv6nvSO0mD7acpMHNVSwUUPfkZxMZMlW1fEqc1PJxaofFRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Sun, 13 Nov
 2022 18:53:32 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::1a65:97e7:c0ee:f986%5]) with mapi id 15.20.5813.016; Sun, 13 Nov 2022
 18:53:30 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [git commit] add configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHY9g5Pz/8KQxO0J0OZ94r1tSRSgK467M3vgAH/9YCAAEjEAA==
Date: Sun, 13 Nov 2022 18:53:30 +0000
Message-ID: <CH2PR12MB50042F8E342C170AA24F1E14F0029@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220506191229.6154E85C61@busybox.osuosl.org>
 <20221111214345.419477ef@windsurf>
 <0C68589E-3CD4-45B3-9664-016BB50D510B@amd.com>
 <20221113153011.38f22043@windsurf>
In-Reply-To: <20221113153011.38f22043@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN0PR12MB5834:EE_
x-ms-office365-filtering-correlation-id: e5795840-f280-465e-f6b2-08dac5a85b9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wrj+dnT2AsFbS0sShLcCuodB3naGZPsJUBbGMIzdbHGrALBPAMnYbT7dRcs6RtFBkccTgBP/27xhv2nDCmKNuK5dAAeB11oG35Bm/66vn7+OsiIn2Y79ZRWiVN1V1V2KC1iy6DKux3UzXOHAz2UmztpHcMVR8OIsBC/8jkGbBIE4VgUWz3nkwhElQE8LjDNK84uMGHAi+yxVaMjJc+wDhvIe1INnug8An2hkb0Lxc4ttlSjmNQ9DAkRoFAPS8oPbItabuNp1bEootD9kjpV6h+N8HyCUXfLw/QlTpUAN3MiLtd2h3129HzRPmE2EfovCcBVazgmzjqJJH0jRgXuW2xQ2Nqz/BABBkGzHPLfcEy4AQzh+SSLrKTVQ6fYjiLTk5bvKIioZdDXJiukCzW9enxjm9bDLqbs/nFRHbChRi7T70hUplP2Bos012+YtA3tzGdJmHX4OiJPKsLsAu2JDVuo7/Hr8Wcgm3DHIpfKHEOOWnA1qwGYjmc1Fqt4E+1/H3CeTxRrCHPiLatGuNC1pdjXZh/L7kBSvLgPXzLgz/QVrh61Pjnp9Nyq3NvM+X9vxch0Vfce/9CsXjY7pt54AHrHoSUygWXyrX3nvTHWlkTdrXIt7Kf/Sf7t958Kj4yzN7ut+Yp1PUiuUWVJB5r2ON5hqQHLN8XYwA26qV8YRzniW8ZNi5PpuEAaVngIAac22+gLQ1sHDLPBMAPG1fAS6SJGjly27IPNoZQVyy516RRmw828wccwOFXfXHygMU6DJXNeXED8s0U6JNRTz/jcN7kBuvviKn+A7ToCBAKmwv6c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199015)(2906002)(52536014)(76116006)(66946007)(66476007)(66556008)(4744005)(8936002)(5660300002)(64756008)(4326008)(66446008)(41300700001)(8676002)(478600001)(6506007)(7696005)(71200400001)(55016003)(966005)(9686003)(83380400001)(26005)(6916009)(186003)(316002)(33656002)(122000001)(38100700002)(38070700005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eUX+fEMFlHjyzQgnn3dYplBHt9f/W2g866JgBCzLxpQWtuOy9RR3124qbhr3?=
 =?us-ascii?Q?cDUuoumYutOazwaZzEj6hCDW8ngVOLJ/NRdXMyqbLJiX2fONGQm/T+CNcOFh?=
 =?us-ascii?Q?jJu3x0TGHS3TZMo/g/Anh7nMAjAyq0+i0z78SaVo1PMSc1cpURhDgE3zk+gb?=
 =?us-ascii?Q?lLm9BnlWpKqKBIL4793u0aFsNaHRd9XslJx6X0SbFP83RbYdzzzwG3RPkBDQ?=
 =?us-ascii?Q?vNOOIb5yKyBgH/RhlOyefuAdS5GAnnSFZsERg+IHcm6QWRW0tsZmwlAaGlYj?=
 =?us-ascii?Q?luD1clGeDZ0K3rETSWbO91d9p8zxTLyguhQn+e5JFNsFDZfzapBE8q3yXBn+?=
 =?us-ascii?Q?ao2YOUF+yHFKPX+p3BmJd41Y15uaSQifvcbFnBuIbr/Y1uTybd70+R1p3fWB?=
 =?us-ascii?Q?GUI+EJIDQGNqPNjYxzYAriTzkV8DRYLVq9MLLCOxMPVqi0XeA7RARPPwoWoY?=
 =?us-ascii?Q?tT6jMMrnalpOZ8C8F3Bx8xkoTPgNIUZHNDYmBS9oMvaFhJkNunkjfSEt4GRz?=
 =?us-ascii?Q?6wF/YDesuNWVqSkzIeOZNFERYTY9zY37vQD1yz7RW/pr+sKSlY1KlrroxRDE?=
 =?us-ascii?Q?DYRlohRQy0GPK84MGdR/uYLiMLSLYUoEYcs0pliybDcWPfghrKotZKTL9ch1?=
 =?us-ascii?Q?wFqspA+Pw/58hxox/05mgfC9Z6Tpr61GhNE1tL68jF4ssmlYiDuqkddkPmql?=
 =?us-ascii?Q?Nw34Th+zReEkt6E9VK7pOEAPlxok5PsSbxgOZWdYx6f/6inkp63AmqZ5wAXS?=
 =?us-ascii?Q?7RuqxnQIP/kLpBjKuo6ryCixMF85EVKTtaO9a17Z1HIQxhC4YD4raoWUBQrb?=
 =?us-ascii?Q?AKgt9p1APuuQODJGPBmMrAXF8AOIMEYYbpBfPo1sUY6dP752ZriCdqRueUyE?=
 =?us-ascii?Q?cEZTpIGOpB3UxJrDUHTds9XYKWgWO7BjCXX7AnuAX2w7CGQwWdOF+4YZL8rZ?=
 =?us-ascii?Q?OWbu3+eJsLWp1T3+b+tJTyGGo+hTQn2MvD2PtA3G10QbanQhXLgMcbfUtLbm?=
 =?us-ascii?Q?DGKRTIUBCdYGSOuwMAw8vmvP965v7dbfpRyMIuZ0WAcvanxR480qJPiDrymF?=
 =?us-ascii?Q?7CO4yk+rlkvqygwsBttLvb3wOgSld++FIHywcNcaZBwNp3QHtJtvb/v7Z/8D?=
 =?us-ascii?Q?pLTflSbiDIbuIAnqZAyxubBmIXrb0goYAZ6gg1zjMLoYj7vUVXLfNuYG2qXk?=
 =?us-ascii?Q?5MsAMQXT/L45ZG31BeApSLeFJb+Z5uwo4K80fhoFmAyM1qvH7ABHQN9GJkYb?=
 =?us-ascii?Q?POB5HczDa0CJx9F4ZXfWlyh2+LZr21PJTD8ZC+ASbAIqm1Pc+cehzb7OsWkv?=
 =?us-ascii?Q?z7X31PIcd50gI8tEoOqhs2iS5YYhC2AO/Tj1fXwEvGEij4kVLtDOtE0fi9zy?=
 =?us-ascii?Q?mVw0LAckCYhLzAeHjqpuz7TKtRLQZAF/Y72oMeKVvtxuN0GrenoHd+xoyMod?=
 =?us-ascii?Q?Y000k8nhbzYLdxSrxc7ubw8UYJpvSXTHl+H37f4ZhgyPBI6LCl7YHkD1NFL/?=
 =?us-ascii?Q?fxQFGEiX4/YJX4KWpomAASsbe4HuZlY9GQKOKsFCY4VgohsTOIDFECm9HQo3?=
 =?us-ascii?Q?8pH/Tc6Ifo032CzWpTM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5795840-f280-465e-f6b2-08dac5a85b9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2022 18:53:30.8512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: voSULjCPXhhofMKzmNqLyySaHKms9DVgxMY5PDVkbP/EisWGp8VKyFyeNVp28S1v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqxI7BJbF0DdentWFLyRc/205NmK5etrHfp/i8cNidw=;
 b=lYf35NrIcvxPrp2pPblmb6gom/ucTMv1JvAzqeQyx2jc1ZSXUiAZ+twIFpE8hmfpas2lBxGLGZtYECZnt722jErCES9SS/Xhg/5FbOIsCiGTsBG0N1Yej/lxv9c/PbAR9RRr1DprBT9UIBXHfX7NajeO2miXotEV4fBtLqBzWsE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lYf35NrI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [git commit] add configs/zynqmp_kria_kv260_defconfig
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> If not solved by then, I can look at it when I am back on Monday.

> No worries, it can wait until Monday, for sure!

I am not sure why the build is currently failing because if you run 'make u-boot-reconfigure' immediately after the failure, it succeeds.

In any case, the CONFIG_MULTI_DTB_FIT option is not necessary since there is the post-build kv260.sh script which builds the correct u-boot.itb.

If you apply the patch below, the zynqmp_kria_kv260_defconfig should build properly now without any failures.
https://patchwork.ozlabs.org/project/buildroot/patch/20221113184933.47232-1-neal.frager@amd.com/

Please let me know if you still see build issues after applying this patch.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
