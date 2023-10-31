Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9E7C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 13:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A9242C3E;
	Tue, 31 Oct 2023 13:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26A9242C3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0oBLuXEmFZk; Tue, 31 Oct 2023 13:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4784E42C3A;
	Tue, 31 Oct 2023 13:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4784E42C3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16B761BF2F8
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 13:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E394342C2A
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 13:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E394342C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVACr5tIzKMS for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 13:30:21 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41E5442C3A
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 13:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41E5442C3A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV5x/hZcjLoLxjrLFK22McygtL0bht3zBBGBXt57/jKE8x4FPrs2Oh7we3BWDgS3wVwNrnvXJkA46v4gHVPQ5HW20ArfMF4RA+jp6VRuiteu97FxcWeWel+nPhZ7bDjMGjaFluFaeKrvwaUlwzkIrfnHG5wFiswIx+R7x0zjbWfIzScLu8QWCZoY2q7Ph1Rp5wUI/G9KAwxwYiYbFVFZ1nDnBQ2d0mnfT9X09cu3iNcR1bj7g3n5D+e9pmXfAjf3RL9huosO7HSE/53DX5ZTaW8SksDbm9sv84zQwYLNmEWj2EUJ7b0twr7PIAMLyrI1CS1x4CDQn5s8nKtP/moKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbDlTsJGqpv0N5BRYTLzJhxuLVP+RsJVKevkZvhYw+Y=;
 b=OzYcfS1pQOilGAsgy2WRdE2gH6n7JfWfS5T968wqIjCLXbN6wHTbfZFHBjhuxjCtQ63wHTx6kEGfX1BH9uogLUbCDGNaTHLP6hBbQEVFCeEhFJYC8ZzPgESuJ4dbiJYcknK5AxmqNUmQKhIeOHXgogYnZB7LaEsYaDncwhv3Ak/a/l1nzcKu3Oie3Jtx/9vYAgv5+VHTUHFzDs4ZDbn3vG6rzmQKNygOW0XwoCjyq7sn0jK3HtQSmrwAHTx5DgHqJYInlV2cB2gUgcWCcUCFBbFZRABNAxYfHWTXJoX1yYVUmMHLpiFZSuQd7cX+Kvb261RqZIfciW11qkdOGuzLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by CH0PR12MB5314.namprd12.prod.outlook.com (2603:10b6:610:d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Tue, 31 Oct
 2023 13:30:15 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::a507:b06b:e64b:4c50%4]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 13:30:15 +0000
To: "Simek, Michal" <michal.simek@amd.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH v2 1/1] configs/zynq_zc702_defconfig: new defconfig
Thread-Index: AQHaAbQ3Mm25p1p3fUKYJaXPsu9PIbBj0tQAgAAE7hCAABHzgIAABHuAgAAH5PA=
Date: Tue, 31 Oct 2023 13:30:15 +0000
Message-ID: <CH2PR12MB5004A3E0B5725A32D422E945F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20231018111357.2898095-1-neal.frager@amd.com>
 <20231031121222.1dfa4035@booty>
 <CH2PR12MB50042DEEED0FC5E7D3BBCA99F0A0A@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20231031133415.1d89db5a@windsurf>
 <8a0d97bb-2fe5-4e09-8e95-b928a431ce1e@amd.com>
