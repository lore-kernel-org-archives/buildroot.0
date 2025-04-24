Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476D9C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 05:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9930D80E2E;
	Thu, 24 Apr 2025 05:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cS78mvj6uFuh; Thu, 24 Apr 2025 05:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F57680DE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F57680DE7;
	Thu, 24 Apr 2025 05:32:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 227E82A6
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 05:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5878460789
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 05:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2Aic0_8Lcu0 for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 05:32:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2415::602;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20BEB6078C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BEB6078C
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::602])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20BEB6078C
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 05:32:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SewGsH3PvdnrlgtKHHvWk1Ge1JpEXcBNZpcLEm8ca5QtaSOKFkCWUg67XtUe7BlYgGyx4a/Yrx9jrAv9TDW6qi3+TobNzI+SoS/vO07V11kBTPv3L30edT09eOHVm/MjS0TEB2Lf1CLagZKQMgxov3xz/OJJ3ikxJXTHz9ExXARwUjoCdYSD80VuORDhq3cCUr0MEy+pJ53ERZ5/GTD1Mu688SuT3H8rpkCFnIRWsgm5nnw0Oi65LnweSDOHzQz3+2Yt0Lr/SJ0bJwBU6Yyw9Tzt/QN1DuxvS9k686OEdbB9o0sygwHUw9Cqy9Qmk+Mguhbbn58njkcIvzA7pKnPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjAghFGN9hZ8F79so8b/YnmpEUxp6W+8n0Gu3GGQXKU=;
 b=q6IThcReGwI3QVcvwnVwtqH4VAo8GP/8Y90iqfSx5/w6fpPKoZzirkm+DmePo48cBg3U1+8fzrDfRqM6fDzu80seYvPtt7ItxT/1ephJ2XBovedifEulxjbrukn6TSFiB0+uFglLMHOqCSXikoydnJyYsp1U7nNZDQR4n4F5DXnkC039ysDTr5GxhNIrbm/QKNNqr7POhPTkZKpQmTjtmOuT2XQ72OYPf0FqFCQjgvz55SAFI068ipgN6U2BDAh552T60THY0kH8wHOMalGEfnfu31bG8zYRj4js3VPHVOahx3C9AXQL0Vcah3WglQJR3qNw6JyJcIfvM9lzaSWxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Thu, 24 Apr
 2025 05:31:58 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%5]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 05:31:58 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Neal Frager via buildroot
 <buildroot@buildroot.org>
CC: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>, "ju.o@free.fr"
 <ju.o@free.fr>, "Caccamo, Fabio" <fabio.caccamo@amd.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek, Michal"
 <michal.simek@amd.com>, "arnout@mind.be" <arnout@mind.be>
Thread-Topic: [Buildroot] [PATCH v1 1/2] package/fpgautil: new package
Thread-Index: AQHbqHwzEb6M/nIU9ky/Ihkd+Pn2rrOwO1mAgAIlo/A=
Date: Thu, 24 Apr 2025 05:31:57 +0000
Message-ID: <SA1PR12MB561566BC39D926C9E2AE0D64F0852@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250408114834.733285-1-neal.frager@amd.com>
 <20250422223601.1ca5077b@windsurf>
