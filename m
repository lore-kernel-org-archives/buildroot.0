Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F83C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 10:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B3282B94;
	Sun,  9 Feb 2025 10:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUf8LBxakNoQ; Sun,  9 Feb 2025 10:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1A3582BD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A3582BD6;
	Sun,  9 Feb 2025 10:09:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B79FE199
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 10:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6A6D60ABE
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 10:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DiZ1K7RX-l9m for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 10:09:52 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 09 Feb 2025 10:09:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBFEC60ABC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBFEC60ABC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=12825ece3=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBFEC60ABC
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 10:09:51 +0000 (UTC)
X-CSE-ConnectionGUID: jSOx/KZQS6yu33C5KOPufA==
X-CSE-MsgGUID: 9XqBbupfSLmAH8PrI9Jqiw==
X-IronPort-AV: E=Sophos;i="6.13,272,1732550400"; d="scan'208";a="39208028"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO
 BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.11])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2025 18:02:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=st/pGZ+uH7xWP1wPY+Q+S2qNTI5ykb5tuBp/pt1Tip2xvyCa4bwNQis2uyFzq2pi+m4a6K/d2JC6Thv9QCfH342CsGFxxL5r/O+NlMQBOL7y3dex/CSMtloP6lvjaIh4pl4E8WrpauhI7ADmdFPhaUDeqJKZW32u6Qtqj/DolYaGvL0PdI/pLG/Oik9zelC83Yxa577mGIQ6j+LiwFcm6peCAEL3FlwqPjaZr0Cybup6WM+/tzv2q8FMe6br3ht2evq6CtIa2PS+uZA4aWkD3zS0S+JR3yCvLeeFYMEf55PSOuRYq4zmb/GT0eKGDY/y3YDPRDJHG/Niv7a10U+G1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5UHXUykn9JCb8y9boWp/kywWgkRXpYBQEfd3Vce/3E=;
 b=BGYTgSSSKm3nxVWvM6Q6y1oxfyazQAmifhR5hatWkcIr84hpoQOTA5l6WHtMnb34MlCBbRySsOFOH8WrH8QvQYv9FlE6Ic+mmXZFO4OqRSwlyfE1e0riuWFZrne6bEKJfOMcekGx7T/wLCWo2LhMo8xMTCjn/CwZ3ICB/JFd6zZDGJFi8Sq8HI8w1WKIaEP2VZALjn2EGiBBo1J1C0IU9TQKMz2YKSYFMTZJoBSj4dKqC2fzHdBgjKqO1NIdUeo72S5FP1HUQWH0y/eIlRbjHqU88fIslBcxXVX23Kzzzc2pEnRu+iiw6OIGr7CodwrhIIQf7+2ecOZ8s7bO40hUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BY5PR04MB6360.namprd04.prod.outlook.com (2603:10b6:a03:1ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Sun, 9 Feb
 2025 10:02:40 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%5]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 10:02:40 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Kilian Zinnecker <kilian.zinnecker@mail.de>, Damien Le Moal
 <dlemoal@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Niklas
 Cassel <cassel@kernel.org>
