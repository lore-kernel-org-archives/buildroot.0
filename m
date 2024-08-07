Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA59C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22975400B1;
	Wed,  7 Aug 2024 14:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyNeFLSYqTMD; Wed,  7 Aug 2024 14:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE27400B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE27400B8;
	Wed,  7 Aug 2024 14:26:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF75E1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E916040273
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIgEjg7QwGGv for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:26:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f400:7e88::62a;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 484C540184
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 484C540184
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 484C540184
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:26:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW4lwLFE9L5IeR0uCvDkQeMIJrgWaXxL18n85cKNwAHJCbvbVhvuBEhkyjWDciJ0s8g83H0zxfIr7kZrHMmvkVq65B2rKCO6JIoBe3X1yPOiXav1VtyD8aLivPWOmFhTZAY4LNQNppJ0aF2QA8rEVAYrFAG3kc3PNtGTc7E4gw1V4zV85I2dJkD5WnnG7pBKRnPzKiFMe2B3tKFHms5VL05UNO6YMUTTbbL337CRON0nnIBm3hBDbdG3vNmGkUsBw+92e+IqPU9qrJRTUn4ua4Z8N0f981mc1Br6xIi/a0bCIRoU2d57hDvKY8hk9PbyiC0TLSrgvGcinFxeobWh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2e7j9XETZQEFf2+53XP7IPJdiwV5oUVo0FClMQWo8DQ=;
 b=CW8bCbHwQcPd3xer8SwsVIHUMKyyMvOBNx4CAcGG7cheUvpiJ1rEl19TydKXjJEYT+UBGk9pJJJIAeSseC/Ix/JjCHjI3uXeghP2cthQ1U/5VdU6VSrBvPz1ixWqohzJDN1Czl466CRtQq4ZNenKcTjim+LXB/3fAQP8RzMnICmGRFXkg/MLq+LThB9yMLdAMCUwshoSrKWM/ByNSgKIoA+FGlOBk1obHr3cSUEZUklmMKXY0tF0RTJDXZ8QpwwQGlU5HvKd/YiNoHQu2hKploMM5A4MKkhWrGlFIBzupntmngBSCo9EUdhmkB8K9vJgEahfY28n8+PoWZqYIL1Wzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Wed, 7 Aug
 2024 14:26:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 14:26:24 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add linux
 6.6.40 hash
Thread-Index: AQHa6Li55XsRTBDAbUymX+ME1mR6K7IbuDoAgAAhcgA=
Date: Wed, 7 Aug 2024 14:26:24 +0000
Message-ID: <CH2PR12MB5004D0D6722981F95A9C6D17F0B82@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240807105813.3844985-1-neal.frager@amd.com>
 <20240807142506.45de55d8@windsurf>