In-Reply-To: <20250422223601.1ca5077b@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=ddce7ed5-55b0-403e-83a0-6b4d15176bdb;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-24T05:23:14Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|BL1PR12MB5804:EE_
x-ms-office365-filtering-correlation-id: 50e6a2a6-fa34-4f60-ae1a-08dd82f154f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ktyf03mekWlpvZaF+Ojhog3qhBQVS54abKRnWllpbYG+kBMc7x4qpZg6O8wr?=
 =?us-ascii?Q?huIjVx/T2c8WtwgNd6WEIfQBsj3w5uS7UT7Ay0YFtQXW4lmq/SenWocUmnhZ?=
 =?us-ascii?Q?4L1uH37WCalqI7gaQ7OwuoWIFiaoFTAaMe0BHqX+f9u+rM7iRi2KZLeb/6yt?=
 =?us-ascii?Q?o/5lTJ4pnReGgodqkUZVWQax3STEyjVhggWqOcvGocRanNbjiJUrgZ4pkV8b?=
 =?us-ascii?Q?w0CWFDWsjFHQqJSqXw+5zkO7x1zo4dmBmI6PAv0m3PETJoqDxXIn86Rqen3K?=
 =?us-ascii?Q?6SIjD13K6VxLPWqXbKxIA90C55DpUIfKGV9dUx0GBaOqVJ1ejgMFgx0rLnRl?=
 =?us-ascii?Q?th2u1HDjJOCOcaP7NlwSbLfQvQq+YWWfTY4SihJFLVZUYK/A+2WmVssXMJ9z?=
 =?us-ascii?Q?yDfq1FU/X2xkmbGXVt/omoUw/9yzN5k8td/jEiU9TCgaXMBOV9pQXtf7FLQM?=
 =?us-ascii?Q?ZXpvp4JM1UO7gj3uYAU4Z6Yq/I2+OX3GTRS3qHVgAw7UGjdcqywmVUnJAjd0?=
 =?us-ascii?Q?33XCwoY8Porrpq+UtT9trV4rApKKuF7vz+xkGC0Jw9ciH1FJ5WQVuqi9LJzM?=
 =?us-ascii?Q?MGF341yGjL4VFVcg1m+/+E6Quf19iK2atKYWC3XWXZXMBxf8CgiOjZLe5ozl?=
 =?us-ascii?Q?Dx/u9Dzkf7iI29zmHB/l+hSgqTnwDYGSDx3tChRoZ6UbQIQYi8mNW3E+wnfa?=
 =?us-ascii?Q?ZKDnKYyMj5qvKMygkm2pMUTISBDP6owHdxOylYsn3S5cHZ4ZnUADnIO0fWxe?=
 =?us-ascii?Q?wRhGVCWzHHRShk1pfCKOecfYDlMibRdiHSv8ZKkf+BRvq6ToT5+X0pkAkyci?=
 =?us-ascii?Q?uArBKBW/ucjaQpOI4d8Hs+xGeeokxt01JxKFCPRAAglbKxo0FONnYU/yHYbd?=
 =?us-ascii?Q?7xfHpZKFhZmtL08Aow5fuH4gsV72OXtFSdr1mbN9vkkDspBSeUrTFSiJQ6+g?=
 =?us-ascii?Q?uPiiFpmfu2aV7AZwUiWeyflJ+PI3GzJ/0g7jUe+5OTuluQkqG8LAF5hsGzsE?=
 =?us-ascii?Q?2Xh/vIAXEb0MDtG1Pt3/dMvJCPC13V+fFzvo2dG8wGhQDvk/BNY44QV7xVcP?=
 =?us-ascii?Q?ScjMbXcX+w5BrY+74OBd618KV9VDp8ADj2b9PAOclW8VwyGP95R1OsoSS/C6?=
 =?us-ascii?Q?Gjuo1WFtYkJynumthRp39DpItBa02k29j4I4n1X62MpNMWXYIyenQ59RcIL2?=
 =?us-ascii?Q?IhxRF7mjyVxykZ5ucdgl9i05ieDfEH9H4VIbSd4+8gtpjTrmA/U6GDlHIM06?=
 =?us-ascii?Q?jPk4lFvb5op+Mau4DJqJZm0awTdIf/Sz3xbcusW7n66U8ddU133xNn7Vln/G?=
 =?us-ascii?Q?dcO8AbEKTVU4B67bBl6AJnn13MxSKKFIp3GpsuAq1OfjY5oGuSMoAHUciqF+?=
 =?us-ascii?Q?6eRzlZx5zDVNVjbSHvAVFTRK/t1y0M6wf/Wv6Ybx2Px8EEKVQuKwQDrlQ4im?=
 =?us-ascii?Q?ZbOleLZURFN/WfiiqNexFhQ03PC0VU9h2zRdWNCnEF4HzlKcgfiRZw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SCLXRVz+msuCH/mRF3SzUCRbbvSmLBCjNoBx7O+EH3QRZSPQgZcYYXoKC9jF?=
 =?us-ascii?Q?nFxUK22AISEZC7fVt3iHhjXcBbgGLrzhTKgUjgOdhRTFDAKd3lP2gWSzN5sK?=
 =?us-ascii?Q?dPu0TPNC7UPj2kiB8Do3LbvUs7k/mRz1JsSr7Wx1CjwG6KmOW7v26KwTyaTL?=
 =?us-ascii?Q?dxILt+ainDB3UAkdeBRiidATsC1c9t8nMJzOopqrNexASPZ6eBdGVi+S6VbY?=
 =?us-ascii?Q?+DxdUuRWPvc6/5Fw8ZFgEtzC5kX+XlGcuNxA4dl2oVxBBvAWtRb2tJlkGnXf?=
 =?us-ascii?Q?/Hv2NLWn0zhvSF/ZJ824lclH4cbxrA5nDjeW0yisRHT9aE9s+0DDw4qcUZrM?=
 =?us-ascii?Q?DBYtMgUbyqNLsLVjhwGRWhpSdtDSAy+tWCl6S6jlrStLxvhS4iaJzzMKGAtz?=
 =?us-ascii?Q?wCTaRDyduo1dQPabAGh4Axuz4SyaohpiBFmBUREfvAcZ/S8mkgzL0/eWjBGn?=
 =?us-ascii?Q?3diic+R1vUMt5e7+GPqa4wZVh+Q3inMK1J+9pqUVHmGG898XhGYj+mWNYt5Z?=
 =?us-ascii?Q?83Xp2gaRnMiNh3x0fnhLjmy2xCY3hR6an4m5KXcscDmrG2NYwc2pzoAm3JgH?=
 =?us-ascii?Q?J2vaF+5rij0O24+B4awtcZnTUYnCb8RsQh+YhOuRo0W/rwg1QupbuzdR8ZNw?=
 =?us-ascii?Q?Ed4o0R71oT7HnMcVPJiOoqrNS7tFT6sI3APAwYETiS7aIM4J9jHe2XQ/QR8+?=
 =?us-ascii?Q?uVxSHbPvx3JRGmSRkxnF8kKtX/TIkq/9N52cs4ySVnEQWVmJheCFQBxkcAjd?=
 =?us-ascii?Q?qrQbkEt/KP0awqNXObw7pM68opzptoDezWJb0aJfFD7YPsyMdrXy7g5R9Utb?=
 =?us-ascii?Q?qPQ1oebexwt34iG/qJUZdUBHjfIHK5MUQXM/irjqk4pTMMefi5mQf7rtkmMt?=
 =?us-ascii?Q?lOKlxv21wXosYfPkeifSVih3q9jTltCXC8DwUuFRPvRDZ35dGMcr/zS6vdBo?=
 =?us-ascii?Q?KRJlyXW3oVhRgoIuBbfSy6J//m/hDVgr/HJohCjYU7f00D94323rT/PwAhxU?=
 =?us-ascii?Q?WXdWT8ALeWPozJpHnHEgiymZDNCJ1/xykB/2ytMOKrtdGNm0r+z8JtQ7HebF?=
 =?us-ascii?Q?5XgQZmzHbi+w6rsg/Gp60k1woIff1HcONtkevpvFWe+x2L0xVy5Tf5+/zT7z?=
 =?us-ascii?Q?L/VW8ZRXsmHI154KvcYR1gFGO+Ai8jD9pXS1n/FhYP/GAMm7WWQU7pc8tLNG?=
 =?us-ascii?Q?VN/EDmxxUGFqh2V+PE04Gktd4WfH+hinZyWL9Y8pIPDlma/IXtEkDFwgiJY6?=
 =?us-ascii?Q?5Nwb41dsvSuDA7QiqqrLSielVr67AyikpRu6R7Ui0EHMhnYXJs9/lGA9CYbR?=
 =?us-ascii?Q?yZC3J2/KFBD+pMyRUveZrneUK+GLYBrDmj+XCIyHPIV0UFhy0fL+pPgTf7iF?=
 =?us-ascii?Q?ISahABC59RGGT3VZHmRyQmayYwzY64oWEWVe6zvreCdAlICQzI3YCT4kubYR?=
 =?us-ascii?Q?BvVzWpHdHpEIokKA+v0SLhnizjKvkDpeO7TFSnqSHCtwPKAZChEWKG843FZ9?=
 =?us-ascii?Q?iCMKXmufMR3nI0mtPEu+q+ut1Pkdd8l4HxV+Yo2WmPASIVTf3gQ/WgaO732E?=
 =?us-ascii?Q?MhLEOwLuSDgwMS0tD1I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e6a2a6-fa34-4f60-ae1a-08dd82f154f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 05:31:58.0310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eA4A2DDsLF4WEs8myFh3UlwdMQgnwp2Wm2H/6Mij3cXEujIMEWaAEbQR9wvNqHKR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjAghFGN9hZ8F79so8b/YnmpEUxp6W+8n0Gu3GGQXKU=;
 b=0OoBS5VToXFdPBRgG+mzfolKHgGnAs3nh/7S1p+fHyAinydnhgg2S6Vi/lNJ9gAAZkeCl7QKwSeskhPHeCLghNm8wnNYoOwsiMzgbf69AwrA/mVoWGWqiF/W/rK7sxqiEEnkrWFY5qvqJEM6tUdq7AKgrOP7RVyU4R8PAqh2AhI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0OoBS5VT
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/2] package/fpgautil: new package
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

