Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45009CCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 16:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2914815DD;
	Wed, 29 Oct 2025 16:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-Ka938_6GRz; Wed, 29 Oct 2025 16:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E4682255
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E4682255;
	Wed, 29 Oct 2025 16:44:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4AB4708
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 16:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4DA760EBF
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 16:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7zyXIqb6F_k for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 16:44:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::1;
 helo=am0pr83cu005.outbound.protection.outlook.com;
 envelope-from=tim.hammer@nav-timing.safrangroup.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAE8660AE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAE8660AE7
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAE8660AE7
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 16:44:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZF2QAAJnJIh2KKbmC7IOscolWa2KlUe/Lm297dCfl2Sj2D0buuxp6KwgOXzqsUFeG5K9nXYAOtI9Z0lY8gpFmgQxMg4ooukm8mlx/3IJqRyMAqPDJ0uaScBgmxmIkXUA/5u1O7ewpvsGVUNr4Ah7vMMnlaCZB7T2qynmyMIBWRjb8nnQSmd+f784O1UzNiXQNANrAtPaAdCP6gat3ughP0s0rTmNNhzkCMvdQ/1MGG4DEDxuFC5qD/0lJhIJtCX9wBaA5G5UzGJK4MViyD/Slj1wBy/njp+Fwj+V+vEZdS2cV5b/QDJCOBR9AZbxfIpKtp16PyYbdppZVHfTvIB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXOWFE0HREqAWd5ag64gYqJqCKOrLT+2OinTVpu7V1E=;
 b=QcF+20HhguC7q1Idxn/sFG3g8s0O+KPxYH1Bw/zQD1Nft7s/xaTUTcModM3A/83vhf99B950XlObyYhkpX4S3i2wRQs//7yxzHZBLEWYkSIC5c0CD+EBXsYDOdbiThZjyuyW/jcsulazcEI3jPNuAFK/RF98J6/qsCCxveUYofUTABZyhflvBT/+DoNA4QaNglEgiYSzS2QXMjo/2oXnsgk6sceq1vmN0mfgJrONclhYN0DH8L1dMf9Lbedtujzayf6zLAgC6NXW8fZRPPZhe2z9BSYGBgaWXpuIHq79SdxWRQbh2KVhNaC/7G5GJBB2ZLPTqoXbs0wcIP3lchceGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nav-timing.safrangroup.com; dmarc=pass action=none
 header.from=nav-timing.safrangroup.com; dkim=pass
 header.d=nav-timing.safrangroup.com; arc=none
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3a4::16)
 by AM9P251MB0399.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:3dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 16:44:51 +0000
Received: from DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::49d7:2ea6:801a:8d2b]) by DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
 ([fe80::49d7:2ea6:801a:8d2b%6]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 16:44:51 +0000
From: Tim Hammer <Tim.Hammer@nav-timing.safrangroup.com>
To: =?iso-8859-1?Q?Alexis_Lothor=E9?= <alexis.lothore@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 0/5] package/compliance-as-code: introduce new package
Thread-Index: AQHcPqu4mDIoGn0X9ki1C+ulz7aCj7TZaQbw
Date: Wed, 29 Oct 2025 16:44:51 +0000
Message-ID: <DU0P251MB0779EAF112983D733067B9B3E9FAA@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
References: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
In-Reply-To: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_36fef848-55b7-414c-8e5d-50697d030e75_Enabled=True;
 MSIP_Label_36fef848-55b7-414c-8e5d-50697d030e75_SiteId=a263030c-9c1b-421f-9471-1dec0b29c664;
 MSIP_Label_36fef848-55b7-414c-8e5d-50697d030e75_SetDate=2025-10-29T16:43:41.0000000Z;
 MSIP_Label_36fef848-55b7-414c-8e5d-50697d030e75_Name=C2 -
 Confidential; MSIP_Label_36fef848-55b7-414c-8e5d-50697d030e75_ContentBits=3;
 MSIP_Label_36fef848-55b7-414c-8e5d-50697d030e75_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P251MB0779:EE_|AM9P251MB0399:EE_
