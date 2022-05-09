Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66ECC433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 11:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC174151E;
	Mon,  9 May 2022 11:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gcHBFDMPU0wQ; Mon,  9 May 2022 11:01:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA10C41496;
	Mon,  9 May 2022 11:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3A341BF3A7
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 11:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B02A7400C1
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 11:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGYqJl2h34Vi for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 11:00:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::626])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 075D3400A6
 for <buildroot@buildroot.org>; Mon,  9 May 2022 11:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lm8heeF9d0+IJFXsxOZ/mXZzvP3I9ONEUwVWVUspmrPuMTHaIOsXN0LChp1gjU608OokC76vEHM0e668rKZLMDaf5f8VmMi3ooW9FRVIwLsnmy680ZQaaqkNy+kmjec+f/9j5HeBSv9e3+4ZLOt7rwVv3mA5iqiJa7JzK7jcMS0qUPqmIKQhWTb+N4Idukrvor7P0GKy2dgN/upOtg/d+1fIfW2lZfeYGfCwGbgK7zEGV3QmYFeF5FT+HmFDThHytvwo4VQ5MSy1DxgqElpq/BESxEfMcoE858gEkIFNIkXRi5OLTkFhMsDb+bD2fqpdJuc+2AShdI+WOc32al2t8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6P5KpOB/6gjLFAgttvlIKn7yudbtx+AOAAhBbJ0uJIc=;
 b=Dq9KLBaYdxbEecrXxzPR1SGfQK51hEb4RZvuLAr936jnBlv9mMfI9ZxBbPAVR9VUfv9urBFqBWemWdD1LimOImXiXt2OqR7WDK3ACq1VgqqaWTnwhpNX+D7Ql1izeuWBzODAC6CuCR1Nsl0XY3PIixDotbZ+EpGvXpVdGoUULi322r5YMgDUAp5Fb4/Bq6OKZ58UT5DDY4qvDn3Xn5PSDN3FjhjXbcgpIenmjn5s/epO+uTAFGmiipNqbyMnQ+awT/p3IryXROOXvRMsrqfup9tj+uoywO+oCo9sbqSbXkicovh45OoJOAlOardle+tCbaRLzHbizy7w4oSLupBoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P5KpOB/6gjLFAgttvlIKn7yudbtx+AOAAhBbJ0uJIc=;
 b=QU0MzS5qnBcinxyC5ZFTiXcz6dsZwlgfDXatQDRsywROdXcIDUJCkhCO9BX6ggd4TKLdVEiowgZKLW1fZexCRo0uUmIKYVd5FozLdmfQahainx/qLBVBPOI2M+IeAmm8/XKfwAi9Jb4y9dwntEWCOmG1unKvSy5ls6PHgUcWW2g=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by BYAPR02MB5862.namprd02.prod.outlook.com (2603:10b6:a03:11b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 11:00:52 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 11:00:52 +0000
From: Neal Frager <nealf@xilinx.com>
To: Wesley Revens <wesley@sonifex.co.uk>, Michal Simek <michals@xilinx.com>,
 Neal Frager <neal.frager@amd.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
Thread-Index: AQHYYJhu5wIi+XoP/0SfaUcCKPdJpa0RtJ0AgAADXACABF8KsIAAFGeAgAAdwwCAAAFaIIAAGo8AgAABPJA=
Date: Mon, 9 May 2022 11:00:52 +0000
Message-ID: <SJ0PR02MB7758243996DD3EB0BE94D176D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <77b0f29f-7df7-36f4-9b49-5212fd46c5af@sonifex.co.uk>
 <51fb4a8c-cd8c-9db0-76e4-5461e72871f8@xilinx.com>
 <SJ0PR02MB7758503615E7EA06416E482CD7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <dd608132-245a-32b7-7d27-f267c1524fee@xilinx.com>
 <74b54843-fd4a-4f93-6f8f-3f3110ab0548@sonifex.co.uk>
 <SJ0PR02MB7758B1B096451C45B9489053D7C69@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <f4f5acff-c577-b7cd-c708-4415c2a08b4c@sonifex.co.uk>
In-Reply-To: <f4f5acff-c577-b7cd-c708-4415c2a08b4c@sonifex.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cb541be-9dbd-42bb-1c50-08da31ab2eed
x-ms-traffictypediagnostic: BYAPR02MB5862:EE_
x-microsoft-antispam-prvs: <BYAPR02MB586246C421F214F0336FBE96D7C69@BYAPR02MB5862.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n33Rw0sI83Yu7teRf/aCVGc8hTNZGOmXripjVUTqmhG6bLwBiI4/T5PeeN5GBZjM0xt97PAdCpb+z//MC9oZS7cwiNIxkZIHbdMU+9dGN9TczX0qF91oGEejaFljNtx0amdX6qYHoLDgg2dTh/mBHWqB9mIGCJfKBANwuSwgPRBN+eMIOOuHgqqB89g/Ka7e4zKyWpKJS2/SEhWczqfrs3u5M+xpVxXmFX3XxuT3X8sptjWY08JQ3z3Q9AMhRKMlwSQzjMErC0in5xdjHz6OnuAbkb3v2cwIvv5+bonDTp+VYHOvSnbT++MKv+BKGUQBpln1clkdmq0HarIIRKlkWJrj+S1P/qF7VvB97edsNwqc9EPyJRUuMpqwrN+qa5AG5Bg2UykkOa3f4juTTWZOAjbXrR0ggXjQzSO0wCAkIuch9Py+gmcoCP6Hw+Sqzsbm26KDuOU1Szht9cRbVBCZe6vmZOMYV4GuAwlkI7adcHYyN59AzeJlLm4nOUw9u5+2HxVgaZOxfC8Sc5K9lWYagjyo26AnCm7UCDAUqsdZmbrsxQt8AiGfMIO7an8PEUKYRAzfgA+Xnm2CdBWB7tGHMlv4mQTTEJmNDFNx2rbPobDdz0oAoBZ7FZxFLP6CcAo+EceppJXgDsfGm87sk84UheyviG0jueByc8U64PQ27gm04C66z2zcvldO2fcgTio5PCJh6hVD0/Xj0b3nZjJk5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6506007)(52536014)(7696005)(8936002)(33656002)(71200400001)(2906002)(508600001)(5660300002)(4744005)(38100700002)(122000001)(9686003)(38070700005)(186003)(54906003)(66946007)(66476007)(316002)(66556008)(76116006)(110136005)(66446008)(8676002)(4326008)(64756008)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEM1aTN1UjR1NnZvdGVKakZqWXZNMlp4NzdxQ2tBcU41eTQ5d2tFNENEaGps?=
 =?utf-8?B?MHZQaXR6QVJMTEZvSHZEMDRwNEEzRHFPaERIOGVXdDBLUDdGeVNiR1FpZ0p3?=
 =?utf-8?B?YnI3QUdaaEpoZWFZVDVSQ1B5RzNVNDBGUHh3VTF2SmhNQzVxUjNoMm5WMktJ?=
 =?utf-8?B?bFdJUDI0ZmQwTUl6QVo0S09xR043WlBHTTM5VGFHVkRaK2piRFkwVklldlNO?=
 =?utf-8?B?VUZCZGVYTjhPTHUzYkJ5RisyL2E1UGVqUzM1L2JiQWVXeWpXckxvMHBTMHQ4?=
 =?utf-8?B?c2xsSkg3eGpwV1pIZ0VyejhaQWY1MGMxSW81N2NUWHhjZVFqMFFndXQ0OGFV?=
 =?utf-8?B?NWR1a2ljT0t4MFJyMmxPODRkRGpEMzVQUHpjVXR5dG50Q2tLS05jOFhUcDlx?=
 =?utf-8?B?NWFVMUp3QlRlNU81TWViYXRPWG5wTU5IbFo0TXUrWW5vTGZZa0FJYTExSGNQ?=
 =?utf-8?B?Mjgva1h4QThQb1VVMkFtTitKQ3Z6dUNBSXd5aFcyMWc4aTljSFhCS2YrTFJH?=
 =?utf-8?B?SzFYL3paRTVjZVlZb1huZHVNTnNXUjkvS2ZCNkpRNEZPL1Z5OUp4M3VUSmVh?=
 =?utf-8?B?R1dZempkMWVCcGNoWTlmYVc5aUZITER2NG9OZzFXUUxpNW9mMy9od1M5SGpD?=
 =?utf-8?B?VFNrbkFNTWt4T3ZRVWVENVVPVHp2RFA5K3F2cGN6OGd3OW5pd2ZvcTF1QlA1?=
 =?utf-8?B?ejNsV3UyNGZ3a3BMUWt5K2VZYXdMaVByK1lsQ1dLcE1RaGNpbmJHekNMU3B3?=
 =?utf-8?B?bk1tU2dETEt3czh1cThsSUpRakN3eURBR01lU1VzTFQxaEF6Q1pucUhFRUpX?=
 =?utf-8?B?V210Zkx4SjF4K0pILzMwV0NMcDZKQjJaeU4vOHlMc3JyTUFuNXJxVXdVd0g2?=
 =?utf-8?B?MjduQ1lQTEp6SGVSVnhiR2FFQnl0ZnJCNEdJREJsZ3BhY2dYUmRrTjlPTkx2?=
 =?utf-8?B?MklOVTh4c0pYRlJ2a0M4Z0c1a0pSS3ZqOHdCeHBoN0xWU3ZwWkNJd05naVRM?=
 =?utf-8?B?Mjg0dnNOUWxPMVpTY2V1cllWMVJzLzF0cncvOXUxVkRyaWRaelhnWHNNM0VP?=
 =?utf-8?B?YXV6a0RLZG5IZDZVZTFNdEt2OXNja0dQQ05JNytzS2NSM2xjTkJpZldnd3Nr?=
 =?utf-8?B?aWVTS2NJMnZ4ZmprcUdtUXcvUnA3ZWQreldQWitqRWdpS0ZSRTdtZjlCTGo1?=
 =?utf-8?B?OWNLKzZrMWQ0cVlGcEd2eVRPVnBCWXNDUTJSbXNVYnBJMkc4VTNyZDdGSi9n?=
 =?utf-8?B?SERBdEQzY21JOU1UcUVxNGRRc3JDYWxrVE5lRmYzVFo0SnRLRzJ0N09qSmVH?=
 =?utf-8?B?TTY4SklRdk1wcFRNVFdOV2o5OGk3ODRSblBuRi9vcWM3RlV2eE5JRC9LOEZa?=
 =?utf-8?B?dTRTQkVWc2dkY044QVhIVVJZRFEwOGEvT05EYkhwUlBhR2JZKzMySUM1VzZt?=
 =?utf-8?B?dnMvM3VyeG96MUxNVEZUQXRNYVlFVWNsbWJvdGZsN0RKYWpWRWhVbC9UQ0RF?=
 =?utf-8?B?YytmMzFCaDYrSlR0bGFkcWgxWFkyL2QzbGtwZFhUSzFlRGxKTS9jcmYycEEw?=
 =?utf-8?B?ZysyYy8zRlYxbUI0ZWQzVGVjbEdkbmk2NEVUeTZ2dE1sSUZUNCtjV0k3aGxq?=
 =?utf-8?B?clhDdUxEejVoT2J5NnROTXRDMTcyeDdCeXZqN05od3FhMmF5UFRzcnNsV1Jk?=
 =?utf-8?B?ejArSjl4UlZoejAycG91cXZqZ0F0aWplVEdUYUI3Qk1rSXQya3JWdlNQeGs2?=
 =?utf-8?B?TXRrMTZoMk1SeXFPdW9Oc1hXc1JxYWplOXVLS2RZSGFkNEZ0R21tSXJxSWtY?=
 =?utf-8?B?Y2xLL3lqbHVSYzBVQXd6VC9ZcEZkZVN3aVZta0hab0NBbzZGa2dmMWVYcEdm?=
 =?utf-8?B?TFUza3M1QUh3U1NtQWo1OE5qeHlxV1JXSENRM1h5bzlnUEJ2cWhLN2FCWUdx?=
 =?utf-8?B?YzNYajBBRUJRUmpjeGpSYmwzZlpYT0tRZGdBakgrTVZzMDlONGRUZElvaEV0?=
 =?utf-8?B?UHdLOHVKZmVYWWpRblhpWi9EOU9QSzVWOUF1c2Ryc3hQYnkzWmFRQnBXU1pB?=
 =?utf-8?B?QmZKMzMrQkVoUHZqdmRWK2VVd1YyampmM2NPT1dxSDJEMTdHL3hnR3VyNllJ?=
 =?utf-8?B?OVdIY0VmQTRMVktMSkN1Y2VWaWJOWWR3Q0tZNVlZUE9IdWJsYllJOFR6RFNh?=
 =?utf-8?B?TmlBbno1b3djUmFMTjBFSjJFS1hqMzAya3hVUUE3VnJuRlYrQlh3dmd5azR4?=
 =?utf-8?B?WGN5YVVEWnBydng3bllPNFBZdHdqSFhBWndzSjlxR2NqazE4RUNUQ3RDaFUr?=
 =?utf-8?B?MlhQTWZZTm1wZ2c3dEZlejBxNnhKcllMTjl6QXk3bTdxLzFRa0VZMFllQzJM?=
 =?utf-8?Q?LaRQWmzG59ZvuFD54ru8QAh7pq+x+cuMEhiDW?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb541be-9dbd-42bb-1c50-08da31ab2eed
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 11:00:52.2493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9J7Z4UvAuEey4F8ppRVLoo8JfelghXYFlXl82Nir72qDcR+NJU3lvS0zVZsaiWbjtYnY1D9A35ZmqS0FuqFjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5862
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
 <giulio.benetti@benettiengineering.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Wesley,

> I initially tried using pmufw from the xilinx-k26-starterkit-2021.1 petalinux BSP but that failed. So I tried the pmufw from the 2022.1 BSP instead and have now made some more progress.

> My board is booting to a u-boot prompt now but not continuing into Linux from the SD card.

Have you added the following to your board/zynqmp/kria/kv260/uboot.fragment as recommended by Michal?

CONFIG_DEFAULT_DEVICE_TREE="zynqmp-smk-k26-revA"
CONFIG_SYS_SPI_U_BOOT_OFFS=0xF80000
CONFIG_DTB_RESELECT=y
CONFIG_MULTI_DTB_FIT=y
CONFIG_ENV_IS_NOWHERE=y
CONFIG_DMA=y
CONFIG_XILINX_DPDMA=y
CONFIG_PHY=y
CONFIG_PHY_XILINX_ZYNQMP=y
CONFIG_PINCTRL=y
CONFIG_PINCONF=y
CONFIG_POWER_DOMAIN=y
CONFIG_ZYNQMP_POWER_DOMAIN=y
CONFIG_DM_RESET=y
CONFIG_RESET_ZYNQMP=y
CONFIG_VIDEO_ZYNQMP_DPSUB=y

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
