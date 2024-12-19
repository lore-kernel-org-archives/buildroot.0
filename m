Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7070AE77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 14:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3D2783D24;
	Thu, 19 Dec 2024 14:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z519jeFr_U7Z; Thu, 19 Dec 2024 14:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 639B783D38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 639B783D38;
	Thu, 19 Dec 2024 14:30:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9D786C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 14:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8517F42588
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 14:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVnxfiJ_Q1jc for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 14:30:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2417::629;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD0AA42584
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD0AA42584
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD0AA42584
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 14:30:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3MvHO7vMCeQEH1kxFNb9xYitjnYE5iQ4V0K5Usdyu0rQSyEBFdgDvoNpp4SrbO7XtxxAK4DIrU4duZGx/ehSNYmWEdC1BvAQcfQSa1xsy5qx40smThhHiBHquJL+e0C6asYkn75F9rtcqZjeOlt43CbrgFg8vKBk9P78i178wpSZcwO3eLTB3v9YPHLCfN/DgiHtFsSKwo/B4lzeT8nIRBSy4y9d4hM+qUomqY52wHyg6TLdJBA/esRSzvgi2BjEANoMnu3NBILIU2Y7dbtWep41g3rWDdDDoKV4DgCohwPiTKjmMlyvDmuPYt437o8OzhOSciN6QQeJ90NwhynTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scazE1OEsnO59As6iu2qZ9dy2/0L/m+TAejSJWASTCc=;
 b=IKBwhRBPFg/Q/GYlTDdOIkAJgRKZT+VW1YkJUtkEuKSED6mrKhBlj4p6dee8DcxltRAREWedb5pDYrP08DxplDZVQZANzQHiXA5UjA+jErjNukZ+3cPVJOi9oTDQjyL3WpfWLe8XRxhHaqISTndZ+o7ax3d0M+NMtXq12lEAZT8+M6zIzrDW8V4oqidq+KV0gxlP5Zzhldou0WQKRn+KlxRiBFjZPG0Il8VA2EFUO6koCNYJ6jt2NGqQ064ZRGaz/iFeGs8suN5P3vLQDVtymyI9SkNIoxABK9jWPVEhEBs9r/S5LOt5/L/gq6Yu7JeH08CMUwTi/p+1DYZQ09k+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB7249.namprd12.prod.outlook.com (2603:10b6:806:2a9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 14:30:02 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:30:02 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 2/2] boot/uboot: add qspi.bin file support
Thread-Index: AQHbURl1Wc/g90dfEU6WgDAfGix1ELLtWUGAgAADmMCAAC6WgIAAFbWg
Date: Thu, 19 Dec 2024 14:30:02 +0000
Message-ID: <CH2PR12MB50045BEDF784061973EA5A58F0062@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20241218065239.503162-1-neal.frager@amd.com>
 <20241218065239.503162-2-neal.frager@amd.com>	<20241219110653.37083055@booty>
 <CH2PR12MB5004A6A41AFB5D27366A93F6F0062@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20241219140629.38e4e37a@booty>
