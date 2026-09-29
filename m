Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA76DCA5FA1
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 13:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E41180EED;
	Tue, 29 Sep 2026 13:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fSenUGWwCCzh; Tue, 29 Sep 2026 13:09:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A002C80D63
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790687379;
	b=CkBEAmF6yoUz3iK0/aHddczM/2evTf2hYmKP/ToCRQxPEQLNyES0zDdwTj3Mpsj1rux1
	 jpAL10E128q+DvpmqVcH3iMABcvhfAkCCUZcL+HnSbAqy1gYSFVFKeNkS7ypzzPDPOBkx
	 Lt2cO7zna8zPerpaWMYR/AHlBdiYJT07TLBjoi0yW5k06RnbVdXA4hvbTQxbjz9Bv96f0
	 dMJBaqGiIKgM8M5c38JdlUNp1tTZaTQeUStqg8QRxB9TcIuudsHIG2KJWbZd6UPtnDx9d
	 xwY9d6aWuun0DgDFnf1You609cUUgm84djqTmh7nXTlBnyM6crO9y6VPPZOwRWITOdQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790687379;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:To:CC:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Errors-To:Sender;
	bh=d5iFK7VSi6Vt3dJgk81z++3fZVUgBQMU2ppbTLx84Kg=;
	b=XPvPesOQ4cdy3eI40SciDdXAP5HA7yz6nGyeMLXwYn0LowUmTHsrBYriW/N5JLnss4+O
	 KRhK3OWMAwD6xgI12lnpA/Fmy4zGTWHMbznyZ0pO9RZtHktTZLOT63iydzgihHu2J2iN7
	 nPAg34rn1e05NUBXugpC1Rgz5Bm11WSLESg1aSiFw1qF1pAGwqz+BtawadLwVVSMWQWjK
	 ALy4W7GBB/pjVoeloD/u3RMEWukBSLOp9eNrwawwEzWveH4Ko1bhMovDDOYhZiXM9hBMM
	 RmG19vGNCq7iHBDn40zSPVL3oN+QsH2UxqNiPaYNdG+80X+IDwYg2P6rBpVpnwmdJjQ==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790687379;
	bh=d5iFK7VSi6Vt3dJgk81z++3fZVUgBQMU2ppbTLx84Kg=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yc+ElIe1WAI44moVYUFfAmaQNXmeT2EcDzJv/CILH55IlJewBzIxQehneX6QAxE9K
	 +IXlQWYfrGW4c2OOmgb5QCTl7qQO6b2Yv33vrCK7EfWg454N8jRC3/00wGRrQarXZ5
	 /ekGmx72l8SV3xxZcymGUSh1SLeE6PPrtWH8Mfd2k+v/5L9A+gCw8E2yyEUF6fOvo9
	 ch35/Z6Aj2XxTld/HybuhvWq530M39ItoTlqf18fKg0WkIWuS20GUXk2KKiwqs5Hf2
	 SOGmq5Ce06yCZjid1/QMigiP7H9VP6I6VjZkPW/0oMPKHFPBlayHqhUSjYxkU2kBRo
	 t2GMOfLjk6NPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A002C80D63;
	Tue, 29 Sep 2026 13:09:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 678E22E5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 13:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DD6D40714
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 13:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYgtwDcQGOSZ for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 13:09:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 91A0A4061E
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790687376;
 b=p4+YnJ5aBZeYb2BFEyACAhe/NBV+hPvOb6HbZ8US73XV6DCh+HZU9rc0QqFRiqyeyqGm
 d+9Ar20khPekpcIn7N7aGidTY5fkUT+1oX+vH7QmWq+Wk7RBqSVPckgepjbiCxkSVRlQT
 UcondnHUvvKsHYcOoOVCib6NtwfJtnVgBFBi/SRDn2hRHx6MQlvvkcTTORNM0UVRhBHbg
 P27VmQRvBwugCu/JGG5FO10zZ46+cIZzFzmPVJkG4AUvJYBUDh9ZsRoLmsKgodX73fLx+
 3hd46Fa4iaxxpKF1ZKW/dYyvl4H7NgXDGVezKxDbD2zm+S6JF9yzRlkHlMZES0om3CQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790687376;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
 x-ms-exchange-antispam-relay:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:
 x-ms-exchange-antispam-messagedata-1:Content-Type:MIME-Version:
 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=nVmrppH2WvNBrOSuuTke3++SUTTrEzJ0OJmFAa2wqCU=;
 b=bwEq0E0VlLcuCStbnoPNrf7xcyy0nlgkq1YSgTtpiWtDVtMkTUvqD6tqUcguI7G1DMT5
 /qgoQBBUqLFaqutAUkE/S3JXxY2/lofP2ffsea3wVBfqkHjrBcitvUCHrkSK5z8mw3DFF
 +5XoqLjj/gkvIjVeoi38Klq8UpLXOgRjWAtQS+Ex29KN4vc4Fr+sGKI5kfiEsgIZ+nA98
 ijf4ufY5fjn8opEbs6eNFI5EspCn5pAU81DZUQLWh/WZQ1QjPhzpiaYv7Sa7JmGsU1KNh
 q/zgpxjjXosLOzO7cPaxRMPwdN5KaV0Pdag+WBYmEWBYYHkrR34v4lbBfXBKoDFkbzw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org;
 dmarc=pass header.from=espressif.com; 
 dkim=pass header.d=espressifsystems.onmicrosoft.com
 header.i=@espressifsystems.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-espressifsystems-onmicrosoft-com header.b=dF9RhXxi; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c406::3"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c406::3;
 helo=os8pr02cu002.outbound.protection.outlook.com;
 envelope-from=gustavo.nihei@espressif.com; receiver=<UNKNOWN> 
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazlp170120003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91A0A4061E
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 13:09:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1iYwjNA1L+bVcfQjTgTTZtwZC6y66TsnR0f2DD89NLwthXWILQFYU5QzCRFIbnnedpbBa70L/1hN/OSw6uomwvJw5pSomyupaCaqCGN9/64W44rgHjsNkiPpTpLHh5mi/P7x9CkcM3zGjJ47u+Ap0kjoUWvwj6jHqh4wsMntE7Z2VZ4d3r6v2n0ssudE3Sy+dDvtodCsnAfFZpBN9P1CD9oLn7uHoqs7uPTJSDD0OoN8QzplB8v/SJw6+yEReB2BhRaEucs4KaxGC1/g+gW2m62aC3YmNwOwCTAZsbWRsLf9X7+c0ApLEkmiZVkztasvFsBd9C8KsaX5CVB7cbQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVmrppH2WvNBrOSuuTke3++SUTTrEzJ0OJmFAa2wqCU=;
 b=WdpwYMhmLvvbg323960l7b5uOEYLOnO/crFsPAl4JWTtqThBe0g4nW1JBUndN/FCU9LEtx8vnFi9RPkYezYyg0gnMMQVchAUFIwPV3La0iXBTLyCITU/RRZPKWZfrkp9go2WB0gzfrW32oKFdAmMt6hBUntOaffljOqUQRlX04N5HUVahU7GrQ6vxmem/XIdeVsCgpRvpVGpKn2i9LaBXMXwfniqGmGiXqShHU50valISJMm8e3sjBZZgq39/xvDrYjf6dQQ5ELdYCj1P4s4D0q9k7W2IqJnUZXyEkUSdnlyoQyQyg1utCRACliUBiqnFuaPSf52tQh0iWuPIAT6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by SEZPR04MB7930.apcprd04.prod.outlook.com (2603:1096:101:231::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:09:29 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 13:09:29 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Giulio Benetti <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anton Maklakov <anton.maklakov@espressif.com>
Thread-Topic: [PATCH] toolchain/helpers.mk: copy only the multilib variant's
 dynamic loader
Thread-Index: AQHdT1pUaeLo0LkpIEKbRlJZ4V7cYLblhyQZ
Date: Tue, 29 Sep 2026 13:09:29 +0000
Message-ID: <PUZPR04MB54192619219E6567D7F4D256EB8C2@PUZPR04MB5419.apcprd04.prod.outlook.com>
References: <20260928150149.963781-1-gustavo.nihei@espressif.com>
In-Reply-To: <20260928150149.963781-1-gustavo.nihei@espressif.com>
Accept-Language: en-US, pt-BR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB5419:EE_|SEZPR04MB7930:EE_
x-ms-office365-filtering-correlation-id: 51ae7d47-59f9-4353-c0db-08df1e2ae526
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|23010399003|10067099003|8096899003|56012099006|22082099003|13003099007|18002099003|38070700021;
x-microsoft-antispam-message-info: fDqoqtsfOZsiKCt089spm8CGe/3SrbIWy78YNZJAy1u9sxN4Vn0Yn7LDOcbsf+JoXR6YX5vBm5PV6if+KVpvple5nr7TWn6QN6cgsuvnR6b/8EMbZ/9SkzyxiT+ih9IM+qP2YFSeBLyRAwJceGBwLvUlqF8YoyQh0+HnVhCcRLn+AJfMV4lLjNC6Ygbghmm+5tKgdnY/lvlTBkXP7q/qvST1dMdwz0xJ9SUAgCLif9fK+Y1ctNMRkscx7EA/GtdNAeKNSo1fhObuHjBx/LVucn8+TpvRjmfQRrfDHqIznVSlqzjdStwprCvk8a5+MkDvRuDWqyE4GoKtYsA6ATKu7eTude1/ANIhKgbu3UcJXjB8xto7TeFBmkIWk9JfO0o756a7s4b5nrCoi/Gm84HIeetT4B4X0ctemUtp6bZfbL/hcLPMtCw/ViVpPs7vH+IrJRaYLInfI/xjX5CrjtLIvjogLZEvz7BrdKLk56QqpDqEb+OHgOXC3VryKVNjy68z2AoR64V6YgqP+zCvbPDKgPLmhUhPeeRCW6rRcPljM8nsWgMvnixqBS31JjTEMpiMFddALnNRkps0u8cbIJq4gUtQRzlNxuUvY72ElOG4ahtWYxYHis62FT3XcNyCsgQwGBsOjDS7oRq+wJjeHQBgID2ZjCMK9gf0eOV7PLHDs3Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR04MB5419.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(10067099003)(8096899003)(56012099006)(22082099003)(13003099007)(18002099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tdbqfcGqa0Y2jm22/aib8o+al8MmBL5HLUpk58/Pjuo4eSfHYPziU6uLt6AK?=
 =?us-ascii?Q?p98bzX565JA28mgTbqcNcq+nRWVWz8G488f3D0LVZF4eQzyvn75fCwmlrDz1?=
 =?us-ascii?Q?kjV5isgiQRzV3/WGhtHbFFV/349xtgQp59a+0rixyNP2vI4gg35XB8NrDeS6?=
 =?us-ascii?Q?Y5lhXusfMF3P84QGKlCMm3lcgqL2HIWlvKFweZFrjmA0IGAbcpH78ssZIPJZ?=
 =?us-ascii?Q?25TZPWlCktKNeUd+pnJZfJ0qJ5olvFuOCxytkZEyxkO1HXpIBWt+nPK8g7Lm?=
 =?us-ascii?Q?ovzCnO5dAwN36OTTqAlT1K2/qIcTz3dD6iixxWxbJwVp1RxulQJvZvVD2nHf?=
 =?us-ascii?Q?S/3y4MmGvBcJH47b++OVkhFY/GzdkcoVHxh4RAD8nwDfG8ImK2Bh2FEU2e0Y?=
 =?us-ascii?Q?GlKQweZicGXGTb98MkQK0K6mxu02hoC/vGFnXRAshWQBo2xgRvxLlwbtkPpd?=
 =?us-ascii?Q?Yw39C61VyWLskqp2j5dJcnVaDX6llXdgUElZX/cuwgh/m7uPWOItQZ9EUb9N?=
 =?us-ascii?Q?eQg1iUOTEu+HjpYW/KPHwgbzspLRHHNNjWOdUDNocd6tlCGfVolRHGBfGrEd?=
 =?us-ascii?Q?iVpA/3fZ5llXSFk5QxiFQBHTJ1OcKfZaYBcqKpQN4XB2xpxLdWwfFt5gZAXT?=
 =?us-ascii?Q?ALulilKquSa0hHSowuzZBMuEtP4CPs3jOrqLFsimrVQOdt7n80lHVSY2v3+f?=
 =?us-ascii?Q?WTbbYLfreOJ9PQbzBopNovG4B/1N/A6gFxYfTaPFxnoXf/xrMR+qgI7+nmXD?=
 =?us-ascii?Q?nmE/HmmkE8T6Pg2D1PWo4sSJonfyabBQuMLbqx6N0ic86CtGJEzl/uPqj+W4?=
 =?us-ascii?Q?VXEpA/YTbuFTJjGIPViFNzsoB6k2kNJwQCd3jbKNIezS+hmxvTceUL61Qxyh?=
 =?us-ascii?Q?iaCVrINEO7QIirV4nP1ruaN689BcbkQngl6s1IfJoZIU1A18kr2MwVkERFmI?=
 =?us-ascii?Q?0YuI6tTY53rZWSP0ahP3np/lgI/1ZjBDQNWhb10xatQ9GQpGU3mV694ln0aZ?=
 =?us-ascii?Q?4o55n1MiGmVKcEssCeGKeQHYIsoQ5J6HLYoGovXEscIzXilrDuwI5ZPJo610?=
 =?us-ascii?Q?Yd+KRKm+XNN14m/6TDpEJ98zMBVhB085EJQk0PKcxr7TzR6rOIpb3UMGlzLQ?=
 =?us-ascii?Q?bZfjfntWLemxWq4h19ZQAqMUMK5FZndx9CVi/I/CCqoNaGCfQ0PC8HmpjU0T?=
 =?us-ascii?Q?voWyqM3k+iOV4ujtXJ3IGCC8dS5nMq4Mu+QpcfI5wSw64QmJafyulYhwpUHE?=
 =?us-ascii?Q?LLhdoY6j4OIdqPWuCm5bvr66x2X2a52SeUE2hH5Vm+OQMA8JnPuKf0t0m7aR?=
 =?us-ascii?Q?c5pmXFrMKSRkl11c7uWCGdWzBT661PfQJXAnUarbT0VtiYzoyqhXgaN61umy?=
 =?us-ascii?Q?gUBg7ZM1e76IGOm3cCp+qqPKc6ObXCQOzMZ/I9v9gEoSJTufB4GmiVkq47xd?=
 =?us-ascii?Q?m2opBUiwQ0yo9/YGKPLNxAYmWKb0ouq50sssPRySvhSUttoCAGSVDKhFDARM?=
 =?us-ascii?Q?rqUUJFG2kj7lgi9X8RgV0005ah6WB+Sn2BmLxGVLakR0BJVCCcysrPaHGBhe?=
 =?us-ascii?Q?RnBTmuhVhJEPUAhtBju7SnCHvnHEwDU4wlnYcKPhkTTUF1uoMTvQj7pLD8LV?=
 =?us-ascii?Q?2pCPDZhvzOuIlfIqgEuSe6LC8+DNO9WCudp9bHrFA5FiM1i4MuNA7MwwiA2k?=
 =?us-ascii?Q?ZyFx9tdfgOv3MLEhYViNQZd4AmzZux59xogzF0CMcN0OUXhkooSmKoIyQUgC?=
 =?us-ascii?Q?LqkER9EU1UjqFjdL4uXDjyVYgA+pVjsXIiN6NExZqJSKIUbGyLNFl9wzK6dL?=
x-ms-exchange-antispam-messagedata-1: NANXc0UQct+Zmg==
MIME-Version: 1.0
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ae7d47-59f9-4353-c0db-08df1e2ae526
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 13:09:29.1267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RD3LDkv4SNyE+L2K6u8i8pLwo/nBKUXxDtsfWEYZVGG88JsfjoV06xnPE+LndA63AWajYKGag+Kd4M7L7TjMF3DLFR6hLTnk5VaTSMjIlKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7930
Subject: Re: [Buildroot] [PATCH] toolchain/helpers.mk: copy only the
 multilib variant's dynamic loader
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
From: Gustavo Nihei via buildroot <buildroot@buildroot.org>
Reply-To: Gustavo Nihei <gustavo.nihei@espressif.com>
Content-Type: multipart/mixed; boundary="===============6356450859204546494=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6356450859204546494==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PUZPR04MB54192619219E6567D7F4D256EB8C2PUZPR04MB5419apcp_"

--_000_PUZPR04MB54192619219E6567D7F4D256EB8C2PUZPR04MB5419apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

For context, this affects external musl toolchains that ship several ABIs i=
n one sysroot. musl's dynamic loader is a symlink to libc.so, and every ABI=
's ld-musl-<arch>.so.1 sits in the shared lib/. Single-ABI toolchains such =
as Bootlin's are not affected, because their lib/ holds only the selected A=
BI's loader.

It reproduces with crosstool-NG's x86_64-multilib-linux-musl sample ("ct-ng=
 x86_64-multilib-linux-musl"), whose sysroot/lib contains:

  ld-musl-i386.so.1   -> ../usr/lib/libc.so
  ld-musl-x86_64.so.1 -> ../usr/lib64/libc.so

Selecting x86_64, the target /lib gets both loaders as full libc binaries, =
next to the real <path of libc.so in target>:

  ld-musl-i386.so.1     (the i386 libc)
  ld-musl-x86_64.so.1   (a second copy of the x86_64 libc)

Neither file is needed. The x86_64 binaries only use the second name, and i=
t can be a symlink to libc.so. With the patch, that is the only loader inst=
alled:

  ld-musl-x86_64.so.1 -> <observed link target>

Selecting i386 (BR2_TARGET_OPTIMIZATION=3D"-m32") breaks the build. Its lib=
raries live in lib/ itself, so the sysroot copy brings both loader links in=
to staging, and the x86_64 one dangles because usr/lib64/ is never copied. =
The build then stops while copying the loaders to the target. With the patc=
h, the dangling link is dropped and only ld-musl-i386.so.1 is installed.

I first hit this with a RISC-V multilib musl toolchain (rv32 ilp32, rv32 il=
p32f and rv64), which shows the same two problems.
________________________________
From: Gustavo Nihei <gustavo.nihei@espressif.com>
Sent: Monday, September 28, 2026 12:01
To: buildroot@buildroot.org <buildroot@buildroot.org>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>; Romain Naour <r=
omain.naour@gmail.com>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>; Gu=
stavo Nihei <gustavo.nihei@espressif.com>; Anton Maklakov <anton.maklakov@e=
spressif.com>
Subject: [PATCH] toolchain/helpers.mk: copy only the multilib variant's dyn=
amic loader

A multilib sysroot ships one dynamic loader per ABI under lib/.
92207bc03f ("toolchain: handle toolchains with multiple ld*.so.*
files") replaced a flat "cp -a" with a recursive find and a plain
cp, so each loader symlink is followed. Each loader lands in the
rootfs as a full libc of another ABI.

On a musl toolchain with rv32 ilp32, ilp32f and rv64 variants, that
target directory is 17 MiB and contains three libc copies. Selecting
only the matching loader name still leaves the loader as a second
copy of libc, 15 MiB. The default rv64 variant fails earlier:
copy_toolchain_lib_root stops on the dangling loaders of the variants
that were not copied.

Restore the flat search. Install only the selected variant's loader
as a relative symlink, resolving an absolute target inside the
sysroot. musl's own install creates one, pointing the loader at
/usr/lib/.../libc.so. A loader that is a regular file in lib/ is
copied as is: glibc installs it there even when the libraries live
in another directory, such as lib64/<abi>. After the sysroot copy,
drop loader symlinks in staging/lib that no longer resolve. That
covers the case where lib/ is itself the selected variant. The same
ilp32 target is then 14 MiB, with one loader symlink and one libc.
The rv64 variant installs.

Reported-by: Anton Maklakov <anton@espressif.com>
Signed-off-by: Gustavo Henrique Nihei <gustavo.nihei@espressif.com>

---
Link: https://lists.buildroot.org/pipermail/buildroot/2018-June/589607.html
Backport to: 2025.02.x
---
 toolchain/helpers.mk | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 21c710d0fb..37faa8e9ca 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -126,6 +126,28 @@ copy_toolchain_sysroot =3D \
                                 $${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$=
$i/ ; \
                 fi ; \
         done ; \
+       mkdir -p $(STAGING_DIR)/lib ; \
+       SYSROOT_CANON=3D`readlink -f $${ARCH_SYSROOT_DIR}` ; \
+       for LD_SO in $$(find $${ARCH_SYSROOT_DIR}/lib -maxdepth 1 -name 'ld=
*.so.*'); do \
+               DEST=3D$(STAGING_DIR)/lib/`basename $${LD_SO}` ; \
+               if [ ! -L $${LD_SO} ]; then \
+                       echo "Copying dynamic loader $${LD_SO} to $${DEST}"=
 ; \
+                       cp $${LD_SO} $${DEST} ; \
+                       continue ; \
+               fi ; \
+               LINKTARGET=3D`readlink $${LD_SO}` ; \
+               case "$${LINKTARGET}" in \
+               /*) LINKTARGET=3D$${SYSROOT_CANON}$${LINKTARGET} ;; \
+               *) LINKTARGET=3D`dirname $${LD_SO}`/$${LINKTARGET} ;; \
+               esac ; \
+               LINKTARGET=3D`readlink -m $${LINKTARGET}` ; \
+               case "$${LINKTARGET}" in \
+               $${SYSROOT_CANON}/$${ARCH_LIB_DIR}/*|$${SYSROOT_CANON}/usr/=
$${ARCH_LIB_DIR}/*) \
+                       LINKTARGET=3D../$${LINKTARGET$(SHARP_SIGN)$${SYSROO=
T_CANON}/} ; \
+                       echo "Symlinking $${DEST} -> $${LINKTARGET}" ; \
+                       ln -sfn $${LINKTARGET} $${DEST} ;; \
+               esac ; \
+       done ; \
         for link in $$(find $(STAGING_DIR) -type l); do \
                 target=3D$$(readlink $${link}) ; \
                 if [ "$${target}" =3D=3D "$${target$(SHARP_SIGN)/}" ] ; th=
en \
@@ -144,8 +166,8 @@ copy_toolchain_sysroot =3D \
                         $(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
                 done ; \
         fi ; \
-       if [[ ! $$(find $(STAGING_DIR)/lib -name 'ld*.so.*' -print -quit) ]=
]; then \
-               find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xa=
rgs -0 -I % cp % $(STAGING_DIR)/lib/; \
+       if [ -d $(STAGING_DIR)/lib ]; then \
+               find $(STAGING_DIR)/lib -name 'ld*.so.*' -xtype l -delete ;=
 \
         fi ; \
         if [ `readlink -f $${SYSROOT_DIR}` !=3D `readlink -f $${ARCH_SYSRO=
OT_DIR}` ] ; then \
                 if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \

--_000_PUZPR04MB54192619219E6567D7F4D256EB8C2PUZPR04MB5419apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
For context, this affects external musl toolchains that ship several ABIs i=
n one sysroot. musl's dynamic loader is a symlink to libc.so, and every ABI=
's ld-musl-&lt;arch&gt;.so.1 sits in the shared lib/. Single-ABI toolchains=
 such as Bootlin's are not affected, because
 their lib/ holds only the selected ABI's loader.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
It reproduces with crosstool-NG's x86_64-multilib-linux-musl sample (&quot;=
ct-ng x86_64-multilib-linux-musl&quot;), whose sysroot/lib contains:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; ld-musl-i386.so.1 &nbsp; -&gt; ../usr/lib/libc.so</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; ld-musl-x86_64.so.1 -&gt; ../usr/lib64/libc.so</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Selecting x86_64, the target /lib gets both loaders as full libc binaries, =
next to the real &lt;path of libc.so in target&gt;:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; ld-musl-i386.so.1 &nbsp; &nbsp; (the i386 libc)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; ld-musl-x86_64.so.1 &nbsp; (a second copy of the x86_64 libc)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Neither file is needed. The x86_64 binaries only use the second name, and i=
t can be a symlink to libc.so. With the patch, that is the only loader inst=
alled:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; ld-musl-x86_64.so.1 -&gt; &lt;observed link target&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Selecting i386 (BR2_TARGET_OPTIMIZATION=3D&quot;-m32&quot;) breaks the buil=
d. Its libraries live in lib/ itself, so the sysroot copy brings both loade=
r links into staging, and the x86_64 one dangles because usr/lib64/ is neve=
r copied. The build then stops while copying
 the loaders to the target. With the patch, the dangling link is dropped an=
d only ld-musl-i386.so.1 is installed.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I first hit this with a RISC-V multilib musl toolchain (rv32 ilp32, rv32 il=
p32f and rv64), which shows the same two problems.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Gustavo Nihei &lt;gus=
tavo.nihei@espressif.com&gt;<br>
<b>Sent:</b> Monday, September 28, 2026 12:01<br>
<b>To:</b> buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
<b>Cc:</b> Giulio Benetti &lt;giulio.benetti@benettiengineering.com&gt;; Ro=
main Naour &lt;romain.naour@gmail.com&gt;; Thomas Petazzoni &lt;thomas.peta=
zzoni@bootlin.com&gt;; Gustavo Nihei &lt;gustavo.nihei@espressif.com&gt;; A=
nton Maklakov &lt;anton.maklakov@espressif.com&gt;<br>
<b>Subject:</b> [PATCH] toolchain/helpers.mk: copy only the multilib varian=
t's dynamic loader</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">A multilib sysroot ships one dynamic loader per AB=
I under lib/.<br>
92207bc03f (&quot;toolchain: handle toolchains with multiple ld*.so.*<br>
files&quot;) replaced a flat &quot;cp -a&quot; with a recursive find and a =
plain<br>
cp, so each loader symlink is followed. Each loader lands in the<br>
rootfs as a full libc of another ABI.<br>
<br>
On a musl toolchain with rv32 ilp32, ilp32f and rv64 variants, that<br>
target directory is 17 MiB and contains three libc copies. Selecting<br>
only the matching loader name still leaves the loader as a second<br>
copy of libc, 15 MiB. The default rv64 variant fails earlier:<br>
copy_toolchain_lib_root stops on the dangling loaders of the variants<br>
that were not copied.<br>
<br>
Restore the flat search. Install only the selected variant's loader<br>
as a relative symlink, resolving an absolute target inside the<br>
sysroot. musl's own install creates one, pointing the loader at<br>
/usr/lib/.../libc.so. A loader that is a regular file in lib/ is<br>
copied as is: glibc installs it there even when the libraries live<br>
in another directory, such as lib64/&lt;abi&gt;. After the sysroot copy,<br=
>
drop loader symlinks in staging/lib that no longer resolve. That<br>
covers the case where lib/ is itself the selected variant. The same<br>
ilp32 target is then 14 MiB, with one loader symlink and one libc.<br>
The rv64 variant installs.<br>
<br>
Reported-by: Anton Maklakov &lt;anton@espressif.com&gt;<br>
Signed-off-by: Gustavo Henrique Nihei &lt;gustavo.nihei@espressif.com&gt;<b=
r>
<br>
---<br>
Link: <a href=3D"https://lists.buildroot.org/pipermail/buildroot/2018-June/=
589607.html">
https://lists.buildroot.org/pipermail/buildroot/2018-June/589607.html</a><b=
r>
Backport to: 2025.02.x<br>
---<br>
&nbsp;toolchain/helpers.mk | 26 ++++++++++++++++++++++++--<br>
&nbsp;1 file changed, 24 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk<br>
index 21c710d0fb..37faa8e9ca 100644<br>
--- a/toolchain/helpers.mk<br>
+++ b/toolchain/helpers.mk<br>
@@ -126,6 +126,28 @@ copy_toolchain_sysroot =3D \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $${ARCH_SYSROOT_DIR}/$$i/ $(STAG=
ING_DIR)/$$i/ ; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; fi ; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p $(STAGING_DIR)/lib ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SYSROOT_CANON=3D`readlink -f $${ARCH_=
SYSROOT_DIR}` ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for LD_SO in $$(find $${ARCH_SYSROOT_=
DIR}/lib -maxdepth 1 -name 'ld*.so.*'); do \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DEST=3D$(STAGING_DIR)/lib/`basename $${LD_SO}` ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if [ ! -L $${LD_SO} ]; then \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;Copyi=
ng dynamic loader $${LD_SO} to $${DEST}&quot; ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp $${LD_SO} $${=
DEST} ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fi ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LINKTARGET=3D`readlink $${LD_SO}` ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case &quot;$${LINKTARGET}&quot; in \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /*) LINKTARGET=3D$${SYSROOT_CANON}$${LINKTARGET} ;; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *) LINKTARGET=3D`dirname $${LD_SO}`/$${LINKTARGET} ;; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; esac ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LINKTARGET=3D`readlink -m $${LINKTARGET}` ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case &quot;$${LINKTARGET}&quot; in \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; $${SYSROOT_CANON}/$${ARCH_LIB_DIR}/*|$${SYSROOT_CANON}/usr/$${AR=
CH_LIB_DIR}/*) \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LINKTARGET=3D../=
$${LINKTARGET$(SHARP_SIGN)$${SYSROOT_CANON}/} ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;Symli=
nking $${DEST} -&gt; $${LINKTARGET}&quot; ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ln -sfn $${LINKT=
ARGET} $${DEST} ;; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; esac ; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done ; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for link in $$(find $(STAG=
ING_DIR) -type l); do \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; target=3D$$(readlink $${link}) ; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if [ &quot;$${target}&quot; =3D=3D &quot;$${target$(S=
HARP_SIGN)/}&quot; ] ; then \<br>
@@ -144,8 +166,8 @@ copy_toolchain_sysroot =3D \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(cal=
l simplify_symlink,$$i,$(STAGING_DIR)) ; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; done ; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi ; \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [[ ! $$(find $(STAGING_DIR)/lib -n=
ame 'ld*.so.*' -print -quit) ]]; then \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; find $${ARCH_SYSROOT_DIR}/lib -name 'ld*.so.*' -print0 | xargs -=
0 -I % cp % $(STAGING_DIR)/lib/; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -d $(STAGING_DIR)/lib ]; then \<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; find $(STAGING_DIR)/lib -name 'ld*.so.*' -xtype l -delete ; \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi ; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ `readlink -f $${SYSRO=
OT_DIR}` !=3D `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \=
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PUZPR04MB54192619219E6567D7F4D256EB8C2PUZPR04MB5419apcp_--

--===============6356450859204546494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6356450859204546494==--
