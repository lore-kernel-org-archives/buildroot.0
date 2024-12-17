Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9263DE77184
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 16:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135B06108D;
	Tue, 17 Dec 2024 16:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8KxR8UEW3Lb; Tue, 17 Dec 2024 16:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2045D60A7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2045D60A7B;
	Tue, 17 Dec 2024 16:18:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6713EC5
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 16:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4291681315
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 16:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbuVVYb4O99t for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 16:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::62d;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13B3781275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13B3781275
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13B3781275
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 16:17:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2dvQJ7TInVEJSP2qCxQHYD4R4ftZjR6ilJOiI6J/dcScQqKuRpsXPx7cDLFatoirQNnomk1kkXqyEQqBMKzCXerIE4P5y8l/bfGl3QaHbRLMPRa4ezsgBd7UN1nJNqLIPi7hRqs6lnwmFvK0clEiKpdoDKw6zxCSow3fJR2WDzbM6I/2/QByhzMW0eTfcCp5UsQWvSY42WbkAElprI4m5vO5VBoz3xcQI44tB90IS9FuVxSKrmUZm/r1CBk+t5StkCAZJyvLlQ5QpwHz6vmPXdsHcWXNBPoitimBKhE0e+PW3iIk2cme9HBYXtn3rdQO/nSBO/fMV3RyRcNRcDwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kE5w4efzavYZuQgZPBG80IJgnb7fOGrxTguX4W2Jqfs=;
 b=uL8D9ctpKOwAKUNa+rWY2JVU5Nn2FYn6uUAYXK5O3oRaAO2+3ERfVscOQKziKVIaH9ikHbyOqMUMUTZJWWGXYk/CDzYk+MkAcrba/FniYJ6Gnbr+qbNaXL6nY6sVx1ofb5czgqrEcwYGaYN2KJ7qpn2qe+k2hanmI7UO4UVdLYojeVJdPoTTDI764rCuBr9nOh0HQQZxp8tHZFgrsh7G9qsqiRmey+k7grqA8To0iVhBw/SKyMMpx/PFb4b/lo/h9A2k6BK9e4W3u61RpnDuNsY10t3sbBnvxbJI6VbFDMEs4+fdfTCkFKbBALHBLlvzrbu5M8E17PaOHA8qtvSN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 16:17:52 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 16:17:52 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig: bump to
 xilinx-v2024.1
Thread-Index: AQHawTEMoyu+eO8XaUWWah1EeSt8SbLlTKkAgAAEJQCAAADvkIAGHYYAgABLwOA=
Date: Tue, 17 Dec 2024 16:17:52 +0000
Message-ID: <CH2PR12MB50046ADE8AB8B917D43F476AF0042@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240618033849.2389758-1-neal.frager@amd.com>
 <20241213150136.0c434b72@booty>
 <1b302d1b-723e-4347-99a4-c2491b072850@amd.com>
 <CH2PR12MB5004F72DCFC7CAE9556FBB4EF0382@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20241217124300.64fe7fa9@booty>
