Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4C9C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 15:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 722A340873;
	Mon, 24 Jun 2024 15:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnOB2bQxvDla; Mon, 24 Jun 2024 15:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A8BF4089A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A8BF4089A;
	Mon, 24 Jun 2024 15:29:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FE921BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 15:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BF6E8102A
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 15:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qtc6fIHXZ4bp for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 15:29:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2613::701;
 helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=aleyssens@idtech.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5077081013
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5077081013
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::701])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5077081013
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 15:29:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXVbnV7QlyawnbtcPeuf9N/ZVbg6/Vu6F62emnrCLLv1w8K/LmsUg9Rx4RuKtd+G7bg6/7zoZw4OXQXoRxYL5Rzax/Ck09UCEqykS1WOjW0XQKdM7gWXOfBjyUXMyB2qm9xdzf0LAMH0tuZeSBKsZ2DfyRnqJhwSG5KF7byBOZpnlVUnraHQZ9zMv5bNkZ1piHYjlu7cucM7r1ZnwhFy7uK15PyEg/Rp5b+8ijqFkJQUQQrcO+XmUuM50aD0wPEUxfAY402FVDrmDZkPQbtdGUNjGzh7DgQdYj9nNDAVE1RZYGx/tA8aQvkW/2xBbP+GYidrqEE+fxPPVyDQdoG94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxCmFyqXUrDAbp4XYqz6iAjnAaYf3KuoB/YSgbAMzDM=;
 b=nIv0vaQySbgyfKDWohVMC+pMLcLbKmgIJgN1qE9ziXgXRBqCdcOoey86DmgHVd5sUjc31OEtFuI8a6egYlIPj39F3T4y5JF499wUlmqcjOzQD/PNDlXr1FU/808fAYOplzaPM7oog9EE/+0Q+lBwaeiNHV2innbH9ERrC8eeRyksSjXgElRdBYrDc8Hy4YqBwy54b5al9NpTj+ya5MlFhQhlvKfLQbBUOUSy+uaajrs0kqR/AY6BdWWIqfkZ++U7+UGdoGA+E0C6xIWvPEVR+NA3JmTx64j83hTxU6zc8iyoFw79+kxjbothpdYyH1blQbZs+skr9e6Ejw0lx03IHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=idtech.be; dmarc=pass action=none header.from=idtech.be;
 dkim=pass header.d=idtech.be; arc=none
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com (2603:10a6:800:1dd::19)
 by DBAPR06MB7159.eurprd06.prod.outlook.com (2603:10a6:10:1a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 15:29:46 +0000
Received: from VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4]) by VI1PR06MB8926.eurprd06.prod.outlook.com
 ([fe80::972a:41fb:f85d:e1b4%7]) with mapi id 15.20.7698.024; Mon, 24 Jun 2024
 15:29:46 +0000
