Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73652C71135
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 04:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F03EA605FE;
	Mon, 16 Jun 2025 04:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJRXRL3OfutJ; Mon, 16 Jun 2025 04:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16E026060B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16E026060B;
	Mon, 16 Jun 2025 04:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 874581A4
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 04:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E07180729
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 04:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sN512d01qtD for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 04:22:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:200a::60d;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70BE780670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70BE780670
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70BE780670
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 04:22:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cx7tmGWEdd7ze93GSyQEyA719Po1mPgzq7JlD/PLPWCL6/0G+mf9DqXJeXoS2qIlzMSRl57BvDW0ToXgKLfOKyDzGbmQlyoNKaYq4roFDA6xrKRq9xsjcq4AkAfWHbHonejY7KGgqJ7lbu5R9gxwx0c77/MjLFmoPLUMuky/mhD2gv4GEhFsH9mcLUi1yhzJzBhTbHByCYYms9iWKdFdRaGaiyXfIyagcKY/5nWHIq9Lo5+i2LzazO7/8Y7hASkWuyL4U+GdI51BJCjd8EfT0MvY3EYPaGwe+jq8vw2kYWT9TuOvMj2DdA8WRB64sFeFxCKeCibzPEhEPuPRFVch4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHMpf0+Njz0U1zRrUD9vcuFEocZkoLEzO6ZBz2hKkSM=;
 b=JTm8DiePbohu0jythtbEwZvlFmxkt7NOEfhmNeCucrvoAqwF0FLbsgN0ywVELuxsN/YYE9TKFq6JGQL64p+F7vofqSDtMGdxaoSSMdCSjmoAVHgCCYUS8/uEfbB2R2PVfukgtISwNikGbWhpnk3K0szNAfSW/HdI/QpeCPAzZa6SNDNQfyeo/sgTlJiq6AtiWQ9yrP1iUflY0gy9A1DFz3nae5fz4/w4aAU05nZhBHAp/4t1l/QKTuul8ffF3aWM4wnK05c/uiW7A+9T/LyBnH2SwtOAGR6S2coNkm4KNj0FxouHx2FtSm6TPDpoSIBNOE09a7W+Inz6OzyjmX02fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17)
 by SA1PR12MB8987.namprd12.prod.outlook.com (2603:10b6:806:386::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 04:22:38 +0000
Received: from SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913]) by SA1PR12MB5615.namprd12.prod.outlook.com
 ([fe80::7557:587c:4ec:1913%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 04:22:38 +0000
To: Julien Olivain <ju.o@free.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>, "luca.ceresoli@bootlin.com"
 <luca.ceresoli@bootlin.com>, "brandon.maier@collins.com"
 <brandon.maier@collins.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH v1 1/1] package/bootgen: fix path to local
 FlexLexer.h
Thread-Index: AQHb3CY2d8WKIrd3fkuTne8OPEWmuLQEAl8AgAExqlA=
Date: Mon, 16 Jun 2025 04:22:38 +0000
Message-ID: <SA1PR12MB5615F3E2E5D80CDFF290E1ABF070A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20250613054406.3479383-1-neal.frager@amd.com>
 <b6c8b435423519a401803fab511d5c93@free.fr>
In-Reply-To: <b6c8b435423519a401803fab511d5c93@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-16T04:21:44.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB5615:EE_|SA1PR12MB8987:EE_
x-ms-office365-filtering-correlation-id: 5d357e5b-9715-4b52-c621-08ddac8d6d82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Rsbg9kmqKPuZrv4EzgfgQIczQirK/Fz+4hItnCiSAOzsEyqW1mcZiQdypg0T?=
 =?us-ascii?Q?THjgTvmVoZADQh9E+ZHxt7/weVjHzyIoKHUvFxRw7SZvTo/yejiDZK6CmUPb?=
 =?us-ascii?Q?qUASu3cM8w0shdfELxogGVYCEKF/9OlbNG9XUo6N1wdVYowpwRXN5yq7a2l0?=
 =?us-ascii?Q?Bo9CL0bPUm3eDgpSkLTcVVD1RjVpBAErGU491KzfYWgjjduP4UdAjhYepDVN?=
 =?us-ascii?Q?HAIxFD5jxlJserLkyDIzayMzGtlz45xMuIf6mIP1rkyYylpO2CDpUBl8Lbw7?=
 =?us-ascii?Q?eimyGoTmzqp5EFHRdBkDlaODe6DyrJ+eh3e4fqeKobCavsyEifq6xhybnEns?=
 =?us-ascii?Q?4/VF653v6/VmoM/SNJ+U9EeSEjA/hT2rbTnfE7P6cu0WaEpbTP1eW1pmTOJV?=
 =?us-ascii?Q?FHMu3a5SR5YlB20fxh2jYaBLjLwhQ3gu6BAY/vspZVztaX4nGZpfiFTXO+s+?=
 =?us-ascii?Q?H4Tgnk8q81M2eC0NASyfnX4Clu8aqFSkwJdX6Bdk8RZQ5BKht6ep2e0komeQ?=
 =?us-ascii?Q?jBhtl3Wco949tDAqv3K+075shYicWbNOJSp4ac0KUsJHwf0jYWdmXzgyTUG5?=
 =?us-ascii?Q?oVMDU5rvx156OBWSMlbM8poussPC+X/bjmzqfp4T6dHm/4vui16JHXSOB3wG?=
 =?us-ascii?Q?kxGlUxsqiECcO0loXKzZytJGE1INcvPBtpDvICACTtkXwSmGCKdPGwgqICuP?=
 =?us-ascii?Q?tDuVgIUw9LQOcM7tTPH29kenxiYLPaYuanWk5wMNSr3DVUdIL58yZMO083s+?=
 =?us-ascii?Q?/16kLE9IhZKiB6MV3mS5RWXyIEs+M65gtgX1DmUR6kmMDFngstDrd4jJpX4T?=
 =?us-ascii?Q?UYElEuvECYJp/bUFgkAKuLFUlYGLOZhczyqF26BO1Wc0tK4FOHaBKG88pFQW?=
 =?us-ascii?Q?Y4X0tCYEaRvfJctpAuIicF6oRNnksOJvTv1bhIJu/4XIyJ83k3H303ex9VDG?=
 =?us-ascii?Q?yLSNEhlQZflc4RAuvwAb4lBVMvLknn8vUO5kbAbzg0DNKC93P1jqCcOAdQUG?=
 =?us-ascii?Q?Kj0CqSrG8dWPNmVk/foa00orCtMbmTKhGHWtPQ3JwT0Y8cDXq+8jOpt7AQ79?=
 =?us-ascii?Q?bIcHBPCuJy+533x3ES7U5LOxUxwXZyl6n4NAvk/RPKlpnJSQh3YBOeJTTsD3?=
 =?us-ascii?Q?/FY8zAO2+pl5buVyiVVdhcZzt/pQG604etZLJfp0M8T8KrvvmkY3AIavdgWE?=
 =?us-ascii?Q?y/auzBmu9KwX42v0V8E+qZu7EEGOJL6HVV3TMA8LkVQLvw6uweNbwbBTxsJp?=
 =?us-ascii?Q?sqejmQaNwmAjXI37tjjGY2QJ+JtxBjFGPrFqyio/tuPaUzp5jf2T37hM5f35?=
 =?us-ascii?Q?Vet3pKeDjqyrENNAx2U9NPrUbhgciPJoZDVtZmTZWeVl/nwRv64v9IHsL65+?=
 =?us-ascii?Q?K5qIxwRY0ELd/s815EjYQVY5UrQSDkSpmLb4ZIDDZQ853+5R1LUn+UG3NFJt?=
 =?us-ascii?Q?ZFKYtd3tYprVeqFO2XJcN96NrekiWahznEHv45OHy1SVyBEp/DAZ6g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB5615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ndAQUvM8YlzMcKwDhGS0PcIdW3oTtAoz+7V3veJw7YR9grHtk6+3nHXiq5HE?=
 =?us-ascii?Q?OUpxBY4S5jN4XHL/jlpnsfF11yHn52bRMkFFMLtYQHaJXAsI+FOdJCE3VMhF?=
 =?us-ascii?Q?vamnyVrFX21izvnO8DAnswPV9qCYXQUsFmafK0eK6WRV8K5Gkt0TF3MjcqmD?=
 =?us-ascii?Q?yXWswoHEGGyndw7x0UyWCHBz4M+ugzIrUdF7ZDLLPGOGx75G6BeUVBu3xiMH?=
 =?us-ascii?Q?J+BhduR6ke6ogjVo/cPP0q0QGRoNz6rukumIoftx81EgnbFxYU/g67q4UTei?=
 =?us-ascii?Q?IYNbDjOSHaenP2nH8WJXR1G1EcqS8wKnlBnpGg0ux7LbgrABirMEuaDt5NW9?=
 =?us-ascii?Q?zoBILCCUOxSvS4tPs8DMUwFVe8tIPP/5oLLuFuZyrUKPEKUep2NIiUNHT3OK?=
 =?us-ascii?Q?y1yO/+j9SpWGy70KnGpESegExdVGF9zcV+BOBj45K1wKQxzQTHq7HW+fO1FK?=
 =?us-ascii?Q?fOupz+bWsVSwAHLJpDkBwcoWfYuniJJVta/+PR7Lfx2Vf05cXwaTlwoYTpBE?=
 =?us-ascii?Q?BJDAkMGKjVYmt77j66fP5/XWcZsbtYSIQbc/J+hrdj/8DyweTqflZ8bRStfu?=
 =?us-ascii?Q?NDLb5n1h1XkeMxzV/D1jp8sYa9eU11HmsZLwhBHAOiLpCTh+AzM26JkXfSzp?=
 =?us-ascii?Q?HIi6HhKUmA2HZEikf4ZLwg368WSiTCI0Bj00H9kK9fCjmdUuOQY4VPDs6h0+?=
 =?us-ascii?Q?HK3tQQKWsH+k5dZTOPb+maaWCseSVF21dpuX067CRz14wc+XKr9bua9DyUvN?=
 =?us-ascii?Q?/eoKd+NP4pM3KQoUBz6XKGp2wPHx0Ym8TtVmJtBvi5A/JE0W+loI8Ay1N/vi?=
 =?us-ascii?Q?OQ0nTQ1C2On2rlaHt4fCSlPAQTLTB2/5/e1bfaAVrUFBUe/269eZ/LsxqboQ?=
 =?us-ascii?Q?CPCgpVf7TSEvF173OL4LjxLokVO02xJQFV59gXHhcIwvMicmkAJsbtzuI4As?=
 =?us-ascii?Q?xvWlbkSDEGm9q1PohwTGqVHdGFAZehvAJMi/Cuepl65J/YOrU2BlPxz57N1c?=
 =?us-ascii?Q?U/wKAgpQEsvjcNVBPM7wIy5eMM7zy+74/6u9+uokdFCLlAtgNVaF2ijMmmJK?=
 =?us-ascii?Q?iobZq4DOCyJpUR6vkDcn5DvgATOAm1WhmtAt4PLJ2sAYyiKms228GfBQ3JHE?=
 =?us-ascii?Q?Az3DPWBgYQZH9Z3JbhmFyJ/V2/3zHUQ+dgBMoeK7hp3lrsrzITx/8J5qGWBn?=
 =?us-ascii?Q?XU4XfnDHbQXqd9kUT5t/sReYpCwfZrF0dGAPiCsiar0aq9O7Q84wpCHa34V+?=
 =?us-ascii?Q?zoiDKejgo2KkWPAZ+zbqvxNqT5R//8UzcyY59BJPifMGoyJgwAwZTMFPTfI9?=
 =?us-ascii?Q?FYjKVSUNmoELbDrI4+g5dlUJgZVXc+VRVWedxvPVShLJtSiXjq3H5dccKYSp?=
 =?us-ascii?Q?hiwMbDS2D1SAAcwqNRV4g76H87vsCENYoHusqTMA2O0QIJofiw2Ck5LVdCdv?=
 =?us-ascii?Q?uXbor9mOsVuu/xRFWqtsoWZcB6SsVN1l+AYlGlvTXXRiF6yjtk18XLGmbVF8?=
 =?us-ascii?Q?p8XDjfW13Agqm5EqQaCFd7nnldUw3KBhtpZ6xDv8QoQPOccqcZBG/5JP21NX?=
 =?us-ascii?Q?Az7yAdExOYLDgdM1aIA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d357e5b-9715-4b52-c621-08ddac8d6d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 04:22:38.3627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VySmQSjTltMnCtLwu4Uxw0arlASA6rWgIzdf8r2YbL8l+ta+SHCjmVA2xUca6r2q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8987
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHMpf0+Njz0U1zRrUD9vcuFEocZkoLEzO6ZBz2hKkSM=;
 b=0/pFlekgd/BiWIRtOp1WFCFnEuQ03rhguOh+Hu6y+TWxJ0U7OofjktbS3/UbcLBGgOeBGuEdpsCDIa+BUmAvbdaObyLWCn97Sx5VY0JemzxdCk5L4/joD65OKiP6tFmF24hcg5vpKP961lNahc5r03xFmA9NuGVjillzyWBDt0s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0/pFlekg
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: fix path to local
 FlexLexer.h
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

> With bootgen xilinx_v2025.1, the local FlexLexer.h file is not in the
> same
> directory as the cpp files including it, so the previous patch used to
> solve
> the issue below needs to be updated to find the local FlexLexer.h which
> is in
> the win_include directory of bootgen version xilinx_v2025.1.
>
> So this patch corrects the path for including the local FlexLexer.h
> header for
> fixing the below issue.
>
> Bootgen embeds an old version of flex, but uses the system include
> syntax
> (#include <>) to reference it, causing conflicts on systems with the
> development headers for a modern flex version installed, leading to
> build
> issues like:
>
> ../bisonflex/bif.yy.cpp: In member function 'virtual int
> BIF::FlexScanner::yylex()':
> ../bisonflex/bif.yy.cpp:1608:18: error: no match for 'operator='
> (operand types are 'std::istream' {aka 'std::basic_istream'} and
> 'std::istream*' {aka 'std::basic_istream*'})
>
> Fix it by using normal local #include statements by:
>
> sed -i 's/<FlexLexer.h>/"../win_include/FlexLexer.h"/g' *
>
> Fixes:
> https://autobuild.buildroot.org/results/60220f94cca1bcca5667afcb2acffb5aacae048b
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>

> Applied to master, thanks.

> For info, I added extra info in the commit log to reproduce the issue.
> See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/92f23ce83ae0fa5b19f034ba6d1d5e7dcd073991

Hi Julien,

Great, thank you!

Best regards,
Neal Frager
AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