In-Reply-To: <20240807142506.45de55d8@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|MN2PR12MB4141:EE_
x-ms-office365-filtering-correlation-id: 032d18f0-1295-4040-e85f-08dcb6eceaaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xHl8wtuZK+dDRCPI97oPrWZePC9nOjdlP93+JZs6QDOYMTGY11fbf31XyA5f?=
 =?us-ascii?Q?znhzLCGXBxgGioEMbCOq65IQHHaSi32yVRY8wC8XuKQ3CiLBYG6twn7eIpTS?=
 =?us-ascii?Q?n2XxBD44kG3eQjJiIaeXr9FL872stnFhDLtMn1dhPciGcsY9bsYm1t5cDoSZ?=
 =?us-ascii?Q?ocErR0340Sotuzlw5wCQdTykhFJi0Njr8ZuzX1vz1i4n+RWStNqtaorIrEnJ?=
 =?us-ascii?Q?JP+Sm4wk8Hb09POp1pwytoKyghd6Iy4jwTRyCDxvxufR1Ywf+rMdQMn0ABW4?=
 =?us-ascii?Q?UHOjeeRrR9d175tO1rRaplCNRIx2/F0qq5NAKtpjAbPXh6HaEcBA11FF/mT3?=
 =?us-ascii?Q?XOUlbnIPGqgqKOmIO7Y+qjClB3ieQoXgY9e3kwidIIr6l/5xCnTyOUhcrGA/?=
 =?us-ascii?Q?7FsZCMWOFmcMGWlyh353OReB5sNn3WWg5E2rfPDvgeDUluv+puHUF5EXvOt4?=
 =?us-ascii?Q?dux+Y3Am7g0vkzG7x0cQCfVFVFfVM5aU6dCKNrkg+PpJt6NplOkIYCDNxgSQ?=
 =?us-ascii?Q?vUxp8OUUsRa0x112M4WUXPeaVemTwORSjfJ35lqLESZOQt0zEDD7Vngawrsk?=
 =?us-ascii?Q?huTg0Wd6bTrOlBE1o5YXxZ9pulDczNZmDzFczMj3t0SgWjskciNny3vV81W9?=
 =?us-ascii?Q?j0GYkbPjFaCWnlfSC3QIs+8q9aA42N5VVhaDK9eC9ZAL5XRsR7JlRm3T8Dlo?=
 =?us-ascii?Q?ayqSGw8OBEksqpw3Efuigx8egneDZ7mflUfKcsWgQ3brxjY/8VY7Zb3AJeJW?=
 =?us-ascii?Q?pW7SPUsPr1JJq5UYnrBZVPAUYT3ZAwyNnsv/EipiKOuv1jtk6ph/Q5K7/4Ll?=
 =?us-ascii?Q?q1P+2A3ox+7Dr62pcgFGsvYXLUoKHOJU38lgCn/huf1HH1vF/keBmqzG7Wd9?=
 =?us-ascii?Q?dWRPN8UIq4NaBU4Ejj6MeMHcavqymtilRynYyyhrxIuBCsxiv6yc6BTPCayT?=
 =?us-ascii?Q?jX9hb4v8HsD3dyzmOC+xBFiJJGxHZA/Ar8x5LJ2s+Dh7yatKhDGgMP268XBo?=
 =?us-ascii?Q?g620hEAB7UMkiI4V0ZACdwoq8Ggf3lPZry5eqhRMP1+0NQ78JJGYlotygHYt?=
 =?us-ascii?Q?FuVrQFSPDRYT04H2Kg1YpxBZnv3FUCJF5Wj77ce9+bdyLEKuMw/U81nztSWM?=
 =?us-ascii?Q?2nW8KAYBA+MrigPEshwMNYp5H57lbbakiLW1ZMZ5YJcGQabzimY0MQ/DSC/N?=
 =?us-ascii?Q?xqt/p1WMxEcQRuwlmF0Evc7jzspfXAqNzyUeYufnFL3guVUlRLFqGu8fZMXZ?=
 =?us-ascii?Q?15drOG/1yYogqp2wy0NuWS/W0Fsm5bAEYPqjzoYs/OJoqJ5w0yIlxNsLMHqn?=
 =?us-ascii?Q?oQohXuirrAj+Nkynvbsh+Z1M7zMATId/4nyQ3ZjkgC5e0MY0YCqFS7iFSFRb?=
 =?us-ascii?Q?1qu9sJXL82QteU02VYp+2pQA6PQs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+2eQ/04VC40H0UnV5kv1XvB7pTUQ3bdv7L2Y9y4qAUUNK6TgJBiLb/NtriIh?=
 =?us-ascii?Q?rE7nqfi9ZRiyDK4/V+ca3JgRYBDPLyxx0rgvUmoO28Sx7Ps0DVZvd7viW1QA?=
 =?us-ascii?Q?NVCLUFPabQUDuH8Zd1g3/rfAa+Y/VJVtzlBCbGCyNxgPk/rgb/sm4frcLGOP?=
 =?us-ascii?Q?m0YYx4sDcR0GEuyAN8HNbA3+BM6tCWbfdiAfXgF6E8oX7CWjRVZzvFFw/fl6?=
 =?us-ascii?Q?fpit39VIhn8WE458Hz/ZPWOi4G8+mqvhCTzx/dg5Iestx2USi4GfGR+CMjXk?=
 =?us-ascii?Q?njy5NBHmEnhF/b4f840HT3Ze8CIdLqRm9gnQRyHrRE6kTATrOdpAg9wl44VM?=
 =?us-ascii?Q?KgWzsn5D4XoKa0Okf5gVgr6eg/+E82xcLOv+eKaYUek859zvIxXoB0r6vWFE?=
 =?us-ascii?Q?xkssr2WGnv4ktHPeABpRks7mGkFecaR0ryf2ALm9n23nzdUS2zFXJpKrl9Zh?=
 =?us-ascii?Q?D3p4XiJDSgwJ+7H7YvlFdtOvLLJokx0j2euHeWCiHYyJMP9QP/X7mPGyrHGU?=
 =?us-ascii?Q?D0hoVcs9ltJEjSPh065N4Jmxbvigy2T8a2Xzie3EKBFDoPU3G2QcSu3tuPcX?=
 =?us-ascii?Q?5shUtzIf3SN0z62ntfD9J14VgLZtli3/GAJS7lrF20NYOtv1RQ0Ye40UYO7L?=
 =?us-ascii?Q?GDLQ6Jdv7IRrTdJxcAucODopZqPle+5duerc+ssNqagZIcH1wb2U9m6eInLb?=
 =?us-ascii?Q?VZhLCYTd5i5BgifsWf6nhlZCw0prQ9wHuepNMn1QUimT5dMwcvarKhoxd4WQ?=
 =?us-ascii?Q?kkRIzEI+1dAArY9EJTh5+WkaEBPrPiIllQEx6liGo3HA/yPpRT2OP0tLdSbJ?=
 =?us-ascii?Q?C2W7zBTaWeEE1et8ymJOdf/ieXcfHJCpiB05Sro8JJGT9a3tGUag7uGqczMe?=
 =?us-ascii?Q?jRtHU7yiSnJKNMs6+PSknawxIcqZfPCQ4C9ZEUxppeWH8DK6Ow59BBuKjrB+?=
 =?us-ascii?Q?XfBGCj6JSwK4ghi1jwoZa0bTUcWpD4ekWGj076CxIWHHQMeb5I7v75M6eWwl?=
 =?us-ascii?Q?369p9kqbLpXbf1O9jdjzH9+wnl58MENwJjsmmAP8lgb45kmXycU8L3Nx605o?=
 =?us-ascii?Q?L6MNeGIKAAnHkx9j0Kmiea9pFVR2wM0RwrSTTUeWec5qgbnQ5gt9Y+1VK/oo?=
 =?us-ascii?Q?gSMgvokN8OdJuhT5SW+Bz3N8bH4MDHFBuDYTvaapbzmGwYdoehrB60/CNmP2?=
 =?us-ascii?Q?Qkgvc/Ad9xSmks/VInn9kyMoXRYuCyUjLojDoIKgz3EybMQ2aS9lXGud6fGv?=
 =?us-ascii?Q?aI6RnJLxB09bwDbAPJTTMgAypE6m8M1SkFPM0/Qyum+6vNUIPr643LQFKS4S?=
 =?us-ascii?Q?j/A7Y71KI4Da/oqMSWodW+adyn8nGbeweZ45hGmMGUOlc4h8lri66oPwh/qc?=
 =?us-ascii?Q?AlTeLw9qQIyslfpj5v3VYJoyp9ubH7cUYCVCeVuONQxWfyJJMv0tzZZevH8D?=
 =?us-ascii?Q?FzxVdzo1gA7uqAhtISE5VsKDHu/ZNA73RIFnC0o/vu+LysYWz8sb6BAlUPHd?=
 =?us-ascii?Q?v1LWGdjQUHMCSaORdXneguLh4xRHiO/MTHaG9EdGLZwoi21ednKS3RSG69XM?=
 =?us-ascii?Q?0te50bGxTYU0vTWdUi0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032d18f0-1295-4040-e85f-08dcb6eceaaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 14:26:24.5202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: klZM3VqIOPqSyRF4k0iOMMWLk8YhQEarAp8l4+ssDOK4ae8Bqud8NG4ZJlrCZZYu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2e7j9XETZQEFf2+53XP7IPJdiwV5oUVo0FClMQWo8DQ=;
 b=kXiXEjV3wqVJD/dmZtpghPgIoOZ/Oz+zsWhDdb6w/4GnrZxeMmSWfrGVkC63iNeSo832eygHDMajyV/9WU1qcY8ien2qDq6ANO8RfGL70EjaqI7mZo/Zbl6VxWAf/oQ6rqZUx5XM6yBVCIX4x1OlThXVzuVYsaPkUBip3xT1Ey0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kXiXEjV3
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/5] board/xilinx/patches/linux: add
 linux 6.6.40 hash
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
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

