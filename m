Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07660ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 08:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05BB400F9;
	Mon,  9 Sep 2024 08:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLr1fJIb3mNO; Mon,  9 Sep 2024 08:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BB594037C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BB594037C;
	Mon,  9 Sep 2024 08:32:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1561BF3AF
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 08:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0904F80D93
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 08:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0UXy3as704b for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 08:32:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::624;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7FE080D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7FE080D8C
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::624])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7FE080D8C
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 08:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVtuaJ/AljSFL5eMB5KznHI8af7687ZU670Wqz9vP8aAhuT7Hf6wCimujll7PV/wZn0AyM3WhNUP2RoKAyu07X/1JX0mh3BiLE5bhkhAnJl4gqmV5D+dL0P1r1MmjmVsSzsUeB4EDQSvUuJwleIK7DqJ1H6Ccz/aj6rcpBXyGoe8iw76RJgt1xju7vwiPfcC6/WeHT5C1XLkFzZ+zEqVINyYBUhGbuUSBvRzR+1NsIoRtVANHV8A89JSdLMu8ptZW/fzRh2JLF+a6+071LIQi/SWSVPGLAfC7C2TaJ8FsVTUSWhRMaWKCD5MwfuD2rK1VrPzjq5x5KnYBuVpDrXBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a086NrRQ/sm7pDEmxypVZSrv2672mul1+2FqukjFCK4=;
 b=lOM6bzeUK3XlTAtS5v/K6lPpErvFFhHMCgN8gGvbfIkMSJXoQAvEszvw3waQ2Sl2oAg1OfcAfRtsG/e3nT5KDRKVyir3Zum4AwLka506zxh9iEmXp/WjFfoquhUAhyBnDhwwGzCjfQssZCIBvi8moPxaRyhAYZe4eXZ/HBaOF/N7Y9Om3ufVFwTelTupmtVLDS7nfsMKnOJqPsOXXX8DC48kfhhzT4SUpV0KEpiEDQ3F6XWeup7NeVxKNx5nwxtwM3HwINAakSD6leXFSXA025xn/CETeLWcyEYcMAvaR+trhQLix5IVZXgJPHlwvSN4Lcui18GQNqX6Di5xLx3pzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM6PR12MB4203.namprd12.prod.outlook.com (2603:10b6:5:21f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Mon, 9 Sep
 2024 08:32:30 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 08:32:30 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/1] configs/versal_vek280_defconfig: new defconfig
Thread-Index: AQHa7Hdz9f9A1ml8RUagC3Nu1R9UUrIuTacAgCD+3WA=
Date: Mon, 9 Sep 2024 08:32:30 +0000
Message-ID: <CH2PR12MB50048CF51D6E9799A0FAA491F0992@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240812052101.2920141-1-neal.frager@amd.com>
 <20240819103924.58e40ed9@booty>
