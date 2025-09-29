Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E00DCAC5B5
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 15:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8628360658;
	Mon, 29 Sep 2025 15:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLoUuaYv4CMC; Mon, 29 Sep 2025 15:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 907F46067B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907F46067B;
	Mon, 29 Sep 2025 15:30:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F96212D
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 15:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 217A64068B
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 15:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2r7B3-cEeq9 for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 15:30:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c007::2;
 helo=mw6pr02cu001.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBFE04063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBFE04063F
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c007::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBFE04063F
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 15:30:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5ZSNshi8qxSQUDukjXDB9QvmnZiCeuAGhS2C//hUoz3ADZFquDEaX2voc+tee3v7WBfnvrnske2ndv+avoB+PG+bGowImTU1oDme/lxeMIjc4LB3gCmlbkdcC52sNDSsQf67ZRxoNKeqoZTGvi0W/uyXU0ug89dP7HbP5FZsxUq8H8seUg0VuG4v7l+A1gKXlCdUmtwTANI09oIbBoFQ9o3OYH5/OHVQlSo6g8ibTSPeYoC7LAPuVAjkEKt84ptQdzyFz/JAVT0EltU5k9aLiBaAJlKleWRyo/dPJIu8gmIlQuXhBCGwdAZyDEYj1qsxIKQoCq8YF3y/rcK4hOhGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCqbNR2E4qOz3EHM0ly9vhntY40QJ1SeezET/dAH5pk=;
 b=qgDkTEiLOUsmzceDIxA48sQkblgs3dEh5nBa2Q4BKpUZ3YshFCaV9P2r13DrsvXFEWeUlZHZTdTEEgMKg8VXjEXak/1w0oRJMoLf/bBViSJXUXXtugWOALQAQXf00p0f9ZjgtvC+QEkJ03oT+6BI61NxmZUShxI5V94j87Ol8lxyaqODbbrMFjqsxiJ+OpeGeTPrf/8fh/nsWL98NA4xQ+WUmlgOUgIbPWY7UPtT544CyHCYcl2A8g5cZZbf+MvLF/z0XjZPZ1nFWeXdkp31grioxi6l2LdAFcif7Tq+zIOCt0Ks9cmqiGeqsuVx+zR3Y9lplhNn/w8CDPdvC/BPyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 15:30:40 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%7]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 15:30:39 +0000
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Thread-Topic: [PATCH v1 1/1] board/zynq: correct zed board links
Thread-Index: AQHcMRD81gn4gTPBdEil2+211O+Hw7SqR/YAgAAAnqA=
Date: Mon, 29 Sep 2025 15:30:39 +0000
Message-ID: <SA1PR12MB561564E3EFAACA14CA213F8EF01BA@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250929071622.136094-1-neal.frager@amd.com>
 <20250929172346.65c6bfe3@booty>