Hello Thomas,

> Add a new package to Buildroot called fpgautil which builds the Xilinx
> fpgautil script which can be used for loading FPGA bitstreams on zynq, zynqmp
> and versal products at run-time.  This is a handy application for loading
> FPGA bitstreams and their corresponding device tree overlays.
>
> An explanation of how this script can be used for each type of product can be
> found on the wiki pages below.
>
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841645/Solution+Zynq+PL+Programming+With+FPGA+Manager
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841847/Solution+ZynqMP+PL+Programming
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1188397412/Solution+Versal+PL+Programming
>
> In addition, the source code for fpgautil can be found here:
> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c
>
> The fpgautil script can be used hand in hand with the Versal Segmented
> Configuration with the following example command for programming the pld.pdi
> file to the Versal FPGA:
>
> fpgautil -b /lib/firmware/<design-name>_pld.pdi -o /lib/firmware/<dtbo-name>.dtbo
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Thanks for this new package.

Thank you for reviewing it!

> I think we should probably name this xilinx-fpgautil, because it's
> really very specific to Xilinx platforms if I understand correctly.

Yes sure, no problem.

> diff --git a/package/fpgautil/Config.in b/package/fpgautil/Config.in
> new file mode 100644
> index 0000000000..8a1f557f7e
> --- /dev/null
> +++ b/package/fpgautil/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_FPGAUTIL
> +     bool "fpgautil script"