In-Reply-To: <20241217124300.64fe7fa9@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|DM4PR12MB8450:EE_
x-ms-office365-filtering-correlation-id: 261d04f2-6cd6-432b-73b0-08dd1eb65b64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?x4LjL2rPdR8+bEn53F5zYASkUhLDPktCCo/IbxKZ/gRvm4jBtLXzgHXoIgSM?=
 =?us-ascii?Q?uh+u6AYYgPs6S6WvdwBFfvODlGattv4kHrQ/Pp4UCZU24ZvOkiKfpg8nIO/u?=
 =?us-ascii?Q?HKF5DvFa0fMatUl+D+gZfGcbrol2rb1c9EFf/608MVWzlfQuvtcATqIkZL4B?=
 =?us-ascii?Q?zTKUq3gIMjspHtn/AvTE0OWPpK7K5qIHKbEd5svho4l6lcb+CS5CiOvJtwpH?=
 =?us-ascii?Q?jmhqxhwv4fFtWXTzkAvm1s2gwX6bWbXLwU1swkNGR7jMPojAvFhc8iPEkD3j?=
 =?us-ascii?Q?/+q9qhcvgNEbZ19ZJmt9WgUYBxJ2o0uNCj8YBkhBNkpgmFcqDjcJVdZn3RHz?=
 =?us-ascii?Q?LpFVF2SE//WD3uWgvoF4ZVygmcI/2+rYevKhvZwzLi2vzSfzLcTVo22mnv7U?=
 =?us-ascii?Q?IMGe2Mla6ZQWJGL5SYDudAy6pLy+W+zhxxmaGFIYXCz6VYl7QHU2Hd32IhJP?=
 =?us-ascii?Q?jPhR6pkkYYQFxiwWz95L/fCzY7+M6k/rTZIgXJjrqtbOlhVQ3HlUQWm37cmy?=
 =?us-ascii?Q?CTCgGWOCJPqa7QQvAF5zc/6uy67uKFt3pu6/zEofnQ+7qcc+PQcT7nlCEfD1?=
 =?us-ascii?Q?8feEpKglP/lLjjEWMhk6pcksUzjfohAMOWfTuKydBRGMKZjZY1IB+gHV1WUM?=
 =?us-ascii?Q?3WMM9FRpGiF0zI5CPfU7e8TV8Zfzn7ReKxIi4O31OPFHDTswXOWImeNNYs0B?=
 =?us-ascii?Q?PkVjgOdFGqd6j83xAonl7xkyIx9M8mSvwQkaWXAeqjmbj9VvkP64Lx5vEEDp?=
 =?us-ascii?Q?1DeOIr0uwfkrlmgG7mGirLiiIG0BS+huMI+pPSXHF+JdnMgjfuZXCtbDsnSQ?=
 =?us-ascii?Q?yHIFn6Kk32x3Tqbprhk3SP64ajVqBakEIWn3q7s4wfqLqN3ojkLWYVwhMa53?=
 =?us-ascii?Q?cI6AFkdg6aRuOG2iL4ezTKJvYNj4CTXVx2AVXDHpBxmNlRjtjdlpstNP4PI7?=
 =?us-ascii?Q?eNEBSZ7zuPXngMBQ35HpNYCJ+eJUmyy1pcmT4reuVsvGQv3kdJ4Wh0XuRBnH?=
 =?us-ascii?Q?CMAC9Zz/RDKZ/8gzrvOd+LxBafqF42hbSsLpT8362QOpkmDikoQOF5sjkMuC?=
 =?us-ascii?Q?YTpniWoNycLfdKYy4LAGKLGWIwitsEKT4M9/mhDEAqGlp4+xbscxks4cQ7Yq?=
 =?us-ascii?Q?a80DJI3ZJQroZI6F39wu0/LTDCDZDEHEZNM4wKM/w1yV+Ydvs7/1+kG4gH/B?=
 =?us-ascii?Q?C2c0Qiy+3tdgyAxl8vfUjm8VDKO4tZ2L06Ky8kIM2nOakfDC7cXt+m5ab/he?=
 =?us-ascii?Q?F0Ed1AduFqFxvUg0phzXyaVxtKTXttcKAjX+YGpVid7tKS3A20eM6JSNzO2E?=
 =?us-ascii?Q?WQSGFzvBGgSPHCAXGEwSGGZUHcpndFqVCKzB7EF0GotzEpz7lZkumDvCrUhP?=
 =?us-ascii?Q?A7lPQTDbSRS6R3cFx9vm5v35nyCss41X2t5eq6ThFZZaTGOSmWEY5fthTVPD?=
 =?us-ascii?Q?NLDTrXg8CMzf3CPh1DIlmdDDXxron2M/36OpP8T/qBeb3Ls+dg3dbJcTperS?=
 =?us-ascii?Q?Yqtll/hC+hf8Kio=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6vxouE6v5wL8+JNFvcLJ22n0O94y6mj/JEwM9Zoq5MgOsOZoYSI8KNtyxGhu?=
 =?us-ascii?Q?6pl2o6BhleEaJb8QL79Sbl5wobZF0wt+KE3U/AJDfcAAsnA5s30VJ9sJWtd6?=
 =?us-ascii?Q?0jtoleOq/8lVpBTUcoyu3ddsXCWcdwdG5LwdvPCE9Uuu+6w7FXo++fNHVBOg?=
 =?us-ascii?Q?apk/yNBKOsmIXfvIiaGEAgSyDQjhKhfX5SovYnk0Uo2WIvFkNsHi9H3otn1F?=
 =?us-ascii?Q?6f+/EvQ/OhIg0q13nIl1VOAU0O7eQNhSNcXNfAA+jX9G05zzy2gUlmE+C07s?=
 =?us-ascii?Q?pH/tdpKRxamyOzQwo5sYQrJqogQXFtJ+Iy73lV7AXobfKz5jQezwXaIikJPq?=
 =?us-ascii?Q?ZhDCg2Xkgnmmgmaz9V+fs/549cfLYD+K1r+zQBabJYKSnYeKoF+uqJckeSD1?=
 =?us-ascii?Q?/uAP9x5MfT/TCSu5vV5gZzRjnRg0QqbuhxbYBo5b8nw6QonszxcLkRCyqCS5?=
 =?us-ascii?Q?LSSsWCyOTjVU2yj5C4Lygs7Tx7wKWmJzHu8MpsfY/hZCskxOCz4hQrNDVU43?=
 =?us-ascii?Q?HQLoV14CaQfOAFFAKefIDxKbT5whrRx6n771z0SYJuEPeIBUANfnPImMoIWq?=
 =?us-ascii?Q?sSz/9rjQgmklwXEutAH3JOR4nISGWHby84el3+fjQ6F8eisv/LfX/SGMO9Cn?=
 =?us-ascii?Q?Lc0P+S3dLAcbWMvyPk5A7DkL2sqz/kZJBUTIRxEpjkeJ03pVSZwXkt+Yzuhj?=
 =?us-ascii?Q?9h8zeBvIOtozxF0cTHdmwO2w8RKXWDvwoVsUhJ2a4Oe9SHIf1T5WKiD6nZ1F?=
 =?us-ascii?Q?/zZQJJGCO0l+7axbsJXxffU99TSAfFV0kZNNcce0HSXGQGF5dC0IlKPvzDm7?=
 =?us-ascii?Q?isgjfxgR0m9X5XDdLSDJeRHHQV/uPzihRh+qLHdwi+HZaBE1uDMA1mBerSqm?=
 =?us-ascii?Q?i0+qg0PMJ8XbRWJS63A0AZYuPUEwFtmvLhF1viXqaW8ZupvXNKs0gCT1ZiJo?=
 =?us-ascii?Q?OwdKBGIYRAfvp9SIYVhfDY69YqnPpbymrN7pJe5vGlwr38emyF62FfnqjRVr?=
 =?us-ascii?Q?CSG9NRcfwVMjExcA+RDkebmdPGIo6CsdarUcX0nNH+3iCwfvSeKpk/7HkXco?=
 =?us-ascii?Q?B4TtFIgSjrJDu1o8bp9k5INMZvSzuO69pSO2vvS1kMdEz5H1WER1Uo0v+5Hh?=
 =?us-ascii?Q?jSXCCNC8RuTGzr1O92MSQzw4d0uduHAoRv+hI8oOX8dwcxRn5AVUpqfuRL0+?=
 =?us-ascii?Q?BoZYS0ePo4Va9XsUspZM5h/+rGujeBLWLSD4xg07AXQbal0z4Cdr+Nji6K7Y?=
 =?us-ascii?Q?yDbROFdez/Lvp184a3mTMGWjz9+kvswPwTPP98pBpEj9FWNWz54Cf1Nb1lfb?=
 =?us-ascii?Q?rhV1XkeFIlKg+ZSMPhe9SPNRWOKe3Dw2cCgTuIxNowFQM4BASMBPUaYCRFbB?=
 =?us-ascii?Q?Fzc+RH0fmSB7GmBw8wWuvdlsuSiyWlFVwA6fmBJHgDqXyAuIFovwPAIs//yc?=
 =?us-ascii?Q?Bz6YW7elrwcjDUjntij6W8rnSOrJvtd0l6WsMz+8WTXmE8Mi4ia2J8ixel1z?=
 =?us-ascii?Q?0u8IOch/K/41C7M0e7txBkxXDxnhnDq65GGbYxyMz/Dhia9gzDCyQsev7nCH?=
 =?us-ascii?Q?n63MPcmH0E5Im0I3o7g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 261d04f2-6cd6-432b-73b0-08dd1eb65b64
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 16:17:52.2235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0sBVBF98DTRxZ/wfIhj/us9TZ0WaKMIJJOy5EL1C707x4ZlU3NyjHJXwplUPxg9h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE5w4efzavYZuQgZPBG80IJgnb7fOGrxTguX4W2Jqfs=;
 b=2ZxVG8eJFU+ZdshG7wbz3Qk7EkWTXU6n4l1s+SZTI17q57OwQXhrrQedRVp4c1k+vXaFIjx/738m+AeW2oMMgspHMB+FdHonFG91OD4dlpdxapNo3OGWIOPA5bhrEW2i6IssGSq14nxoyOmzawO3G58c8gOgzacrs8oeJCa2KwY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2ZxVG8eJ
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/zynqmp_kria_kd240_defconfig:
 bump to xilinx-v2024.1
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
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