In-Reply-To: <20250929172346.65c6bfe3@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-29T15:25:58.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SA3PR12MB9091:EE_
x-ms-office365-filtering-correlation-id: 1395b960-ea72-4d76-59f0-08ddff6d2547
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|13003099007|38070700021|41080700001;
x-microsoft-antispam-message-info: =?us-ascii?Q?63RVriVTh8mvxfNMCC5L2nZMVkPpcJ2VJ/EIgBejmTf5LI9a1KGdJEo/hqjZ?=
 =?us-ascii?Q?g9Gq2DJ0EOx3Wb07lpEUzPG8VkSzgQokwuPILXPTL/jSg3AEI/tTCf8PMf7J?=
 =?us-ascii?Q?1Clpc3bowVZu7f1GN9JBU9/E2QCzqKOxC0g/bxaX+D4ebzwxfF4SaRPA/U5k?=
 =?us-ascii?Q?BbKcUrpY0w5ZPSlv2hkWG9dOSVZIIp7+Ii4txhkZ5VXQMRmrPO6rdnMaJxVO?=
 =?us-ascii?Q?ggn8niPXyoYYCIBPc7MJRFrurWd5BhGmxohwdXHq83o9q7ddXTxuFkbWfDgt?=
 =?us-ascii?Q?m/h76lBUHzI1SI40P6G9opW3FYeAP7A9RRosERQqhxr7UAmFP5TX//t2WSXK?=
 =?us-ascii?Q?9rp1O28J6+n5IDcwyVK/9AsRHVtySnl0RXdgizEZ/t+H14HKWyI8m6ilZ7nN?=
 =?us-ascii?Q?iI+OzGtnyl1DbwgJfXORAlGyRaZXCnOz2mjcFwiNEJDFsP3d/uGnL/UcfZxW?=
 =?us-ascii?Q?oBTdqE8mY/2ni0mR/lgF/cx1jPI28g2ZGCRUT3N/BnZ3Litjd0x+sthdQSuz?=
 =?us-ascii?Q?EA5mBHgty4uet6GlvPx9keRpHa9MBZOuu/k99zWxAcYIkxqoE7NVzimIEYoF?=
 =?us-ascii?Q?rt5kVZbBTVr/W/FceQ5XmgjwFJBtA4UE2EbJmccPRNCMJFW0GOQS/wadKBuU?=
 =?us-ascii?Q?vbGcDWsKLhfJWR5cuKgp3kwmF7apMbbPSNOxmadZ0P/9S9dgRucpRvbVa3cR?=
 =?us-ascii?Q?1h/yAtSYPT5Xm923mtcb1I5cVI6Vw6Biuivai0kXVhX3fmvXhW6Vxsrymxlj?=
 =?us-ascii?Q?ANVkrkKn8tyopLLOcW57ytcrpOoiSBtEgmvStvMI/mpyQDhY6T8NjAdSOklZ?=
 =?us-ascii?Q?xEQXS87UQEGswl9KDafp7oJDQXiAYUk2iWMwL2mf/XmI4SoAe4tZWJ3hJ+4Z?=
 =?us-ascii?Q?oTA7iEqnfOMd7VGhYha5Ft1nMOr/lvaJdOb+J0NiZVRVHq8vmu4nj0xj68dW?=
 =?us-ascii?Q?ykuYtJAMuduKIve1e82RA9DybpDr200RIoQ4G+ofojC/XnBRCHFEbzkQKXH+?=
 =?us-ascii?Q?gXmLaGdTP6xRwGrrlRx2bGlV+uMDXax068ZERvmKb8nDBSYx27I4Bz7pX1g3?=
 =?us-ascii?Q?k+JvSKLrrF375p0GgZs8KwnlwpH9AUf7DpAV4dIZ99WoeLHECA/MJFu0/+8S?=
 =?us-ascii?Q?5JZKFhQAVCCjU1kQadA07lWk24KZX6GGvofXyHklyW9/LmcUQD9qxRhoXRjh?=
 =?us-ascii?Q?d8wC7pVK6RZDG6l94dd8FNFjkpYVBlDLK0p7TDwxaBuPNpwZpFqUi7ib0IBu?=
 =?us-ascii?Q?OCnAcFys6II2glp7yqaTrFegJL9G+i/eM/Ag6XwXEsVk/ZHfRnEpbEvOLBAH?=
 =?us-ascii?Q?ow/Dwcol8XLKi7lm3McmNvpYfp+vOsq4Qat8wK53iTBsYD/dRlIWQ3ChuP/1?=
 =?us-ascii?Q?pQ83ivR0MyW1LEsyZ9wBcvMjLPaRUYgoHXGC5M22r38R6nh5orNmaqryKpTj?=
 =?us-ascii?Q?5Ik8IrI/todqKJ0wn8v+FND3619M7iNHcoHRHVqkOtYU+pnz0O1Z2fxgHdCb?=
 =?us-ascii?Q?k4Gmu6PfKFeCyWg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(13003099007)(38070700021)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?es3NEOgWHeONLR9yCBeKMqWFpjbMzV8+vISKGPR1yZ9dys4VHgd+mkuRRf1g?=
 =?us-ascii?Q?AbcgTS0gjbQCMfWGRYCLRlBLUnnuA4cCUbPdQhoaylL0F/9F8E+KVWxSgV/u?=
 =?us-ascii?Q?Dfck4ikehmnPiLQRek6XqJcjdpB3hMBiVj4Z35OseQkQI5MBp53YNA2ZTahM?=
 =?us-ascii?Q?6IHj+7NlEzxF36KL2x8dyccIcEbVtp7SgZj1i6kc4+dbSuTU+mBfhwig1uKr?=
 =?us-ascii?Q?sPnQonTHVP75E7M6eUVZcDv8dtUhXE92OlNnfH6rNffr1SMjX8rrqsLjwYv2?=
 =?us-ascii?Q?E2ttPD98KGChKIhqxVTjwIAZp1GNv7yVHfowsymR981U0sQtvll+px+kkSZ5?=
 =?us-ascii?Q?yMIj/JDucseq5hSRm3nWaUpdajePPmXZMtn1wAgtVgz660a5PFnOxvbCIMp0?=
 =?us-ascii?Q?oe7GJYj/musQzKlBQOGD43jrqHd8M5j6D7OaPeogJ+2KxsbMWpfdLZ0BYqgf?=
 =?us-ascii?Q?0my5vzxAB31NNgiVDmja1dZ5LNulvR4ylP2FX3nykhpubfenqsz/twOwIpoW?=
 =?us-ascii?Q?/cYyZ0WdJDhESbfSj68Q+jdroNlPwMO2YEUesBiJpJ56AFbUaRVQ7xS7od2j?=
 =?us-ascii?Q?jLeyQOVHrgnCchfGcREqI9qD0ZcGBV4th5i71ZmneD7a1GnEv+ye20GqufA7?=
 =?us-ascii?Q?NxQq3sIt4Sg7BpfM3fLjX1Rrk6usOb8l74PxNZAoVA1Fg52QWzHsA957tquZ?=
 =?us-ascii?Q?jurB5ss443HlQga/m8osZRqa7HjZgLYjWYcbiM1vfj4rn7BpIz7Wza6dOeQ5?=
 =?us-ascii?Q?Oh19knjQKTjG8BZ/qQmLWylcZpVVs5p3Dn+lUJWg9uDPeZhvMdeji1DHTvEa?=
 =?us-ascii?Q?2X8EynYjJL1wxZGJyBJEWgfsoUsuBrtCyv2nZHWLukTLic9EBumVDknZ6LuD?=
 =?us-ascii?Q?OYRm1HpaHdZyGV3zu3aSumEVPZRYjCs3WbCPd60SqZgMpFSjuiKLX9yLBmxj?=
 =?us-ascii?Q?A2JY2habg6nkcDypN/SZ00j5N6EXYdYcD8E9Xa2RroFwa9E5ftQVD0va0XDs?=
 =?us-ascii?Q?EESjdx5GsOU9E6WUrjMQqlySrqY7CdpBB26db3YEW5ZjaUypoLG+gYbI7VcL?=
 =?us-ascii?Q?9Zaf2SJDsDfcbO4C+5YharlYtIgZZoA1QuJLjdRp8Nomw/zZe8bknGy2jEI/?=
 =?us-ascii?Q?ajt16+m2ddtHavTxcCo88wBNQbZ/opmlCA7V0hDjbej/MF6jaOzsN/dg/VNX?=
 =?us-ascii?Q?a2BydaubD/DuhIU21QjZM+U7FsUXeqIXAw0O9TuG6upnXfr2PtcT+kE2fvVP?=
 =?us-ascii?Q?UzJFRJVyMljWoZXoTIXSaXPNewsLIuZ18+O/1DTBoai6IQsM5Eq0xm7CkE7q?=
 =?us-ascii?Q?3el7IQd4r4tcP7CoaHEKoHyOxKZooseVfTcLpGQ4FqU1iYJvC8JtBPZEjItn?=
 =?us-ascii?Q?YBAT3n+zisUpnQh/6pTSJ3kVvEH7YUarJyEDXhPM+wZT/weiiDMK4rdEFZ9M?=
 =?us-ascii?Q?kPzrxRB6/PrjdOVw6UX7CmpEIOv5dZ5qI6j5x1nASrgrXHlJZaOfqPPEdyI3?=
 =?us-ascii?Q?hLIbxpph/j6zwenO5PbvYnG3XOuLEVIvhKZMsE3qVXxRU+w8qFcT/l6/pjsI?=
 =?us-ascii?Q?0U4W0OjSC2+Xv54dC60=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1395b960-ea72-4d76-59f0-08ddff6d2547
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 15:30:39.8031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5daElfb+OKO0NQvv49to/C925VJ/Xba84nY3WrGX9uIPdLN1rhVaNOgi1q8jTHFr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCqbNR2E4qOz3EHM0ly9vhntY40QJ1SeezET/dAH5pk=;
 b=P/rbqu2Xht/PjE9IewYRtllZR3ktSWggVV0QLQS4Ine4mMYboeGhiSAtLOvUw+3urb4gBxFXI8gkhogxldORYET7KMevfQsDCa4xlEDlrDsM6/X52jmEXmKLJFwsBVQmjwhWSeiIebDtiMHwuuVqm8R3p5TGw7PXSA0RCxRmS/o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=P/rbqu2X
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynq: correct zed board links
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
Cc: "yann.morin@orange.com" <yann.morin@orange.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Luca,

> The web link www.zedboard.org is no longer valid as it routes to a generic
> avnet.com boards link. Fix this issue by providing direct links to the Avnet
> ZedBoard and Tria MicroZed boards.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  board/zynq/readme.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/board/zynq/readme.txt b/board/zynq/readme.txt
> index ed7509f2b5..225af4b9dc 100644
> --- a/board/zynq/readme.txt
> +++ b/board/zynq/readme.txt
> @@ -43,7 +43,9 @@ References:
>     https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/ek-z7-zc706-g.html
>
>   - Zedboard/Microzed information including schematics, reference designs, and
> -   manuals are available from http://www.zedboard.org .
> +   manuals are available from
> +   https://www.avnet.com/americas/products/avnet-boards/avnet-board-families/zedboard/
> +   https://www.tria-technologies.com/product/microzed/

> Looks like two unrelated changes (fixing dead ZedBoard link, adding
> MicroZed link), but for such a minor change I think it is OK:

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks for the review.

If you look at the line above the change:
  - Zedboard/Microzed information including schematics, reference designs, and

I believe the previous http://www.zedboard.org link applied to both boards.
This is why I added the two new links.

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
