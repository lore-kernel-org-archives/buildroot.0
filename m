Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBBBE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 16:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C213A6074F;
	Thu,  2 Jan 2025 16:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HMeSWKFJlrf; Thu,  2 Jan 2025 16:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1CB060755
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1CB060755;
	Thu,  2 Jan 2025 16:36:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 090CFF24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA0DB4049A
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUUg_HaSIV92 for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 16:36:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2409::610;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90BFD403DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90BFD403DE
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::610])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90BFD403DE
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:36:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wh1OKbKt5bBBa/2iv6xhrfWJZJICRfw8EiCPRZ2cIViuKyxBB075+1BvdciS3EOVhEt2ug1QJkv0E9li44GqEqeNBQNsUK7fX1lB+vSGv14aPoojxpYqw189eXQzxPWue0FLPQ0YBkWXpI8IspcRDC6WCUsgleJgh7/J3L638WVekskwqHqNYRvlyityMC0fkMjlKnq6vxE8A68mUcq3ntacempEuOhuHKnVtL5EucNXrHYC9ahzjI+p2l8y0tsof96pmytusOJL2g1y38a3bZelFitmQ4QXYQFX9VqWzub17wL2E4vCR5bD6ZYx8tD7zZSRVhe5x9oz3an5FDw0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kB+im6/yBOEmkY462KzZ4KQEdq2IrQTWSCydATDPdO8=;
 b=OK1Db6EikfpmBdoqO2MV1cqj8eRaIxSvWvoykzyXbpXMd8WmyPDgMkH62jqmHwo9bTR5yXLh9Dx0ir2pLuMKsGrkSQkR03WVTcvv/kDCLTr65fTt2FnbhShDyz0zQzLk7KXxc2lHDhlTPj5aTP9NOmEOvz9tHHb5MlzEWvlSfZWl/Oa0Db7DE5BjTSfLCl7Qn7/2BOFQ7Nf/Bklb732ExJZRmldXIArKCs7c69q7fwP9oCpD/kS/bpiRvEZ8N+ZKvHnUu8Mry+Q0bTMEmoa4dYEQshLmCT3NBPMmyFI8iJhAtMwEW8c15+flggwHMGKB4ECLpWik60jNZCC/seGfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.13; Thu, 2 Jan
 2025 16:36:28 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%5]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 16:36:28 +0000
From: "Frager, Neal" <neal.frager@amd.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/2] package/newlib-bare-metal: bump to newlib 4.5.0
Thread-Index: AQHbXQCefVnKVtXNyEaTwLvmanhcebMDqSwAgAACVTA=
Date: Thu, 2 Jan 2025 16:36:28 +0000
Message-ID: <CH2PR12MB50046D8C2D6E66801E9E3905F0142@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20250102102500.1420512-1-neal.frager@amd.com>
 <20250102171550.0fd6908f@booty>
