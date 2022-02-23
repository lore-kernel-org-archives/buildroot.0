Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84272C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 11:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 391794014B;
	Wed, 23 Feb 2022 11:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 282e-wF_bZ-6; Wed, 23 Feb 2022 11:29:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4335E40275;
	Wed, 23 Feb 2022 11:29:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79CA11BF868
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67ECD825D3
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 11:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id go8U7Fy9VweT for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 11:29:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::622])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEF7680C1E
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:29:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0FUxPulQCTYS+GOEHpkrw2vzSw7/Cew22THLIHAkyKS32Rs3X0K0FfoBIIqOGD1jYN5+9nQdzTBSSaR4ZvZItm0LlF2tQ3hVN9IktPN3ec1Q6DI5zF8yjKvUxnUP+jDYUeVkGcqUrDnrgJAwsyzzo7GXojhOFMlLDdsUaAiATqE2uE5/cZ1mqc1jmtMWfDgKHx2bx76qsYH8cxy4tkCscNJ8jZCMmxLYQjfvkCmQ9sM4pDHWfCE0PHll+4aiVGXBxSfihIeYYhP1E2ul/LL0uGRikryAn61MINRhzB39OcQypc7t2/t4yFcPOOeOKGfq9+Rz6OFx3HSZFe7AlpbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Md08uihV+YZjFt2N+CbVzfL5ECs4eglP2YkV5p4p+dk=;
 b=Ij7uHZG6FFLTIUTVLKMM6jxcYQeUoysMuupRkDSfNt0xFMDI8Sft4w0J4LAYtD+Mn4EMU2T84325QoA/DzHn13KiOoU5TpbA6D0wlCxBK9eR6ARR+kMNHZluuiw7uuadkIEooRyHHVJRdh5MjmKQhSZ6MTlhtIZs+Ms9V0mFrbsW/ua3cXE80S5c/IYVIdSoEdOwUuPoHqkXaYqtUd9QKRri/n9UyxUE3xXon47ClV/FYXw8r3g6IbmKmjfDms/qaI6czpWTjD2l9UmTln8bPlp9VvAWqmoRGdqtfhB5mELtkTUwVWUgdYJVjMeEcExnap4oJA/nWuBTHkRPEyc3KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md08uihV+YZjFt2N+CbVzfL5ECs4eglP2YkV5p4p+dk=;
 b=fVKFgscj8xE+AcBMV2v/nHwcDoWpM16REd1F7+Ol9UhdYPcdKMkGW9GD5MQMQrmfiESdsDk4lcM4kL8YM9Q4nHtdagT0kKH3i2OxgwJaRmEYe0vQJjuNpuV+T0m/kx6U/T1WmVLFpcbKcSRR6/pLZ9R8LgVV3IbO7mOzOb1oosA=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by MWHPR02MB3295.namprd02.prod.outlook.com (2603:10b6:301:61::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 11:29:31 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::a093:eb43:28d3:b345%6]) with mapi id 15.20.5017.023; Wed, 23 Feb 2022
 11:29:30 +0000
From: Neal Frager <nealf@xilinx.com>
To: Peter Korsgaard <peter@korsgaard.com>
Thread-Topic: [PATCH v6 1/2] configs/zynqmp_zcu106: bump ATF/U-Boot/Linux to
 Xilinx 2022
Thread-Index: AQHYH1Xayzc2KIF7FkeZID31n2sKs6yP7iL0gBEM1XGAAA54UIAABDMsgAAEb+A=
Date: Wed, 23 Feb 2022 11:29:30 +0000
Message-ID: <SJ0PR02MB7758D0AFCF4B57C0551537D0D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
 <87pmnsnquv.fsf@dell.be.48ers.dk> <87sfs96gqj.fsf@dell.be.48ers.dk>
 <PH0PR02MB775035975B305CECD5D842F3D73C9@PH0PR02MB7750.namprd02.prod.outlook.com>
 <87k0dl6dn7.fsf@dell.be.48ers.dk>