> Hi Michal,
> 
> > Hello Neal,
> > 
> > On Tue, 18 Jun 2024 04:38:48 +0100
> > Neal Frager <neal.frager@amd.com> wrote:
> >   
> >> This patch bumps the zynqmp_kria_kd240_defconfig to xilinx-v2024.1 which includes
> >> the following updates:
> >>
> >> - Linux v6.6.10
> >> - U-Boot v2024.01
> >> - ATF v2.10
> >> - PMUFW xilinx-v2024.1
> >>
> >> Migrated u-boot to xilinx_zynqmp_kria_defconfig, so uboot.fragment no longer
> >> needed.
> >>
> >> With u-boot 2024.1, CONFIG_SYS_SPI_U_BOOT_OFFS has a new meaning. It is now
> >> the offset between the base address of the boot.bin and u-boot.itb instead of
> >> a raw base address of u-boot.itb. This allows for A/B firmware updates since
> >> the u-boot.itb is set by default to a 0x80000 offset of the boot.bin.
> >>
> >> Thus, Kria SOMs come with the following QSPI address table.
> >>
> >> Partition A:
> >> 0x200000 - boot.bin
> >> 0x280000 - u-boot.itb  
> > 
> > Now I realized there seems to be an issue when using the flashed
> > recovery tool to upgrade boot.bin and u-boot.itb. The SBIRT recovery
> > tool does not allow writing at address 0x280000, thus using the current
> > flashing procedure leads to a non-booting system:
> > 
> >    U-Boot SPL 2024.01 (Dec 13 2024 - 13:41:04 +0100)
> >    Loading new PMUFW cfg obj (1836 bytes)
> >    PMUFW:  v1.1
> >    Silicon version:        3
> >    EL Level:       EL3
> >    Secure Boot:    not authenticated, not encrypted
> >    Multiboot:      64
> >    Trying to boot from SPI
> >    SPI offset:     0x280000
> >    <system stops here>
> > 
> > Do you think my understanding is correct?
> > 
> > If it is, I already have a draft solution, which is basically creating
> > an image just for the SBIRT tool, based on:
> > 
> >    cp boot.bin sbirt.bin
> >    dd if=u-boot.itb seek=128 bs=4k of=sbirt.bin
> > 
> > Do you think there are better solutions? Otherwise I can finalize my
> > draft and send a patch to Buildroot in order to generate a working SBIRT
> > image from Kria defconfigs.  
> 
> > not strictly following buildroot activity but I expect Neal has started to use 
> > binman which is enabled in u-boot/next branch which generates qspi.bin directly.
> > It places based on kria defconfig u-boot.itb at 0x80000 offset.  
> 
> > And that's exactly what you are trying to do with cp and dd command up.  
> 
> I was aware of our migration to binman, as this will enable us to remove all
> the kria post-build u-boot.itb fixup scripts from buildroot, but I was not
> aware of the qspi.bin!  This is excellent news.
> 
> With the qspi.bin, I retract my previous email.  When we migrate the kria
> defconfigs to binman, the best solution is to use the qspi.bin in the
> genimage.cfg as this file will work with both u-boot and SBIRT flashing.  We
> will make sure to update the readme.txt accordingly, as well.
> 
> @Luca, that said, I think we do not need your patch.  Once we have the next
> u-boot release tag (it is coming sooner than 2025.1), we will have binman
> support which will clean up the SBIRT issue naturally with the qspi.bin.

> That solution obviously looks way better. And if it is coming "soon",
> I'm not going to send any patch to implement the cp+dd trick.

> Thanks both for the info.

You can find the binman patch here:
https://lore.kernel.org/all/35bc47a4a4799c5f5dbea56a45340a2810538330.1730452668.git.michal.simek@amd.com/

Along with the definition of the qspi.bin file:

+#ifdef CONFIG_SYS_SPI_U_BOOT_OFFS
+		/* Full QSPI image for recovery app */
+		image {
+			filename = "qspi.bin";
+			pad-byte = <0>;
+
+			blob-ext@1 {
+				offset = <0x0>;
+				filename = "boot.bin";
+			};
+			blob-ext@2 {
+				offset = <CONFIG_SYS_SPI_U_BOOT_OFFS>;
+				filename = "u-boot.itb";
+			};
+			fdtmap {
+			};
+		};
+#endif

As the patch is already submitted upstream, perhaps I could go ahead and add
it to buildroot for the kria defconfigs.  This way, we can add this support
now, and then back the patch out of buildroot as soon as it is included in a
release.

Does that work for you?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