In-Reply-To: <20250102171550.0fd6908f@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|LV2PR12MB5726:EE_
x-ms-office365-filtering-correlation-id: a451b302-c568-4061-6077-08dd2b4b9b54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AWyRZZEpO8R47H8iQyAXclh5X4Wl30+XL79yUYOGwDJ4UnjxxBpF8wX8y7PK?=
 =?us-ascii?Q?36gYo+diT9W8D9mqPeBzEgH1r3D0E3wYzJIqs46firx4SQJpjmGmqpKc4M8j?=
 =?us-ascii?Q?NzEkvrBBtt8jZ9E/XilhkA/Jiq9CN+WFCLhaG94YloDsHgPpV638qf5Mfnyi?=
 =?us-ascii?Q?1eoAegGUNm5qS9Y/SC+PTPqBFrWDBko50hlVd3XOLAZcUZV8MW3MkUTkzeDy?=
 =?us-ascii?Q?ntLHwIecGv7fqHtBdZoUv7+bBnvjiQ9/g3t2dBQdCbhgcxFzmmANXA2E4zbo?=
 =?us-ascii?Q?Sq16qRqbffusBTHSAqnDA9zgdTjNr42PLRspC0A8QbQcLVqG5A54QhiPZTBN?=
 =?us-ascii?Q?2fLhj8mhznlwPLBHzbo8WXNDkV6Ww7giIE2MOOcSk8sAMOgkbDJKpFt/AzCt?=
 =?us-ascii?Q?eRbNUarJifjU7ZhmrWmZLyO7HVTz9eSdPhflb3hl9woK2/Ay0hmSeiSfJV6j?=
 =?us-ascii?Q?qBLpe/Rz2eXhOe0RmNYICjEteMit34uPqQ3dlcAu7BVdmE41OLoELQD99skb?=
 =?us-ascii?Q?kiuGUhpsfPmkkVEPLstPLyPQ6UG2TMwpdf9TFc96RGeuPP6j/QfGPbku87AO?=
 =?us-ascii?Q?E3pNkdAiSYpPQn9RCBCcNHAcSdjkHRCGtRrcSmcdAplOujgJ/xcWWIP6qq5J?=
 =?us-ascii?Q?SI2RWh/3zxp2gIxq7h8xK0IcE+CztS5ciGp0I83sxA2F8EVDC+0+qUAD0TI8?=
 =?us-ascii?Q?Cc8JVKEwnPajR9VjGeoVf94EL1OpxrvaM5qvZg8cyANgD/jI8zvffVgrXt9R?=
 =?us-ascii?Q?RdewFdEI0NmSUiqppj+Hb7fxQw4bxwMghQoVEOs1BSK/Xn0oHp9hCz/w6ouW?=
 =?us-ascii?Q?fX7i7cfc0rqeHxfgPy7QjtdxuqmS4j9pD+/8WBRk9xpjhKfCTicmlwVQWhpz?=
 =?us-ascii?Q?uPfBoUIJREOCXFwRc+jXrme7kNARDRIQO6xTrt0NqRRa8fMuBCTPPO1D9o87?=
 =?us-ascii?Q?dCeI9peEbUAnil3asMLMet3wwJC1k2b/lHj+ol8lUTTf5IcMArsF0V9IHKDN?=
 =?us-ascii?Q?ej/ks5u8bHfdM9K1rjH6QckHo2PYkGomDeudkjqfHOM96jxmVBiccUBIWW6r?=
 =?us-ascii?Q?eNsK2o2I4Wh3gVjsDu1EkdyB2laU7iLAvHphE1UOhoAOMeS6HRYFzOhyMLH4?=
 =?us-ascii?Q?sS2gqGylpzllFmhHpU3x8ixySicna8WDZta4N8lgBJU3xoW4XcAF1VTxIWCv?=
 =?us-ascii?Q?RJItwAdHaRM2rUngTg/3NBTLOv8ErI/fR9b7hMkyZ6xKrZxY6dOzJteHI3dT?=
 =?us-ascii?Q?SFSGa/fsRF5SAxiVsAKI7AkEEGTlZY1rUVZ2krDwT+GuOBqolC6r8STGX8V0?=
 =?us-ascii?Q?Qk11PSzuGBhhnOSQjGCoNHkmdG1Ku1DaKt7ib1byRvc3+No85wp9ijwc7+OB?=
 =?us-ascii?Q?bbxQpVJOFsrCHSaK4vJGLjUPwJpBTOT4kf3xGEnMDzkvvlq8wawWYe86HNoE?=
 =?us-ascii?Q?MTUOHMDCG8ux6Knx5OUzRPohRZndbEbJdebrSwCq4JhINSguOp6uUAnMuLR2?=
 =?us-ascii?Q?rWqh2G3Mj1IfIwU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u0XMgo9OGU1llywxMXudK3FY0qz0xUMZdRrnJVIBo5CuUhoJrKNnMuvsbYjK?=
 =?us-ascii?Q?22/QHaid4M55t/Bgdf5ajSk9Cp22+HFZYSq8UgRH/k1K+9aHX4brOEUYVQc5?=
 =?us-ascii?Q?XIctYc5WFAen1BgXcQZzrcN5QV891qAaDIwe10jHswAtm3xrgd52/gSa/Vu4?=
 =?us-ascii?Q?DuRdGoE/Jc1oimhXylM3CniY2NkG38kwuVAhv0gZciXNsILd3LoGrGbSw7H1?=
 =?us-ascii?Q?SZkU7QpwUPuq7+FXou44k8usdLyiLID4+sIWDPZ7nbEWTTPNQeM7JAHCBVCc?=
 =?us-ascii?Q?1PfY8bOB9uWoXi1HE1JpF9qlIKR0s858w2K+RhxvM+km8RNgGGTpb75dzlys?=
 =?us-ascii?Q?7IfOi2jUjnn7aXz6AknkdryLu0ibijqP96o9HpNSHqaPBS27ovaYK3It7da5?=
 =?us-ascii?Q?IsZKAxYmtrb3E9etp0SNn9U8t7XU6MMEfnmBwsEOLHWNqBibcXvK9oUj+MF5?=
 =?us-ascii?Q?DfuBv6QqFyfY841cc/AQQCN56uGBB9N7brBF/HEN7hTbZwqq4lM8XtLaNINi?=
 =?us-ascii?Q?9TY8C6HrkHK8+eVtmMizK97As4hqW+e4EbUTlnDeKtnOC7v3uX/fFXMOEwrO?=
 =?us-ascii?Q?hjy1Z0+wqw4WcSFePHA3W1LO905wEg73kB9yAKzKBQLxvVbkAzytHGHXzZ9w?=
 =?us-ascii?Q?miCWRyIiogwXtV35oWIEWyZBY4dWgWcdGKub65lU2lryoXQ5omLiKrDhGIBq?=
 =?us-ascii?Q?/Otsvs+GmDNmsl50fLzIJ4nfPeW83b3/aarthCeSr/2HT5MZjxa6vK6KDcat?=
 =?us-ascii?Q?dlhyBI/zkA7mBiIgcGRbGfiUi7Y9sK7d4bQR5bpoBsBmFGBECRo0TSU8fC0B?=
 =?us-ascii?Q?gB152DX1vsICmt6udpNkSj2wj4oIicIwyZnuf4zsoA8uSmaF0xfTtMNURPKq?=
 =?us-ascii?Q?q8l2/fUJZRJdBPIoJwNrTULNKEmT/ZpKpS752552gE0nxCD/lL6sJXusw/UB?=
 =?us-ascii?Q?DgC1Hd+IzLkMtLucCQdo+KW8M9DGGzj1TwWrxlf33sMTGc9yKZ9YFWkFN/22?=
 =?us-ascii?Q?/N41DazXdkh+Afj7BX5J2wu89Kr5JnZYAqrFkey+BC/dYS3C4f/7vLS8Va9i?=
 =?us-ascii?Q?vB1CCA93rfAm3RlcIZY1FzuBggneS3X+Lebmm286G4hiIaIzgC1WIVFL25mS?=
 =?us-ascii?Q?BBP4kdgZkrCsbxg8un7KWXGGK6D9D+CTWJBcHicX31xZFfi1UFHAneZ5A1XP?=
 =?us-ascii?Q?6/osMrCCKcjqZUkscI3+5J5XSsydv7rCS5dBI+dVq9o1Ya1WxAjv4WKwiS0/?=
 =?us-ascii?Q?orr8pbQCyZvsey9o5Aib3qovLmCXc62rYsB1JoM9l21hp5Gs/VuARPSqjNo4?=
 =?us-ascii?Q?J1COl/iJtTtNSSEfXgq0lTvOibyqcaY7FpioQR8QzEvXOePfhbIyogNp8waq?=
 =?us-ascii?Q?DHZiawzdAaeVbKWHF50l/+r6bjl1rovbJmX8mY/DwNjP20ifgF9BZGrE4krR?=
 =?us-ascii?Q?SAYENWuIX+4HECATtawvsl+rAfuU6rfJ25i2A2PIBUkrCRH7aHEfpX0t2/xE?=
 =?us-ascii?Q?sbGh4aHc/8OF1PdYMwXkhgOY95NvpN6X9pMuwduyGmo7WfxERoDQr4KUQr+F?=
 =?us-ascii?Q?ryfjt0ztGLV1VdOkUR8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a451b302-c568-4061-6077-08dd2b4b9b54
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 16:36:28.4724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BceBMQdBnflU0oZJEvsW8TIVBQPdOtgnkj8D3mCrbB1/tL8tT5GiB2AZH3bF3ZZ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB+im6/yBOEmkY462KzZ4KQEdq2IrQTWSCydATDPdO8=;
 b=EGm8p5aextmuQVX2dkm0fVjdBUqOni7hbRwzqHvNeIBiRsh5SLAqPhMKJ1Pu4s6fiExEHTTvt3Zd+4enzBQInVlkDWdpxhS8xF0TRVdRXw5Ifu/KKPAcLkGfIrtnJWIoAWD/bMHGUqc2FuDpsLwVp1Fy6vjv6q6i5fs31+G2qM4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=EGm8p5ae
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/newlib-bare-metal: bump to
 newlib 4.5.0
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
Cc: "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> This patch bumps newlib-bare-metal to version 4.5.0.20241231.
> 
> The 0001-libgloss-microblaze-fix-read-and-_write-declarati.patch is no longer
> needed since it is now included with version 4.5.0.20241231.  For this reason,
> the patch can be removed from buildroot.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> I also tried to test this series, but then I realized the
> zynqmp-firmware patches have not been merged yet. You latest series is
> v12, June 2024, and does not apply to current master.