From: Ayrton Leyssens <aleyssens@idtech.be>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Question regarding IMX8M NANO processors
Thread-Index: AdrGSty/IicNGFPSS8KVlfE7TijnaA==
Date: Mon, 24 Jun 2024 15:29:45 +0000
Message-ID: <VI1PR06MB89260012C046F7C3764905CFADD42@VI1PR06MB8926.eurprd06.prod.outlook.com>
Accept-Language: nl-BE, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR06MB8926:EE_|DBAPR06MB7159:EE_
x-ms-office365-filtering-correlation-id: 0b64fa10-1466-4bb9-3659-08dc94627a50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|366013|1800799021|376011|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?LKha8h8g0XLJ4RJfo/H+8hrbrN4h77F+q9QlHaLVoUpp5YFctmW9hvXwCA2U?=
 =?us-ascii?Q?Pew9wzOP44sPaCQkt/I+40c4qPkc+Fz7VYQqxG4vHnUNMJAcRDLC+RO3DVZV?=
 =?us-ascii?Q?l0duBVg7F6OjlOdCkBUsUCq8OgOcHi9T6pOhBfJfbFJyiEXUrtlL/Y7TK1La?=
 =?us-ascii?Q?YD/F074FbTHgTEvhXfEzWafn+8U3BuaOk4hLr3P06eIKdPBdDe1sk/pKoY80?=
 =?us-ascii?Q?JcdNTgOwJETTEa/Y10EQkcor1mOLIvMhysxIGwumE7gY2F+hNqRSzisgnI8e?=
 =?us-ascii?Q?+nTKO9pfUECPoAK5HHw9b5vlP35syHNBP61pmhu7i9Kf84kMEn62ryVvedh/?=
 =?us-ascii?Q?sLGBNjOMYruj/ZwJZ9ECYaPQXOxDMd8RLym4XSbNwYOzXR2HntWr+MycXf5I?=
 =?us-ascii?Q?lNBX4/oGNN/iPjFcz/aNJV+TFPFZN/fdpBUk76jQKCN7sd7QHVdUymoln68f?=
 =?us-ascii?Q?OF37FE5RJUv1gbnXzfPrl8kiOCrOD+AKrd70xyiAa67MDjYpVEHAjfZwsoXK?=
 =?us-ascii?Q?nACACQ/f+FOO36hN5A6E300uWzAnAqPpxcVTehpVUNWfXXiopAD94sQmDOR1?=
 =?us-ascii?Q?s8nGKU323jjiWpnEG3bbxehUHjrQt9xE1C9N7INjNeJeAmj947fLPsWDQei0?=
 =?us-ascii?Q?3kpAu93icoi5Te5LskYUaBYmzMDT+j4zzMKS7/BKAc8zyglCiovKBsPYjmZm?=
 =?us-ascii?Q?+WDrrZsYdgFAqzOWRZmvgKYIJVb2rUuCICSMZ6ufZsF4lIg5KqJXnL2ZFagi?=
 =?us-ascii?Q?+5xnScsflu7Pgg1aO7w8BwQXKY9YvCQmFMCe8gmVsq51uX680br8z5yEdYRa?=
 =?us-ascii?Q?ww7s5WDlzliaC2uvhtLn1cOJq8njOSwj+WT04rsn2+qhAHwlp4Y0R/3IwEe1?=
 =?us-ascii?Q?LU0lpvhOipxthOpmK8+3A/5Qljvr8sjt0ywydesJduPd4b9FclHPRtfVvQoj?=
 =?us-ascii?Q?tPBwz8/efhUTSPGpv7egE/srwUaj1Jt84qoSdRI6dDR78plfB10dRHdcmmrM?=
 =?us-ascii?Q?aB3RtT2pl4fPFBdp1BN+9gkhk4pQG7c2YCaI7qEFrMWUi5urIqJ/Ys0hWhlL?=
 =?us-ascii?Q?kixZ79Af4pSoUrSAGSYx4a+NgTV/qowDT5NgHfG/g+QEDz1jO606Y28NPdpE?=
 =?us-ascii?Q?IqYQN7FVTcRN3cv5w4UkRezJRRUTg9IYgQgyuz1JLKHaP6LRttkzxIlzKEm5?=
 =?us-ascii?Q?FBLr/VCmtNbLm+g9/MrPU3F0MEmIuEZi9Ny472hcb4m4EnFHB5whn6W8mNMY?=
 =?us-ascii?Q?KczuFH56Xz8gTl6OMk8+gbuGu8XV3QhRYfrU2+ZgeBLUTej0qQ08BhRTGJ3o?=
 =?us-ascii?Q?/VVTjBuuQ/iKTe1mCAMwAlno?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB8926.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(1800799021)(376011)(38070700015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EPvYq7jSgkDgYIK4ugQuPSy2DAMPImihD+1hFR+ZJV0l2/8kGPDIgIWL+X9+?=
 =?us-ascii?Q?IWgVRXjvl0VaOdeTtfkujzD50+gjWRpHfYNwkZaZg2abpzHC3Zta9iXbJGas?=
 =?us-ascii?Q?KJfLIFvqZMfX4UcBC7Z3PGFdFfQZGY2JWeijBasJDemkkzWKvDxI0fROjC6N?=
 =?us-ascii?Q?ypmG4wR9uydT3MhEhkgJuuVcX9iU3bRmYG623nWt7weqDC4CKYLHmt2/P9LI?=
 =?us-ascii?Q?7x6X7tYHr9j+NSC6VfbALqvRTXmFmGlRA3Vjns4zq4cM92RnuYs0/szOhAo8?=
 =?us-ascii?Q?rluyGarCaA4hxLBLKR1MXi+eMP5Uozq5MDA0oB1IWNt2c+VJBPtu3NSb+iTT?=
 =?us-ascii?Q?wlKV6y6vwJOrpKwMg6h+ynnauBzG4UxByLhuEHsVb13pmjJb7Kn6FzXsEQbH?=
 =?us-ascii?Q?EanE03UNZy1jfzWWg7wCk8bo1l+P2yon5Mn248poe+PP8VXoHLF3WzuRsMh3?=
 =?us-ascii?Q?cL/ozWSPdarcn0WMHcly3LK2/pFnPHXaJCF1F8i0S1713Wu6TMN+Lj/paKVG?=
 =?us-ascii?Q?pgYGr9aH4ZWv/3vmlpTREoeux+jtK26H09QvxXEBhQXK3vl06aKQh/JoRHdF?=
 =?us-ascii?Q?B5u6YNneBI9EUSrDtcJX4BrMiOjjMjuRf7VycPJgldUztM+O9Hwd4YeFyRX7?=
 =?us-ascii?Q?4ls/Q/0cUArnfion7ZquZyABewcIFxuTr/39GXquDQtDS4/9Hb6/aZXg5lUs?=
 =?us-ascii?Q?3099v+iGNSEUATRDaoE9GPUiA57jgbsFyu1SB8CPEgUP2QHvtSp93rTlkQwo?=
 =?us-ascii?Q?Y+XweBayejxTmdGHB09mOOE/K4/1GBvPxyLF013FSElZz6W0UObyYvUWYUz4?=
 =?us-ascii?Q?5Sag3E/ti/nelqJuvzE6lcdd5NfGaxjbhmugaixoaNpxJP/kvEWK55i6WszY?=
 =?us-ascii?Q?ir/MnQISf6gb4bfBfg8iD0hOcjzGdKmmfxLV2JA5UKu9RVYCYFOq+indsWaM?=
 =?us-ascii?Q?/CAhUnWtdBnkvWoBw/FOqtPcn9uRg0oM1StGuXvx+V6g4zM5gwBlSFKjTbRB?=
 =?us-ascii?Q?IIowBcuKaHlAyeUeNGFJw7Ug7lN7CsuazQYWQzsZoSmD5K1+uvadT9gCrCwk?=
 =?us-ascii?Q?vA+sv3P1/mivuH8rPufgJVwAgF7oPPV1TG5lXz6PKGD8TcY2vRo0AQK3W0rE?=
 =?us-ascii?Q?3BZiRhmD0nnCDZ8nkDryPvr94xxUZuM+SJIQRr5K1EvKg8QM4Z8x31EtvjKN?=
 =?us-ascii?Q?2lsqBrTpAsmkiqIobgbQiehOLc+I75DdyEES5hw/KGUyLM4NCteF+0lVVP4k?=
 =?us-ascii?Q?h+PJaRULT3NYYpmqrZgBMZ90PiL+ofATkinp6mcJFLJKcXR38exky/v9x5wt?=
 =?us-ascii?Q?bVgakL7UvTWovchBJtH2jAdrHL2fneNmxu86UorT8GveJEB/scAJulLaqiT4?=
 =?us-ascii?Q?90VbbCfy97VSwzn67zTQ/MmSeqEr/i9IvFnK+RVjC2fM+NU6C9pduZ+NFcOW?=
 =?us-ascii?Q?6X+e2jGizWNihMZYJjLHUdDspBPtUrEn+TPaQxqZWFETiIvNQ8J5LNh3HYJv?=
 =?us-ascii?Q?+7OPZCfcSvx8yBj4rOowgLR2dAN0aRjNHtseiW7w0cc5eBe7Bu1nmm+2JBBJ?=
 =?us-ascii?Q?mKAZq0C0+KDaZZaweh0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: idtech.be
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB8926.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b64fa10-1466-4bb9-3659-08dc94627a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 15:29:45.9227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 982732bf-7da9-409c-87ae-889ccf886826
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lcYZXJEU5g0AvPQaSzqcRhWuLP6zsg+KZIA3WmESneE4/nqnNztq58FlEbwfv6/zzLCXXULt0O8bGg5rM3BcCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7159
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idtechoffice.onmicrosoft.com; s=selector1-idtechoffice-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxCmFyqXUrDAbp4XYqz6iAjnAaYf3KuoB/YSgbAMzDM=;
 b=CKTTk0v2xDKDeYZCDGVBKkns6zamIH4na0mOzJwdlnHNjZX9iJMNmGwyM7vaDLUi3+XAkz4VKqzbVqC+TyBt5KFzoiCxz6dB9si/fIy58ajPK/BL+ewdMs1fLHkkEsSUrwrU5RKnQXlXtV8Tz8ggpjwmWgHMJ59xJNL/Ex0L1JY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=idtech.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=idtechoffice.onmicrosoft.com
 header.i=@idtechoffice.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-idtechoffice-onmicrosoft-com header.b=CKTTk0v2
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=idtech.be;
Subject: [Buildroot] Question regarding IMX8M NANO processors
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
Content-Type: multipart/mixed; boundary="===============4309352880940780345=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4309352880940780345==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR06MB89260012C046F7C3764905CFADD42VI1PR06MB8926eurp_"

--_000_VI1PR06MB89260012C046F7C3764905CFADD42VI1PR06MB8926eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all

It is a long shot , but nonetheless...
Has anyone experience or (partly) done a port for the SM2S-IMX8NANO platfor=
m of AVNET (https://embedded.avnet.com/product/msc-sm2s-imx8nano/)?
The IMX8-ddr4-evk defconfig seems no help on this since the damn thing does=
n't even want to start with this u-boot and ATF.

I appreciate any help I can get with this one... the alternative is a quite=
 bloated default configuration in yocto (like +4gb).

Thanks in advance
Ayrton Leyssens

--_000_VI1PR06MB89260012C046F7C3764905CFADD42VI1PR06MB8926eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"FR-BE" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">It is a long shot&nbsp;, but no=
netheless&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Has anyone experience or (partl=
y) done a port for the SM2S-IMX8NANO platform of AVNET (<a href=3D"https://=
embedded.avnet.com/product/msc-sm2s-imx8nano/">https://embedded.avnet.com/p=
roduct/msc-sm2s-imx8nano/</a>)?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The IMX8-ddr4-evk defconfig see=
ms no help on this since the damn thing doesn&#8217;t even want to start wi=
th this u-boot and ATF.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I appreciate any help I can get=
 with this one&#8230; the alternative is a quite bloated default configurat=
ion in yocto (like +4gb).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks in advance <o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ayrton Leyssens<o:p></o:p></spa=
n></p>
</div>
</body>
</html>

--_000_VI1PR06MB89260012C046F7C3764905CFADD42VI1PR06MB8926eurp_--

--===============4309352880940780345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4309352880940780345==--