In-Reply-To: <20241219140629.38e4e37a@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB7249:EE_
x-ms-office365-filtering-correlation-id: 3a0f928f-74e9-409b-dc20-08dd20399fc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FqZA0VfqyIc3T1gQzbSaLYhY8vTtg7HMXSpwDPe4xURjhAc0MWLqnJxN9/PG?=
 =?us-ascii?Q?q+5ZElwLdQTQHlEUAj3daWYFzA0AxTi2MRm4jV7k9zsPdVLYPFm1WiQzIlKn?=
 =?us-ascii?Q?EW1RGLwcfQhMss0il5hBCzW4JhxcY9EkDV2qsCENoaCuuyCWxyEQnQe6Lq6B?=
 =?us-ascii?Q?N/2XBzMEBysZrdEBytgiApdEePWLM7e57zuD7Dlnmk6qex3gMdzZJNtWMCDx?=
 =?us-ascii?Q?4iLxu1uK2Fd9BhGy1phramaebky48s80L1+PyNHqLZ1yxMqMD8q7UwONEsu/?=
 =?us-ascii?Q?kvrDjoUW8tj35is52XphuW4JuRqfB/82mAPaTD0hP//eZxP5BZKdI/yogj/3?=
 =?us-ascii?Q?J2SPhzm/NhDlySzlXO3bXw7IazAAOxbX8TpGstaMgGe/guemKBkWVAIEQsFf?=
 =?us-ascii?Q?zikwaJBYVSqyv9ZUfp7mARuxgXIu++7GDuHbxMSbhhhSmFq+q5OU9KyYFngb?=
 =?us-ascii?Q?LpFyWPwf22LHJZZW/SCorbraMEblKPYB32d6byRu+A9/3C6gaTucNidnRs4B?=
 =?us-ascii?Q?OYCwgUr7bMxxR0H7rSaNCNMFgo1CZGhvS5ptglPONx8lRkPBkhIOPFaFZG8A?=
 =?us-ascii?Q?nZ3xg8LTBRluIv5M8I46w9poNVa9BQZK1KCMhw0KJNeqO3QkDBCRWRMW426V?=
 =?us-ascii?Q?vQK2fHjapEL2A5AqEja5lJueGxb7QpdH1iro0KTggVfCHpKdIB9wsWPN5hlP?=
 =?us-ascii?Q?CxB/uHrPzFVV/9lPT7MQPukqTrIxOWkWDRZ/WGSLMxf9HmkfmBa583pDhrXU?=
 =?us-ascii?Q?K/dA8b0EU9tyTehPp0vpo1y6Askpc6/ta59WLZ42t2GqIoqa3Cv1grPiYvx6?=
 =?us-ascii?Q?uCvf2w8+wG+dxerC6kL7z+7Jr4zc2PdJFMZNmcx3NB+YFhHml9ycO8QMMnYD?=
 =?us-ascii?Q?430iDQHDr9pk2aYQ2osUz7m/VJfTo+/9O/wStN2R7rYtS33dxyKcNebnEkki?=
 =?us-ascii?Q?qGYonwExBGfSNSslxFD+hcttnkpI1ZG38uVtwp270KdwVswCkRh4vTuquskR?=
 =?us-ascii?Q?F3TE3sC3yOYHxxQG6YdpQXo01Tt5UIqkpo2YWutYZ5egdT4uBsnV4fViKfmE?=
 =?us-ascii?Q?ibwz1YA/6wfoJBrv4iQfTU7o/A1Ib4b7W1KB0Y9oZ0blHCRl+iZD1Z7wLfHJ?=
 =?us-ascii?Q?DX2359bYvNHpqGAoyg75VsbCn7mdYg3hn34ou1BUmRX60/t+Vdkpyp1Ow+Z9?=
 =?us-ascii?Q?YA+6zTDszHGoSLWJGXbIca6C+R22eexwUiWEy3q0fP42hp+6tkeCJZUFpLGI?=
 =?us-ascii?Q?nOuHYLWHEsHYKwtBLto5QmS5ScQdmy56yy4NdksTQimUGSrlwfYTgpUlO/e+?=
 =?us-ascii?Q?x/wHYfedSpP2YqbQNBTZcLhveadAQFLVxkBPWMUJxbRGqLHRnJ7EEuVct7ZY?=
 =?us-ascii?Q?WG7lr44nW8Ctvo/uv1GZXqXgfmNQ+J/bfcLOhqnERvjuHwF34y4Br3lGHTa+?=
 =?us-ascii?Q?GpcVyFrqyhb9KJ+cau3a6mBxQyC0WbWD/2TAt79gEHUUckjmnf22pWsxaMlx?=
 =?us-ascii?Q?kH2CL+/KFVWViYw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vodkgrOUVWQ8BW4QSB4TjooCmzZ2oBHwJ6zVrfgz2mYjMsG8fj2d1bizSs8k?=
 =?us-ascii?Q?Au3+KJXP7gHaKxXqw8iOAXeDL7y5Do+PQEc4K6pl96lC7q9rjIAQrXDdmt/J?=
 =?us-ascii?Q?B99QPjLr6JHQ7adRsDH02xj4bhaxR8z1rP5FO4znxov87buo117Do+ZT2hpw?=
 =?us-ascii?Q?rV+QS1jXXm45qgvCw2H0dnP5HSJX+FUCjPRFCqdC91ajZWfWUSOjrEUda/Be?=
 =?us-ascii?Q?595e/0JlthO2Nn/Z0e7A9YKKWpIfdj3IOy/dXPzCTIMrs6w7g8B2VB5wQKOB?=
 =?us-ascii?Q?9tDTsAizWtGeBKYsDRdApD0HQj2GihCCE/EglKXN50IOlpEeaU3d1zuCtiaN?=
 =?us-ascii?Q?IIoKV2vG1mtNxu83dtRyIzHA9Fq7RLLr61rKCK9kR3Pm4xGoU5ZOmO1vZgBJ?=
 =?us-ascii?Q?R1lR12wWhAzd/60JT54GchtzXowUAKM6jAnCty3zZ5+r0LTvmTcXjxyiYYKh?=
 =?us-ascii?Q?xJtz0py3WNHpoGr/HJ9GgAiS7T5t8DK8XA0pXVLQPyynVcwLhQA4KijBZibK?=
 =?us-ascii?Q?HsOa64AEop8K6+xWUgcVU+2ayqT/AaT44sb+9VcgnPaM2rFPAXQ11pNXxx3+?=
 =?us-ascii?Q?a1tR2hYkvcXN4t6z5d1bLMaQ9brcbQ+iuJgowpTGTbrH/H9LU2cg5y1gaOcI?=
 =?us-ascii?Q?lzsQ9hjM21Iy9Gcjm4QNxSGjsBEeJ7ix7AKWkJUV2QzIgUMkJffnvoXFW2uM?=
 =?us-ascii?Q?BTcA7ef8GSqnOUrV2w+P1R6qzGPmDAfHSqMeI5wavOqsRs3ZmkanImQsDEQH?=
 =?us-ascii?Q?6VKc9J157q07W/KhlOnFm9l51ouikHKxXVQXBG494XSEkUKdOIhfvqMvxue3?=
 =?us-ascii?Q?C5IwpDTyX63GGR3xuMPTTxcMdcdBsXVwKHrssueV9zkjZx5COYaLXU5fLBSs?=
 =?us-ascii?Q?F/V6aQo+axAMnmtMVHyvFhqhHip4DykjJegBQ+52qYAqLxUVbJVvK30U5TaV?=
 =?us-ascii?Q?+puDMjCSXQYfw5MXNqJ336CHPWUOUvJDfCgoONG+E/aNpxmdz+OGqM2qPtIA?=
 =?us-ascii?Q?1GC5mQQHm+83sXkyo0eCWW9f/3WXQGbWZitgolXYicZi4cFBMx7TsJPZxMzU?=
 =?us-ascii?Q?8WbTSS0ttBvql1isvrXK4603pFSsTW4eTBgWQcEyrEUTyn/BHFgBac9dyzFA?=
 =?us-ascii?Q?UGD/GFhGgp7b1mo58ixcV1HMCq6ugGGr1gPKIQBeKcWuvnv0iVDJsiio1/dC?=
 =?us-ascii?Q?h9Bc5zkw5nyhcdIIpE6unVLjqw0jO53GThuyEhRqvZPpo+PnxhLVIR8ITx3y?=
 =?us-ascii?Q?pQjExGbNomTQdUc54+oroUFxJAf/9rF77Y9yssCQEaXVd4IxZe8sHXrMeMXY?=
 =?us-ascii?Q?3WzM3EBdT9CIDfWqTTiUc5vPcyuu1SFGhR/KdgkiWfzmcq0k5h0Vu2pUbGCA?=
 =?us-ascii?Q?3k1Zl0lWbjOpoK37L00h5Jbm4071ocBKk7CbVxyqIDXhVtvYZ3rccPvvF5U0?=
 =?us-ascii?Q?oKZDCisMkGHs9QHYFWw73ysV9eGg+UBXX70viq3AUJdzH5aYyYlnpu8hVF9b?=
 =?us-ascii?Q?Trmrui/48PRH9ZjzNXsJTqD6Y/ZE6bhguyXEsHb7uNU6DhzZi6iv4hlgDv2h?=
 =?us-ascii?Q?QXbAIlykqOGw+JypeLI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0f928f-74e9-409b-dc20-08dd20399fc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 14:30:02.1877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttBBb5eBLiEPS2aPsWJ5UH6FjGUIc8D0IOKNrRV6N2zH9C7J9nGgeEJY7HC6AO8J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7249
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scazE1OEsnO59As6iu2qZ9dy2/0L/m+TAejSJWASTCc=;
 b=bAMNbgdYkusG+kXEZODLDBbhuV2uzEhagVKPyGthPisMF1t4opItXauURRHCTIkEVjVm6QVMmCJkIpWMomshW5euoR4R5bWE4g5dDbFqJaTRJV+J7w0j7K9jMFVQTjsMnOEK9ELDAO175XCC8tR8/U2d8HG7ESjg7JFHSArYCVM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bAMNbgdY
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 2/2] boot/uboot: add qspi.bin file support
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Luca,

