Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5CCC28B28
	for <buildroot@archiver.kernel.org>; Wed, 12 Mar 2025 08:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1A8A607ED;
	Wed, 12 Mar 2025 08:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezcsFhvsB89j; Wed, 12 Mar 2025 08:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F284160C20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F284160C20;
	Wed, 12 Mar 2025 08:40:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E8ED943
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 08:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615E140E2C
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 08:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rC7NJOXXexN8 for <buildroot@buildroot.org>;
 Wed, 12 Mar 2025 08:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=159c3cfdf=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77D6B40DD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77D6B40DD9
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77D6B40DD9
 for <buildroot@buildroot.org>; Wed, 12 Mar 2025 08:40:28 +0000 (UTC)
X-CSE-ConnectionGUID: kU/IzevoRqqepI5xGgX6Sw==
X-CSE-MsgGUID: EeAK0LZmSEaHCdffFBDbig==
X-IronPort-AV: E=Sophos;i="6.14,241,1736784000"; d="scan'208";a="48587866"
Received: from mail-westcentralusazlp17013076.outbound.protection.outlook.com
 (HELO CY3PR05CU001.outbound.protection.outlook.com) ([40.93.6.76])
 by ob1.hgst.iphmx.com with ESMTP; 12 Mar 2025 16:40:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r15EFoyaqn2mceZk2dPHt2cESqGMukPIfNzVhZ5k8glDl8eXMGjrBOx3rZjUHvr+Pc5+MKm5D8eAhb01WZucblIetaGDFXP310XO2RrU5l6bAuZASPrE3ebPZuDL8oZxpX+yBfu6k+0FGi5/0sIZ66RHAlj6NAgHPA0RinGQLjcd/BsJyPZOrfZF9dCpdU7e3KhWmv4lO9i0wL3sUyGLJdV6q1d9X3B9YpfyN8GaRESHXvVlaaQbG/564QwaRBC/rwbMsWBAMUw8pBwN2dTG6EbsV3/FG3nf27drQoZysX0qHYrSp5zYka9vhs6uN+xG3ZS04RoIziQn7XB+Np2xAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOjo0GTp2oSscBF8yOoldEKXPDNUGmhFn3DWYTFb01k=;
 b=w1GVnxr0jZMBTwNxt0qQu9ywfxFQTA/WchfNvvHlfziTepTp50wXx6QbvcFVGdlogCRRdu/wdcdAxDe+ZJXvhW7+BuhYjdQcXcvbsV3SX2zMBdmtUvIGKBeSY2u1FCz8cgwgrsDgSW6KGfrQti+zR3zALBtmkB5CIQ/7cp4q2tjvV4AUcPZ7sobW374628lOO25FjRAdcnOhCGEy+Z6uCTZyQKRMvOsmN2M7aFGejRzlKamIxeeW+JHUx0DKBiHJF8InK14sbWPhUfu/bBpVSeLxqomFwQi9IbJ9BvTF0pKKttT13g6lPh+EfvcIJpqtmsyy9l4zCcuvsvXQ6/w0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by IA0PR04MB9033.namprd04.prod.outlook.com (2603:10b6:208:481::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 08:40:21 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%7]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 08:40:21 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Damien Le Moal
 <dlemoal@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "Yann E .
 MORIN" <yann.morin@orange.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH 1/2] package/linux-tools: perf: Fix _BIN_ARCH_EXCLUDE