> That means the bare metal toolchain has no users in upstream Buildroot.

> Any reason for stopping after v12?

> I think it would be good if you could rebase on current master, apply
> the changes requested by Yann in his v12 reviews and send a new
> iteration.

After creating the xilinx-prebuilt package which combined zynqmp and versal
prebuilts into a single package, I thought it would be better to create a
xilinx-source package.  

This is why I migrated to the following patch set:
https://patchwork.ozlabs.org/project/buildroot/list/?series=413161

The main thing I do not like about it is the versal pdi file.  The only way to
build a versal pdi file is with Vivado, so even though the same microblaze
compiler for the zynqmp pmufw can be used for the versal plm and psmfw
applications, the pdi file needs to be a prebuilt binary.

Because of this difference, it may make sense to create separate packages for
zynqmp and versal.

Perhaps the following concept would be best?

For Versal: (two packages with a dependency to force using both together)
boot/versal-firmware: builds versal plm and psmfw applications
boot/versal-pdi: downloads a prebuilt versal pdi

For Zynqmp:
boot/zynqmp-firmware: builds zynqmp pmufw application

For either of these cases, enabling the firmware application should be an
exclusive or with the xilinx-prebuilt package.

What do you think of this concept?

In the meantime, for testing the newlib, you just need to add the following
lines to any zynqmp or versal defconfig:

BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-xilinx-elf"

This is all that is needed to verify that the toolchain and newlib are
built correctly.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