> Hello Luca,
> 
> > u-boot has introduced a new file called qspi.bin for users who boot from a
> > qspi flash device.  It combines the spl/boot.bin and u-boot.itb files into a
> > single binary that can be written to the qspi flash.
> > 
> > Here is an example of how binman generates the qspi.bin:
> > https://github.com/u-boot/u-boot/commit/a4c98119109a60b9b236996f47065aa8fc0de9ca
> > 
> > This patch adds the necessary support for buildroot to install this binary.
> > 
> > Signed-off-by: Neal Frager <neal.frager@amd.com>  
> 
> > Do I understand correctly that this requires U-Boot support which is
> > not currently available, at least not in U-Boot master nor in the
> > version used by zynqmp_kria_kv260_defconfig?  
> 
> > Otherwise, who is supposed to build qspi.bin?  
> 
> Yes, you are correct that binman support has been committed after our
> xilinx_v2024.2 release tag.  My idea with this patch is to already
> prepare the support for using u-boot binman and the qspi.bin file.
> 
> My next step is to cherry pick the upstream patches for binman in
> order to migrate the 6 zynqmp defconfigs to binman even before it is
> included in the xilinx_v2025.1 release.

> In this case, you should send a complete series that cherry-picks
> binman support and exposes qspi.bin to Buildroot users.