Thread-Topic: [PATCH] configs/rock5b: bump uboot to 2025.01
Thread-Index: AQHbetnBpovg1ZNDa0K3bSRsxybNKg==
Date: Sun, 9 Feb 2025 10:02:40 +0000
Message-ID: <20250209100233.2541832-1-Niklas.Cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.48.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BY5PR04MB6360:EE_
x-ms-office365-filtering-correlation-id: 8ef02571-0100-4645-4ca8-08dd48f0e3ab
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?RIKFLb50eZDk4QxvLp6w2FGlORnwyTtoTDQuVnD/F+qRa8hbIn0MiCVvBG?=
 =?iso-8859-1?Q?DEjZxxMWnBK6aoPj3iucpvjHX+FY9w/WYy8/8mTXIb86m+Y+4ejMHcYPq9?=
 =?iso-8859-1?Q?845YtHJ6oFH7T0pg99C4QDxrTXIk/d3bgnpReUPdTlRLYPbdC2v2yHdP9t?=
 =?iso-8859-1?Q?FSag13m11EqbsE0kVR4mttI5NIQ6SVHr2l+NmkS7vIgwVMhJF93B7ki0+4?=
 =?iso-8859-1?Q?aeOgAhe1C5LZwTHOMJbLtKvUKTRYtNIYN5oC2L0mrs1M/YeRFInEhIUsDs?=
 =?iso-8859-1?Q?ANCxqenTA9wR9V0H4rFOMIW/LyxakAAC79TqIlZI5PGw95otW8qulX34AU?=
 =?iso-8859-1?Q?R0xKTCXBBuag9LXjnm42BpFJShG2hm5u/5nMxv0Bx4aW5wl0MUffWujCN0?=
 =?iso-8859-1?Q?zTUimqHzjcZw+a3c0+ZYgm5I8qFUQ6ecsvZgGrJcdKPgRzMIRsiA8uNqmI?=
 =?iso-8859-1?Q?+GlxvLnS48xJbYE5Y5epspEDcGwnRagKmp76dJHOUPDGyicqz5m5WM7h43?=
 =?iso-8859-1?Q?3I8o22Ha9unkf/I/noN7pQhtqJcINJyBWcbm757Cam+Ufxq41CVkcIKluQ?=
 =?iso-8859-1?Q?KfO4xrh2aFOMiraRLdkbtY03DpwlfxMgGxIwY+mYT9lCoakWis+qHNNRGK?=
 =?iso-8859-1?Q?IvjxV+EGGN4yWRZcq7vpuXogtI6k+a4A2SysoKMt0xpap82LGnLlnJpI5r?=
 =?iso-8859-1?Q?SI5Edj01IQ+o7GRqgo86+AawNN4cN0GA5b9G+MJWryTzndddfiq5d7P+wy?=
 =?iso-8859-1?Q?QI5dVEQutmxeH3REZpud7uR1/kRV7UdiDFwTkKlNtWccjcpR8pBEjES5li?=
 =?iso-8859-1?Q?6dEaQNs2yT84i8IbOK9ZEFeXMDOrYm/g5cwWgsSALupcBz+Bp8yYBFMC5w?=
 =?iso-8859-1?Q?16OHl73R6SGDM7Yhvq7zM/zsZ8zMyZwBYzAppcog+UuOJw0A3kW+YAisr1?=
 =?iso-8859-1?Q?ULzOdUNVgxGqjdzV9OK0hl6cKyRsHUmL4Yg5QuHWKxpPZFTE8p4jQ6Rw2s?=
 =?iso-8859-1?Q?4sbuEPahOTelOCKAT1y3Jtl2ualdi2JZXX7GDR9jlJt1Y6aDaQGIZ300Yi?=
 =?iso-8859-1?Q?8gbW7hlm+sjgBr2Xj0B6RYxjuDXS93RELvBoCPiVc69uDqX9nGyfll9Mo7?=
 =?iso-8859-1?Q?/Q+OcMkQTGhiOBeUVj9u5eUISnf5jE4c6pjI3tZYw8G5VaeiJaSGk6qweN?=
 =?iso-8859-1?Q?1BW3jnrGeVTq09ttDBFOq1/bApL8DtF3d5bfpcCUNTlG3Bo3g/Q4XfCZRW?=
 =?iso-8859-1?Q?MHjG9NLrv9EfjY/dD/75JtUJOrSlcwIm/aqYkJAdxeAqMWwekua+OCNQ0N?=
 =?iso-8859-1?Q?4zs/K1wGfd4Sx45Z1otLItMBvy6OUT80DtO1p3T8/CFhwkoV/S2uc7v8T1?=
 =?iso-8859-1?Q?GY2bOhSiS2ohxJrHEjBQQKhvJDdCZEEdR4Vqb2RS5UEu5ELAMkZRgejSGi?=
 =?iso-8859-1?Q?LK+alBnJ9CkSJz5fIkxFMfDDnXeYUNrXTo2ui0XIOxw6rRZPh1bu6XRyje?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?73HijTE/BH8wKwc8vd3hcEoCYl5OzSRHRNVrI5ymKryqThhfRouqDwt/5B?=
 =?iso-8859-1?Q?Y2zM0vwj1y+quJPYOjqAcqtcL/RSUMULwle4bxJPfJR+mqUI7WgdeYvfL4?=
 =?iso-8859-1?Q?riNP3NTTQx61bZL09w/iTPU4EQD3GpfMQAh2EJ30vECTOVxofXxm4DZ3rn?=
 =?iso-8859-1?Q?76gZq6jsp+7vkdvDGlodZzU1Q8FFELP8fRfYTuUqDpS7EdeJJtdeszIo46?=
 =?iso-8859-1?Q?PHiez2pJqOhf11/3bBJK2NRgp1JgP/pNstoqNktKqDx6Qjplrgm63p9PKT?=
 =?iso-8859-1?Q?UpsH3bNnGoQTYblV/SDnDzdmP1g1s/09MMqOa8XlhFeah+XWedtFbBLjLP?=
 =?iso-8859-1?Q?/azSfSy3eOMfzxw8q387wpsls/CL4K24OrGmfrKJo3Bo8TFM3VwzFv2JZ/?=
 =?iso-8859-1?Q?Eg4NOTAhGtaXm6LIYmuKJ3BlqENluLTj35zJ4xSu++ADfE6Xl8ARNFtVne?=
 =?iso-8859-1?Q?gxq60Ag1VOoF8y9Eox/wJukO/kN39eNbp7Wx6kd81acD/iqoSVtUPKRtdy?=
 =?iso-8859-1?Q?YnxdOOdXAhaMTkal2O+qQB1s84KvVU+My7LC5L5aTwDPscx0oERiF3NgPi?=
 =?iso-8859-1?Q?FnLe4ETSvLUzOyZq/kExHDg96qwteAYxkdgUU1XMsJrmsIbv6fFyDRAR6e?=
 =?iso-8859-1?Q?P3d1rC+m0WuAYuCuPt5TlW6QlWddwJyWKF0HXv+iR9jguUIocVAXQqNfDS?=
 =?iso-8859-1?Q?n/ZKpg6Uohc3xYvGjwABLePGSSN8wlvw1t96abzBIcZuckaM2NZldS4ddk?=
 =?iso-8859-1?Q?AyAqKmHE4rcDaMadV2falO2JuWTGmWcb1G9hxN2K13s6kplAJZHwfLY2kB?=
 =?iso-8859-1?Q?615lD9cbAnyB8WD9ji2a9p8AndJ2+arKFQG7LPD7GU4BxtC4FChqbasy8S?=
 =?iso-8859-1?Q?YFScnoTGaS8f/407D62xOELFarug5O+WZ2/3aiHdjrjJtFTo9yhOwnZ2I6?=
 =?iso-8859-1?Q?78kooU2fDHp3PYNI6r6zZ003qAyjlM3BIsxleR84AprcQk1+i42ptNN1zn?=
 =?iso-8859-1?Q?xT54j4oygQ7z+25WYvE2UWookRvSKnvC3ZIqMrtRv9V6geeOWR9THXBw0p?=
 =?iso-8859-1?Q?Ra4mtqYMRH0/ESdEAkDQwgkiulrVni09vQyH/+ZtcHLe5ikHgCjYWGVRxy?=
 =?iso-8859-1?Q?srWIxePNq0of85HNWA5XaQ9FoAHbJhl0I91fErXztB2x4/Ew/ncvDvTVG2?=
 =?iso-8859-1?Q?K7iq7iAc/NLCzkSIugtGB8Hd/qLXdKS25cf5S2LaB5gxWINeDMMAVnVjeD?=
 =?iso-8859-1?Q?OdW7FIqo/Rt46jPOIDttRMwCoD7sKIwsB5M7beru80GJ/SuGgYzpHuuqN+?=
 =?iso-8859-1?Q?DH1WJRPtQY5+dQI6bCAFvGcX60t8/RJTK4sTLpMkeBVd67ZBXQHo5bu0im?=
 =?iso-8859-1?Q?geURt+y98VXQAB3ZL7dxMaq3tvgQUIBuEDj/WgeQBcp+sfWdiTdGdLj9N7?=
 =?iso-8859-1?Q?cVUqoD3ZSkn+2g83h1zJlHN14R5UtA9V3aO8uxPYO6qi9inkQHLzzpKln8?=
 =?iso-8859-1?Q?HiSDgRYVurXDG3xXolv1xw/b6rF+dHYGJ8nSSpiRjQ82h2QyuB9T8mz2JK?=
 =?iso-8859-1?Q?nI9GfVZyZnHvR7nyhBkP1biIgOrgAi/Rtd2E66dUT6xdBMx/w5XHFFY2ti?=
 =?iso-8859-1?Q?/W2n29zX+F1wSA3INdGbd/DgY3XNUITkZJU8ZaJwiQa52izQBZa4HBDA?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kzZrhmy9ldT0l7cZ1hKaWbHDtM2ThQDh9m3vUnkY9AYgnRpRbleU9EK5NfFFECimVTZtVcl6lgjZMwz76RB8SHHpuHuRqXlLfcjBvKMgdbmFyfV5bHOTDWzjHMHpjAPxhdV/Bw8Gd6cWiS5h/4DkOIiufK+7rY02tajlHRzhpZ0C4nIXfd9RVdkNJGbd96ugrzGMqkKpU3ObRiljOXu82w1ZYltzOV8Z3So8qFv1ZpFr5KqpNDWOAaltovtxV32yFLMTUOxd8+3HCL4Kg6M3OFCXWu0AgJbAmVIDbwVsl12mGW0DwmEBLpgU4bUmWLPxJzi/xrxQL/qvHUQkPIIAzWf1so3VOLV/TlSiettkZWq5GPO7RfD0iniI3xvstGF1AXN291e3hJm9X2QoWb5Tq5AARArMrgF9UWrMjlSYiGMXuvkR/4kAah7wQMOkjd0CWRBPTf2FcGjuSdVU3avktUILtNnLIFzUoDzICfmW1hdXOrmM/IXjsPUFp60puvANsLTA1bqJ10Awk2LqbTbewqQqqLpMNfvzlVr6i8+tWsGiV1Ug6CWZLHjwlIyG8AVnpR1nuBE9mPhvA6C40u7paFuRgCmxZp4mT5jErfUmxLzHF+IKG8XRrCgXKly1BrTL
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef02571-0100-4645-4ca8-08dd48f0e3ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2025 10:02:40.5059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XNxIVRzMUUYRar8pGaSSS1HzVZfGuPKFHqOLu12xSB6Djez3b4veEwhqwDLG4LNsokiFOf9bW4PpQdVt0Av7yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6360
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1739095791; x=1770631791;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=W5UHXUykn9JCb8y9boWp/kywWgkRXpYBQEfd3Vce/3E=;
 b=NQck0lfXG2sWesH4kd3aT+LIs1w3kMKLdyW/mCJRBYmcY4SkD4TQgm8X
 9DjC86lViteFbNH9ozQ9a0C3XhiRBF2hZHP4XZdQNbdhUAz/LCorUMZJL
 m0tNpJXlRTfkG2ecptDdPMJPJdyP8QVhxTxQsb0Dpmk8I43dXRA1tYviZ
 PESjoTGQQRJm76f8zjb4IylntKdJKDUNCeVVYH/mvYGWXWXjuDn1sWPSQ
 a2mqrXAsbgP5TZv60y1YSd3tmeX8gH1ZkcO4TytxyrhxTKtq+7AS2IqID
 GiDW7U9We3q6QaP3XDTS/me+Ne5DEqIcJM6wuDtQEMPtgKyHhqnCT4RWl
 g==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5UHXUykn9JCb8y9boWp/kywWgkRXpYBQEfd3Vce/3E=;
 b=E8aWFfwR7wesdR69Ccg/NZrxalGpyj4xJMnYB55RMEat+PP64VGzXtylCx85NM71OqXvxh//TfrOxejN2o10myVcWpxV45581rWroaJyQu6wntJuPyewk4QFVJhV9uAbnUiNvwLScDeFTX3vQWe9ne4DtTO5+C3yKHtQwKL3+G4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=NQck0lfX; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=E8aWFfwR
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Subject: [Buildroot] [PATCH] configs/rock5b: bump uboot to 2025.01
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

From: Niklas Cassel <cassel@kernel.org>

Bump uboot to 2025.01

Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 configs/rock5b_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index c1bd9deb1a..ebd665e322 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -42,7 +42,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.48.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