In-Reply-To: <87k0dl6dn7.fsf@dell.be.48ers.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1af0c962-7696-4288-f033-08d9f6bfc256
x-ms-traffictypediagnostic: MWHPR02MB3295:EE_
x-microsoft-antispam-prvs: <MWHPR02MB329590B872F2D53B6B1AB539D73C9@MWHPR02MB3295.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NIeTgo3iibzALvuJgMyhsNAnROzcjSTSb4IJWP+hI5qnGQbDdlVs4gatn7tWXr4c+B+GjUj9bnK9xw/dXB/UEc6MwolnauWpr1PBCHLAwblCUd4m/Phm9BdCMT1mVCBMxER2EqTfsSvdAxKpypFToWL4OL5iF/mys2KJiz3u4NsxlXPESDy2TLDvhy1czrkBhosSldpAYXZglhialpM/FVkerHnOvMzNb0mf+LJ9I7g0CXDaVqGlXPSvvCawZBvgc7yjvPJzcYDbiElZf4pLbTp/TAW3Odb9U3TsQT3Fwxv8yTU/y4vpznJAZGGtpEff6i/iyawdlSclVVK2484JWDfPlxFKRkJ24fDAQQAlDOrxhvbQdWKCr+4UBtcQaSTTpL1pEPHBnSebHIFxvkDRyM5ubMhi+ZHYpIt0J8wLkYTdREkTnxsqrWZRwpZZ8OiToibyr5xzITu+/ZNQbYg2EDfyVXDelfZfegEHYo6TNtccW3tJHRn7xagi7im5DbUlpofrAZgX2AN5GtnkC0BhItP3QIXPwZtKJtnzJJHNix/me/7PgVmsN2/LXSnou7fsfGW2jUx11sEL8Q3QHJeUKtFwJ5vWrKC39A+qOn+T/BtLKUksT2olbYU8BOmENlAV21JmpHbGJ+1uVk5oWJSOZX4MkXyda7r+X++xgfczo3s3vS43WU3w9wFjyaFTjYzhxTHuB3Q3O4670cUlahTJ6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(5660300002)(52536014)(4744005)(8936002)(33656002)(122000001)(71200400001)(86362001)(26005)(9686003)(186003)(4326008)(8676002)(76116006)(55016003)(6916009)(66946007)(38100700002)(54906003)(38070700005)(6506007)(316002)(66476007)(66446008)(7696005)(2906002)(64756008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sNJWke5eNl7dFNQhcLvLLKO+7G5GPSCm1MJEQnPozYdQu0UxUuuA6xqc0JnJ?=
 =?us-ascii?Q?HTR4Ksd9WxzB0sW3vbVNlyriSI1YBiov23B64iTXLkzqWDJitbuy7pwLlN8E?=
 =?us-ascii?Q?TjH8gNvTzzgx1fT1RN4T28uMI3OfCHQHt2VJdJ1XHMdaxnWFECtDqE0v/lA2?=
 =?us-ascii?Q?BN6srOu3FQbkV5/62DTv522HY72fB7DbqnuyeZrq6J4WLW8GAFOLFZ9lR1S0?=
 =?us-ascii?Q?5JOyr96/1aH4Q9/8uBSFYMiae2aceKZ/TELa5nh4HvQBLsH/YfIFTMv/li0p?=
 =?us-ascii?Q?dJRHylCVd3XNLU1LKevA0y17VQRO8TbMaVZCmR0qcqqSrWYxNtYZgYjrn6dO?=
 =?us-ascii?Q?1NrrxFBP7BZgaJ1wD0BDOOI6uYRt3MhnVI/4UMLM4NHPUB+4be1IQjxcQx79?=
 =?us-ascii?Q?gR6uj0zbue7ccVXsIXYghvG9hWxO3uvM574v27jeg7Its1C77U7au19jcunM?=
 =?us-ascii?Q?2js+4/tgfaXSep8CtE2b3PXfOCRZuPkG+lTZ3fAX8jdoebuA0uzWlbu8Fkht?=
 =?us-ascii?Q?oYryT/3Q5G8GI3iT2rQ0UjpQMSHkMXuUrcsgbo39FW3PJnwKHLMOE9zpzVyJ?=
 =?us-ascii?Q?bAcpNslguINDjmZb9TWimhNr3Zom0QdATPLhDA71xwdsaKgRo+lz5Cc5+fqe?=
 =?us-ascii?Q?N+PvpoBMgfuf77ep+FQm0fh0Iu+gTd4tOT9IfiCKweu5iXYHpDNOmEMfjfnN?=
 =?us-ascii?Q?JfuF4Wiel7AMEWufUpAPWkwTLovU0yXYD/SAnpgIR9D9I42vRKKcPpSu0maK?=
 =?us-ascii?Q?0r/N6C3pR/WLPxRwxvCgYcAo9oRPhkOMq7Fmicpzn192i7gRd7hsSr3TFGZZ?=
 =?us-ascii?Q?Ey5tqMBpybX9S294159S0MyT3SNrLH6X9yflBx1kAS86v4CCD2iyJ0sMTmFi?=
 =?us-ascii?Q?Vuo3685tvrwGgGZ6+91rjVJyOhEX3ivhTjiaDopX/i4LCt3cKJua8yreInVf?=
 =?us-ascii?Q?0serbssXGUqcCBCJ0Coq+ZYTWwpdH2CHN1hoQ1pgEp51tkoNQC2PsWdQ6CLa?=
 =?us-ascii?Q?exjxtnMMpaS1K9tQyJNi7S26lY2DZvI1DkuS92PBWxLB2jXeR9/ej31D8nb7?=
 =?us-ascii?Q?RczEyZO6WyEV+VNCMVN1MdQBfHlWYskq7cxgcIy/mS5vMS/bNYB+H1WXZXzE?=
 =?us-ascii?Q?g5k98hHKV++QooM8D/IaTyfUf66UqjpsSc/SUuHbuA2B8hNsHqbayYJJe4aN?=
 =?us-ascii?Q?RNlfkhDboEoH7JUulNg4cey8lhEnB3nsf+JDiJzo2ygkW5EXBwLz6GffKF7+?=
 =?us-ascii?Q?T6O9wOgZq4ohS/2gMD5EdUDsBC/g+JEEG0x36dSd3Y+3Ln3I5RAhM/2MjzDj?=
 =?us-ascii?Q?EiDkrwR1rXjEDuH8hI9Pr7b+Xd1PHUoWSRwEevIdN6P4XM6YeLMSBWZxiJ0Z?=
 =?us-ascii?Q?BwwmIU0d03KDMkYISIFan/n+xzaj9q+k4tqNwORcvFBz2GjtNcSOHC60Hzet?=
 =?us-ascii?Q?m/QtDqDbaBy62Uo67+S2v7UmWivfvZ7PYinfZNrk6lKSaYN/xMJAJzE1a13+?=
 =?us-ascii?Q?hY/T5n90KOOuog505jivWLnbT97btu2yUYnDghvscggd6kDhohYiIaWsABPJ?=
 =?us-ascii?Q?c9K8gLOe6wy072g/dKWaW7fwQyCpTIUjJR1RNj0DyaeUuFvDINllXynLgCok?=
 =?us-ascii?Q?9w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1af0c962-7696-4288-f033-08d9f6bfc256
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 11:29:30.8674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wW/cQ5ypEr11C8Llr5nUbKl/39L7ASKaBP8D6nc9W3d9/VOewVzUPU05tTsIgl24y87V71b8hjRn+WNYeXgW/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3295
Subject: Re: [Buildroot] [PATCH v6 1/2] configs/zynqmp_zcu106: bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

> Instead of working with an environment variable, I think it would be nicer to tweak the zynqmp_virt_defconfig file with a configuration fragment with the

> CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"

> Line.

> This can be done with the BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES option.

Yes, this looks like a better solution.  I will create a uboot-fragment.config file for each board in my follow up patch.  Thanks for the idea!

Best regards,
Neal Frager
Xilinx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
