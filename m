Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0D0CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 06:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08BC844FD;
	Tue, 12 Aug 2025 06:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-RmmQthDzpW; Tue, 12 Aug 2025 06:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E5DD844F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E5DD844F2;
	Tue, 12 Aug 2025 06:13:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F208AB8B
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E42F541E5F
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yS-nY5hTvR54 for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 06:13:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2418::624;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DFB841E67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DFB841E67
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::624])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DFB841E67
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 06:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjeuYCYc7MHUiDPo95UJcQjrj/MRvPJ7kwzbxCJxWiF/i961ulUrEU8KdQ3zO/8AN8qIQnMLlNbWI3ZHLnMLshvS6EEHW+76Fxa9BhxqA0HoXA+9j4wtNpqvHkoRmAgRHA187zzAzXLQW6MAqE3gyvAqc7GKcqUy58CNm0K0PxaaueajMYs2BM+f+lJi5OV8om0JIy2zHTRZPp9UHSyZ3+bgIsRjz/mRDUWiU+5a1LvTL6ECwzxa32w6fYODhQJh1lISeLm4Pc8PHLqDaVDByUOKox0ZwJhposuZAAjFmPd/i298xgxfbumv6STeaRScKI3IUoPBhjmGDNRu3/fs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlH5JcbdNOfRI91L4NDhYzTQo+9r9tJ5qRAXIVTpvZY=;
 b=Dy5jwDXlad7SuqTD4q64mrLT7wIGtoDM/NEgGcbKv26AzWYLItXBWJU1xPDBhpf0gdISFPdi9howcLcf/gzV8L0OLh3PB+ZR+h07xD6iq+P5eonkbYqoD6U+xAVNSIbdsoYD+BJkQveHxq3C6JpMacubFAyVof81r7aJ/nIbTLUiQUJ4d1Kv8Gm81o9kwD+eyQcDlw0Nvpb1CgDCFkKjAJUaIJgvKyWcGzP62Ltm159NZ6lh+dNXi6g7xXhLVoeHr0rFOwiosHfSeD0Ec0ku0G5pEgI45IYJqauULbutM/HWCH5J39RAdN3W8t88M0+JO68YjzCQmYCpu5MrizHc1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 06:13:00 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 06:13:00 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, "arnout@rnout.be"
 <arnout@rnout.be>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "peter@korsgaard.com" <peter@korsgaard.com>,
 "ju.o@free.fr" <ju.o@free.fr>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>
CC: "Simek, Michal" <michal.simek@amd.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "romain.naour@smile.fr" <romain.naour@smile.fr>, 
 "romain.naour@gmail.com" <romain.naour@gmail.com>, "Erkiaga Elorza, Ibai"
 <ibai.erkiaga-elorza@amd.com>
Thread-Topic: [PATCH v2 1/1] boot/xilinx-embeddedsw: only allow apps for
 device family
