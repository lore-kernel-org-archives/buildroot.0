Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82902C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 16:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17F0D608FB;
	Tue, 21 May 2024 16:20:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PyJVNrTd8J1x; Tue, 21 May 2024 16:20:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47524608EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47524608EF;
	Tue, 21 May 2024 16:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70F771C53B7
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 16:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6924381A2B
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 16:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-sB3ErGgDRh for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 16:19:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3306181A16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3306181A16
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3306181A16
 for <buildroot@buildroot.org>; Tue, 21 May 2024 16:19:58 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44LEbo75027195; Tue, 21 May 2024 16:19:58 GMT
Received: from xusxph005rp040.rtx.com (xusxph005rp040.rtx.com [128.13.121.146])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y8r2c5d4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2024 16:19:57 +0000
Received: from xusxph008rp010.corp.ray.com ([128.13.124.224])
 by xusxph005rp040.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44LGJuEq004730
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 May 2024 16:19:56 GMT
Received: from UUSALE2H.utcmail.com (uusale2h.utcmail.com [10.220.63.43])
 by xusxph008rp010.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44LGJtvw003928
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 May 2024 16:19:56 GMT
Received: from UUSALE29.utcmail.com (10.220.63.19) by UUSALE2H.utcmail.com
 (10.220.63.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 12:19:55 -0400
Received: from UUSALE28.utcmail.com (10.220.63.22) by UUSALE29.utcmail.com
 (10.220.63.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 12:19:55 -0400
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.180)
 by UUSALE28.utcmail.com (10.220.63.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Tue, 21 May 2024 12:19:54 -0400
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:184::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 16:19:48 +0000
Received: from BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42]) by BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
 ([fe80::c67e:811a:963d:4a42%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 16:19:48 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] [Buildroot] [PATCH 1/2] support/download: introduce
 curl backend for FTP transfers
Thread-Index: AQHaqWGHzrWsC5u5j0ONBOG38CB2kbGh4J+w
Date: Tue, 21 May 2024 16:19:48 +0000
Message-ID: <BN0P110MB1673D23A6CFB29DDA9C61DA5EBEAA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <cover.1716063903.git.yann.morin.1998@free.fr>
 <9acaf4118aa1e3ba7ad9e0516a78273af7d05d3c.1716063903.git.yann.morin.1998@free.fr>
In-Reply-To: <9acaf4118aa1e3ba7ad9e0516a78273af7d05d3c.1716063903.git.yann.morin.1998@free.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0P110MB1673:EE_
x-ms-office365-filtering-correlation-id: d4431fbb-756e-4d7d-3d5d-08dc79b1d60a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|38070700009|15866825006|41080700001; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gLAoCavX6g7LsQ5ewgBGCnglHyQZXtu0OYn1sKup9L3b+JptdYJ3Zh39X5Fb?=
 =?us-ascii?Q?/1kczlPbF9EQCuPHkoCvWAXYoz+oklZjP8RQuGpsuPKE4uFL+ndSYd2boHfk?=
 =?us-ascii?Q?t5t2lGgNeO2hxC5YpuKN6qS4RwbYvf26lHEjCC2bUfxyLXn0xNPi5BKQZlxJ?=
 =?us-ascii?Q?VBQBNwG8wPPne6sPAw1pf9KG9CZ17KaLHiaQyfd8HIp47XRNtWagtbpU8Z5A?=
 =?us-ascii?Q?vkWe9jq/m1EwzNk1MUjFqZ1d6F0M+r8aTrH6FibsIWCoDC/ct9jHegkAPpJ8?=
 =?us-ascii?Q?tFvnFabbDBWniSLP4WJ6s8yWZDb0LYJyNF2zXryLLig8+1mbwaLAsG5jAYJ0?=
 =?us-ascii?Q?ZYrWK/xTyOHFZFsTLFqQevQagoX4yj2bsaNqEuEVS1xVkTK+dhGg/KuQsZWe?=
 =?us-ascii?Q?f2f3FCjijabWKKE/z9jQthr5Dr3yn0b04I0xLEDOdKzusrrJYe2NUQNq9wQE?=
 =?us-ascii?Q?XgMDFdatNNn0czENlgs4pca0lELQL2yXl73j+f1n82A9xk6iQ7SwLSHmFJ32?=
 =?us-ascii?Q?TVxcKzYg8hDmtihQnmc+bLnAZpYu9ZlPZBdsZoeAeG5/PBE47opB2JcWf6Dv?=
 =?us-ascii?Q?YKm72szO5EIIl9cgdvj3hTpjNmmPbEQSW+ZRQho2UsFtV1y27NgTwxSi+HV6?=
 =?us-ascii?Q?1kZCekBt3YQw0rpEXbomNCcRykn9b+xROoTz8SxH3RcLWvI+FATjaNB/1Ncz?=
 =?us-ascii?Q?CqscP6nCm7ea9OC+CpyWBUt+a6KLwofhwxiAwHm/7CTOJnCCZyLn/GuQII4u?=
 =?us-ascii?Q?kjSSwHL+30j1of79xf4IfsK2x8SJKhHN2dhAoNZ7cyCghXs1lTJpN27tkMAH?=
 =?us-ascii?Q?SWA2vXR+A9+PqB1ZmD35gKKPEqg4/xmMEnN5y+eCkwpzqc9S3Ed63lnXaetV?=
 =?us-ascii?Q?EfqOVZ62sqmhJ3lth0CMAzXIbPCNlNmqz6LHX5i+Oyz948l6ldaST7sz1+1l?=
 =?us-ascii?Q?dWCRTcJO/7lmV6GuZ0xmZ1QV7BV7uL6ARmg0OmTdaz53SHp/5uuq52aGD7/C?=
 =?us-ascii?Q?MDnhpC+WgbQOFAc7UqPf2hsWk3OUrfvbrH3rA15BfJ2fhrEr1VdHImRzlJ8w?=
 =?us-ascii?Q?COcMEngcjUE6sMWKAtvf1EYMOYc/9AuBDNz+GS4nU+kIlVSvOFzy6INfTp2x?=
 =?us-ascii?Q?LOgVVlYLW+6L4nqMQfC8n8PcL07O0chTCqbtpqYzBAcjEkJwf02wTrPysaiD?=
 =?us-ascii?Q?0P+a28phjcy8OZF3SYGz+PjuedTmdyn4bzuSl3PP4iJ8y0fqFeiAEJeN4Qug?=
 =?us-ascii?Q?AHY96CIm/QWlz18rjraPdaZRed/pL74f3MFxUt5/lmpmvJCty2i5Kw7kWiBe?=
 =?us-ascii?Q?qrAgRySv+YAq13hh4/8UTeBVBOSdZ3ux51tpmsp8d18x7R7WNwZ33PnCoMqB?=
 =?us-ascii?Q?voJylbBq13SRhfOWiND5B0j4krqRYRYWEuIFzOOBbHCI2uv8ZQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(38070700009)(15866825006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DKcrH2TYsFoQVuiPaOYwXE7Ui21E0Cra+on/mLDhnlnzwz11QVlwexh+vKKy?=
 =?us-ascii?Q?M7Q+F5d4bwJyCGBMqRqdd/kSduTK6bcEQfTlyqUOomSZPM8hg0U6YePdpPJ1?=
 =?us-ascii?Q?5tKdIqIvVvpnAYlOhD5hW6Tjz9dy5AlfVkw67kclSWAD39DrcqsCLQZxP8YG?=
 =?us-ascii?Q?FvPWbPU6vxsqKYqn48x+pDmrdP4D06GBKkJ3wIMd3k2rWw3bxkYvjFpTWpyp?=
 =?us-ascii?Q?K+q1oUqaC9NjyhXwBo7M7DlNVYUYKvyQOIh2OXMsXVIP/CcT92nxi6gPekBQ?=
 =?us-ascii?Q?EIPF3+Uv6htpTK+KA7gBhwvFelt3957pfBh1+ErUhUbTPKhaVMJ/I3NUAL3z?=
 =?us-ascii?Q?pNe0M4KKxh9HEUNtSr0xn8xSQeZjqVB2tZ8qD6n6sfgz7N7jykqgAIiR7Rhi?=
 =?us-ascii?Q?11hVv8N6sjfGaKKuhwCxziy5c85gcjmbHEeGsVqi75STj/aVQl2i98JmGvEX?=
 =?us-ascii?Q?MXZSkbcRIEHSw5lWKkXMGNEvoQWdFbgfpet3m40MNMfdjndAF4nk/WC/6u9q?=
 =?us-ascii?Q?qYo5Nr8FL+kNqwh46VFH+6gocpf1aobTutpeXeHv/7Bxe4zuWc/LtNZTeB3T?=
 =?us-ascii?Q?7gj429E0lnU6rV7Cv4z6GSKH8zIZ1jASwbFLSpsOap+ubx79SvZzt8w9/lsI?=
 =?us-ascii?Q?8Hson04ya0tIv1XvEt6OvAQTiF+y4w1iU7W2FrIUvGR1Jju2GEJGh8bYWGR7?=
 =?us-ascii?Q?sgRfnmGfLsEKOlIRgsVVGQoM6xFfDQeMu7H8RSuSliANVdtszrAFqm2agnsE?=
 =?us-ascii?Q?grafHT5T3apeSdxaxnYYLld2ssrCS/p3R5duqQrAj4GpMTRgcUxM+9XzOxFN?=
 =?us-ascii?Q?DsUVHo9rEsN+2blik0j1sbdAhX7XqGLGnoK//XX8Ve70+40ykmPN4lCFjBVk?=
 =?us-ascii?Q?ra+87OoqWy/2FDmDEV8RfZV+/plT3s4uv708QXuw6cPXUe7K/A98Wnsgqhnw?=
 =?us-ascii?Q?KeUdrRa/tcY7aS3tgkRc10X2KBEKKG4JAZXVyree+3SM0L3bGkADpucgYMGB?=
 =?us-ascii?Q?w4ZeYYzuh0nDnJxfeKmEhLNcM5+sa+ZqlHJWPsZI45W7opjnEVfQGOTH36BC?=
 =?us-ascii?Q?s40bqQFxtSYd6eB55COdL8gJbDt71hOysFbBf3fxYIA91pKYUwnzH6DeNw2X?=
 =?us-ascii?Q?aADu/hEIQnxmGeuRidD5w56tfjuImJYEHm4G+u2sFOhdCJjmdSuF5ObhFg1U?=
 =?us-ascii?Q?f+eACLQ1kcFjK4VOJnV62Lh/4K7FgO86y9kxFutI6+NiUugoyaUkl1XNf5vv?=
 =?us-ascii?Q?gZMoVBCEwaM1IdaBkx1eQL1zYJW0xuol2Ua4fz7AZh2xDx/P65zaKGPPnYBo?=
 =?us-ascii?Q?QYok5ZmZANWQd48kh05rJPwgHNv8KPnBSisTPkOsOWpYccfJJeEpSzYWsYwU?=
 =?us-ascii?Q?QACw32SnMhaSdED+7u6dhQoiZ31ESr3JetVQVxI/kIrERz6FBh9c9gWcpJRk?=
 =?us-ascii?Q?bcIPMP4B6tyd23e2NhYPclGXhTJh3Q8AnXxczWGaPAkPrBQZcgBdC+OcE8Tc?=
 =?us-ascii?Q?qOt+upMBrlMpDvg=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=07mPf0gWlhr2mMFF0M8CuVL3O6yb0+CVQMsu1JK5xTxXO2d3HtRIXCBBHje71B2cqlnWT9rRqQEFYnNS+cTRxu5kcKtP3jcvhxZ54DSp3qtadGAc13n27iTm5XOOsDyyfILS5aod5G0J4i/OPqY8B56xOqQdAm84XcOanJzz1W6+dL+SJpt3JQLkCApRKe1CTkh5ZAS+9bBPuMgQI7oe66pMgOdFVNs+sule12pbPX98zwxWv73jKBzj9V8asQUqdyeqlk9mPhFG7Bth4U4Gu8JqYEuUeHvE5bDdBRJBFPv8Fj0FVLs6u+Wl1vk69RlbF5gzw7fnDnutN8cuiVSs+w==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMuHvQC6T5Ltr0OFvKUNRSrdB1XN/lzzS7OrFGkIFbM=;
 b=lmq9QVS7fIQXPgddGcbvcnnBU305lkjabr/fKUTLiQhm7IzmWusr+G7NYc3y1FLAsWuhkQWkALKsowkOLeskwyhlADLedFh6fFNUPHXx41jsTGePefmcvDtTM6uqf3yip+nl1NnsXh9BYP7tWDsOfkpeTRYMCC212pc2I96T9LKdeMxD48/Sr/jg9Qx1+sQ3WokhAKOl0F8bo5t+hOsqbjk5N054qG+Z0N0VIu3/anlyTqg+wr65tvZ2jWJfkWW0b/tIP7NOwszsN/Oxak398itH9EsCJ72nElQLfbk9VqsIM4Bsw61PSSg0BUpE0FGhsAv1tlfvnbIct6rqrrFCFQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=collins.com; dmarc=pass action=none header.from=collins.com;
 dkim=pass header.d=collins.com; arc=none
x-ms-exchange-antispam-externalhop-messagedata-chunkcount: 1
x-ms-exchange-antispam-externalhop-messagedata-0: dFx4p+JPonlQMWdOLmHA5ih1kS68zNzgg8gHUNqrLhMYja3spp9o1CqP2GPY0Yc7IP9Z/rNoRZ3nt8a85gWBp/IeTmEcDJZ549eS7L70IfEeDuXAdQKEW7TS0rQP+gkEJoZRono356dnq3N0S2xVW4Vfk+SeV3HfHFKOKKQFSeRy4pf43n+J5pOD3C8x4LLw1eP4Y8QQwrdzBay2tyGkW4sNS43bNUNErIyLfEL9zlWQ4zrT2UHiuFpQRJkc6I1v/DkudH2GOd2NmYxX3EpS/2vASiVdgXQc4O6XvNqDVXl35TVJuIFqxgMa8f6WtDdSu+Ac/FIq4PKL8hQjUbR9RGTfEi8Wy6fFIwU8fIb3oltSnwdJ9v8kBQfbN9s+ciqHT1TP3gC7JF5DcNdx2/anZ0tlv5Ipj7QYr6rUQGvsx9F8clEiWcJBGS9ZC684W44pGebwqaXVl/foRjxVoCaXypEIkCilkixdXM0JlYflzLc6dVsRPqa++1sYGrA9b2l3M9Wx4pxW9S9PHmYRG5Ndrh/UqmeLuclUW8kjjWlg7Pv5gDYhfXmiMBZrTTIQq44ko5k6VnVnIQ02P/dABNGLhem+hDMsSdWlrjgPi3DPYjQMun5oIOrU4S9Zoo9bwRS8
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM
x-ms-exchange-crosstenant-network-message-id: d4431fbb-756e-4d7d-3d5d-08dc79b1d60a
x-ms-exchange-crosstenant-originalarrivaltime: 21 May 2024 16:19:48.6764 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 7a18110d-ef9b-4274-acef-e62ab0fe28ed
x-ms-exchange-transport-crosstenantheadersstamped: BN0P110MB1673
x-passedthroughonpremises: Yes
MIME-Version: 1.0
X-OriginatorOrg: Collins.com
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405210123
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405210123
X-Proofpoint-GUID: a1g1jtwcF8bjxMCb3FhLqU_j_-kE-ZvT
X-Proofpoint-ORIG-GUID: a1g1jtwcF8bjxMCb3FhLqU_j_-kE-ZvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_10,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405210123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=POD051818;
 bh=VQStEJAqQv0ja3iW/ugTVyaJUUunjXULQpbYNnPl6BA=;
 b=m2fyMPCsvvEsj9UJzAVAPz9n0xCIcZ/KtjIELoz2bwnVnXO7ijkhH9jZ5d29aHc6Z2mW
 7+gx1TZiFkVsDIpUrgBCDzylF83/kAwkrD8x3xRMER97dDIjTE/8Ll6BKX9US/vZCcR3
 U4Iob0UPM8RwMXTwubC80w7ZIMbhuozIGerS0/LSRAtVZuQdGxWu/OibOhV67SmuMXrr
 dTTMcxAzc1D4yDD3MlWpJJimy/dNVkFz+CGjoNAYsJxc4D7PB+Mp+mtDUgte1vSsqg4S
 Qb2+HJMWFKya1MbwHWep5uvagt9L+8lGZ3MFbHuNGdlRLrCUV1wO8gQfH6I9C7hy8ePd Mw== 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMuHvQC6T5Ltr0OFvKUNRSrdB1XN/lzzS7OrFGkIFbM=;
 b=yuPovAXXq6Wzii7O9rk/2hO216+ffblWGGuBl2/GIDK1Gr6o1OAM1YVaVuO6gnBiBEJLmAn/4szX9HkzYsIAPGz5Kbi/AiRphBf7vTVWJYvMGVpC8c6b+d6cWyCEfw8ItqUwg3OqmalrKq/SrI+A0hO3Up/eHSAE97tTkLIOE10=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=collins.com
 header.i=@collins.com header.a=rsa-sha256 header.s=POD051818
 header.b=m2fyMPCs; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=rtxusers.onmicrosoft.us
 header.i=@rtxusers.onmicrosoft.us header.a=rsa-sha256
 header.s=selector1-rtxusers-onmicrosoft-us header.b=yuPovAXX
Subject: Re: [Buildroot] [External] [PATCH 1/2] support/download: introduce
 curl backend for FTP transfers
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
From: "Maier, Brandon L Collins via buildroot" <buildroot@buildroot.org>
Reply-To: "Maier, Brandon L Collins" <Brandon.Maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Yann E.
> MORIN
> Sent: Saturday, May 18, 2024 3:25 PM
> To: buildroot@buildroot.org
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Subject: [External] [Buildroot] [PATCH 1/2] support/download: introduce curl
> backend for FTP transfers
>
> Recent versions of wget, starting with wget 2.0, aka wget2 thereafter,
> no longer support FTP (nor FTPS, aka FTP-over-SSL). wget2 is packaged in
> Fedora 40, recently released; F40 does not even have the old wget
> available in its repository anymore.
>
> Introduce cURL as a download backend, that we use for FTP and FPTS
> protocols.
>
> Note that the -q flag does not means being quiet; it means that a curlrc
> file should not be parsed. The long option is --disable, which meaning
> is not much more obivous than the short -q. It also has to be the first
> option on the command line.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  Config.in                     |  4 ++++
>  docs/manual/prerequisite.adoc |  1 +
>  package/pkg-download.mk       |  1 +
>  package/pkg-generic.mk        |  2 ++
>  support/download/curl         | 45
> +++++++++++++++++++++++++++++++++++
>  support/download/dl-wrapper   |  1 +
>  6 files changed, 54 insertions(+)
>  create mode 100755 support/download/curl
>
> diff --git a/Config.in b/Config.in
> index b5a94325c4..534efa4050 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -103,6 +103,10 @@ menu "Build options"
>
>  menu "Commands"
>
> +config BR2_CURL
> +     string "Curl command"
> +     default "curl -q --ftp-pasv --retry 3"

In my testing I found we need `-L`/`--location` which allows curl to
follow redirects. Otherwise, some URLs like github tarballs will silently
fail to download.

Also I'd suggest `-f`/`--fail` which allows curl to detect some HTTP 4XX
errors and print them to stderr.

Thanks,
Brandon Maier
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