In-Reply-To: <8a0d97bb-2fe5-4e09-8e95-b928a431ce1e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|CH0PR12MB5314:EE_
x-ms-office365-filtering-correlation-id: ed2c0344-3cf5-4e16-252d-08dbda15846e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z9mGP1Su8WYHXTh8jyReYIql5RsDDdvmeFAIOTlKydgytfj4Ytv+j+s1X8kfq6ZM/lenzrAPP9I2x8ChVQWKv6rnmLj/q2SFKtIWTh4oB1cfWOfkkcwhZqGW9163vv1uH0XVMFFVzYLwRo/0XrJTUPbjyE3t/f0wRlJpa0nGroKPeKOUYJD07Ejm7c2thI3R5qXctBQA/ElkrcIHz9bPoYe8qTVJP3fYxWWjWRTCcrVxWwBCUfRf5eo2xKiXgzOaRNk81egSeQ2pZW9bglMYyEKiYgH+wblKwSAM7BKGOX+O8t4e6fL/eTTfw2YTp90SDNL2oc2AEQZJUZd/ZWZjV9XyJha21WMEXGFqEpi4Tf5y9bZgqCEpRJjKubfkCEQiCo5jHGepdm3q/4Bu1fRUbyyNjOs5pVhurGAymbRw0cD9jq8/QqaV2aiDab5P+JfRkTaYtEFu59pHa6esTQ9UAbrBFqiWXNwj5iBqhcVgYD5vPYtbT5mvCuQkfadGrVV+o9S27wuXPY0JSTavFSKSGULh5fS2YcIEdzJMtjO86Fw/UUHbluNTQY7DVqlJyo3fBJR5uIFXN4t+kfPHOFCiGGbbVzH+gH3GKiDn5NX3VxvydxOVDjVMfze2gSlnY8u4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(33656002)(122000001)(86362001)(38070700009)(7696005)(71200400001)(9686003)(6506007)(5660300002)(478600001)(41300700001)(2906002)(83380400001)(110136005)(8936002)(8676002)(4326008)(52536014)(54906003)(64756008)(66446008)(316002)(76116006)(66476007)(66946007)(66556008)(55016003)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkRablJtOEgrbDUra2VxSU9PTmFOZjVtcW1wTWEzdWl4d01nK21MUjlmeFhE?=
 =?utf-8?B?L1lYMVVrVndZaE9BZXBJdnA2T1UweWVudGdYWTQzQW5VR3BPaG80Vm9BUjBu?=
 =?utf-8?B?RU9ua1pJUXVwY1pjb1JSbzRLZVNnTis1aHI3elNka3JVOXZmdXNHMXlNcTF0?=
 =?utf-8?B?QkNkVWMyRkFCOEdOd2E3akk4Z1oraGdGS1l0eXZkK2kzVHlFdW9IWHBDSDN4?=
 =?utf-8?B?QWNQc0VGdDY5eUhjY0lSUEtPZXJsY0dSbXM0V2lRTHp4NVp3YlREa1RPaVlq?=
 =?utf-8?B?Sm5vd1V0RHNRczhvT0hNek1PSnpUTWZTL0lyWXoyaGN0Z3c0bDl2KzRVM3FR?=
 =?utf-8?B?QW5nMXFQa1ExN2RhMThrbXFGWGthcC9Bc2tqRHQvTnFlUEx6Ykdpb2luazN1?=
 =?utf-8?B?dVZaMlBFSjFod0Z0MFNoaExDZVRrcHhHQ3lsS3JQc3pseHJZdGhFSzlyVm8z?=
 =?utf-8?B?NFhNNHBwS2N2K3VrcTBock9JMjZMMU13VlBHd2tsV1RQL3FFb0dkVHJndlhv?=
 =?utf-8?B?L2s1d1FMR0JLT0I1YXJIL2Nha2N3YldzcXJ2ZmNubmljTHRud0JiZXhwdjFY?=
 =?utf-8?B?cmtNek9sZFNLY0p4a3d1NFZ3RVhMeU9KZG1DOTdvVnY0U2F6MlZvMTJCVkRD?=
 =?utf-8?B?OEs1amFjS0VsV0tJb0M2K2FCUXBDVWFKK1RPNkN5aDB2ejUrR1Y1dFZoMFFC?=
 =?utf-8?B?elU3UENhSU5wUUVPMVRwb3Z6aVVCdTJQc0xjTkUxVDk4UkpzUjhQZ3A4Nmxm?=
 =?utf-8?B?bDVDSXc3dzlXaithcXgxMGVUWFY3NlpwR25MajRqVVB4N092OGJnSVN2MFJh?=
 =?utf-8?B?bWM5M1Zyb0FWNHNKK0RlVTVEZHN6bjJNQ0Ezc1cyVjRkbTEzREl0am5lNHVN?=
 =?utf-8?B?WldwV0VyRm9vODg5a1MrTUhBaGNDYUVYTUZIZloxdWN5Z2plS0xKUlJZQ1ZP?=
 =?utf-8?B?YzVzNXd2aXdzdW9pN0RSZjl5LzFxbGxmTHJka3RtdUtpMjFjVGpDS3FNK0U0?=
 =?utf-8?B?Sk9WbDFYN0NWMFdjaU1pSFdBMzlzNWhJMzZMMzNWYXBHRWo2dTJsbS9lbDJT?=
 =?utf-8?B?aXgxZnQwUndQRG9ZTlBRVkczTHZRSXpmRDArZmN0Q2RWVmN4dTA4Snc0aGov?=
 =?utf-8?B?U3V2QUJaTGt1RTAxRUxsRVZRcDl1N2Y5bmg3S3ZKTHRqYndYa1NTeldjWXRj?=
 =?utf-8?B?RkhXKzV1dThUYzhRM1Z2YkhLYmlDTUVOK0U1VFBEOGh3dWFJQ1UxMHROYXBV?=
 =?utf-8?B?MzBFZExKbHFNaWlxMWlPV1JwNTJXbnlNVGlJRytDS3Y5Y2k3SjhzSzZtYWNx?=
 =?utf-8?B?MUUxYi9xR2tpOVl4K1M0N1V0RmJTdjdXalFTWTVHWVBOUnhTenZqU3JOSk1x?=
 =?utf-8?B?eTcxK1oxNkc5S1pkZ1pFVEFDME4wSVMzdlVWUlVSL3d5RFdLOFFveHNFcnBz?=
 =?utf-8?B?bTJWSkxEZ0dzWWM4TDYrWHA0ckRXYWk1ejlsQ3Q1SHhNeG1uVzdHdW9ERzh1?=
 =?utf-8?B?YzlDTStpWkpCZ21KMElsL0ZCcWU0WFBjWE1WVE4rL2Z5UVJrOTU0Ry9HQzAz?=
 =?utf-8?B?VERkV0lQN2VLU0M3UWpEZWp0KzB5NnlkU1pnN0YwZG9GbWJSeGJSS2gwek40?=
 =?utf-8?B?YWRTck8xSnJtazBabHFqWWdQTHcvY3NaRTRPR25RSkozL1E2TEVTQmZIOXVt?=
 =?utf-8?B?UUdFbGxvWWNtQW0zQ0FaSHpTQ0lqWXpsZmJ5SjlOaHUxMndrZVlYZVZKMGNp?=
 =?utf-8?B?bkxoaEloYWwwQ202ak5peXRNbE5wb255VHA4OTl3NjgyTDJZVnBVd2NSalFv?=
 =?utf-8?B?ZDljSUJEclRCSFJkRm16NHYzS2NFbExaekVBSDJKbStFQ3FPOTNsU0tqUDhT?=
 =?utf-8?B?TDQ3Q1gzR3RzbXZmamlCSU5ZckRVdXc3SGJLT0J1cFd5clJJQndtMGVhdVRO?=
 =?utf-8?B?UjJwNWJNMnYvUC8vN01OcURwTmZkeTFuR3pFdkR1OW1TYWN4WGRzK3lVSDJD?=
 =?utf-8?B?aERleHQva21VNDdQNHVlazVHK1FJOVp2Vkw2UTF5aExjdGlOelZmY0RVL1d3?=
 =?utf-8?B?dHRqSnJ4U3Bia2dHamhIV0dHQVJEbkdtNWJOU3pobzNGOXZlSXdBSTRVWHpY?=
 =?utf-8?B?MEQwRzJySXdxTUhpZDl0M3ZZc1JlNFlybDZ3L05KTkVyU1hJTFFNZWxYaVMw?=
 =?utf-8?Q?hk1s+IMf/9Jjh2gnGfnQ6NQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2c0344-3cf5-4e16-252d-08dbda15846e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 13:30:15.3474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GLpnqhAGxgfLDolMKxcSRpTFjTO99peYUgcZBOP4SkD2jGV5BqVuXTSrcJB4Pzfe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5314
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbDlTsJGqpv0N5BRYTLzJhxuLVP+RsJVKevkZvhYw+Y=;
 b=Fql/gyVLoQRroC4ffq9LcytVJTB+nLCVC4w9JnrTvGF9dfFU2Odawn3qEDeh15GCE87cs/ltdT7IaHiGBt/Ofcrw20UBP6VaOT5D/wd4lPP2JDtdz+RZaYN7QHBthEc3Aq4XmovNgn7uCzJT+phv9S7ZA3QltitlWvtxWoJcJvU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Fql/gyVL
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/zynq_zc702_defconfig: new
 defconfig
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Luca,