> Or, at your option, wait until the next U-Boot release so you don't
> need to carry any patches. After all it is just a new feature, not a
> bugfix, so it can wait. Not sure how good it is from a Buildroot
> perspective to add a patch to support a feature that will anyway be
> available in the next release.

It appears the next u-boot release tag will be xilinx_v2025.1 which is not
coming before May, 2025.  I am ok with waiting, but do you think your issue
with SBIRT reflashing can wait that long?

> You are right that until I add these upstream patches, no one will
> be able to actually use this qspi.bin option.  In any case, I believe
> it is better to keep the option generic in case other platforms adopt it.
> 
> 
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -108,6 +108,10 @@ UBOOT_MAKE_TARGET += u-boot.itb
> >  endif
> >  endif
> >  
> > +ifeq ($(BR2_TARGET_UBOOT_FORMAT_QSPI),y)
> > +UBOOT_BINS += qspi.bin  
> 
> > 'UBOOT_MAKE_TARGET += qspi.bin' shoudl be added here? This is assuming
> > there is U-Boot support, see above.  
> 
> When using binman, it generates the desired output files such as u-boot.itb
> and qspi.bin.  In other words, there is no make rule for qspi.bin.  For this
> reason, if we include 'UBOOT_MAKE_TARGET += qspi.bin', the build will fail
> with the error "No make rule for qspi.bin".  See the first patch of this patch
> set which is needed because there will no longer be a make rule for u-boot.itb
> either.

> I see, make sense.

> Since the u-boot community is promoting binman over mkimage for new binary
> generation, I do not expect there will ever be a make rule for generating
> the qspi.bin.  But I can imagine that other suppliers may copy our idea and
> generate a qspi.bin binary for their platforms, which is why I kept it
> generic and not focused on zynqmp.  Even though only zynqmp will support the
> qspi.bin in the beginning.

> Uhm, but it is possible that no vendors other than xilinx will adopt
> the qspi.bin filename. I think it's better to add the new option with
> 'depends on BR2_TARGET_UBOOT_ZYNQMP', and the 'depends on' can be
> removed if/when other SoCs start producing an qspi.bin file.

You are right that it may be a while before someone else adopts the qspi.bin
file name.  That said, I agree with adding a 
'depends on BR2_TARGET_UBOOT_ZYNQMP'.

Thank you for the feedback!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