> This should only contain the package name, i.e "fpgautil", or if we
> rename it "xilinx-fpgautil".

Ok, I will change this.

> +FPGAUTIL_VERSION = xlnx-rel-v2024.2_update3
> +FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(FPGAUTIL_VERSION))

> I was going to suggest that we download only the source file, but that
> doesn't work because it doesn't contain the version in its file name.
> So we have to download the whole Yocto layer just to grab one source
> file. Sigh.

I had the exact same thought, but could not come up with a better solution.
At least the meta-xilinx repo is still <1MB in size, so the download and
extraction time is still in the noise for the overall build process.

> What about using the vendor-agnostic OpenFPGALoader instead, packaged
> as package/openfpgaloader/ ?

I was not aware of this package.  Do you know how well it is maintained?

At the moment, I have two reasons for wanting to still support the
xilinx-fpgautil package.

1) The OpenFPGALoader does not seem to support Versal PDI files yet, so it
would be incomplete for our needs.

2) All the Xilinx documentation talks about the fpgautil program.  And on top
of this, I had a discussion with one of my customers regarding the use of
Buildroot vs Yocto, and their primary reason for why they felt they "had" to
use Yocto is because it included this fpgautil program.  This is what
triggered me to want to add it to Buildroot.  Especially since adding it is
quite simple to do.

Perhaps we could create both packages, xilinx-fpgautil and the OpenFPGALoader?

In the meantime, I will submit a v2 of the xilinx-fpgautil package.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
