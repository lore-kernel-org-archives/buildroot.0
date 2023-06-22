Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D7AEB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 12:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 219364208A;
	Thu, 22 Jun 2023 12:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219364208A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7G80qr1C2mf; Thu, 22 Jun 2023 12:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C854208B;
	Thu, 22 Jun 2023 12:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C854208B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B82D11BF59C
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 12:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AB0A60BF4
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 12:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AB0A60BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODFfkfyUND_q for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 12:47:50 +0000 (UTC)
X-Greylist: delayed 00:27:12 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB91C6143F
Received: from mail3.bender-group.com (mail3.bender-group.com [194.113.57.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB91C6143F
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 12:47:49 +0000 (UTC)
Received: from pps.filterd (mailgwag03.intra.bender [127.0.0.1])
 by mailgwag03.intra.bender (8.17.1.19/8.17.1.19) with ESMTP id 35M5FmoI008454
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 14:20:34 +0200
Received: from extraseg01.extra.bender ([192.168.90.20])
 by mailgwag03.intra.bender (PPS) with ESMTP id 3r90t3jt26-1
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 14:20:34 +0200
Received: from mailgwma01.intra.bender (unknown [192.168.90.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by EXTRASEG01.extra.bender (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 14:20:33 +0200 (CEST)
Received: from mailgwag03.intra.bender (mailgwag03.intra.bender [127.0.0.1])
 by pps.seppmail (8.17.1.5/8.17.1.5) with ESMTP id 35M5A7iP002392
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 14:20:33 +0200
Received: from vms062.intra.bender (VMS062.intra.bender [10.0.10.62])
 by mailgwag03.intra.bender (PPS) with ESMTPS id 3r90t3jt25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 14:20:33 +0200
Received: from VMS062.intra.bender (10.0.10.62) by VMS062.intra.bender
 (10.0.10.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2375.34; Thu, 22
 Jun 2023 14:20:33 +0200
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (104.47.7.169) by
 hybrid.bender.de (10.0.10.62) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2375.34 via
 Frontend Transport; Thu, 22 Jun 2023 14:20:33 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmIiwEygDs2XUG6hLL6YBd0bHvyI3VC7t7Mo7ARg7zzPNieA2zCRvNMgdz5XZQGT8LIcb7qorhMb4X0lWbg/HnMTrMl/CMvE67+aW8f2f9i2XR/BbhMoDzQVSqIDK5t0yiz5fqeb4Av6m9Vx1aRpuA1p3PlLRSo56ULaB+umauYMnxszP9JLZcnWq5/KkL7IuNQDbOJc2ZmjDW3amMt+XSqd2YsCLzE8QhmC5sfTaZiumUTkz1vVKZMryJ5EIuKL9gaEol+B6pVwGRz+N5vlt68UP5Kjli32audt050l+G1ILrwNqraY7V6KKSk0CeHU3tFkJr6UxRrCycAxPgSWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkOoCsaOHmlw39RcR2mFurzxvEM+rXXYUp1lTain/po=;
 b=jKuegKW+KrLO4uFyxib0OjmZyTOFtLQeg+M9nwDicgFADA7kfI/evdTN5GMv62FLMQxvuw2OaLfHSc8dr0xw2uoe3ruL/h9a4JchJVHUGTc7NeYS995kF04r0XSqGBCjAD576SpVenZoBp8/ulBTwyCVXuhXHBY4wDrw4HmgMmxC+fp09fjteYzS4e96cQW9NIoNit29q6EmED/5lRWDkzf72XSNH0kZBKURJrK1nX2ifwM+f/Xzi/FWQSrMIn01hCTBdeMUux9+YEWHIYdnYjFuE0xNvNvMxI8gzDTHGERWE33O1SQ18YsqVP0eluQ9uWtrRExTTq0sV8vVDD6wmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebee.de; dmarc=pass action=none header.from=ebee.de; dkim=pass
 header.d=ebee.de; arc=none
Received: from BE1P281MB3109.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:4f::11)
 by FRYP281MB2969.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:72::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 12:20:31 +0000
Received: from BE1P281MB3109.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e0d1:60bb:66aa:f75c]) by BE1P281MB3109.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e0d1:60bb:66aa:f75c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 12:20:31 +0000
From: "Stuhlemmer, Kai" <kai.stuhlemmer@ebee.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/open-plc-utils: bump to version
 1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2
Thread-Index: AQHZpQMoyPj2pHHm90+M0cmuW0WFoA==
Date: Thu, 22 Jun 2023 12:20:31 +0000
Message-ID: <BE1P281MB310985DED7F956EA79AA0C649B22A@BE1P281MB3109.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BE1P281MB3109:EE_|FRYP281MB2969:EE_
x-ms-office365-filtering-correlation-id: 11110493-7b96-4d6e-8bbc-08db731b1251
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bzMfWPHRry6OnV1AVwMS7VbN6zFTnzLOmNQrWXSOHU/PAbjgB6LJQJY+iMCl37QKYRsEJXNKdgjhFGGYwJMEkPcLsM96MvHrFA/iIzjcAIlUu5OEOjEqK20GDYe0kkV4sk1+fO1P3dNkqs73gp7M03cTbfkzW4TzH72TnY3lEtjywtAIX47Q2R7o1b+prZJpIE4YlC4eougO5IKm0w+nA8yasD/aeh33s0qV7GESSxPhwwV70+AkMngrX1YI4D/CTRlLQvZSjuy0FOEXF6PpbJOzadIOAhoRvbJKmtN5v8vH+tA4KssiYuAxaV73Zxq9d9XZ1eJs+L58tx/TGMjinh/UoN2/NEvxIJRmJoO6dB9kco+RGGsNpRVembD8gOw4KYc0gvNJTWEkI3ATBx3KlPvah7tiWVWLQrhLHbptMn2lEEAC6go6D7hIEj4JVIg73FSpGOV3V/JIudvXlDiIbRu2i3sEFBH6Bh3MHYpQ+U1gmEignqhO0MJEgAzY7mKZXjpRWoezOQ7gDrDmkvo72/jfgXjr47Hvk4RR0LxFOjHUMqr+/5nDsuspWP9hAHZh0aviQceLwx50ePiJ0XlxTptTkTj/mko8UtMIK3596d613FTUuNNWpdV20CmaviKc83cCOdi/Ck5c8Zf3tIZqjycSIMq4g7+FhmE+3mWFqNE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BE1P281MB3109.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(39850400004)(136003)(396003)(451199021)(186003)(8936002)(8676002)(41300700001)(9686003)(6506007)(2906002)(26005)(38070700005)(66476007)(86362001)(64756008)(91956017)(6916009)(66556008)(66446008)(316002)(76116006)(66946007)(33656002)(38100700002)(122000001)(478600001)(71200400001)(7696005)(99936003)(55016003)(966005)(52536014)(4744005)(5660300002)(98903001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VoyG9H6J9fU2r1AkzIFK4RyURAX629ueVi/aBQTgFkivAJeIQh7a+a17wh?=
 =?iso-8859-1?Q?zfCbu3Dwvnn/1pYTs9mS5zAmApcJrTHX0/Fo25XKrhUWCaNhbreKw4xIMf?=
 =?iso-8859-1?Q?9CPD83ddsAjZVY0egEE4oMLLVH4VF7kezyn0RF94PWfTUkoOzWzLjtm+O+?=
 =?iso-8859-1?Q?arULAo+huacoCmhrfSD43UpC5LAJ1bZIk3ewmDibr+vnBxUhZ5kXS9oQqu?=
 =?iso-8859-1?Q?7tLFWJn4AZqLVwvm+Pbq1eFV8LP2hN1ujXJ3hJ8nYACTQ6FJGxoclzCazq?=
 =?iso-8859-1?Q?tyAdvSGS7Snzetb7+FRdmaxvF1omoQAsOp2SsVuA6Wi6SszArP0kEo+kmy?=
 =?iso-8859-1?Q?fVLVQr7bK3w5Lrwik7aiMpIrtz3ye9mOTL/t3siDXu2pswAj8xub5gcyNN?=
 =?iso-8859-1?Q?WUBQP9pqZ3w2P1WDBbsz0UCtiVCy7LDcNLwVat3zmKUI/L3Rr3kaHyjLdp?=
 =?iso-8859-1?Q?dBmuhxuaZgRYoM6S/x8XfJ+67rMLbHWf2Af4q2A3CZ73+WrSPCogdJWnVp?=
 =?iso-8859-1?Q?G4M1r/RAlvJ9nzzTZud20GVCukZ2eT9U0mjXFyg1MPQkmr/gSTKvZ5FKUe?=
 =?iso-8859-1?Q?LWfpiAjl5n1FVmpZellPt0W7ER58KkPFVc71Y0sEOaKjmqoC0jXiDxbNan?=
 =?iso-8859-1?Q?SKmSNVtVIULjW1/qdAICu/yhDEofaz56j7yQ4BFglVzzy7gnIPtKvE1kEr?=
 =?iso-8859-1?Q?gpOkTe/xJXEAUKOpZxuAU9nIQ0xjC4JmhxlwJbTDFmDTkQfqvCCtisFydY?=
 =?iso-8859-1?Q?bV8iRaPHP3g3TenTQinIo01qFUUQgjazRuHlQ09O7e7OxCgi9cXcDKxdZC?=
 =?iso-8859-1?Q?a8IjVmbufxPpP80nlWKmRgqoLnTgutlfZplfni95pOrmY12cVWkLjFiOYt?=
 =?iso-8859-1?Q?XyPwF+1CA7+WFjt8t4LbtwKuBVDjlI3nAk9wFTCZ0D8NvYtOQ5sQLsv9gC?=
 =?iso-8859-1?Q?pHvqp3HjkZ/Q+u1cXZLNI5Bs3DFIuGFBTx/+UHXPXGM3TIFPcLzdo1SSuL?=
 =?iso-8859-1?Q?WAJNzYj5N/yeSxIGBRJRA2J4feQwgkHKbXEUP9svhMVXhRzGOayyqW8FnQ?=
 =?iso-8859-1?Q?4B5kpaalEjJRJQuC/wB1N5gzKrulDhEINn7wbZySI1C+32/93dwYXd8pzz?=
 =?iso-8859-1?Q?xCZwqTtdxoUbLj1J7LgjtYTHhKuUaTkn+zCSed2AWPLlxbZticpue5yjwG?=
 =?iso-8859-1?Q?bqImQymxrN1m3oLQRgC2u3a0BToC+cl5G2hPozZO8+lH7LM0ISTM9oAjFo?=
 =?iso-8859-1?Q?6D2WpVlH8TbBjuU/hYRM2OXOHzKRlhyjek/ucWLZVKB5ZVet9QmmiMj+cg?=
 =?iso-8859-1?Q?dSVqZhUWanVdG1OYi/4z9LPmmnJlbAXTLT5o4rcrYKc3VNQ6NB+UfQ7is5?=
 =?iso-8859-1?Q?4mmomxAu/93YTjVUf4eYbv5RqA8h5y78502IIiox5rUlBe9WgCgs48OxA1?=
 =?iso-8859-1?Q?KKUONi1nl5L1rkBQiIrOkFCuAki9c9H1aS1mKq7FAYhBflHuYd1IGtDXcA?=
 =?iso-8859-1?Q?qZjLolMgKuYrcgAEUG9QnaSGQ8jWU3dnphHogQFKk0B9tzSeCB2y6oTLGl?=
 =?iso-8859-1?Q?xBxdOzyw7zWh/GgDV81rg+jF6RFBIb+NrE4HAoTxFfeSSZJxyoCHXuybLX?=
 =?iso-8859-1?Q?6XZ0yH3LFlOWdpNufYFppzUxgYypZ3vONw?=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB3109.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 11110493-7b96-4d6e-8bbc-08db731b1251
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 12:20:31.1267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f516ab38-e108-4989-bf85-0219703b8744
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ta+0pYDoNBquTVXDySjlopBFrMUXA1WStfVe2SXTjk1QUPZxOZ14orTYjLTOecBBWbUvWjzMDqsIYDvNeQ+qew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB2969
X-OriginatorOrg: ebee.de
x-proofpoint-rule: module.access.rule.seppmail
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_08,2023-06-22_01,2023-05-22_02
X-SM-outgoing: yes
X-seppmail-outgoing: ok
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_08,2023-06-22_01,2023-05-22_02
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ebee.de; h=from : to : subject :
 date : message-id : mime-version : content-type; s=mail;
 bh=WXBOCXdG61HKcWo8S1+F2Cu9pi0YXRxUcthSaw1a4B8=;
 b=C0ezQf/jqLznKtZ4tZf/BWJMuyKzdh7ifc87knjA3z0330VXr9lPpkTq8gFG06U/wMK0
 x0Iu1b6QE7rk4oI2cmCB2NAND8gBPQVD9+X1FqFRhEdLmf2AudPS4psWsqMKWQpwmTrT
 SNQxvSGgqhuIAvB+foFtsmm0YhQDxzNbXrWugfjIAW5LxYcthXlHcBVvqfhwEhcEDaCP
 /I4eOb2zuJZGNbN54NUW2U9vhlaxF7vMRnlb2nIqmkf4+e4hHsfkXuMtFjUy1x+cP1QN
 M0Z7xUr3qQ/LN2dWL5BkJqLzpKnZ/U0B4PhHoM7aNNJ0heuA7mXPkQ/uW47qCfJeTME9 Sg== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mybender.onmicrosoft.com; s=selector2-mybender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkOoCsaOHmlw39RcR2mFurzxvEM+rXXYUp1lTain/po=;
 b=bRgXJFPjXTYbzpGzUSCmn2uE7XLOyThqie3cW4srv+VX+4kH1enmaLgXyvLtvf7lU6sJ+ZA6+HBr8U28aRkMmthRS1tDdEfYrjcoPLwtKJQNqK9XZUgFGFs1IDnhtjbUHDhtWphu6eUYdVonm51wozDcccski9rAxlFIqU6hfA0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ebee.de header.i=@ebee.de
 header.a=rsa-sha256 header.s=mail header.b=C0ezQf/j; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=mybender.onmicrosoft.com header.i=@mybender.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-mybender-onmicrosoft-com
 header.b=bRgXJFPj
Subject: [Buildroot] [PATCH 1/1] package/open-plc-utils: bump to version
 1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2
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
Content-Type: multipart/mixed; boundary="===============3354587771065061638=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an S/MIME signed message

--===============3354587771065061638==
Content-Language: de-DE
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg="sha-256"; boundary="----517FB700262ADB1EFBE8F2A03DA15BD8"

This is an S/MIME signed message

------517FB700262ADB1EFBE8F2A03DA15BD8
Content-Type: multipart/mixed;
	boundary="_002_BE1P281MB310985DED7F956EA79AA0C649B22ABE1P281MB3109DEUP_"
MIME-version: 1.0

--_002_BE1P281MB310985DED7F956EA79AA0C649B22ABE1P281MB3109DEUP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Other changes:
 - Remove 0002-plc-plc.h-fix-build-with-gcc-10.patch as
   related MR https://github.com/qca/open-plc-utils/pull/141
   has been merged.

Notable changes since last version:

 - Drop privileges after opening the channel file descriptor
 - Remove all checks for root permissions
 - Add chip identification for QCA7006AQ

[ebee Logo]

ebee Engineering GmbH | Washingtonstra=DFe 16/16A | 01139 Dresden
Fon: +49 351 65699 6100 | Fax: +49 351 65699 6105 | E-Mail: info.dresden@eb=
ee.de<mailto:info.dresden@ebee.de> | Web: www.ebee.de<https://www.ebee.de>

Amtsgericht Dresden HRB 33370
Gesch=E4ftsf=FChrer: Hans-Joachim Baer, Andreas Maurer, Sebastian Giessmann=
, USt.-ID: DE295442918

[https://www.bender.de/fileadmin/content/BenderGroup/Downloads/Disclaimer/l=
inkedin.jpg] <https://www.linkedin.com/company/ebee-smart-technologies-gmbh=
/>

[https://www.bender.de/fileadmin/content/BenderGroup/Downloads/Disclaimer/L=
NdW-2023.png]<https://www.wissenschaftsnacht-dresden.de/>

--_002_BE1P281MB310985DED7F956EA79AA0C649B22ABE1P281MB3109DEUP_
Content-Type: text/x-patch;
	name="0001-package-open-plc-utils-bump-to-version-1ba7d5a042e4e.patch"
Content-Description: 0001-package-open-plc-utils-bump-to-version-1ba7d5a042e4e.patch
Content-Disposition: attachment;
	filename="0001-package-open-plc-utils-bump-to-version-1ba7d5a042e4e.patch";
	size=4571; creation-date="Thu, 22 Jun 2023 12:16:53 GMT";
	modification-date="Thu, 22 Jun 2023 12:16:53 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjYTdlZGRhMGE0NWQ5OTU5Yjg3ZTkyOTE3MzhlYTc1YTFlYmJkZDNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiS2FpIFN0dWhsZW1tZXIgKGViZWUgRW5naW5lZXJpbmcpIiA8
a2FpLnN0dWhsZW1tZXJAZWJlZS5kZT4KRGF0ZTogVGh1LCAyMiBKdW4gMjAyMyAwODozODo1MyAr
MDIwMApTdWJqZWN0OiBbUEFUQ0hdIHBhY2thZ2Uvb3Blbi1wbGMtdXRpbHM6IGJ1bXAgdG8gdmVy
c2lvbgogMWJhN2Q1YTA0MmU0ZThmZjY4NThiMDhlMTEzZWVjNWRjNGU4OWNmMgoKT3RoZXIgY2hh
bmdlczoKIC0gUmVtb3ZlIDAwMDItcGxjLXBsYy5oLWZpeC1idWlsZC13aXRoLWdjYy0xMC5wYXRj
aCBhcwogICByZWxhdGVkIE1SIGh0dHBzOi8vZ2l0aHViLmNvbS9xY2Evb3Blbi1wbGMtdXRpbHMv
cHVsbC8xNDEKICAgaGFzIGJlZW4gbWVyZ2VkLgoKTm90YWJsZSBjaGFuZ2VzIHNpbmNlIGxhc3Qg
dmVyc2lvbjoKCiAtIERyb3AgcHJpdmlsZWdlcyBhZnRlciBvcGVuaW5nIHRoZSBjaGFubmVsIGZp
bGUgZGVzY3JpcHRvcgogLSBSZW1vdmUgYWxsIGNoZWNrcyBmb3Igcm9vdCBwZXJtaXNzaW9ucwog
LSBBZGQgY2hpcCBpZGVudGlmaWNhdGlvbiBmb3IgUUNBNzAwNkFRCgpTaWduZWQtb2ZmLWJ5OiBL
YWkgU3R1aGxlbW1lciAoZWJlZSBFbmdpbmVlcmluZykgPGthaS5zdHVobGVtbWVyQGViZWUuZGU+
Ci0tLQogLmNoZWNrcGFja2FnZWlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEg
LQogLi4uMDAwMi1wbGMtcGxjLmgtZml4LWJ1aWxkLXdpdGgtZ2NjLTEwLnBhdGNoIHwgMzcgLS0t
LS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9vcGVuLXBsYy11dGlscy9vcGVuLXBsYy11dGlscy5o
YXNoICAgIHwgIDIgKy0KIHBhY2thZ2Uvb3Blbi1wbGMtdXRpbHMvb3Blbi1wbGMtdXRpbHMubWsg
ICAgICB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuLXBsYy11dGlscy8wMDAyLXBs
Yy1wbGMuaC1maXgtYnVpbGQtd2l0aC1nY2MtMTAucGF0Y2gKCmRpZmYgLS1naXQgYS8uY2hlY2tw
YWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9yZQppbmRleCBjNzgxNjhlNWVhLi5iMzdj
NDU1NDY0IDEwMDY0NAotLS0gYS8uY2hlY2twYWNrYWdlaWdub3JlCisrKyBiLy5jaGVja3BhY2th
Z2VpZ25vcmUKQEAgLTExMTUsNyArMTExNSw2IEBAIHBhY2thZ2Uvb2xzci9TNTBvbHNyIEluZGVu
dCBTaGVsbGNoZWNrIFZhcmlhYmxlcwogcGFja2FnZS9vbXhwbGF5ZXIvMDAwMS1VcGRhdGUtTWFr
ZWZpbGUtdG8tYmUtY29tcGF0aWJsZS13aXRoLWJ1aWxkcm9vdC5wYXRjaCBVcHN0cmVhbQogcGFj
a2FnZS9vcGVuLWlzY3NpLzAwMDEtU0hBMy1pcy1ub3Qtc3VwcG9ydGVkLWJ5LWxpYnJlc3NsLnBh
dGNoIFVwc3RyZWFtCiBwYWNrYWdlL29wZW4tcGxjLXV0aWxzLzAwMDEtUmVtb3ZlLU9XTkVSLWFu
ZC1HUk9VUFMtcGFyYW1ldGVycy10by1pbnN0YWxsLnBhdGNoIFVwc3RyZWFtCi1wYWNrYWdlL29w
ZW4tcGxjLXV0aWxzLzAwMDItcGxjLXBsYy5oLWZpeC1idWlsZC13aXRoLWdjYy0xMC5wYXRjaCBV
cHN0cmVhbQogcGFja2FnZS9vcGVuMjMwMC8wMDAxLWZpeC1tYWtlZmlsZS5wYXRjaCBVcHN0cmVh
bQogcGFja2FnZS9vcGVuamRrLzE3LjAuNys3LzAwMDEtQWRkLUFSQ3YyLUlTQS1wcm9jZXNzb3Jz
LXN1cHBvcnQtdG8tWmVyby5wYXRjaCBVcHN0cmVhbQogcGFja2FnZS9vcGVubGRhcC8wMDAxLWZp
eF9jcm9zc19zdHJpcC5wYXRjaCBVcHN0cmVhbQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuLXBs
Yy11dGlscy8wMDAyLXBsYy1wbGMuaC1maXgtYnVpbGQtd2l0aC1nY2MtMTAucGF0Y2ggYi9wYWNr
YWdlL29wZW4tcGxjLXV0aWxzLzAwMDItcGxjLXBsYy5oLWZpeC1idWlsZC13aXRoLWdjYy0xMC5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDYzYmZjNTM2Yy4uMDAwMDAwMDAw
MAotLS0gYS9wYWNrYWdlL29wZW4tcGxjLXV0aWxzLzAwMDItcGxjLXBsYy5oLWZpeC1idWlsZC13
aXRoLWdjYy0xMC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM3ICswLDAgQEAKLUZyb20gMjcy
MjJiZTBiOGRiNTljYWUzMGE1ZmNjYTkzMjU1ZGFlYTE0N2JiNiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKLUZyb206IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29t
PgotRGF0ZTogV2VkLCAyMyBTZXAgMjAyMCAxOTowNToyMyArMDIwMAotU3ViamVjdDogW1BBVENI
XSBwbGMvcGxjLmg6IGZpeCBidWlsZCB3aXRoIGdjYyAxMAotCi1Ecm9wIHBsY3Byb3BlcnR5IGZy
b20gcGxjL3BsYy5oIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZQotd2l0aCBn
Y2MgMTAgKHdoaWNoIGRlZmF1bHRzIHRvIC1mbm8tY29tbW9uKToKLQotL2hvbWUvYnVpbGRyb290
L2F1dG9idWlsZC9ydW4vaW5zdGFuY2UtMy9vdXRwdXQtMS9ob3N0L2xpYi9nY2MvYXJtLWJ1aWxk
cm9vdC1saW51eC1nbnVlYWJpaGYvMTAuMi4wLy4uLy4uLy4uLy4uL2FybS1idWlsZHJvb3QtbGlu
dXgtZ251ZWFiaWhmL2Jpbi9sZDogcnVsZXMubzooLmJzcysweDApOiBtdWx0aXBsZSBkZWZpbml0
aW9uIG9mIGBwbGNwcm9wZXJ0eSc7IHBpYnJ1aW4ubzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVk
IGhlcmUKLQotRml4ZXM6Ci0gLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0
cy82YjMwNjRiNjRkZWEzZDRhYWYyMTlmNzg3NDI5YzI1OTE4MTAxNDgzCi0KLVNpZ25lZC1vZmYt
Ynk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgotW1Vwc3Ry
ZWFtIHN0YXR1czogaHR0cHM6Ly9naXRodWIuY29tL3FjYS9vcGVuLXBsYy11dGlscy9wdWxsLzE0
MV0KLS0tLQotIHBsYy9wbGMuaCB8IDQgKy0tLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMyBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3BsYy9wbGMuaCBiL3BsYy9wbGMu
aAotaW5kZXggMWZhMzJiNTMuLjIwOGNmOTFhIDEwMDY0NAotLS0tIGEvcGxjL3BsYy5oCi0rKysg
Yi9wbGMvcGxjLmgKLUBAIC00OTYsOSArNDk2LDcgQEAgc3RydWN0IF9fcGFja2VkIHBsY3Byb3Bl
cnR5Ci0gCXVpbnQ4X3QgREFUQV9GT1JNQVQ7Ci0gCXVpbnQzMl90IERBVEFfTEVOR1RIOwotIAl1
aW50OF90IERBVEFfQlVGRkVSIFsxMjhdOwotLX0KLS0KLS1wbGNwcm9wZXJ0eTsKLSt9OwotIAot
ICNpZm5kZWYgX19HTlVDX18KLSAjcHJhZ21hIHBhY2sgKHBvcCkKLS0tIAotMi4yOC4wCi0KZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvb3Blbi1wbGMtdXRpbHMvb3Blbi1wbGMtdXRpbHMuaGFzaCBiL3Bh
Y2thZ2Uvb3Blbi1wbGMtdXRpbHMvb3Blbi1wbGMtdXRpbHMuaGFzaAppbmRleCAxNzg4YjQyZmMw
Li4wYWI2NjEyMzFhIDEwMDY0NAotLS0gYS9wYWNrYWdlL29wZW4tcGxjLXV0aWxzL29wZW4tcGxj
LXV0aWxzLmhhc2gKKysrIGIvcGFja2FnZS9vcGVuLXBsYy11dGlscy9vcGVuLXBsYy11dGlscy5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIGIwMTU2NTY3
YTcxYzYwOGNjMWEwYjE4YmJiMWM1YTk3ZGQwYWQ5MTgwMDk3NDM1ZjdlOTkxMTk3MTJiYjI5OWIg
IG9wZW4tcGxjLXV0aWxzLTMyNDA4NTIwZmNlYmU3ODU5ODNhNjhlMzllYzgzODMwYTMwMDU3Nzku
dGFyLmd6CitzaGEyNTYgIDRiMWI1NTg5NjkzOWYxNzgzMjFmZmUxZWMyZGM2OTM3ZWE2ODhkNTc3
YjM2NzFhNWYwZWRiNWMzMzI2ZGZhM2QgIG9wZW4tcGxjLXV0aWxzLTFiYTdkNWEwNDJlNGU4ZmY2
ODU4YjA4ZTExM2VlYzVkYzRlODljZjIudGFyLmd6CiBzaGEyNTYgIDMxMzdjNjMyYmJjZWM1ZTg4
YjcyZGMxM2Y0ZmUwNmVlMTg0ZWVhMzY0ZmVjOGY3NDk0YmRmYTU3NjcyZWY5MjEgIExJQ0VOU0UK
ZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3Blbi1wbGMtdXRpbHMvb3Blbi1wbGMtdXRpbHMubWsgYi9w
YWNrYWdlL29wZW4tcGxjLXV0aWxzL29wZW4tcGxjLXV0aWxzLm1rCmluZGV4IGQyYWMzOWFjYTQu
LjA4NjU1MmUwOWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3Blbi1wbGMtdXRpbHMvb3Blbi1wbGMt
dXRpbHMubWsKKysrIGIvcGFja2FnZS9vcGVuLXBsYy11dGlscy9vcGVuLXBsYy11dGlscy5tawpA
QCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLU9QRU5fUExDX1VU
SUxTX1ZFUlNJT04gPSAzMjQwODUyMGZjZWJlNzg1OTgzYTY4ZTM5ZWM4MzgzMGEzMDA1Nzc5CitP
UEVOX1BMQ19VVElMU19WRVJTSU9OID0gMWJhN2Q1YTA0MmU0ZThmZjY4NThiMDhlMTEzZWVjNWRj
NGU4OWNmMgogT1BFTl9QTENfVVRJTFNfU0lURSA9ICQoY2FsbCBnaXRodWIscWNhLG9wZW4tcGxj
LXV0aWxzLCQoT1BFTl9QTENfVVRJTFNfVkVSU0lPTikpCiBPUEVOX1BMQ19VVElMU19MSUNFTlNF
ID0gQlNELTMtQ2xhdXNlCiBPUEVOX1BMQ19VVElMU19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQot
LSAKMi4yNS4xCgo=

--_002_BE1P281MB310985DED7F956EA79AA0C649B22ABE1P281MB3109DEUP_--

------517FB700262ADB1EFBE8F2A03DA15BD8
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
oSqrfruFfGVmcKfpItvuuzL6q7GGP6tIgbir8yrdN8cuC/ar31WtVCAUOreJRG3n
6D+uiCEYjkdWlQDJ7GVuVkcUTa0uJtLUi2zK8zMt+fCbjreGJoHnC56LDHwFpzx6
+fCFkJyJZzl1EbFjsNQjLH3cHyt27QStuhHJB0kN4ygPLhEU0ray/3i4/lpTgCSs
C0i6TjIxUeyq/rtELAvX+X2rjdpsqwjd80E9j/VBQVzGzFHKDkQft2qAdlVpUeZM
/ReA+7NU7rBKHTOTBnm5YRGs5A5bs93gsSVct9TTzfR7ngFUK4KQoeHKQ43wQaQc
B8DWMxajRUaPhExp/ZNXndPlb8skDDEtA5jCADlEeSKBbeTq/AtkJm78yp4aA0Tt
f01N6RGydr2GfXu7VD9RkEfHi/j/TizyCDCMGcEsRzWevatTpCKunwwhGSm9npvP
hNyO0TVLIhCBG2LtwEvTK5AiSR8tIa6Rxd/x1kFUcg7eyjQQ9cmandVcFuTNJbHH
qHFGrPhThReJqyQaOBgyJHPpVa74gGMDb4Sw36CUtalT8Itq9VR55f9bnKJvIuH/
QCllbG+OSGkxPoEbO4tY+lsvO2t9ayTwvPKN5ZrmrHjL2IIrABcdeWoJLtZuds8w
+9tZAgMBAAGjggFnMIIBYzAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQJDL8q
oh0EJAyy+UAKQcLPWnKqgDAfBgNVHSMEGDAWgBRbJXuWpGVRfrg588B4Zl7oOufw
7jAOBgNVHQ8BAf8EBAMCAQYwgf8GA1UdHwSB9zCB9DBHoEWgQ4ZBaHR0cDovL2Ny
bC5zd2lzc3NpZ24ubmV0LzVCMjU3Qjk2QTQ2NTUxN0VCODM5RjNDMDc4NjY1RUU4
M0FFN0YwRUUwgaiggaWggaKGgZ9sZGFwOi8vZGlyZWN0b3J5LnN3aXNzc2lnbi5u
ZXQvQ049NUIyNTdCOTZBNDY1NTE3RUI4MzlGM0MwNzg2NjVFRTgzQUU3RjBFRSUy
Q089U3dpc3NTaWduJTJDQz1DSD9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jh
c2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwDQYJKoZIhvcNAQEL
BQADggIBAAL46l3QisysCAM2VGb/CimG4VSDLDPox2yuEKlUgX8qLYgmraaoNCgP
GQapneIClQQyZEwLyvnjfcMTW+iXQI534+OCgYetAWAHw8XhIP23MJc+uhxxdItf
Taex/k58CXh6h1/xrKElEZfHLBGckOpyFj0CNam75SPYH1JAt9COXdojvDPpMv24
dZ9Dvj1XS4dh3u2WyHB8frcT4QlAuxkCBw9r3R/SzA5aEhjkwbGcvr4rER7lmsXg
oTWx5OGyYq7A6Gx8lof6YN4tiRwUQUA5onfvsBVbAT8ezuYUqZy+gp+xYhffIkO1
Mm+3BfwYytp6Q11ltSb+WkGhaXSX8UNRjdx/2VeEpx1R8oJtqw5806Pl4MmVBG3y
x5134qX4yMW5ZwZvbf3Gf26+xWrbBDbbMG9dvciZ/sRylsy5y3SLJKkTC3i1Bsr1
iyYWc5gdcZWd8/BS6WxVfgUiF9CJPGXtV4B3/NisvbNTjwd7WBN6sefJsPjjyaGR
4nTOymgbshvElmCUkNvlCLc+zIh9Z8BV/Chz3hw72s8PHLYI0jM++TySSKBacIge
EBeYenbdYEg+ckU+cGuM60h8WbVWBRIUCkZNAjYJ0WxzIVIn2GvE0nKnTH7bNs7T
Pctc4u4b3fk6/U0T/w7OUrYWcTOgl8Vf9oIYF7U6m5u2eKsb6/1aMIIHcjCCBVqg
AwIBAgIPRXOLMhlC+HUxekgG6wqVMA0GCSqGSIb3DQEBCwUAMFMxCzAJBgNVBAYT
AkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcxLTArBgNVBAMTJFN3aXNzU2lnbiBS
U0EgU01JTUUgUm9vdCBDQSAyMDIxIC0gMTAeFw0yMTA4MDMxOTE2MjhaFw0zNjA3
MzAxOTE2MjhaMFwxCzAJBgNVBAYTAkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcx
NjA0BgNVBAMTLVN3aXNzU2lnbiBSU0EgU01JTUUgTkNQIGV4dGVuZGVkIElDQSAy
MDIxIC0gMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAK1mlxAxJhlg
BGAMtBG6/Pgsc+zJkd8OTSALhaNK2f0/+ieNt0TnI7gkyJ0phAg6V8l3E+j0Faku
40/nj/lejhgsHyF8gvhhgV+P9JZu75PSlvUT4mPSIe8RlQzMrjun92kx7IXbhySl
gsQOM/SD/lbxKLnElbMEyeQfn09VHrRP4GwSuwzRIWxZleo/hb7Kd+cPIf8FNNPX
qXfd5MX4lT90WJ3UdTQFYdK01JBW3tVP4Ath9jtRldmqutgz5+4/7/u/usb3DcM7
BBxxM295hRybgfVACJKsYjLkJk0JAqMf0A5FBdIt/0k3rU+AxfQDATjFCqYDAzn0
2LzAGcJbcox9Odl0+aOwQhFPHp8Ry6I85nXQWHjX8ii0jTesFXTkTb5eRQuoTkpI
0BYE76Sct1O2GH1HkAIdg4soI4bjap7M3nyJRNmDit46hV71NbECqO14j33/DkUv
s/r6u9EF6qJh1DYcWW+Xyom+Yd4HPIqaKjztIltqHCEc7FvGmlkQqUvpzn2iYuCy
dPLbHatMqIu3F/MPEVljeIlz47zkwy0DCc+CIUdtrDajQDH8HoQAdewJmWKWUQgT
QGRKZRkc0eh3MKaoMvk/hTkcvjHd1sMnaM+aa3Gp7YoY6IFcItC3ORUqy8YGHe7H
eRS4+uIjmy+iU6T26YivkV24j8GiROMhAgMBAAGjggI4MIICNDAOBgNVHQ8BAf8E
BAMCAQYwNQYDVR0lBC4wLAYIKwYBBQUHAwIGCCsGAQUFBwMEBgorBgEEAYI3CgME
BgorBgEEAYI3FAICMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFCtmGmME
GQOnGfw158O40TaPTppBMB8GA1UdIwQYMBaAFAkMvyqiHQQkDLL5QApBws9acqqA
MIH/BgNVHR8EgfcwgfQwR6BFoEOGQWh0dHA6Ly9jcmwuc3dpc3NzaWduLm5ldC8w
OTBDQkYyQUEyMUQwNDI0MENCMkY5NDAwQTQxQzJDRjVBNzJBQTgwMIGooIGloIGi
hoGfbGRhcDovL2RpcmVjdG9yeS5zd2lzc3NpZ24ubmV0L0NOPTA5MENCRjJBQTIx
RDA0MjQwQ0IyRjk0MDBBNDFDMkNGNUE3MkFBODAlMkNPPVN3aXNzU2lnbiUyQ0M9
Q0g/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNS
TERpc3RyaWJ1dGlvblBvaW50MB8GA1UdIAQYMBYwCgYIYIV0AVkCAQ0wCAYGBACP
egEBMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZYaHR0cDovL3N3aXNzc2ln
bi5uZXQvY2dpLWJpbi9hdXRob3JpdHkvZG93bmxvYWQvMDkwQ0JGMkFBMjFEMDQy
NDBDQjJGOTQwMEE0MUMyQ0Y1QTcyQUE4MDANBgkqhkiG9w0BAQsFAAOCAgEAvFxg
4AvqZothV0hW7gudd8Vcu7lstjDrIKinahkT30x0mL1n00ASbhR7wbFVvpCZy9oj
Aj3VKdf9Nu++c4dYVrgspkWANg8lj8rZAUtxdl628dISURAXc1xKrvnKqSWvdmfT
IiAkWKi5I8RF14ktxHuHZk8+I8ndFU27iqKRvvehqiXpb1uIaZ/gY+laTfRJ48KO
/0iV+E2AJAd6UudNVXLOCMhHXhbZm3mDkxjzKX3qHTU68/TSt8TTCZSl+Ql/jXF9
T/4dZMm15ev20a4Xliki4J9PbxTZvpiVdPzcl5YYm+5lz6l/TevFjFAiUflYSRk8
zqhrVvRyTQDNj3x3SYbN2YAD1r5I7X3hu+Fxf+O9lCjABECS3ZI1b29vzWYm83vk
LY9xyqjMvIEtANwk+keHTW2qP76bShVz2eu7CJeHymMm0xnfZSIp46vXpmJuumth
/XKebCCxru+Unc2dn6tsPZ8/+WmC8DkGE9snIO30PVMKIAyPKFMOldt1NC2zTN1e
n39aMqzjc7ehKNsxc1raZku4audhwNbUnUL5CSDIsvZk0RGaLuYuji0nzVD8jXlx
bDOBBdi75pB8Sw9LNia88W2wX3SNQSZ6xE1WvNAhJ6eLpozm5zh1rPFw4hONonwm
kHTW/3EV53wUltrlizW88HtH2LzbGp+UpyHNcp8wggg6MIIGIqADAgECAhRgUUcY
DStW87d6tzzEk3f3iIxZjjANBgkqhkiG9w0BAQsFADBcMQswCQYDVQQGEwJDSDEV
MBMGA1UEChMMU3dpc3NTaWduIEFHMTYwNAYDVQQDEy1Td2lzc1NpZ24gUlNBIFNN
SU1FIE5DUCBleHRlbmRlZCBJQ0EgMjAyMSAtIDEwHhcNMjMwMTMwMjEwNTQyWhcN
MjQwMTMwMjEwNTQyWjBsMQswCQYDVQQGEwJERTEdMBsGA1UECgwUQmVuZGVyIEdt
YkggJiBDby4gS0cxJTAjBgkqhkiG9w0BCQEWFmthaS5zdHVobGVtbWVyQGViZWUu
ZGUxFzAVBgNVBAMTDkthaSBTdHVobGVtbWVyMIICIjANBgkqhkiG9w0BAQEFAAOC
Ag8AMIICCgKCAgEA0Iiu6ixHZGaoFYNIAbYJaQOdqxsqTYEu1bkfa8EJmx9WGFo9
gcUePr0sPdpAmwa1jvqs9MkCg1bwvqOG8oqgLuwvi0wPP380m2b5rwOZVYR9v6Mt
mrKgCdmpwp8R1vT5/zl+a9IU+/J0tkSxa90OYYKeMlDWLt2S8dmt/HqJLUBsJ0rt
L2vhk625tUMDg36lBEhMdPXuOvGLTLbIeRa8fP6CAN88jUVHRRuKXhnveO+SHnF1
gYqEG/x08wQSCym0/y9Y7JJCmCow/7dAsmAMi27byQk+Bjai6BEm71X+8Fd0wzle
FW9PHvZJSwAzjtNUJRlvIKdEbA2ZNGBAJJ76v74QxuPzBqV7K5ku+iVm4av9O3/A
2a+/jCYDuiaeOGKxS4eHZ8asZW8f9reLe1cHNHy6xfFOF7pEuAFSiLnyJWdHaNqz
LOXkCT4Oan3HVzeDUewkCn3n1lWY6djKEY/SC8vjogJWsDDl7qZTQ/lROlsA6XAd
X131x0mWyb/+TFDXUeIZZ4QGft5vCvY9UMFMP10Tc54oc4s3oRZ/SYjLlsDvhjaM
pwEMTGUOLnpghOMsoVOv7kddy5/mdC5wFq1zIrGjfAkres6aJ/uEhDu8ou93HPQK
fVyLfK+i8+VD7/N1+0joluz6YYNriDSAJEEsyVwKpyCet3Imev5xYcJRCfsCAwEA
AaOCAuIwggLeMCEGA1UdEQQaMBiBFmthaS5zdHVobGVtbWVyQGViZWUuZGUwDgYD
VR0PAQH/BAQDAgP4MDUGA1UdJQQuMCwGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYB
BAGCNwoDBAYKKwYBBAGCNxQCAjAdBgNVHQ4EFgQUVhi1QD17TMsu73lk/tgOWlHW
/WwwHwYDVR0jBBgwFoAUK2YaYwQZA6cZ/DXnw7jRNo9OmkEwgf8GA1UdHwSB9zCB
9DBHoEWgQ4ZBaHR0cDovL2NybC5zd2lzc3NpZ24ubmV0LzJCNjYxQTYzMDQxOTAz
QTcxOUZDMzVFN0MzQjhEMTM2OEY0RTlBNDEwgaiggaWggaKGgZ9sZGFwOi8vZGly
ZWN0b3J5LnN3aXNzc2lnbi5uZXQvQ049MkI2NjFBNjMwNDE5MDNBNzE5RkMzNUU3
QzNCOEQxMzY4RjRFOUE0MSUyQ089U3dpc3NTaWduJTJDQz1DSD9jZXJ0aWZpY2F0
ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9u
UG9pbnQwZwYDVR0gBGAwXjBSBghghXQBWQIBDTBGMEQGCCsGAQUFBwIBFjhodHRw
czovL3JlcG9zaXRvcnkuc3dpc3NzaWduLmNvbS9Td2lzc1NpZ25fQ1BTX1NNSU1F
LnBkZjAIBgYEAI96AQEwgcYGCCsGAQUFBwEBBIG5MIG2MGQGCCsGAQUFBzAChlho
dHRwOi8vc3dpc3NzaWduLm5ldC9jZ2ktYmluL2F1dGhvcml0eS9kb3dubG9hZC8y
QjY2MUE2MzA0MTkwM0E3MTlGQzM1RTdDM0I4RDEzNjhGNEU5QTQxME4GCCsGAQUF
BzABhkJodHRwOi8vb2NzcC5zd2lzc3NpZ24ubmV0LzJCNjYxQTYzMDQxOTAzQTcx
OUZDMzVFN0MzQjhEMTM2OEY0RTlBNDEwDQYJKoZIhvcNAQELBQADggIBACuylMcD
myGbvUc1vSuLh7OBxcyMmUDdLe0G0qQt9y68RAXzSB3YdYPGQ6kBUvrEepIA+JuB
Ij5aJKqsm+sFdX+TSOY7a1SezqrdG5QW5C3A86+7HQhXBqkkLCIIgEh+r9MM6sW0
SfTnDIhRZ0wAq3QjghbcI7CF/CbmgjGRcbm8U7jlJy1D5P+ECcEfEiok89nnr/bb
15i1/8ihwG3s8NKdk548N8RqzGxTsJSWW4ubgEakccE3YpQ5RdlMrTNZk4tBu9cU
X91rIlk5LK0qtjNIBJNHFc+oKlKptOpvAKqnYp2UHphXaGYLw9SUjwuNsZ2QVwD5
CBOTpHsBDMxkuRH35ByMCYwb7FX7nGl63pAjSRf8S3H1qOmnP4wc7g6owxQi1YQg
zARFhlnRidzwYJYSW087LGklhAhim+rdFZEZtXpdN8+MaiqHYuwPi26h4+cSTTRy
NUeyFdEUYlywk+yYOnsOCS0LeKf4EVNxwip6tvPNLidj9d6NZIQqRJNdQxnD1F9O
03lOjp2NwnmbCJ0m0fwlOA11++oUsp5j82RcEEfpSPOGGXZZgcPWPbe7rlGZiKSR
TrBwTaeco43JdH62Z1NkFDYopu/UDe9CF/BPfs0tvYK6g+lzg+KHKqUxH2g9n5Ym
qzcfRXDmwYfpUXSTPZM9OP9iHPQkOn+bAV0bMYIDhDCCA4ACAQEwdDBcMQswCQYD
VQQGEwJDSDEVMBMGA1UEChMMU3dpc3NTaWduIEFHMTYwNAYDVQQDEy1Td2lzc1Np
Z24gUlNBIFNNSU1FIE5DUCBleHRlbmRlZCBJQ0EgMjAyMSAtIDECFGBRRxgNK1bz
t3q3PMSTd/eIjFmOMAsGCWCGSAFlAwQCAaCB5DAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMzA2MjIxMjIwMzRaMC8GCSqGSIb3DQEJ
BDEiBCDIlfOpyxWiCxhLj1FfMpwzCzc2RCq9tzl/SwUJUUdptDB5BgkqhkiG9w0B
CQ8xbDBqMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoG
CCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMC
BzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAgDPs5ie7iCy7kGUwx05
FoVp3xfUsWl86v8on6cIUajQhIKz5Bu41CleVzmIVOwTAydL0QrfXg4IIR8xOmmv
/NcEsK93nBaAGf34WJv6tOPPEkPdTKizsp9ujy/39KmE6cYbzjKMeQt3muGhc/Qa
4T8vKhiByFHRN20vMVZiE9Ma8shrctE7sV8KzofghDzdO35j2/SjmhWPkAVGBL9w
tcGIDy0yB/82TXBErUvTyMaZBmlxbsiE1FxGrHhihGtxszngnENMzLjEMjQ/KLqb
4Qr+yIZ9coe3dF3r1zXmAxUVTY1H8yApdhbV4fvUFqgUcKaLwQSzwBD4SSUOmibY
4VenqCav519eD1+D9Wx3rtoeaHa/3PeRHGKE/nntcLlIGgDO/K4oN9lAORHQWs12
KLtUlenPVBeYFYwn60zdk9EnCdkQbCf+sVGiN9T+ee1Dd9jC4fi1raN0gZmCt/kG
o7tuzkYIWobVa6xfxPX2d5wC+fddgWsF4efM+ThITwDy7Gexxxrm9oLjotissZdy
dEnOwrRde0tztVbFJ+mcY89spxGUZ40uvAszR7FNK/bhmSfQizFGOv4vqb6E60+d
uDZ/YBywxf47OnUXemhphls1wue7f1aExwNbe+bW2D6e/RVyFgO7a+cTVAcC6Ery
mdAk/ESlhK8PDRXycYjn1qM70w==

------517FB700262ADB1EFBE8F2A03DA15BD8--


--===============3354587771065061638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3354587771065061638==--