> Hello Neal,
> 
> On Tue, 31 Oct 2023 12:12:47 +0000
> "Frager, Neal" <neal.frager@amd.com> wrote:
> 
>> I do understand your point.  From this perspective, we can say the 
>> same thing about the zynq_zed_defconfig and the 
>> zynq_microzed_defconfig as well.  For all 4 of these zynq boards, the 
>> DTS definition is all that changes from one defconfig to another.
>> And in all 4 cases, the only differences in the dts files are things 
>> like gpio LEDs, switches and whether or not there is a CAN peripheral 
>> on board.  So you could potentially boot the same images across these 
>> boards.  You would just lose a peripheral or two that is included in 
>> one dts file but not another.
> 
> I think the discussion is not being specific enough here, so let me 
> provide some more background.
> 
> If the only differences between the zc706 and zc702 defconfigs is the 
> Linux kernel Device Tree (and I insist on Linux kernel Device Tree, 
> not Device Tree for the bootloaders/firmware), then you can have a 
> single configuration that builds multiple Device Trees, and the 
> bootloader selects the right one depending on which board we're 
> booting on. This is exactly what happens in beaglebone_defconfig:
> 
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
> 
> We build multiple Linux kernel Device Trees, and the U-Boot bootloader 
> detects which board we boot on, and selects the right Device Tree.
> 
> If you are in this situation, then yes we want a single defconfig.
> 
> However, if the bootloader needs to be different on ZCU702 vs ZCU706, 
> and this difference is not detected at boot-time/run-time, but is 
> handled as a different build-time configuration, then you have no 
> other choice but to have 2 separate defconfigs.

