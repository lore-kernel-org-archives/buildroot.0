Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898F8C44501
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 10:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2960D407FD;
	Thu, 16 Jul 2026 10:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFSFN0_Oa7Dx; Thu, 16 Jul 2026 10:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A6AC4079A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784198048;
	bh=2jerGePxAOwJ6yTOnwav+2tr4FA0t7aFGsa+Sj8JyTk=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=RPbzo2uL0n7H4An4tTxN/lWCWjMEm7K1cGL0HZQ8TqgWBfGX7ZTIGG03Esax58/R3
	 LUO5a3FwllJpRWnKUAO+USkj/REb/K13R2x8BKAMozoc9539RzDsNkzCV1n+ekmeUE
	 BUd57lFVnrdCA2roLWXy+sfxF5j/xb5bXFIWmXRKTYJXnJJDD26byXSrgRDdJIVJEx
	 RZ3IBiITXjmAWz00BstxHCODGGuRSksCCVbfcTwKx0zjNHt6YDhwxFnE+moQpBMuLe
	 B0Td90E/t8YxWcDWI0ErMbdODLxM+lMM1r/X9GN8XK8GcX2Z/CEoF9r6TcGDeB4gGQ
	 oKjR32nOEmO8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A6AC4079A;
	Thu, 16 Jul 2026 10:34:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFEB4426
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 10:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED7814079A
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 10:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsmPVmVARB93 for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 10:34:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c110::1;
 helo=bn1pr04cu002.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10CAB40794
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10CAB40794
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10CAB40794
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 10:34:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGLMaHIpbFJPs30asPx4btt3l4XSoooys//AGq75rsr9jJNRv9MbXQ0pbo9WrK8tQPfwhNwRwwT+JEydxdygnUsdlR0kkKsqRjHK0J5HorKW09qkCyJq7PJR9lCK/1gr8JeNSSbw6bmVnTCx4Pa4QQi9eyRKDzwROrdVNZovI5NJRyufDNC5z4j+zSfyT1iooF6IzEcqEQwyjTKGF3HKV7DLF6vnZNozgmi7oP+FJR4zBwMLKdyBMNc1TgUCwAN0yDNfdUgtWgzEZM99XpBGo0fTZmK78ImxL/CSNvhpCbztT9g0UlcoqG/prOWSeyQ0yUrt8hF+uqhcZUGXhVBYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uvm/PyGWb0c+zmhMMTUoVFuRxnvByg+q02Gy1oDJAQ=;
 b=qBNEYOuydS2i1Ns3ZACYziOebHd2zVTULVNYUJRnQMKM+no4Sj7jl1SBpnRz+FhKcUJbY3Z6Ft3Z9zr1cxdn2iteagI/Zj4B9s7MyGxYEA0h62wLghq2o8AmsB10oyE5Odmve6/G9yAJQk+z+IHOK8JGYq2HSKwBUVKDMFpHeCcWj5ggaSlvkomuMiZpSitdemXTsnEMdYGgWBjUWPKG1fJgYJtHJWY7V2Xw3SfzpvcMjaWh47t/+3Jo31kkyPE8LOIc5J3jB1zapfASAJNDD6UyYFaHKHrXNgK6qvTEWJ3x8cT2SM85UCslspKpAxf7CTcxXo7bKyLbdBPSGY/gVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 10:33:59 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 10:33:59 +0000