Thread-Index: AQHbgfKd+HnhM9TeK0CK3zJVMv5KAbNvUHVh
Date: Wed, 12 Mar 2025 08:40:21 +0000
Message-ID: <SJ0PR04MB83266CB336F8FFEDBC027DDDF2D02@SJ0PR04MB8326.namprd04.prod.outlook.com>
References: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
In-Reply-To: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|IA0PR04MB9033:EE_
x-ms-office365-filtering-correlation-id: 333cf447-2034-4882-987c-08dd61418656
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?oOOexon4bb2bxcTD+P/NBHYzcncQyHLflHzilK8e++6RWqTeJohx6pvFrr?=
 =?iso-8859-1?Q?pWFmQ9wtuuBmZwmauNUNn0Ty4hJacMKINKjE7ErTdREYb2uVfnRg6ulKMR?=
 =?iso-8859-1?Q?QBfl7vpNzNXz85dequgRyhMRkQ2Q+i/zOxLT4/Z0WlCgOoUdINu8YkKDAA?=
 =?iso-8859-1?Q?bEzbgmqbLXKFr4FlJvJjZkKjHGzjkJKBTPGIhpVZ2XACUZYkkRruB+ldTC?=
 =?iso-8859-1?Q?bC0SRCuRwaEHv6OFrVJp4rst/Nl+q94OVRy0XHqm3hYdX7B2CO2p4jxIcN?=
 =?iso-8859-1?Q?rPViarQumo8bXNdXVJMESvtZ9ozS5wy13Q0ciOqdvFBPQ4g0QEZrW4/qkc?=
 =?iso-8859-1?Q?VHtq3cYZJdt7xdfVSgpfBkt5mJhtZxQwwbNz3X0KHXfHx+J7UM/n0wRGHn?=
 =?iso-8859-1?Q?dX+t1At79oJnQBh8cFCMzMorMvtKHrvJY9IYs6hDX9qyQuOXvOuNgvO8e8?=
 =?iso-8859-1?Q?Y5eD5g3CI+vgI3lgZ+oJDkaJL+Np7ei2zRqAqu94YX0SNVjaVRa6wN6Fjb?=
 =?iso-8859-1?Q?qbZ6oPdKRH8m97zS9r8dIpcOCVZPfviSKuFIQGrxDn++Q4f0cfngujASlQ?=
 =?iso-8859-1?Q?G9ldNW+HhAD1Cwcp21OYBFdfjQCLArDIDuMPCgyBJ7oz98u7r8rXneMzsB?=
 =?iso-8859-1?Q?GjVg1lWeplBLUdQbz799gxqKZbSQWWtTpU5tC/Kb44MKvpS9gF8uKx/wxt?=
 =?iso-8859-1?Q?4UQUAeB+qc+SDRBzKss9v35Eou/0hJYA8NTSPvCL3cFKVTTeujClJRRnqY?=
 =?iso-8859-1?Q?7Rf6ncpnKKWI5kwRiZ1qUtEHdmDq1PPzyrHIy+zRyFeYBuY5uzGryIPpIJ?=
 =?iso-8859-1?Q?6LKkj730yPVfEOqEOnB63thXe/5uofOm2pd4BeG75EQMfaMiutUpUVS+OI?=
 =?iso-8859-1?Q?oEeDNRQNvlgpcDa3kb2BQR/cQD2nu1zIdXH0HN3/gIULNT+71e4Z7qGCxd?=
 =?iso-8859-1?Q?kpSNNzTUYXuggo/6iV8velomSi/wOtTaqRuFvP98iFWYMIBIF2moqh4E+i?=
 =?iso-8859-1?Q?qQ4AK0tQcRCTlecwrPsGJBhRt34tUrjH0QC1T8HiHIwXpmkRGVhXKJawDH?=
 =?iso-8859-1?Q?s3D+B+7R58OkzsBGFm/3zAzxAdBbTAx9ShZp0C4WN/GSNqk399d4PYwCbH?=
 =?iso-8859-1?Q?fSf+6OD+GeZN7lsJnf1BfGw5PUyjhUXFnt2+nCmb4DYzWaLbwVUqBRqFlo?=
 =?iso-8859-1?Q?xlrv29W/QK2YVpUEdRfCT+gTcEoFqIBB967ik1a3FV5aVYHHFdBZ9dglUy?=
 =?iso-8859-1?Q?KiCIce1vQQbRbXe4sDmINpEHTOuRlFcnNPYFz8sjRyquNSL8/qGB2it4yz?=
 =?iso-8859-1?Q?BB5beFuB8xomdTlIxyc5ibeeeuFvHm54IdI+Gt9cIyS1MCKDQz5YFH1eQX?=
 =?iso-8859-1?Q?dTL+MGNcTM0XBmXubXvJwX7sviI7Fdn7daKxZANW9C0qhPAgA0xSbwZQqR?=
 =?iso-8859-1?Q?2o1vK6FpzNg2fRQUNzg+4V2p+ozQ68ebQnFiWoR6U3n+LDPjrBdWuDrC5I?=
 =?iso-8859-1?Q?WJqMycL+umWzkSojzVDsKBQ0Fzo8PCU7GwjV22ILy7sA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wd88xiFD/m6l/CyQyNIz1v7F0lZpEe1wG2zum0ODBRpZqEPmOVNWDfVb3p?=
 =?iso-8859-1?Q?skSartz8r2VyoZNZi3qiMcBs8PGq1+0ZLllHsENYWfBiaoJuIx02T8xhLW?=
 =?iso-8859-1?Q?Vc7f/WztXJBj78EkNv7qOLzc/0KE92iW+iqldHvp2wMpup/b9D3DEHIs+U?=
 =?iso-8859-1?Q?3coRahbSocoVORtUZZKJsa7zq71QsSa2qXH+sAakT4JjJm7h3/nK8vivru?=
 =?iso-8859-1?Q?8pJatP8qiEp89YNZEIkg3P6SKVwUTIpHwBjs7eCvOeQUKqewbkKEhzRrKw?=
 =?iso-8859-1?Q?K/W8ognpXa/eBDeuQB18srLkckBDGipQ75jlYwlCRs25ARQ1if1kIW7Ycf?=
 =?iso-8859-1?Q?pCSPPxgUEwFGrjOVXlwd0/mSD5UVZHPi+yzMzwgELzrPOWCy1oEALa062e?=
 =?iso-8859-1?Q?1ubZjjHXzUdHEPIMvauvCT8zm7WkHs9o4tgNY1iloSGz4N4sjNDGeedYiI?=
 =?iso-8859-1?Q?ZXSJqQfmvpulAXqRqrnbdC4F3v+lIe//Q6DRS6b8QCHItKQ22AbQuC6WQZ?=
 =?iso-8859-1?Q?q8s9PZKtYo/viqHYP4Ue7AcpOkDbOwotym21yfUi7TtCYbE/tIp4ElVipv?=
 =?iso-8859-1?Q?SBIJgi3tf3Iy0+P2Wwk+85D8YYwXQ8QfNWZuc593CS8CFnIddXleOh0oyA?=
 =?iso-8859-1?Q?MGaujBY+gZFrVSCqUgYt4lgQnyBvNpQAiBMMc5mPwAvQtMoMhx92m/+PzH?=
 =?iso-8859-1?Q?nJY5Gwlb+qCNs9EuzyL56GaQpXY01HxUgtrnh3Qvqi+2/JppWo+ZBwsypR?=
 =?iso-8859-1?Q?GHE1UZWVjqGBUr8EWxBrf8yYSN22kHC5wVeII9rD763R2svagdSpPMp/dp?=
 =?iso-8859-1?Q?rgySHWTCPuazAmm/y5VWONCChSXmQcczOuYDb6FtoF8bbbO3/8IQt2em9Z?=
 =?iso-8859-1?Q?6x0TIhSZNvSUejKtq0Lx/rq65nLxF5zq7lPBRyPzO6ZMe9em5qjX1gF4bs?=
 =?iso-8859-1?Q?VoWux37kq5Hhqn4W2cRclEF2wQTGyciAcqiD1FWE0zg0NuUSoHEZgMRyAt?=
 =?iso-8859-1?Q?/BIBCzp5MxYN8NJeAGIFkdcUkU9ugyXWEPaJPOM/ePBAp+fkGlZPiWBQdW?=
 =?iso-8859-1?Q?7xw5Ce8z4LafGyw+CaJ7XCEV5F4Nw1M2dSjEvq+UaYcQ0Kf2CSEAlmePxW?=
 =?iso-8859-1?Q?GC+PgW342w9Ma1wcpFHo30lo/i6/uSIzXsz0/y1fbZ+hiqgTZPRU1EOHhF?=
 =?iso-8859-1?Q?cPTzvQk5NlM6WuUnr8nV2DkaN8t//73vmlo/kii8DaQf6tiwLeelsBds+P?=
 =?iso-8859-1?Q?1ABpOmzUuYDJM2qggACMmFSuiQTrx7zsUWRJRr16tKhH/CuctTBiYTO3R0?=
 =?iso-8859-1?Q?Uo54Sj8f2BIJJYjkvmZ0BadpQvJA42Hm0mw7WF5SoZVwhYe4TO4i7c3ve3?=
 =?iso-8859-1?Q?4yjIFiHwFLChjE+G/CFfUcpAPxb/YnHkK2OFTkFZbEYeCP327A0nhpAB6J?=
 =?iso-8859-1?Q?lryYN0yTKJgoIxtUYMXlydkshCgZ2P2K/CZu9sWDOumua2OIBprJJWEEGe?=
 =?iso-8859-1?Q?CWzl1qQk6Ld63QkAN3IoOUX7Nh1YfyQGgRqa493PjawxmXQVRf973Td9GB?=
 =?iso-8859-1?Q?P08qiZEIx3+G4Tj51oaa1U6YP6XuLRTwqBoH78yCVtThzTsCwRK6wFYKv0?=
 =?iso-8859-1?Q?sLJIaTvXz/PuOw5GNTYR6s0X+coV9YaJcv?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kuG7n6jFpOY3Ie4SAkrNIAmXk3vXnu2PjiLEPTdO1bYJRb/KpCmVEo9psrhDN1YH6KRFAk55ImNGEKqJxofdYtYvQtLqwIrefXSwf14R3Yj+tyM5MCjgDP23ZCN7Awmt7qIfIqGo2n+FGi4jR9eXMl+50Dpi3xhVPvMxwII/yKjDrJ0vVndMH2j7EnAjS8JI2hRasu0IBdHqI95ii6n5FzMVWC3XXlX8fytCB9+8OUP2emM/7Es90i28W19TZxnazpnjTW2hFJy6JK4m7M0LbSchbMZol0gt4Y38RUnNP72icz32yJu9TGvVKL/AAvMwS5GnFrJp3IlSN0IdF9sawSfoCZmAjYXLP+n/868SQ/5KTXgWbEOdPjcsKtuBmIj+juGtHmrrjCnsdKdvyfnszU92O+yAQCmXORcmdEpmumxrsNim9ha9eaoCJAeCzDgMBV0v0MmClHogsTcSGBsW0SG0EQl3B/aFYE44Pl+jLqztQeZR8F9p34VP62mFAhlg6sOWS/xxTxK2HpjmtSV+9dT7cvwvWwVEalU2nPrRh+ywv5fCPC5WbO5IDpRsfwsn3wl4IPl9+xwVyW1+LqKpYfLNv8/zvoL9+NdCgrWy9sM98AIc+f250DXEwRqnybCf
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 333cf447-2034-4882-987c-08dd61418656
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 08:40:21.0768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HzssppPr1ESQ8+VqL0O+CuOOBIc0UlHdQqB9haA0PEh5DJJLnoHLjjs2FoL5bBWzTvBj/gk6WHPKU9asRLxHbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR04MB9033
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1741768828; x=1773304828;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MOjo0GTp2oSscBF8yOoldEKXPDNUGmhFn3DWYTFb01k=;
 b=b9VeuuT/KZxJqiCwf20/OPl9hnc65YEP/GsYvwc6G1lEnEINC1HdpNJM
 Zk4M6RTdCp0nb3e4bQ3wmZWwJzc5CHoVngXOle55nOYXVEvxJsm9UJ9YO
 l5nO204Rj3W6ETgsu9sHFTP8odm7hDXRIpay9mprkHffGP0vxkcRGd7cx
 Hg7kdPi8LKPfRopDQ4Q32twUE+XBJb+8KHR0H623cSL4Mpmg6P0+oXPfh
 d1PnC5Kv177aVk0t/qj3ZqJ6jSzjQccD7qJFF47LDs6+q6nbM9TnTtvKZ
 YmOGeLcZwOE/xnDCJrPoO7GGhBgbLQ5Tt3Q3SpcAQ7bMLtj7FkG+1GEoF
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOjo0GTp2oSscBF8yOoldEKXPDNUGmhFn3DWYTFb01k=;
 b=UIZs/Uk1cZKPETMuzDuO/HljSzVgwhVtTUOXGXVcHhfmwnEJZb2VUZ5Njl486KZAMOflf93DRcmHFs2ro582CP6KYEvhXJJFGO3hXASzFsdfZrc1a4q+Xx/gfAvTG5/WhyxZn/pT2Avm+HiQUz4SrJLLHtSVpRkuDjNGN2ox7R8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=b9VeuuT/; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=UIZs/Uk1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-tools: perf: Fix
 _BIN_ARCH_EXCLUDE
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <Niklas.Cassel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,


Considering that this series is Acked-by Florian,
any chance to get it picked up (on next branch)?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
