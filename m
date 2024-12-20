Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71AFE7718A
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 10:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64CE441430;
	Fri, 20 Dec 2024 10:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dr6dYKxWduKs; Fri, 20 Dec 2024 10:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 552D44143E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 552D44143E;
	Fri, 20 Dec 2024 10:06:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DFAF920
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D57541430
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUtt8NsbY7N0 for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 10:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.71.154.45;
 helo=esa6.hgst.iphmx.com; envelope-from=prvs=077180089=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AB484143E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB484143E
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AB484143E
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 10:06:13 +0000 (UTC)
X-CSE-ConnectionGUID: X4qoxJe4QKOnDWDjiQx6EA==
X-CSE-MsgGUID: tpAB7D1FTFy+tXlABway7A==
X-IronPort-AV: E=Sophos;i="6.12,250,1728921600"; d="scan'208";a="34159670"
Received: from mail-northcentralusazlp17010000.outbound.protection.outlook.com
 (HELO CH1PR05CU001.outbound.protection.outlook.com) ([40.93.20.0])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2024 18:06:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+rB8kubDTx6Yde74ItgmSS+l1YG+9LghagEaxsUo4cIIP/EJvX/X0ISioBGK1rwcgHFlbRmLlwHOaEbr7jBdqX5kKareNBbrbSYj1nftlx3eHGIzv1EOczL+Ru7wdK5dLCRffKOV1N5VMEl5PtdhKf5oeES9BgrgDwn1cJEbC+1fe0MhmTR9esQDc2HuodaPZ7cnIlNjx6V0SB9qdGdWBo5whCF0psfIepiCyG7wKC9dn41zSiWFuu7iEDlxKatC3cBtIenyVPnh6eWwzZp+yiV6ruhbPMnFHYhlOiIjYJyE9AkZIdRyrpZstxWV0yeOGfcWxWIzadawzIj0Ja+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z3jIxZWUTW1spTOQZT9cjItvFb682SzSRlwyddyMKs=;
 b=RHS7EM1YluDDI0OIL4H1eExVvSMs2UpEFsTPx2UOojCqUY5bupA0lQeuKPxyrpKU57oNzGgs1aSHi5pnTmUFSfr/BLArbyjqz7Ss0MI9LaSUocdkhZwkUt99wafI4rjgvCt4FfJOFDmIozNb16Jy+Y/JW2KpuAXd3I/6REsAjdfkZvcqJJyJuBCHkXpiTWhALyALLX630+zJsgoX9CfEqYNpHVU08L+0URvEKpg/daCko0pvz8D+R222zWR2SRtz21j8nGGIa53eknW46HHSGrF42ejLIeD67W862zXnSXbM78Dqkk+xc9jL5ZuQJf8EGaq+Vy6cPAQ3Z46m7ZvMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by DM6PR04MB6761.namprd04.prod.outlook.com (2603:10b6:5:243::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 10:06:06 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 10:06:06 +0000
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>, Damien Le Moal <dlemoal@kernel.org>, Michael
 Walle <michael@walle.cc>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [Buildroot] [PATCH v3 1/2] linux: add support for device tree
 overlays
Thread-Index: AQHbTTn1efpR2iFQaEi1SL/lHYjlVbLu8xyA
Date: Fri, 20 Dec 2024 10:06:06 +0000
Message-ID: <Z2VBjTBKUkn9Mehr@ryzen>
References: <20241213083430.4121422-1-niklas.cassel@wdc.com>
In-Reply-To: <20241213083430.4121422-1-niklas.cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|DM6PR04MB6761:EE_
x-ms-office365-filtering-correlation-id: c9b94a89-e932-459b-ad14-08dd20ddeb54
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?SPt3Zvoyaujri7Sx+6Q82W62k7cmuMJIaiPP1N0l0J8UdDbB77bOghs6pmtd?=
 =?us-ascii?Q?5h6sO+YUkpSgaqDX+k4BnezpxyQRPmKP16hpp+gZoGotBAipvStVHqJQ/3p5?=
 =?us-ascii?Q?+/+yDwbarVyZYO33VJbIK2YstiiNHtgAzMWRcntnyhtmkhIZ+6nbUaP0uBRs?=
 =?us-ascii?Q?b7pNChC0fOHPP94TlBcePIwpNkRAKhjevIgH+V5HJnSmiNcg/0RNKnsa7k0j?=
 =?us-ascii?Q?CWsFDpPZRG09R3oeQM+L1gHKYiccKvle6uBrn4T/V1cCvEnYSzraN9wS9glg?=
 =?us-ascii?Q?V0JYul4GJK/zxT0bjcg2y3OSczowubM7QUroCFx84PtP6EDNHjoQHvvcQU58?=
 =?us-ascii?Q?M8XfCFY0MTbR86g+mEa1450Ha1id53R7e5ycP36+6sIWU/fM+LDCCZ/nTNnQ?=
 =?us-ascii?Q?DFoNDsL3p08DZBHlICFmo3mCzd3/Tgze/NDtUQ6RaHuud9rt87+Thk9DqPST?=
 =?us-ascii?Q?igP4Oh/bVUaDSJdI+xvXbr5pql8jqYzvIm4SJHsdnS3XGyn1ls/aNNBvvxcb?=
 =?us-ascii?Q?zyYCgJLv4trlR0CxqE8Oqh0HMZrL0RkeOQy2PzZyP8Q9ZTG/dFALRhAad3fr?=
 =?us-ascii?Q?O8cqKHxH0xlvO/zv8mO5/fQEAmcpgwvXn3WmisJsm8Yj8vkVwkutVgTb4llV?=
 =?us-ascii?Q?+uw4RoNjkvG/ltGzaEWYT7pPyWYPzRmVI5midcaRK6fBrDyPZrv/uwNMWwoP?=
 =?us-ascii?Q?uD78+D8XqYawK7jxtdCz4PDMleWive7k6Xa1KWMXeojEsVo9qYrejhK0vhNK?=
 =?us-ascii?Q?tDxaRTfyOqNjEaXLoioUIPSqEK4HnpTm+VZ8rvAvrutDd7puYBitpGP30ETN?=
 =?us-ascii?Q?GFQcB6F44ky0AeRjOpFevpx0bb8V+Nk/m4J7In4muoFpnocTX2BfgGE9r77d?=
 =?us-ascii?Q?e6l9KMQYx31d9/ype/FPbx4xHr4sKCxG7yG4Tzq9YqrNL5vh+p9bqq7SlzYR?=
 =?us-ascii?Q?2KrtSz4bTmOeaLS3FCbMI54Zo/IH4Ss2cjtNFmIutVdr6pv7atdksO3NdvBo?=
 =?us-ascii?Q?8aTpuwj20trMMO2DDpxavR3zipcPYOUs6LnMqNzl9eRsGBvo3f7qfdbrbs56?=
 =?us-ascii?Q?5+zjRwVDi53c7ugMwZWblxzqPeN6JtWIxbb886kys8/tV8rYf/C+bS4udzRi?=
 =?us-ascii?Q?dRLd2NNw2r3Zst+yZvgGUahHiAHD6qNQJxz96QCdo1qpbGE3v0s54X0gQiaj?=
 =?us-ascii?Q?aeqAykymES5bJvqngPdjpI51OQuKlVUL6gyqUZolBmZ5KzX44SK7doSpuxhg?=
 =?us-ascii?Q?OFZ7ocxBO0G4UwkSBnSP+sIjF1GtCXjruxZFZhXeIb6p359Hwuk7KRhz8Whm?=
 =?us-ascii?Q?LoStvrrY9dT3oUFHnh4fyo83x+hkC7uIq+Kya+vvNIDCcyWOgwvqnQmfXG9i?=
 =?us-ascii?Q?I2uLWZpRrfxOwBGutakmvltG83cE/dUZM3qQsix1mPh/BI7jZAj6r3g3Hhm0?=
 =?us-ascii?Q?XuAvEr1rI6wcJ71n3CxL8s+e8RkclaA8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ig19z2UssxZfCIoPiSIB2nDQqgLhThfSGTpCqGDvYAyuYiNKG94JRw29x5Bp?=
 =?us-ascii?Q?DmhugAYVxnlf8xZghxs7DU/PtWGu4ji36cqD8JxcTtdI7w3wtF79oCTTYk+n?=
 =?us-ascii?Q?B4oYfmRK4d7bpQeu6ZiUisxWjNUFxhplOv9Tu+MHwOFYPRPGrd0XqVkPMCPm?=
 =?us-ascii?Q?fQz07DtBDhLQJN/+IDAogyrdgoGoz1neA2eqqp5j0PPraQU79Y3yT8MKks/d?=
 =?us-ascii?Q?ARfaWv5iihRxomBjlT661DevLPKqv6w4gHIi1X5NqbC2YG/clwQPK8h6RgCB?=
 =?us-ascii?Q?yws6qj1GgjnF048D8wtsnqKtdMFEEALp29K5X7KVV4WbtuhCTj0fcwCXlN5u?=
 =?us-ascii?Q?DJpVFyaV1pbszZDgiVCM6/8flnwNH//W1BiR4N/PrToMpe5g+9jp36uMqYOj?=
 =?us-ascii?Q?F2NAZ5ooPrEkFOQDs9CziHb0M9hyTKWTtRzrt4HBbbV3d2nyxYHmX3UWKGqo?=
 =?us-ascii?Q?tZeBRq1bg1y/RzUNrZAuLOT925FmmoI7hmRXt2yemAGTTkMYcA4PSKCQnoz3?=
 =?us-ascii?Q?qcE9PYRSQ6BZ7nJOR+gvuou3swn9ez5teDdCrNfUL3d3ppvZfN10ExHNcntV?=
 =?us-ascii?Q?d5XlTCyqFkCFaBUGXTGNcjfjZYiYqpJYqaqTXmlMZAdi5bTVtd0rZctcJzT8?=
 =?us-ascii?Q?zkxJZ1R+UVErUciPiEeGLPQ2V15Tzx6cdHonClhJKtWOxto9WCi5qLy1aHVN?=
 =?us-ascii?Q?kzWWIwKU783BpiYi/cB7oJVZuibwQ6xIYO0866uY9FqLz97HYVsGDPt9l0d4?=
 =?us-ascii?Q?hLm0JPvtNs5pZ+7bBtR7oqF0xIBbFGwChjzAlQoiInVWNjjthMQh8VOF5hIM?=
 =?us-ascii?Q?euYlhQgoBcEfISiuXA87GNUzJ38+FjsMYi3eo8RXQtw6ReogQqS4k3R5Yjj4?=
 =?us-ascii?Q?C12wyQCByfbTPbFHVKgPNghpR2ZtP17K1E4fp8J/UysSbfxxrER6auaH5AYt?=
 =?us-ascii?Q?f/EC0NQDd0JFCVbpkePfxILso3/S/k1eJ15SU1drP6Y0J4IBUZeD/JLHDG3i?=
 =?us-ascii?Q?rTnHNLMOJtVO+0L8uIxkHENDoq2bAazVLDZFc2OhLMO3m0sAcUlr+HSk47rU?=
 =?us-ascii?Q?8TKZuXZewcoB02BChhewXDZ5xM9/E10CqfTttTMz+OtGPYz4Fn1BkRkxLDGx?=
 =?us-ascii?Q?4fyCDNFTyRkMStBXM69SgjZ75GeU6I1GQkqtei+3QNGG5I31UpCWTbokltQO?=
 =?us-ascii?Q?4tS/8O2F0+29qyBl3ZsAqgwpv1NpIgS08SMPOCdMQdbgEoNIpe9z0T3DBcl/?=
 =?us-ascii?Q?8VjQIG9/sRRYIPxTYUWaBnNsnqJug4y7WZ7qzCPZgeDoSiU9kRWhHkFNnlBp?=
 =?us-ascii?Q?7qZu0TYd4l5z7SLbPsijqTX6yLa7y6w/WwnN6whQNn46Ya5A7G8HeyxLTfkO?=
 =?us-ascii?Q?yrGXLIixzJIf9SzE0g9nfA/ec5Ki0hB/sKALG8DWXfBD9oF/Yy2Zifkk2kjy?=
 =?us-ascii?Q?P/AjEGnUfR3adqT4qQAL8txG56E5IvZGKUw6b4YAlG5CMw9K+Et1/2+GH18y?=
 =?us-ascii?Q?5KlhUOntI1HpisvSGrm5qOPDDCm7spRxkbjH8zO8MXi3lQ9qClyzhqYLsbsR?=
 =?us-ascii?Q?I+VR/wTFJ78cwtLutmqiz2rda7YZ/X9PoT5/wGynvg9Q+K86O721Gn0q5XAv?=
 =?us-ascii?Q?3w=3D=3D?=
Content-ID: <238DE74DBA9D3B4392023C525EC268C4@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +NEeDyEayFtiYDKAERPBwDTY5VG2qzEcoKa+qrfbdMqSVliiDEerlxU+HIOewLPGKbbwLvsS3BgYM/OAXXsYv/NFlYKT9pc3ufdCqcL2NN+C8dH9g8lR6Qk0yhuVqUqnDI4sYmuVKlR7StEZAO5HM46mPksgYlhQfaWcgiKKGGg0IQ9/D1OxCEJm/8jkpTIfNd3FwS4KnN8F2tGdm07S3u4ztwAkBdyGSTqoPddQeeqQNJysuoJvshEz+sb8NEV8oUxAL3fUHCwSWrbbljao2dor8Gtuk/hxy8IaB5h3zM2v+nBncUNSnYxMTGZt5H98cpK4YrWSEuHS+XB3M6o4F0NsdmI/4wDlmm8UDrvZdFhXVZx5SKtnofLxxgj4YixTAy8PwqVLmSw7gY0IqypQKkz0Sxcm9c41DBK3s6CZMVcqCbWs4GzNmSbWC1yyszRk2kiiIxT9V5sBhpNbZBZ119aDoSLuLcx67A3E2gWXPg6t7U2nF7j9MfxQzVBokI9eGcGjtfxKpHf1QtqOIinZXUXrrex57eyBgG2ETcIlNbap+F48ckX9JQuN3ItCGWRJ4tOo4/NAeXHcOO9vCbKQgWXJMAJdhRCdoABPojm7qiqNQZmfNdFMaoU3Q072iWu2
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b94a89-e932-459b-ad14-08dd20ddeb54
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 10:06:06.4394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DNFjiPrtaTYQxz4dQ9XTp5p6RHGgVLUmZt0g4Qku34W6acNIO2ajhmDZBXCBgyaXFeTKRD9ckGjjcegDXlhcgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6761
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1734689173; x=1766225173;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=0Z3jIxZWUTW1spTOQZT9cjItvFb682SzSRlwyddyMKs=;
 b=ZvBGR75+CHQAOH/cmXjfoR9uLZjGeGhPCmxMkxdweQJ1BRBrBzrLuVP+
 jvaKTlNfQlzVFLF5XSSPfJWAKEi1Vu/Rh9uaJCzUe3UXSeZNf92jPlWgd
 T+iT30isv7IYbkMy7rthAyc89w+OQKzo9yTRk4AUXY47G+xotlXMFo89z
 gRzIkxKZ6FAGyiH4/coiFXefSwuFqrwFHOL7B7XRhrc+6jAkDxc2Eu3c4
 8WoGoMZSXbRr3ZIW17OtigDFNoLDVsgMGuV54Sa05U0aueRx7sPSEJonu
 IbibXf4yey61MdFBZfYBcApvjygHrCi4NakYf1QlYCXKL61eBOmR2fdzc
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Z3jIxZWUTW1spTOQZT9cjItvFb682SzSRlwyddyMKs=;
 b=SnUsmq6lK0widgM/PDGh4OsXe3s7Ne5zAaI9UHCuOnVnhTA3H5D41WdCnyyra3ymWhIV9iZEIJHhztl3kTOI8/7ZZ3+ICeYWJN9PCbVv/UI/azZ3HnDM6qM2yq9vIDWz95VVuMs+kkx94S+8txUCmeo4wDnlYMHm3UeYXTFLHnk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=ZvBGR75+; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=SnUsmq6l
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: Re: [Buildroot] [PATCH v3 1/2] linux: add support for device tree
 overlays
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

Hello Thomas,

Any chance of this series getting picked up?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