To: Bernd Kuhls <bernd@kuhls.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/bootgen: fix build with host-gcc >= 14.x
Thread-Index: AQHdFOXekVYn3yFVXE6uBs55AhbkIrZv8LNm
Date: Thu, 16 Jul 2026 10:33:59 +0000
Message-ID: <BL1PR12MB50328CFA59F6B58EDBD504AAF0C72@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260716054214.14597-1-bernd@kuhls.net>
In-Reply-To: <20260716054214.14597-1-bernd@kuhls.net>
Accept-Language: en-US
Content-Language: fr-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-16T10:24:13.2826816Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|DS7PR12MB9475:EE_
x-ms-office365-filtering-correlation-id: d013a0dd-ddbf-47a9-eea2-08dee325bef6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|23010399003|376014|38070700021|13003099007|56012099006|11063799006|10067099003|8096899003|22082099003|18002099003;
x-microsoft-antispam-message-info: nCV/zRdFCCxH/TSLYYZsc6zLr2ZsioAWMsZKPKdQHnovSQfdfrnPdWdZD2/y4CVqXnwX3v9S/ryH/Wn0Q28qm+DU9H/C7gAn7NwJrxVvNafulDUbq66/W0Op/fUdN7WkN8BHahwnmkpEjCE1Pw9RHwYKXpydxsOFKWE9t9BRQMV0mYYOlKvGxvPclLouVx0OhT8rgozikHlS5JIE6S5lYpR2X1nT96/gKCGD+1vUx//YUX8LtBAkN+ZTbMVCrwmYHm1r0HBnl16c8yciVNn60n7/6M6mpctqnBX/JyVAthh2ydMLC09Dx1EESHsLUeQno9zX3YAHjhoEbF5SyIk7EMOgAM96PV3QP/BtrtjRs9DF1YVoYY1v1jA/91z7DMWSfPujt9Uqw3xyo9N7EG2MpOnW4VDpNHNhVBt3yJBU/4OMCu099kiyFD6hpU4Kl2POFFC0F4NPq6DpS9TEK/s1pltMFoaY2duSJIJZcrnFVEbw1+/eQgkd4wrGYYnXh/vrBP90nUxLrdol1SyWXsPp1ltxlr8iunDTUjCkPoOk7uNbAtF+lz3GepkTvRXXfbb8ds/guKYoJ33hjqmyBLmOdHAvxvChZ5vWSjLPZAD7GI6OEVwVqGbdTQNte4MQUfpv6KTbmR3t55alZaZ9P6fqz+A/2beusQgiHr7dWy10ppk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(38070700021)(13003099007)(56012099006)(11063799006)(10067099003)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?skbtPZkRNL403LflZlkqaJiBk5t3HTkyRkUPqe9fE6mYlxrEc+M/iT7Z5c15?=
 =?us-ascii?Q?Xi2y6Ie/J6WarTk/xCIEFdO/09HWppoRxQd73p+Dw943T6CO1KcJQhL+ZGm1?=
 =?us-ascii?Q?RiYFL+ITc6Rd0HZKHqcq6WCT+2zwk8cQon69Z0lI1yJSQ/WvFbznln0U/p7O?=
 =?us-ascii?Q?TC6uI0U88XnRCZ6q9p+B6twHkwcwToWkw8Kn7WHIojz4+9kHlXUsoWfdNojb?=
 =?us-ascii?Q?Xkp8P9yanyiJUG3GrHmzTXz4Pe/xExWhGafSajG/5+s0/oiXRuB9cyuDsU7Y?=
 =?us-ascii?Q?CPYF3gubbcvXqyS5aDKbHjSDDT9Ix2N3DrzDjl/LAsaXt5naK2GM8a8Ukwpp?=
 =?us-ascii?Q?5ucu8IKmdcJJUIZ3IzIdcInM2YbFy7t4bE2Qz2CUTYhrxy0MG2OhJWoVhAhv?=
 =?us-ascii?Q?SobGupiW8Hf+sChKHPwaeulQaXMWDrlUDC0poqXtZYMpZ6nZRFsDcXi568ea?=
 =?us-ascii?Q?8oZ2IzIpZGiPv0K0+zWI9GAmZUJ0S/povywa6ZDhuWFPlhE0i6hgf1zKDIfc?=
 =?us-ascii?Q?p4nbvX+XwGHZp+qU50Zz9UBezAkIC5uQIa0J/Y0eGQh/R7fwFxhDOgPeqOHR?=
 =?us-ascii?Q?tuoQOSAhHpMiLwWNWt2pZm+x46PPs4pKwlginH7n5y0kNrH9J1ktmd9NNOwF?=
 =?us-ascii?Q?h+FvWYMb2WS9prkJBp6qkjqEzufAKzW1xxfDFMN4AqvOOOfN6dfNZAsZDRpU?=
 =?us-ascii?Q?9wh8RzlmJmYdvFHFU9mE8bqjvjgIVxi3iTooJFWbZc6vAzvnPAzOtnFPxNV6?=
 =?us-ascii?Q?XkzPFZIQJlK7B34PbJLvDF7iKuzKO8AO2AwxduwSWG4prBVM8yDVq08nVw9c?=
 =?us-ascii?Q?nBCHMuBiLmIW2exsntjD7WFDweU769+PFerIWgR24/VvBmu2RDI//rLKfX1v?=
 =?us-ascii?Q?J0sgxsSi32TjsVpOJS8yTp3IdSpitFZVzVsNINVRpU71cR21wDhMx8x1YSOS?=
 =?us-ascii?Q?Cn+7JwJGoxgaXuvoVthPDVvbuhGRuZHwSxJjaPvB517JSMX0BIWZPO0w1Xu2?=
 =?us-ascii?Q?LCWCxCWJSx9+o3EbO56ZZ1a9A3a4F7MM4dKB1b8YB6g55ZTJU5VVk3Lf/jtt?=
 =?us-ascii?Q?Y6ChAdqlAlt8g3wI6kVpLBB5E0rZMR9QsOPjEfrENt63dq8v4TKXWLLrQk/o?=
 =?us-ascii?Q?hMbjP5xmrJP26gtCF4cuQ8LBgosJA7O3GCdHw++YOaTK0nmcAAQDI7SXheMM?=
 =?us-ascii?Q?bj1PT7Iw44rTzR+shYJSvlVQOkukzuyLNHOk9MCqwNcZsy4FU0kRpibSQnTP?=
 =?us-ascii?Q?FaksDXmr2cLhkekUYyQQk62Q5pfr9KscPwXaFKrGj7xF40zHSfLhRmIR7iPc?=
 =?us-ascii?Q?hZ98eHxyY5JtSdcbqhnb1RTReNGG8MKb6DNTvZYfIswWVw7ErykLydvQ6JwU?=
 =?us-ascii?Q?jrWCBzYfVSQyBH3YMWPHBreKCQzLyFplEMacfAreDGP1GirC+cGWCGItf3uZ?=
 =?us-ascii?Q?fbghEV5EZi0+QSMH+jMWDwz9rn/jULtg8ijA7z+uDlZxfcg3mAfIg51HU1Lg?=
 =?us-ascii?Q?3/uIZDY8IA1Z2NeItHPAAhevFOQAU4nfF5M/tTYbtvz0d4bLeUDqH5ZMiONM?=
 =?us-ascii?Q?bWk4E8Ncmmdhyzf2jEt3Vl19nFaR4l8gvDLEOLDhNnhAjKjQfB/6TdEk9+67?=
 =?us-ascii?Q?mKYcWwmro30gDxy6Jx0corWGc0D67gzg1Pib8jxNIldP3hXQZzgmkhm4OJae?=
 =?us-ascii?Q?fYZ69dAe4FraHNyc/r5nutPlKlB2NOdZpMCZgWM0hH8L5Sn6b6vVyiWpWj96?=
 =?us-ascii?Q?37FGirrXUB8JpgBSwd+o5g/Jt6IzFbg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d013a0dd-ddbf-47a9-eea2-08dee325bef6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 10:33:59.0083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oUEkcowvErS76HWovfHsYHNJYMINictGsXk5BGXKTJqJtgzbvtMXntq1qyLz1HRp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9475
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uvm/PyGWb0c+zmhMMTUoVFuRxnvByg+q02Gy1oDJAQ=;
 b=y2675lRwyARMzv0fb4LY+541ZppDLdxqEHwO3k9bAnTabN814LEZRn3gd7KT8KX1R2vcJK0ypgnRZ0I97yhDirWtNwwfacTMuUrryvot+QqTBc4PdiK4OWj+xIZGiP4TGSoRD3nL3Jd+sjE0woI/YXbcMCvYSZxxEDvSkVwDOzM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=y2675lRw
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH 1/1] package/bootgen: fix build with
 host-gcc >= 14.x
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
Content-Type: multipart/mixed; boundary="===============1529169349143660121=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1529169349143660121==
Content-Language: fr-CA
Content-Type: multipart/alternative;
	boundary="_000_BL1PR12MB50328CFA59F6B58EDBD504AAF0C72BL1PR12MB5032namp_"