> I have never really get DTB U-Boot resection to work on these "old" boards.
> It can be done and would work fine but the issue is that information about board is saved in eeprom which is user accessible without any RO protection.
> I have seen a lot of these boards with empty eeproms that having detection mechanism based on it is not a good idea.
> Another option would be use information about silicon version to differentiate between them but at the end of day it is not worth to spend time on it.

> Thanks,
> Michal

In addition to not being able to detect which board we are running on, the zynq and zynqmp dts
definitions are used to select the ps7_init or psu_init included by the spl for the target board as well.
Some boards do not share the same ddr memory, such as the zcu106 revA and the zcu102 rev 1.0.
So even if we were to build all of the device trees, we still need to know which board we are building
for in order to have an spl which will be able to boot the target.

Unfortunately, I do not see how to support the different boards outside of having an individual
defconfig for each board.

The remaining question is just a matter of how many zynq, zynqmp and versal defconfigs is the
right amount for buildroot?  I would like to be able to support the following 11 boards, if it would be
ok for the buildroot community.  5 of these 11 are already included in buildroot.

zynq_zc702
zynq_zc706
zynqmp_zcu102
zynqmp_zcu104
zynqmp_zcu106
zynqmp_kria_kd240
zynqmp_kria_kr260
zynqmp_kria_kv260
versal_vck190
versal_vek280 (coming next year)
versal_vmk180

In exchange, I would be ok with dropping the zynq_qmtech board and possibly one of the zynq_zed
boards.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
