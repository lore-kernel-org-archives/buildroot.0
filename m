Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1099C41513
	for <buildroot@archiver.kernel.org>; Thu, 23 May 2024 15:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB7340823;
	Thu, 23 May 2024 15:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4loUK0jaesrn; Thu, 23 May 2024 15:57:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6496B4064F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6496B4064F;
	Thu, 23 May 2024 15:57:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 964031CE550
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 15:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8003582525
 for <buildroot@lists.busybox.net>; Thu, 23 May 2024 15:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acsmbbAYElNe for <buildroot@lists.busybox.net>;
 Thu, 23 May 2024 15:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2416::601;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 340F28250B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 340F28250B
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 340F28250B
 for <buildroot@buildroot.org>; Thu, 23 May 2024 15:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sqt6mre2CwpuTZi9xGRvayfKrpRLEgji/V8Y3V2RSBfUP9EAHTE1JWTKcj7e7eNRda5J03AXdKZDrlWWwmCu7pCYSeyrEarMY9Ah7KvLjlPLDpAHT0Y11b+9vbLrPaPFwwwweKIwY+C++xEJzX7wnOOeoHRSiMN88oNDODfRQ2yW9dmH7/vTAdsfAaZRr4b9UUMlTN9iVVhyxOkyu4G9zJN8c1BfaK2NzBywWD5u7+71sxJsYKkQ35abUwMRrZmLA7AlKG5V6hoN/nV2NaJWJ5d2ZhsxEqw0N562finlhD5uJeW85IG14JLkcrLNS5+9LjdQyjkxrowLI/XlnTCXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRihiSvivDEP4XCOYvb9ZetimMs5cNnPQO6RWFpM+Sw=;
 b=lzSOVld/cMLaqg15ctZdaw69ZPB/EwQJi1IOmljUVcCPwh5oYSYIiKc+v3NFOAOaOUUXObnCfGasSZvEQ1MuwPMjE3JTWhW4xSqsK+LangFM0oAWBHwKMOlAogQKqm3pRGOPeDeCI2MZXfyHkFecyBplTMmHMF3M7W1Hv5Tl3Y9EVjRM/ljbUt0o3YKPsJP0ByrzXp/+4HZ04yf8OKbzNNyaSuA4Yx5HSJu6i53xtnXG6QWE6+vwG6mRP88WUjWJ3xG1XWGtmXd3go8gXkygqgcABJkSBTlFIzwwMxzkOw4pfieh2s4fGPigszOxQ2Gg6w//IfiZc6KmX9IDGsa85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB5004.namprd12.prod.outlook.com (2603:10b6:610:62::16)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 15:57:24 +0000