--_000_BL1PR12MB50328CFA59F6B58EDBD504AAF0C72BL1PR12MB5032namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

Hi Bernd,

> Fixes:
> https://autobuild.buildroot.net/results/2db/2db65dc1e84255eef74beb19a44eb=
38bdf469724<https://autobuild.buildroot.net/results/2db/2db65dc1e84255eef74=
beb19a44eb38bdf469724/>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thank you for fixing this!

---  snip ---

>  +Upstream: https://github.com/Xilinx/bootgen/pull/47

I have created an internal change request to be sure this goes upstream.

Reviewed-by: Neal Frager <neal.frager@amd.com>

Best regards,
Neal Frager
AMD

--_000_BL1PR12MB50328CFA59F6B58EDBD504AAF0C72BL1PR12MB5032namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
AMD General<br>
</p>
<br>
<div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Hi Bernd,</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div style=3D"font-family: Calibri, sans-serif;">&nbsp;</div>
<div style=3D"font-size: 11pt;"><span style=3D"font-family: Aptos, Aptos_MS=
FontService, -apple-system, Roboto, Arial, Helvetica, sans-serif; color: rg=
b(0, 0, 0);">&gt;
</span><span style=3D"font-family: Aptos;">Fixes:</span></div>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; <a href=3D"https:/=
/autobuild.buildroot.net/results/2db/2db65dc1e84255eef74beb19a44eb38bdf4697=
24/">
https://autobuild.buildroot.net/results/2db/2db65dc1e84255eef74beb19a44eb38=
bdf469724</a></div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; Signed-off-by: Ber=
nd Kuhls &lt;bernd@kuhls.net&gt;</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);">Thank you for fixing this!</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">--- &nbsp;snip ---</div=
>
<div class=3D"PlainText" style=3D"font-size: 11pt;" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; &nbsp;+Upstream: <=
a href=3D"https://github.com/Xilinx/bootgen/pull/47">
https://github.com/Xilinx/bootgen/pull/47</a></div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);">I have created an internal change request to be sure this goes up=
stream.</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);"><br>
</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);">Reviewed-by: Neal Frager &lt;neal.frager@amd.com&gt;</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);"><br>
</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);">Best regards,</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);">Neal Frager</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);">AMD</div>
</div>
</div>
</div>
</body>
</html>

--_000_BL1PR12MB50328CFA59F6B58EDBD504AAF0C72BL1PR12MB5032namp_--

--===============1529169349143660121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1529169349143660121==--