x-ms-office365-filtering-correlation-id: 56a38de9-8f1f-4e28-a55c-08de170a7afc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?BC56UCr0h9uOKfw3DlhpJmE2kStoVEZvGZUdElOGJqDK+kMdjq6YuIgXOG?=
 =?iso-8859-1?Q?ALkMUuQ5GnR6w6H4p1EY38j6kzqKjMdyLBw+L7JmHtUk8bbLa2qFcrrhp+?=
 =?iso-8859-1?Q?TK3+ZOwKQojQiEwuM4mZ+XIfyUs1EDa98968o/By9cZEDUWw8VpQEZRpcd?=
 =?iso-8859-1?Q?oFwvEZcGVEgKgfVeKRw805kF1G9b7qDYM5KWdnTy4UMhr3z4D9OcRmTG3E?=
 =?iso-8859-1?Q?hoxFIrbSwXBjJuKdi6Qai/4tPC2q+/XVHx32QKkWpws6hE0K14XI7PqgCH?=
 =?iso-8859-1?Q?tZPoF6mhd6fUYXNf0/nIA7O98CIv3+QbdaXRYww6ox9DYNVah+KEZ/CT+P?=
 =?iso-8859-1?Q?kkrpaapRKsu19QShSlUEu8QzL25nGRzdns3ANlAzE9mSbA6PEAr3LwhXWk?=
 =?iso-8859-1?Q?lSz0gcL98S1vY5GJUU/uUIL3macPtfB14F+7mpqu+eKaU48eDD/z0e4+3x?=
 =?iso-8859-1?Q?wZCpAlz1izcvTnz7+86c7rnUsA7/d6ndJHOdMkI+hUP3rnnQWByrdY2ubo?=
 =?iso-8859-1?Q?rI5U7w8neYFRyGgSmMaQgZ/QShAR1ugVDAfJJzXSgSd5qqvWpvidzvqVXP?=
 =?iso-8859-1?Q?DbFR6pl09+H8gSg0Y7zor7XM1hNzlL6UUscc+9EgZksAXgPDfvo11X21OH?=
 =?iso-8859-1?Q?YaRWbr1yYjDIVGT9yx6n9YOkb0racHMTc7Mgy59dmmseA85m3vrHZVD1tn?=
 =?iso-8859-1?Q?W4lpn2wRJvFpwQIqdraOXWGro1Tj4oYowBLcpZ3SRR5fQkehM0MFCWmu2p?=
 =?iso-8859-1?Q?MVcKFXfn52FcU3zZpeWoa4FSyfV9qOI07XnnAc8Z6VMeRtvyHteIDMSjou?=
 =?iso-8859-1?Q?W3IO5GnLx+tyiDdCQXP5Jbp0J5i0jseBOomWPpZVySbzF91I1j2+jn79Cs?=
 =?iso-8859-1?Q?73Y2QwrSvItb1MVFjLF4cpUf8WrnT+iP3Y+10jwH21KJA/PVrLnHMNXa6p?=
 =?iso-8859-1?Q?OCxDNZA5ejOvZ4t27DRnjx51C3wroGVs9NczZWVIK4MoNdK0Cr1U2BsKcJ?=
 =?iso-8859-1?Q?lwYPyrR3+h0xm8f7O12/LfE7TON1m2ZKWQz1Bl8x4ezpXYlg3xKQI8xbZU?=
 =?iso-8859-1?Q?wtdK90TlJXaMNJ9D2lbNr8uIbZPzUpp8lweeU2+lMkEqQZXzC5LIfmkIh0?=
 =?iso-8859-1?Q?FhZSsmFQYJJkf8vB2aA2Oab+7sRM520FPQVy++RZG4fOTjzT9tmnIp0Bk+?=
 =?iso-8859-1?Q?Ss5se8w8Kzkzfosa/41nhg68r5roY7p+5SU91Ebqb6fs1esP3s8uzctCzr?=
 =?iso-8859-1?Q?k1QSJPe19GgtS9RJ38rCTIaPGW2K1WyuAqfxtCS4piAnLOiwsGoY1yz2PF?=
 =?iso-8859-1?Q?dg2nuv6KXWp01Xp8bZnQuKpvxSLSq16c2URmNQt4hNR4o3w47UNqrK1hnF?=
 =?iso-8859-1?Q?+16GM/lItT02qREaomXFr6sHMMH770+XtCoSQaGx1se5lnY4PcArJRMK6z?=
 =?iso-8859-1?Q?XDqtogt6iOmXL3iBho11jEHcPyqlsi9BAcoA4X4i9py1LvsPxDtbJJmIcY?=
 =?iso-8859-1?Q?Lw4EBU1vfUiX3r45ooHAJT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P251MB0779.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+tjGkPTBDg2Dru69+MlnAQJz9/OE+75Oj+CDC2AfWDlIFJ/3+HLeOShK7T?=
 =?iso-8859-1?Q?UPd6HsAMoDx8v4u2Kk5KRizlaeCveLWPV+EDMVaqYxI5fF+de0ZQevd7Ur?=
 =?iso-8859-1?Q?OLuwEkPZNdJ5Mjq46wHzB54kVSdH1KPO2LyzHuAy6LKBfvo0UB2R5JjTBq?=
 =?iso-8859-1?Q?N8dRKv88FToRz0z/JyiGt+G0lvs8T8CWGi4sxbyKeH1Rs+39MrJ0il1SSz?=
 =?iso-8859-1?Q?o7XH/0q88dGK6KNjx7rkrsGsRV8RtOrvHDybyf4r+OSotvuv7sZEtwAmNd?=
 =?iso-8859-1?Q?LS27D6BMCAIuBmus+CxP+qBikT1M9gvszGemgbtfWuPlnBG0v4FkKg1jlj?=
 =?iso-8859-1?Q?zSt2c58wUU0D9KHgaPkgQ3Wr/1d8s/Ij0BDlzrDWhcAEFSEhTMIPlzcUSw?=
 =?iso-8859-1?Q?8f5Oy//ZMdUuqn7gA5bciSQSxGabHQZz3q9hIrQWjZWacJcDX7yo7bdNVt?=
 =?iso-8859-1?Q?1HPt3ahCEOubk5y1QY2Bw2Embg2Rd+ob7ZlQRk7DypgTe3riBR8OWFd+RX?=
 =?iso-8859-1?Q?gw85mDbcUXknHxT/boV8rYHTzuwW3dvPjvQ+CD3UCPRXLYgDUrG8lFlsv2?=
 =?iso-8859-1?Q?CbIRJQRmaTLv+5YwcU+Ja5Bq7yqmoC54CY393eL7jDYd1uKHcT0qhaj2bG?=
 =?iso-8859-1?Q?nFQo41SHEId/h50MuijxUoEUpDg28oU/naMaol07F91wrA1omin/1cJVFL?=
 =?iso-8859-1?Q?yHHvFyEcHNnBPHxQkQGD1X8nEL426IFVLu56mqAvvJ67QQQYDw3rUKk8xB?=
 =?iso-8859-1?Q?iLhjd/wJUCwA4GD94Fp+yJtkcAQeyfhDxwIlddw0Q2k6kg7hqXxYsgwwkq?=
 =?iso-8859-1?Q?RF4pzY/RlI5i1rcsFZsii7SCfw5S7u0eIJ7NKdf7a87K35xYiaGIa3gV7M?=
 =?iso-8859-1?Q?xPaygprTx50LGGTk5ZYPMcShCF7eGd9U80PjMHe1tegVjO2SWO59Tqlk4h?=
 =?iso-8859-1?Q?zh+9FsfLVlPOpNgW0B0kJk6yjQKxzmqjwCNj8SUkDOEuwLmfJVXFdOUlEM?=
 =?iso-8859-1?Q?WPWqEFZ84vRF5xJ/R9g+ntZPl4pUBfIlJd+qnMSWxgE/vPWIqs0hQ8+XLG?=
 =?iso-8859-1?Q?D0GIG9J9CEEzQQ2MVtQBDALlySIiZwDQuWxVmafO8GEBCkjxaQUDBzWt4p?=
 =?iso-8859-1?Q?XFzQu0wCM/Hk5htahqhX4s3sC7qOAoEm9+HkAsgHHfbCH/tMhGKkU1i/ph?=
 =?iso-8859-1?Q?pLL9DnriHfw56fR5We/FayXe1JNYFM0yTLUxa+f2xUjES9W2pyTeffDOn7?=
 =?iso-8859-1?Q?cWJflYyGKW5bR3eOCVa1bMiN4PJOfv5Y/8d9SLGkFnguzGOrGA6FcYBnI6?=
 =?iso-8859-1?Q?HZuRNhx8aj+mTecHbcqp2II5x47VrvdX0+jpNCbdgwtxNP/2M1kRvqwoBN?=
 =?iso-8859-1?Q?FD1JVk+SyS0d6cH/rkNmV8YyrsdpkCuK9dpzWKHmfNOSJwR7tBeGKxureu?=
 =?iso-8859-1?Q?tQinnEd+2TsyZM+IQ6Q0oQu5WH3XFq75VmXt3ehhxIJscPQXEyNOcPyInb?=
 =?iso-8859-1?Q?m1DlkyrXWtN3cxRaVmf2n1gjxD2mV2MXmhLa/msWWBwnjGIkyjbbe/oN7s?=
 =?iso-8859-1?Q?zm9lXjj7g8Qk6UlrgMWU5lN1c3Aj28yADpVzYnhnvy27CtEIJ6qmVTEMM7?=
 =?iso-8859-1?Q?418XXSplmOVrmlktSSCV/JvMRN74gcgkXH+8uJNKbsNaoZ+RtRoOJuVL7d?=
 =?iso-8859-1?Q?ApBoGCH74h8ONBBCllQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nav-timing.safrangroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P251MB0779.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a38de9-8f1f-4e28-a55c-08de170a7afc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 16:44:51.3643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O9lMOs8mMnvt3wejxlqIGRx2V/M5O35BAViktltnTjLd0C9Nj6xG+XUr1v5fjhrjHvEX/h4IVNHl+PvHDzyOD56Gjp96K+iVuoyzSZuj+DJAGUoUeaFcLGkhP3rW7gJN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P251MB0399
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=OROLIAGROUP.onmicrosoft.com; s=selector1-OROLIAGROUP-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXOWFE0HREqAWd5ag64gYqJqCKOrLT+2OinTVpu7V1E=;
 b=MPDDTUm1fIcMzTjAjJqCAzRoBN6Wv4ftD96EpAKULzJXEIzXYRuy0C+WhT2w6M/keu1w8ll1m4bkCbHCIfN2+PWxl4IN1T0bGdiLWnjSsMN7sx4tUalarxeFP3PdB1XgYNbJPt0UNxhOiZVKbdMqggEITr3hIvzZBl6VxdTBlO0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nav-timing.safrangroup.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=OROLIAGROUP.onmicrosoft.com
 header.i=@OROLIAGROUP.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-OROLIAGROUP-onmicrosoft-com header.b=MPDDTUm1
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nav-timing.safrangroup.com;
Subject: Re: [Buildroot] [PATCH v3 0/5] package/compliance-as-code:
 introduce new package
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
Cc: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C2 - Confidential