Thread-Index: AQHb/ulYo+cxiCmX+0u/2/Gmy2Hiu7ReogSw
Date: Tue, 12 Aug 2025 06:13:00 +0000
Message-ID: <SA1PR12MB56157B22B3F7F8E186DE6951F02BA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250727112633.3245247-1-neal.frager@amd.com>
In-Reply-To: <20250727112633.3245247-1-neal.frager@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-12T06:11:19.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|MW4PR12MB6924:EE_
x-ms-office365-filtering-correlation-id: bc0fb1ff-a330-4654-7e38-08ddd96749e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wxi3N1AjHSK/uKW4SGNQKpMEICMEcjaF08apjiXMfM580yo/3njOj3bmovZo?=
 =?us-ascii?Q?hfpLImI/paxuM12ybMTZtajfZvgH6OTcEf/co0sdPHJD+Dl7JuVsQgrvW0yn?=
 =?us-ascii?Q?lvPcm4RPcMro2ti8mCFB3wGGAzv6va8mIJkguaHBlPLCadrEwvANhM4EjEV5?=
 =?us-ascii?Q?yI3qc48jeHLfv4aEATpGGppeikJuicCOjDMujqF6KWueI1R2Ot/hcrYWlrnQ?=
 =?us-ascii?Q?NGHHwzxqlUcZv1zZjegMF4kNIsBrv/HL3z2e4QC8IcHE1IPVYxa57mU4BdgV?=
 =?us-ascii?Q?GwynE0kzDhfXyO9vLFRV0RMUvucgCG9yyPOinTejH2xlaXlDzVuwxF+LL6mj?=
 =?us-ascii?Q?foncFYPbEkugyy/UUQLx5gY80i69/QAsIGZCcSeLDiG0n6SM8sAM25pAF7AB?=
 =?us-ascii?Q?RLUc4pdS+NWggTwUtdXq5vi0bxRkPfjyPCu5DGqHPsQ5kKBBQxddngUB+3cs?=
 =?us-ascii?Q?mP2ibLAa2K+5tqIKTAxFp4qRbNs+HjSaNhJV/EcPfGlwL04iRC1gpsNfPBNb?=
 =?us-ascii?Q?eoFhAyRZTQghj6fCkQ3f+9v/+8vFTVsKrLV4qR5bjnUfjjiPUjriBxI2j/po?=
 =?us-ascii?Q?najkrp4LVfwjNmBU/IX9fvT2obONxr+tMFGUcUYI5pn1VVdMLsblSlvUuWNA?=
 =?us-ascii?Q?werQgrHx9lvJuqXsYsrZ2Ah0RHgphiBa4gFtpwdn2G2FBEJe9sC4MEMFDmUm?=
 =?us-ascii?Q?gFKJibp8ASQHp0s8LmgX8X8KYXAmIsxjC3kev/usjSzU/8vR0LN+b48NnQDK?=
 =?us-ascii?Q?A5mm2InqIlfdv2zP+k9qGz9fKzf7Oy16o5fhj4KL4wxDwb67Bzkt+xjlKWlZ?=
 =?us-ascii?Q?CtxTjPg1WqKKCKyQ4YOWuvpWFlZn8hBWjJNvMJXU2cuETogSAR++s6O/AEXB?=
 =?us-ascii?Q?rvTX2udVpVD5ws+ZTCnkwbGQG4odHuhg8DaWXVvnY94jdkFGAVedcwvoVMI7?=
 =?us-ascii?Q?jFpk7Squbobraq/QCo86qG9eYtIFTy0BjvqEJfuj60LceEp/TCOFmMi7f2m8?=
 =?us-ascii?Q?uCpK/yTddPYBb4eOHs6nL064pHz7qyXft/8NtpQOAjXOock1GUIZbCnW4/Fe?=
 =?us-ascii?Q?e+WhXGZlMomxgbwkMzEGIhOouLEFMSVD1N0IPGOEfsGKVQuODdzp1ccQHdZs?=
 =?us-ascii?Q?AtQ0k8FjEhsf6Xo6OhGjwXFraLke68t5K/AkCQvTozE4g68AFqrTItrIS7+/?=
 =?us-ascii?Q?yjMcqmeGPmnNz9rTp9uGuS8X5qgfTA8xjn3ZxnqkQ6m6OpNVXP7BblNqZnzh?=
 =?us-ascii?Q?EXUVAki8HJ7TA/RgqA39wWbAgXbTANbl32VujGEa8IepQ4sXgcO/PzW1khSO?=
 =?us-ascii?Q?LXHmfKWVAGnkL36PEKmv99toT83a/VYH6HEnb+krBSI31iJ4QQsjGVs+53P3?=
 =?us-ascii?Q?jw626ikq2YG4ELlfymeQJTXd9fs1OxhaatpYxPOR/GZin9sZCF3K9kzvjc+H?=
 =?us-ascii?Q?xcJ40wLuSX8YdJv8VxhrEWBVbiF3lPJYyoBg6MWgUgnry/xQbvAy3bjJRGN8?=
 =?us-ascii?Q?vxiPkts2ENTo6kLgEnV6QgV/ZRduR/Z7Arwo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O/galVo3bus1nCAJIGwmifHTsF2J8LnDV1/cMsy3JuuKNj+HCEg4j82ItTZg?=
 =?us-ascii?Q?tPfPuAMfekdEf378cdLklF8qIXLxfnbmWpM+WKSK7F2lQR7OnedSfCyiVzmW?=
 =?us-ascii?Q?kDwu9oe9SX+FwSM/IKI8K0TNCY0u8FrjpNgeLjRJt2e3xlp+QenzSzIZvGkz?=
 =?us-ascii?Q?ZL6fm5p2/okvJvlAznX4mrp84ikYVHAxYJCM4q4NuCdBB5agotPrUjCIBzI3?=
 =?us-ascii?Q?BOgMKa7w1PBYLa19YsGFarJKOiRVQ1eP7JcW/1Y4jmnKoVP4d7lT/yXWAwVG?=
 =?us-ascii?Q?fQm9AYfDwmAhRFxa3uij2PbMdksEjtVn20+60UsixvRu7PBMck6an55+iSLv?=
 =?us-ascii?Q?xaWSigJB47iVZ8YUoX/jGWbP5m0dXfsm+Qk0BtVIxcglRnsDtaR1VozSFlRK?=
 =?us-ascii?Q?fK603poRButTUSLnTGw1yTIAGVt+XnPUeMhU+06gY3qvVPKyoSgFL9soerHt?=
 =?us-ascii?Q?4btDJyjiDn0znSO+TpVSP1yBG/7pxCGUpwXmcf50q3IKvcqjDUWaviGg+OIm?=
 =?us-ascii?Q?RVrjfKu21wxX66hqsV+U2dXRR7oJFtGCEH+gCG4iOPCHb0yidDV8Z1DR3ml1?=
 =?us-ascii?Q?G2UOXQqMWuecb8i4KP9AlbY8g1iBwO0KZU4/HXUeXXexC4A8ozyn4Jw8Otbn?=
 =?us-ascii?Q?auev8myFWsLenX1yxBW3uivCSEHWjJkOzuE9X/UhuYhuNf64fq+O0of4Lqmy?=
 =?us-ascii?Q?NXunO0ignN1et/DScUIxz2yU1Axp2DWLLPDVCZb/TbPd6wFYJQTgTMvslwBj?=
 =?us-ascii?Q?4/8ynVRk6g5NuIGvSnqo1BPXpv6LnFtH0B+KfrF0M1DxCCW014ojbA01NqLD?=
 =?us-ascii?Q?Z4iU/YIYvAqYeDHjvWyPBnFCAfAKaY3j5j8m31sSyYF/pGlEvVjVIjsCKG0O?=
 =?us-ascii?Q?SvLswFOAoRkxYRkv24IWgLILWSfsjQ4G+0IZdf8gDC5iH/5BSK2Nwkb3pWk1?=
 =?us-ascii?Q?f2ehqvsJQj3UfRNrHSY3s6FYsTkU1t2KMBozQ+WjKU4n3ClM9+VC+3yGufee?=
 =?us-ascii?Q?/3LL4tciegaJV3EwWkzSlLsLShu9qGyQtKCRlUsDkRVqrB3WPCZKXOm8l2LU?=
 =?us-ascii?Q?0q0jJZf0TCkAa2FPDHWIYc4DHAzVfl1kfM2RdZ8wXIntcpdhJ8pmR7KLaV8D?=
 =?us-ascii?Q?gZ47sMAYTVSBi0nuelIUivrd5tYroCgMgylWpCtmBu3wHppBy4l/FyKuF3cV?=
 =?us-ascii?Q?OiWDigHA471FFEsLeqfZ7Y77U3Y1Ecdk7I3jrE/gnedE3eYJrhH4xNvQ9q0r?=
 =?us-ascii?Q?gIVDTBQ7KOZTACQr6dG4R+pU+dKcoB0K8+wAtHH1anNZkSYr9pHtN8STgvM3?=
 =?us-ascii?Q?vphUb+l1UN6hIWMsyTWxDaywp+w1itugMvMoUZ96fW25RBFoARgnwggaurYE?=
 =?us-ascii?Q?1eKCRVpt/tZL6+aixOCl64EnEHz8zQlPG1G/mNglapLEQ1AlXibuQi/neLAf?=
 =?us-ascii?Q?3zhheNqZaPFKB0Pd6yreT52CI4eWqpSLJwTL9sriF/wP4SNzu6uZD1j6JJz8?=
 =?us-ascii?Q?d8oZapm2hv4/jeZDdlMtvCzUYss1Jv524q+SpzkafHZNy1OL1X/af1/2Daqr?=
 =?us-ascii?Q?WjTJJXsCJYkRlN1+/w0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0fb1ff-a330-4654-7e38-08ddd96749e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 06:13:00.0571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6M3/eD/JAVMmK6f8Z6IpmD0BUYeHur4H2+Jx6/Dth1R67FuBIxz+75Q3KM51XBl4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlH5JcbdNOfRI91L4NDhYzTQo+9r9tJ5qRAXIVTpvZY=;
 b=Gew3I0kNOOW5/byrckdsGY/YbBAozoQAfOUjy4q/oCe2Kek3yl/oAEBpOm24wwojcC++yiDVS9lwrnSmUsLbgB90TeXUuOODnwa4c1RR4uDNY2x8zx1Rxw32K4tlMrkprB5XzTqSvfatOtPBsDR9YibjMbIt88solxCWK/crU0I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Gew3I0kN
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/xilinx-embeddedsw: only allow
 apps for device family
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello everyone,

Just a friendly reminder on this one as it has been sitting awhile.

Thanks for any feedback!

Best regards,
Neal Frager
AMD

> This patch adds an architecture cpu dependency to each application to make
> sure that users can only build applications which are applicable to their
> target device family.

> The versal_plm and versal_psmfw applications are specific to versal devices
> which are based on BR2_cortex_a72.

> The zynqmp_pmufw application is specific to zynqmp devices which are based on
> BR2_cortex_a53.

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - Replaced new family variant config option with an architecture cpu
> dependency, so no new configs are needed.
> - Updated patch title and commit message accordingly.
> ---
> boot/xilinx-embeddedsw/Config.in | 3 +++
> 1 file changed, 3 insertions(+)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