In-Reply-To: <20240819103924.58e40ed9@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM6PR12MB4203:EE_
x-ms-office365-filtering-correlation-id: 8583205c-8de8-425f-62c2-08dcd0a9f1cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+8/I3ZhqeQJG5FPHLQv63ctdd3Qku6GcrqMv4msKdmnRuLSOF3qYcyWPjUqb?=
 =?us-ascii?Q?MdYmj904U7B5sHH9NsZBsPc95Z3iq5ogle36C3xOYG9dKg1KBi3DWHFzoPRX?=
 =?us-ascii?Q?qWytCzD6sX9Qm7qE9cD3r81LOUBznAdKTTidMvlOJT99U0Nw2URibSeE67mT?=
 =?us-ascii?Q?BVw7Bh5m7SXohDCfc9h3mGc3n3FZZuxwu0cxc0J3YsMHgoVxoUwT+dXp3Qrp?=
 =?us-ascii?Q?iOi8pyE1/lKvmOU2teR+/W4Dy0oTI+VkQl7eSG+KImO2zy+VCb46Z5tRFS5R?=
 =?us-ascii?Q?UGeuqcYyoHwYYOK+fTLofjn0jzN+x8mqXkcX5rGw1GxZcSZDXGUo6XzlWbku?=
 =?us-ascii?Q?sqln3jolaQVvXQfkyr4EK4Hos96hXfdDRO6xJg9RlbrgmOeE1Y2TJasCrJfh?=
 =?us-ascii?Q?e9NEdN9kov03ZnVXX0+yDAFmDm7Fp3eoEQyD1q3UHnDR+9BZuETltm8edJ/u?=
 =?us-ascii?Q?VBcexa1J1Jg20XA0GUO9/OA2pYBDf9vtCMt2pGzvhxaUwwflLYB8cTjFEIox?=
 =?us-ascii?Q?e3zPxhdwMH4aH+AMCt3fiSJxXNAULMohanLtNmodbcCHR/vETL6/hNHGxfzZ?=
 =?us-ascii?Q?sHqRnTt70AkrF9ajJSsNmpSAJsJWWQ87C20AyH92jaZWxiloclFbh3KOZ1tE?=
 =?us-ascii?Q?bw2bZwi9GbKL0qO/OmMxV3tRRJS1kwNQ2WRb6HJz+1Sqpk0IG2pO0rh4v44+?=
 =?us-ascii?Q?qrlYGOi8DetNwHMQdSveHO0hNuOF0788szWPQJ7cujB0cbawe83BerF4a5gY?=
 =?us-ascii?Q?6AFLUBaQjq22/+vkYjxDbAr4pFJR0fMUxbqROD6tbpT6PSISfwAPrTs3rW4d?=
 =?us-ascii?Q?0QQiOqPMG9kVg6AW/kVhx7UZnj/7AHlx8wokd/XF/tlBhokINcCPWqRGPS4K?=
 =?us-ascii?Q?SocAaH5EI1LOxUaYTomWRWGiDv//U8URtxmoCoF28j2oIo8qTe9TzznkFRhB?=
 =?us-ascii?Q?0ESGsFAxrvZHBmSViLE7pzqrP5PsGTGGxjC3YZqBcbBUgM4qXCeFwCvc1O6X?=
 =?us-ascii?Q?+NkJu48LZr9zMjKTA+T57iq9sT7bpzJv3iuSOURoRWroOhtJkvHE7gh7goua?=
 =?us-ascii?Q?eu+gSvLynI1D+euVFkCJlRO2B/GG1HGrxGdXKiXr9TuX9K3WTqXaALwMytZN?=
 =?us-ascii?Q?Ol3CpZ/Pkxr+8Cv8dSgWNXqjX9hbpxckFne5cnYRz56OmqorJ0SmwljHtzEH?=
 =?us-ascii?Q?btX2uDtUwTG3OhPpvtI10I3OzRjdIpKVZ6KmNFtunzilBXekSWdUSMZcSIjS?=
 =?us-ascii?Q?E9KSLrU/1lyeh/rBUxAq/bFg+KX2GHAsBijXf7eA+Gh35BrV2vQs8RfpqRC5?=
 =?us-ascii?Q?JejHi+2LF4DB1IRRuZ7qbU/29rsDFj1pT4vQdAkTGr3nYgokTeNv4gORr4Dp?=
 =?us-ascii?Q?/i9B8IwMxKDw1e7/2RKQIPfV15qKzJIgVIs3QXL1/4ic01Oizvq+Omh2G+Cg?=
 =?us-ascii?Q?QOVtyw9ZXJNww7OFy1UVpoqhnSxPExCP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Fxlk/h0w1nGRnrB1vsqfu8WXMIwvh0xdU8VVZZ3pygsCE1ewocpbPpZLnc/j?=
 =?us-ascii?Q?ap0pfh9zkv8V+f0yuE8TIYA85UeHu/CDrqwOkLQqiRptXbtoqqo1Pte/kN8H?=
 =?us-ascii?Q?+lcD0I0JNl8dCHmxVIM7h6pABxQw6/AX8rZKze2RNAXir6nRCFwtdCNJfsgC?=
 =?us-ascii?Q?bP52q+9DDIXhca0oFhRF0Hp/NIDaKhy4G9AWuVDcNs3pcsnRxsOE9ozhrqHm?=
 =?us-ascii?Q?NvNUtvfOtGvc09psLE8KDktriBixUTPf14idEcB95Nr0E20cO/knnGdlrhHM?=
 =?us-ascii?Q?LTvCVOXTTcqrfEXQLWfmf8WgGYu4dhyBponmv3y4YjXjveuayufkWPhjSuLg?=
 =?us-ascii?Q?hFt6cEnTPZe5vyYcZGkECWaYp6I8pGRy6bajobnDBiCJE8teZzuP5x0+OHJi?=
 =?us-ascii?Q?gBCKNlxFOfszVj9CSTg6n3+molIV312ptVDMdJnCE4mhPJmbFJNrlqDmzTXj?=
 =?us-ascii?Q?r4qhLU4xSow7DjgOu/U5j0/ZQyiD0xtKle/zTGrzd5oU+1r1F8/rJeEcsCj+?=
 =?us-ascii?Q?xCjv1A5t8JPwyv5sfLYGeOvnnmvrfb5sav+6HsGCidCR8AEgzjd9RherVj5J?=
 =?us-ascii?Q?QbIsPMk6sfdmPL9qIxYhwHSOLtml4+3/wIu5K+90i/VbMInS656a9K8MeHn6?=
 =?us-ascii?Q?FtxhrgtdCOGCuI1DEn51ZoNlidDIs60p5tOqvJ0lDzdGhbc5BsdKeAuPxSwU?=
 =?us-ascii?Q?3dL6/vmEON/oYbjv8cUIBaiqzjVhbMMC8g60d3vwPJxKrv2NdAepFMrtqg6T?=
 =?us-ascii?Q?T5hM0jtc9g3iYRW3+IxpbKG+u8k5KS7qv1meFciLKrXCfprJ41LhiKiAfHAF?=
 =?us-ascii?Q?LP95eAPwQQriavteBU0pTKURKo+EUSy/5V9aR5qWr/DAK66UVjU+1ptOUrhr?=
 =?us-ascii?Q?T+E7Kh8fFU/rhwylxs3z16MFvqD/hEPksS0FrTNyMLFFuBEyt4vqaZAETk0L?=
 =?us-ascii?Q?T64hJ0ib83cjjgv7HiBcyYycm3k2ruv7crJZ8+f1dMGxBJie4DwTmbUSU94g?=
 =?us-ascii?Q?bZKTES87wU8uKAM0psP6lFWunhMHcNIct1b/DRYyFIOEtrsKa+2UN7S9vPK5?=
 =?us-ascii?Q?QC+9CRs4HwJhZv2s0L+cB7Y84wvkQieTdlIPhFxAUtoo2kMsli+f/nrXEARn?=
 =?us-ascii?Q?cslK59JOX8LMp8GzgOO8gtLNJuq3F6ctW1CAMlahPr0xX9sd971FI94YglSw?=
 =?us-ascii?Q?rZkHcGKLQRR5Vdq4dRnWULUvk0TyaLX4fmAIlcZYFib1NoPZvglmKbvyIIzR?=
 =?us-ascii?Q?D8GkszNudriI46JihsDVIzz5QNOqDCD8HHYdDc+MHRTDBbz6McD/HwyYTsPP?=
 =?us-ascii?Q?o+s+ONfE0cz07eCQeQu6XP2ESKFx4tnr7axP4usVSwVR2+uf+ZS36mab5GBT?=
 =?us-ascii?Q?iWJHx4SxkTi6I1Fu92gCxbo0UZVZEoygEsa95wwmGSNHqxLKFZySgN3ME2qQ?=
 =?us-ascii?Q?WHifu53vU+r03lZM8XOufVKr+Zysd2I00fP+7LK5Fh9evazXriTkG4nPfQqj?=
 =?us-ascii?Q?0C9gI51EonogOQfRdTX5eAnBBRYispUATdUIaUXm5c6A4Q+6ENkj2mtCkwGW?=
 =?us-ascii?Q?+XK7O7TNl70CAd4afMg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8583205c-8de8-425f-62c2-08dcd0a9f1cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 08:32:30.4400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBEaDKluxn4Jo0m5AfOWdvtgZRrBxv9zeZuCys1ihOcGi49kXS/8kRIb5z2WSmDI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4203
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a086NrRQ/sm7pDEmxypVZSrv2672mul1+2FqukjFCK4=;
 b=qRYF5lp6BnLL47ysQjht8UzJJOR/6nP/E2GHbTUz+dtdd6NLTHdRZjW1JWph8LMH1DgTnyMxaDB4XBcnvhAys9PBMowm1NqWkwW0djttQXps7GXCorIB4L7PM2EAVVp+o1Z5dJ1zPMM0GY4ENqhSEn/ikYUcjW8x4S3l6QsWk/c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qRYF5lp6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/versal_vek280_defconfig: new
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

> This patch adds support for Xilinx Versal VEK280 Evaluation Kit.
> 
> VEK280 features can be found here:
> https://www.xilinx.com/products/boards-and-kits/vek280.html
> 
> The VEK280 requires a patch for the memory node in the dts file because it is
> not currently correct.  This patch has been applied to the linux-xlnx repo and
> will be included in the 2024.2 release.
> 
> Upstream: https://github.com/Xilinx/linux-xlnx/commit/3c7a97d99bdb3dd6b1f36d7d87d3a3c113dfe2ea
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Just a friendly reminder.  Thanks!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