On Thu, Oct 16, 2025 at 04:46:33PM +0200, Alexis Lothor=E9 wrote:
> Hello,
> this is the v3 of the series bringing in Compliance As Code policies [1]
> (CaC) on a target. v2 has not received any new review since it has been
> sent, but in the mean time, I found some small issues (either at build
> time or runtime, due to a lack in my testing setup) so this new revision
> acts both as an update and a resend.
>
> This project aims to provide security policy content on systems: this
> content brings data files describing checks standards and automations
> for system configuration.  Those files come in various formats (XCCDF,
> OVAL, SCAP).  This project is tightly coupled to the OpenSCAP tool [2]:
> - to build the data files to embed on the target system
> - and to perform analysis on the system, by consuming the data files
>
> CaC then depends on both openscap and host-openscap.
> The series brings in the following commits:
> - commit 1 brings libxmsec1, one of openscap dependencies
> - commit 2 brings back host-libcurl (which has been supported and later
>   removed from BR, as there was no user anymore), since host-openscap
>   needs host-libcurl
> - commit 3 brings openscap package
> - commit 4 brings CaC package
>
> The new CaC package brings a minimal feature set for now: it only brings
> the security policy data files (ie: XML files) on the target. It can be
> extended later as needed to bring in for example generated bash script,
> ansible playbooks, etc.
>
> Testing output:
> $ ./utils/test-pkg -c cac.config -p compliance-as-code
>    bootlin-armv5-uclibc [1/6]: OK
>    bootlin-armv7-glibc [2/6]: OK
>    bootlin-armv7m-uclibc [3/6]: SKIPPED
>    bootlin-x86-64-musl [4/6]: OK
>    br-arm-full-static [5/6]: SKIPPED
>    arm-aarch64 [6/6]: OK
>
> [1] https://github.com/ComplianceAsCode/content
> [2] https://github.com/OpenSCAP/openscap
>
> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Reviewed-by: Tim Hammer <Tim.Hammer@nav-timing.safrangroup.com>

--
Tim D. Hammer, Safran Trusted 4D
https://safran-navigation-timing.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