Received: from CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b]) by CH2PR12MB5004.namprd12.prod.outlook.com
 ([fe80::e6c1:191b:641d:4d1b%6]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 15:57:22 +0000
To: Brandon Maier <brandon.maier@collins.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH] configs/versal_vck190_defconfig: add hashes
Thread-Index: AQHarGMGoz5QfJpYlEmY1g6km7tPO7Gk+GOw
Date: Thu, 23 May 2024 15:57:22 +0000
Message-ID: <CH2PR12MB500492AF5FCEA01A7EE55E99F0F42@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20240522161338.1278400-1-brandon.maier@collins.com>
In-Reply-To: <20240522161338.1278400-1-brandon.maier@collins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB5004:EE_|SN7PR12MB8603:EE_
x-ms-office365-filtering-correlation-id: 22815b9c-4b97-4014-b101-08dc7b41083d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?NMAwgIq2WmXuteWrl/kW8N5bYAhFlUbJtbo07jJOS7LPRsGYOByV2aX02kET?=
 =?us-ascii?Q?wlk5N4AD83PP0CYRCGMbP9AW9aPi6Y5qmCL3kDViFU0RqHTolJrFsCGD6gvW?=
 =?us-ascii?Q?WfDq8yHjZuv1STclV0aaZdS2XScRMWiXrrNXe7F7RSF7T6IDhIdntkQG7jFL?=
 =?us-ascii?Q?V8C/S3JcE9ArYjNHpvjITEK8rl9hTu7g2Ebyp2B+solNuOUkLLdCuYwJvWks?=
 =?us-ascii?Q?YraOFcnocFslx3dvavSd2e4iVT4MG0FaelL/ECV0PNr8lYEEnpyQh+S4OcVk?=
 =?us-ascii?Q?eSALuNxRVfstmVqAFEsvpIaxKLu1xtimNj6WK7dqdMTkdLamfzDRXhfIzwJA?=
 =?us-ascii?Q?HuxChv1Unri8bC+f/913pJxJR5WybLX8Ke7HO4rDAxjePplqfpMiUhXCKIWJ?=
 =?us-ascii?Q?i0mRcFugdvRBAQsp8qBoCFjklFMRCf5w1LvD8VALMeMlfz8oMZBGVWGnZOuC?=
 =?us-ascii?Q?bOK1lSbIzvx5r4T6RZq7xk0PhPtnG/S6E5NXi7HcMLKbULlGAhBGOLECXKzI?=
 =?us-ascii?Q?rK4WI2Atbbd7GC8Lx9QB9ZwbxP53MfzT7mqDxt6Snn4uupE3DfUNVy/W5MbI?=
 =?us-ascii?Q?Iqf82GMtnz6bU5V+BeDYWsD9s7M6gtsz3UGb2ESMTdPVKudr44iXiupiwrGu?=
 =?us-ascii?Q?Hsf+vEWVfoQC8UQ+r93qSjexClZ9CfkO/g0HrDajrkuLNT8hZf7yyw2LwTu/?=
 =?us-ascii?Q?VbDz9eG0Xab2hIlph3eLa47oCtq3GOwMXjD8O59k4CqhUONBR1FjD2xRLwma?=
 =?us-ascii?Q?H7jwHwX9tQt3S8KJnkmUj0QKYi5bJ3L7vdD+CCXqKfixVvVRCLShTfKsOb7J?=
 =?us-ascii?Q?ccYtCqQla2tHUVcYmiKnA6Y0srabmCarSNNHNRru+tVD+YpxRbhVMbJWI4tm?=
 =?us-ascii?Q?YI8DKwtnt/kxExxXdwevDSGzE+3YLuFSt+K9z/HTPWs1G9CTzbDoOhk6toB+?=
 =?us-ascii?Q?hSFIn2RrskofMrM1wOwlz/giEHT5bPWewXZYGwZa2HamKL/m/pkeZte9cI51?=
 =?us-ascii?Q?u4NK28tqP/BuRFa3A9cRB5bkzwql30nhu+tp5mByztZfTj1o5m9dvGWaC5D5?=
 =?us-ascii?Q?6WtiiNgaMJKXPkpUeDFLvdbX1tXKNDhP96Nk38mvlaW6EfHPjUWoxOETsLV+?=
 =?us-ascii?Q?35q6fQVsoz3tb09hSk3xehi5JgyU3S+ypwQv98Vqf3mf4s2J1etC+X3TdFi+?=
 =?us-ascii?Q?vTObyIkH9b8khQmYnz/2rxtBAmJ3JPUioHR8cKhi0IDaH9wF8dod+Gg0txi+?=
 =?us-ascii?Q?xn7VAUcwn1ZPv4WjMfZtLG1um7/H0WbiqQnlgGw8WQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5004.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dEtectKoIvER8doZMKT2W6BR/xfQRarPJkz/Z5k3bN8bW0YmgE3bGQ5fKW3v?=
 =?us-ascii?Q?MuI69mYNlfJ+6aGj7io8Kvbw7vRJnNES6XyaXGvttyYLzwV+Hu990eg1PhaO?=
 =?us-ascii?Q?MjvrlxMR6qaJSc2Pev8u+Dk0NORHF1NDCWJ24bWzCNxBjJbRmxm1uqiMZNUj?=
 =?us-ascii?Q?dIe0LOG/z1HjeKhUCtPKi7dxfv8Cr8aL+mwsICJ8jEOrDMS5W57v+3zmbzq4?=
 =?us-ascii?Q?yP8uP/PwgivIo506XSA9cbfkQAd0DINYhCOTN0mKlkvCTe9nIj9NYgg5qZOF?=
 =?us-ascii?Q?fhc+l8TIj4v/UhFq0k+gT6PEB1sOpwtUBfl5tNp1oqBK+26kjfeKAVmA249E?=
 =?us-ascii?Q?mK3YIqovxrvjc1jnMjzlGZBExvCJECU0jaUSrfAvACw6qtAo25nKeBGxc+sV?=
 =?us-ascii?Q?pE9oSuKmSZ2QSIAWw24bHGkk8jgK9PiXyLUhMeb1X5xkLhr7SSodkGZwNOLA?=
 =?us-ascii?Q?CdWhL1YC9/1x9KHqcBoIezPmMMogIjNGeSgSGeRTHVsJAomy38AyDNZByvPx?=
 =?us-ascii?Q?ksHyydoP0ZS/cGoZWBUB7j0m1NAMkB3/Mdv3Xa/zoqfPIgs8k0fgCzayWnPr?=
 =?us-ascii?Q?3GZU6gWDg5wBR9jSegLANZmyFU4Ow/pfdr68e1Xo5uEHAOtx19YYP+3d4vAK?=
 =?us-ascii?Q?GbOA7dT4PlwBg8C4n+n1tDQCQy8Kx/SGgzYPQa8ufMYlsEKwCsNwHLVLVO28?=
 =?us-ascii?Q?MwglmwzoiQDbzclNtkhhKfK2UA7Wdms+RkBYVoRJaanvmzqXLUcskeioyxC5?=
 =?us-ascii?Q?4BwRgbEy8bH+dFTHlwbwJH6JaQO3Xn0O6DkoH0u3J3sPaotYnX9RaMx5OamP?=
 =?us-ascii?Q?bJaUR4Oo3W45YD2+b5o+HB7LxN3twZcbgAjN82VMa8tKcI1xFnzH/5Xw98xi?=
 =?us-ascii?Q?OLW+CRA6pvipnGWB/EDFuAdxk9GbTV/9NDCGGuVJPMPorV626NaswX1oCtEo?=
 =?us-ascii?Q?XwguUucwwvsU1GwJ0k5qwOkM3kfUxFTDw5zkHAA+DvlML+KrAhfmU/DjV6Tr?=
 =?us-ascii?Q?w8eDfs6WTrsiZN6p3UN8jHhhSuFkAsEmejAef1ZOcg0lQtPA1Br1VU7Kfsft?=
 =?us-ascii?Q?1/EqKQdiQpdqqRA2b9NthrJNT0yVHwJDDKF2cd0hjw7/KZM1wp8nMKrvTKzg?=
 =?us-ascii?Q?w3u6VacNka3f35O2En1rwO+HfN8l7FdPG4wZ05bVRTHXCCSheAe54HapZkCm?=
 =?us-ascii?Q?VumoBPCwAsmNIqMfs3To5hj5o2a84eRI0U9hyaM66r0/TRlRJs2y1lR7t4E5?=
 =?us-ascii?Q?vQxA5LtlwkCj/azRq3gXi4pBmzYtgrS0LeNgrmxJovq6Dsp9yJuPnk88wvGi?=
 =?us-ascii?Q?1oiLtt1p+T079xf0wV3mHbx3yj/aaQUvYgD/XGek0qrkssons52ar3IWym6Q?=
 =?us-ascii?Q?IhAxSefUP7sFs2oNbIcPtaXyml2nhaSyhdZ4HDSxNCj70o0yyz5v+9KOgB13?=
 =?us-ascii?Q?N1Y7h+EFVgO1RrUjYsujBF/7GNDdZk4uwH41QFTMs8jBAbkLuozJ9v6sQWaZ?=
 =?us-ascii?Q?hfG69oTLwVKHO52RnyrCL4YQMAYhbR1INWahgkv5H4r00mkZD4dqqhNvC0at?=
 =?us-ascii?Q?KbRylpolS/5hVZJqg+vpZS66PRi5++XoMkmHsGjb3+3nEFMf/fjIOXfHOwxY?=
 =?us-ascii?Q?9h72AtDI+yChFlUIo69dGFo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22815b9c-4b97-4014-b101-08dc7b41083d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 15:57:22.0711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYA4SWP3nTOa4yR9iTbejsXSuPfjPia5SP+fo36nKGAhC2vtRtmH5CZ4w1B+jiaZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRihiSvivDEP4XCOYvb9ZetimMs5cNnPQO6RWFpM+Sw=;
 b=Sh4xP5a0gyeEu+UEh4lY53G+tamIgqG+/fjiDd92Q/NfQj4hzmYHaauqkNMLThGYyZoMmg+tV1+d6tQSnRP9HwvPKGISh4c7kOmvOnHJsK4YFs4LjdhqAW4r0GUyV9FN2B8VusXuKlchxxfsN6Z7y1aE6SMqoGbXv+PFrphWKNo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Sh4xP5a0
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH] configs/versal_vck190_defconfig: add hashes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

> Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Thank you for this patch.  It looks like we need to do this for all of the
configs/zynq* and configs/zynqmp* defconfigs as well.

My only concern is that this patch conflicts with the following patch set
which is still waiting for additional review.  The patch set below changes
the versal-firmware package from one that downloads pre-built binaries to a
version which builds the binaries from source.  If the patch set below gets
applied first, then the hash for the versal-firmware-xilinx_v2023.2.tar.gz
file will be wrong.

https://patchwork.ozlabs.org/project/buildroot/list/?series=397588

Could we apply this patch set first, and then go through and add all the
correct hashes for the zynq, zynqmp and versal defconfigs?

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