> Add the hash for the Linux 6.6.40 release for Xilinx products.
> 
> The release tag was missing a patch, so it is being added here for users that
> bump to Linux 6.6.40.  The patch has already been committed to the linux-xlnx
> repo.
> 
> Upstream: https://github.com/Xilinx/linux-xlnx/commit/5365c13a86998da06d845c918f849b30b8735538
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> I'm not sure I'm a big fan of the approach of doing this addition in
> PATCH 1/5, and then changing the defconfigs one after the other. I see
> two problems:

> - In PATCH 1/5, you're adding a kernel patch, but do you realize that
>   with only PATCH 1/5 applied, your kernel patch will be applied to the
>  existing defconfigs, that use the xlnx_rebase_v6.6_LTS_2024.1 kernel ?

>  It turns out you're lucky, as the patch applies fine on
>  xlnx_rebase_v6.6_LTS_2024.1, but in the general case that would not
>  work.

Yes, I was aware of this, and verified that it would be ok before submitting
the patch set like this.  However, I see your point and I will re-submit.

> - After applying all patches, you still have the hash of
>   xlnx_rebase_v6.6_LTS_2024.1.tar.gz, but I don't know if it's still
>  used by some other defconfigs.

> So I see several approaches here:

> - Don't use a shared board/xilinx/patches/ folder, and use one per
>  board, like is done in board/freescale/. This allows to update
>  defconfigs independently from each other.

> - Update all defconfigs that use board/xilinx/patches/ in one single
>  commit.

From my view, it is best to keep the shared hash files since there are now 12
xilinx defconfigs using this and soon to be 13.

Since it only requires a single line change in the defconfig files, I will
squash this into a single patch that updates all 12 defconfigs to Linux 6.6.40.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
