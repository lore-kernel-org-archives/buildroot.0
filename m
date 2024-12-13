Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97255E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 09:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D0081EF2;
	Fri, 13 Dec 2024 09:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aami6rn1siXm; Fri, 13 Dec 2024 09:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4019581F07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4019581F07;
	Fri, 13 Dec 2024 09:16:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D15521146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF24C81F07
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YDM79tIURlU for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 09:16:33 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 13 Dec 2024 09:16:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A0B181EF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A0B181EF2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com; envelope-from=prvs=07052b375=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A0B181EF2
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 09:16:33 +0000 (UTC)
X-CSE-ConnectionGUID: SdQDt4XhS2OP0SoSZBzEow==
X-CSE-MsgGUID: zMIyfPHiQQy91O0diRf4JA==
X-IronPort-AV: E=Sophos;i="6.12,230,1728921600"; d="scan'208";a="34272549"
Received: from mail-bn7nam10lp2041.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.41])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2024 17:09:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ry+PvFMtdHLgnqd/0ZZVhIrmxKusbLYm3UN/hBhYPS/g+Ada/AmhG9Ilm6bME7z3NpMS/LGlVq0P8DmmYWeZufkj2amhNCKwCmM7aQibH+ChY5Y+Y3SJhi0ACfupljTXwcJ/URuBXJIzQmJ+Xmx9SK/idUGWI9zgJsVAjgDOaPoF3QKOaQlNU36no8WLkoAjyz3u7NaTMjeD1IYqO0XXzalXtiXLQqejXejNZVAE6FyK4uvYrpN5N+aGklTPYVRXIm2DDJE6Ua45l+3nkaturNqRdWxswWD4kfLtELF3wiyhmXA4kDit+ZCzsdHn+GaJpl53rNiM5kEiaC1fZ4+Wtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAeNlfAJk4z7BkI5B8rk5/jWDuaBabueo2QbRqaHLoY=;
 b=MH7pNsWwdKsjlTvnVMBV/+ovZWb0wzbaP1Eq8Hc1aSzsJwLvmRnoBGWp22Ty072CrBR9hj7dOn/p830DWoFQ5w0wj7bO5jsUe3XPujKdJz2B2Bo/3Nha+MrQ3gnY8d+faulRmDRTNscMhomy1JvsnahNlnYfhyjkpVzM32a4wohZ7g1xTfbN27gMj18hfIdVbLJf7fgY5o2T5rwFG9evTGhVGHNgrDbgENcVC1jZ0lCwyU1XZFyYV7qL156UojwGC9YM6odN+xFbTseZuGI1B+eBjy81OFZStwg8Mx2/dj8N1xXvN536QsaIJq3VTvZzTbim8T8ie8+x0899F/u3cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com (2603:10b6:a03:3db::16)
 by BN0PR04MB8031.namprd04.prod.outlook.com (2603:10b6:408:15a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 09:09:22 +0000
Received: from SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8]) by SJ0PR04MB8326.namprd04.prod.outlook.com
 ([fe80::5088:5f08:45a0:9a8%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 09:09:22 +0000
To: Michael Walle <mwalle@kernel.org>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>, Damien Le Moal <dlemoal@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Niklas Cassel <cassel@kernel.org>
Thread-Topic: [PATCH v3 1/2] linux: add support for device tree overlays
Thread-Index: AQHbTTyALzjNRBAeCUGLNZ/sfrVbHbLj4uuA
Date: Fri, 13 Dec 2024 09:09:22 +0000
Message-ID: <Z1v5werOKAXaX2iW@ryzen>
References: <20241213083430.4121422-1-niklas.cassel@wdc.com>
 <D6AG261DAIGT.19EZJ5IUQQ16R@kernel.org>
In-Reply-To: <D6AG261DAIGT.19EZJ5IUQQ16R@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB8326:EE_|BN0PR04MB8031:EE_
x-ms-office365-filtering-correlation-id: 67f67167-719c-4f0e-5151-08dd1b55d589
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?eyY2bX6uatCKJLHEjEuwaP2TTo1FNn4DrbZNmMPUVYVW6ZY539rL+0aqI17H?=
 =?us-ascii?Q?odo5kKoOV1++Og7XfrUhiurgLVsig3M1Y6nKVrkx+lstw2EKmAaCb/QIu8JN?=
 =?us-ascii?Q?KogIn8uJ41pebcfmybmXOqOeG7obySSCMr/R0M9XeXs3q6N9ojmZpvapr6N1?=
 =?us-ascii?Q?sIc4sO+2FjTK/ioHrrflZZDm+vOyB3q5tlW8ABkhBWzVpkgoaRQqpM6g87WQ?=
 =?us-ascii?Q?ry+V4BBJXZjUHHwNTglI0XFY4KYjpRfDslHQhDjMp9rDxNTGnLOsrnGF16/w?=
 =?us-ascii?Q?pKIs0ic/8xDHfRJY86eCO2laYKM/Jm6dpnvIOEslP98UwiSnUflFMDjAMgcv?=
 =?us-ascii?Q?QeDqvxuGqr/42ml2jRwX4k1pE/8x19gHyThktJSbd3H9fnwKC9KCuTP2P3gG?=
 =?us-ascii?Q?Iq08F2TugYHs3LdzuP0xKBAvcy+64uBuQ9nhx/elKBs26MOG+ohQRolQcoqI?=
 =?us-ascii?Q?deGt+46mXmwoO4R6rvSkYIQ8JhjiRhai+JEsXansogk7DZCnI7xIcI3A+NaX?=
 =?us-ascii?Q?441UYQsLxoD7UsxTsE7zYc6PhK74pTDECYKncmfqTMpqDOtSpCOLfycbid/c?=
 =?us-ascii?Q?0i71sSeINRYNH7b39U331JgP3ySqfedz3+B2UknBGuANB3j99BI4iAAPnz8r?=
 =?us-ascii?Q?R3X7Q5gTLNqox/gxrHevolUTUe3jYpAU6HqqHh9un3nIGKULYfdXCdOuAt30?=
 =?us-ascii?Q?GmAaRtueKpbn44bUlXD9hP2JjFPwfLuBsPc+ovTaSZpaVGZNasRSWTCkIQEZ?=
 =?us-ascii?Q?fGSocszQ9Ks6TZy6+1hqRYipZFtXiGAm9rub4jO9dgwX2imEi83OP0DL3MI9?=
 =?us-ascii?Q?0t0EJ0RE91Fxwj3WV99OBjlTxGE4yDJLVWHw8+62Qce39k2Rvkza42wxJfy5?=
 =?us-ascii?Q?ZkYICGFjSlvlFz908UoMZ8qAXc8SRZgA0kDMUbyMxoWHEyfyZFi2ihWXkNkw?=
 =?us-ascii?Q?PRk5p7XZnm+SamtVDGjoGr//FPcDz2cES1/N+QQ3fceACuJJzwQ0qhm9JSFx?=
 =?us-ascii?Q?skNDLJ7Z05N0JU7jjmztDN+IhHJ+dc4oAjYGfTaV+zRrIhLEYvR05P1jf08I?=
 =?us-ascii?Q?Qw/v7/NU+AdPudKxTRH7ZeGNqIry97OicsUGF92edJ25kC288oYTI/n9D3D5?=
 =?us-ascii?Q?ycSqZe4RlxZS1zJphiTHpoto9OL25LFbXtiT+Y+AWMc4SQVb5AmR2hwFcItb?=
 =?us-ascii?Q?U7luIGlXbKUbGh3pfGfA0IwnbrqyWTaDP4ct4t5thMvAKQYKI04HvKra9GTK?=
 =?us-ascii?Q?C0sCFPdBeJPFiHVv7LfSm1uh/UCfviF8Ql23ZmUIGDkx8hD6AhtfM0F9iFAm?=
 =?us-ascii?Q?JbRmdRo4gyY2mR38QJE9FwEFMwvK89oS72uT5RQ5BOzcRNKEGccmJdO5tCtp?=
 =?us-ascii?Q?vb0fuk0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB8326.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IpUBS35ZLK1WY+8ZmE2ubXYcZzwxhH4Yqbatl6wlLGphPRnb/RoYL4mQUiSj?=
 =?us-ascii?Q?mimPM9D9IdpwwusT4HIO/cGAnSlFeGEGw0BCS7kCjpHvPb+xeaSZyrLYA5x3?=
 =?us-ascii?Q?zJOeL5JxCDr0T/qGeTYK1zD4PIM+N+cl6kVniCz+WeEbRmz1DcPnkz+kYhZY?=
 =?us-ascii?Q?uTa+UN3eoJxUNmAe4reyxeunVt+hIYCLPo2AcafAaQnMwqEzGKyph5jnE8LQ?=
 =?us-ascii?Q?M2Aa8dTfpyC9dSH8xYELEh8bSOjLJX3PsGcdmc50P0rjw/zE4VTiXvVq6qT9?=
 =?us-ascii?Q?9pChXQDsNwnihcPAOv5mQy1Mx6zq0ZS+fb6oZspNa0TLtji3mM8sb8burKbr?=
 =?us-ascii?Q?OuoPq/YdVui/49Hbozbil+xzPhT0k84L+sVllh5QrqN4rSd5SUHF+fxKNL1o?=
 =?us-ascii?Q?b1I/oJGyPpMhDRsh2QDYH3CPeuPuY0sblb6oCp+ryuHM9IzRxaUBRqksLMro?=
 =?us-ascii?Q?UU7GIoQaMHGwaVFEmfqHgc2ft6OwmCjGj7F5ScGx933ZR3fET1RW1sWwcVOy?=
 =?us-ascii?Q?f+xujHhwovwU2xXD5lfrDEXhpbjZJufM89g4NYbJldJ38SYBxLL8gvzyqbfU?=
 =?us-ascii?Q?38G5nf58krJbKCqRcSruoaT/N7Y/rfD6HphzUKSZyYFc3Igknb9ft0TJXq8A?=
 =?us-ascii?Q?vuYUJqGXUnK99ZBKXofPIwFNnZ/nLRtnp4qGI3V5SbiTuQ9ocm4dsxWMLkIJ?=
 =?us-ascii?Q?MEmgHccTyNeBqxr7vmyKr/eQFt7LofKsH0E9pltaQgdc52cPDXh3VZC2kuq7?=
 =?us-ascii?Q?nDTRw1mlj6yFELuBEXQWWw7Z126RPO1cHH20Es3aq19isDyUj+CrqLF57XQT?=
 =?us-ascii?Q?XDgLCO3R6v27P7iWmAWfdyfhinItGRB/W/klvyMgyuvQs5L22RwKcQlgfI38?=
 =?us-ascii?Q?9nxdrl6TPblilgHm6Q+6yU99kcLe/NG1el4aztA49OjFXyOKn1wOPRg5tnbC?=
 =?us-ascii?Q?PR0A+0ruRUcaUFdL9Wxr9xdtImt/pIVTcp7K/mWB+k6Vd78/VxDp/Amr5nPD?=
 =?us-ascii?Q?YAY+AK9TNTjB5L/xxu2z25HMNAVJWyxTHEnI4Rg9e+YwKyTFN8LKXvVHDsr4?=
 =?us-ascii?Q?g5oPbOTOOKQKuUc1Co5sl+ljLQG5O0rPOQGKwq5YeI+ksDc4CS6RkQlRIRP9?=
 =?us-ascii?Q?I412SjxHks0icmNJyZYklSwN5dEqrRhMaojKWszaDHFeq4ExLD18h4vIvL57?=
 =?us-ascii?Q?z1VHf44/N3HUK6xC49tt6GAgIZpkcpWKW8VgVjjP+jZADoxz7X5zQ92ck90U?=
 =?us-ascii?Q?cNvWo6f6b04+iyB445I2GLIqHwijq8b9jWG6Vm1gXP01Zgr7lOgQy1nwwY51?=
 =?us-ascii?Q?/lTS4iZ61IVsZDGEUIvWuHiJXlFEgIOkKU25UpCmq14ZepzXF5oFCtf0bNNZ?=
 =?us-ascii?Q?l5k9ZgmK9pyCNlwuXH1SQ8FdnOo5ZzP0L0EwFzIx0nB48SH0gAaShQdEpDvw?=
 =?us-ascii?Q?rHzpQg1Mt9dab37CPLERbSa78Cjuz6vb66/XYBBdCV/Do2Sec5Qp1DKfP0E2?=
 =?us-ascii?Q?t/0t1mXLxGtDU0Lfu31jNhBVfQ9WIpwOZHh4HkS/EqZRQM04QY8pkjIiGdk4?=
 =?us-ascii?Q?E/sG0fXpSKevp1G5NBR94V/zFiKFitXh6ygPGiG+8EjEBg5z/WsiQLmA2yA5?=
 =?us-ascii?Q?vg=3D=3D?=
Content-ID: <9C141ED23DF72C42AD87BA7185CC4E65@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: tk2rRvsI7qeSTmdBc+AOrvNpCG6w+bfwJ2hNJuA5tnxkFPzFc3jFOGZ9ykctCJPnBR4MCIKqlzk88FPO1XhI5v7vpk2Xnnob1my8Jze13hWhtosqtOxY62rh9NciObIHUX5VtFuLMI1B7USmyAoAeTErJ4VNbiiOuB3yR2SoPRlSmnhyqBy9RTm4k/HpdM4s1egnCeo3CvpOiCmf967Hwjj9oUFKQ92wJpMop77aq1rA4uj0MMiCJm6Nh6C3SYSKPZ5XJfzPxwuHWS7Ev1+D5AsQ23XzbA96OtNQKI9OMDEc+IunZS1jg9BzBOTeYVJuZ5hPsynA+f558UaV2UCt4WKupYQz4ubSnT8lBq4/rLcRrOIryd6Rym9RSNmcUVB6o/OjHz67w+zxuPsDKeIwyv5iUHHw4pxEItqLEqc/1D6Ee17mnqtpA85VeDDk3KEivCOL8ORWcr7Z+NGPwBWGfZK+QISPgBtTrLnZ7z/D2HV5HSbbXHiX9N1VOWhF5mxZ9Fd7ulIZmYTVxFwEzMXvXw9viBpGPPhkEe1XPLyA+fXfdlCV4PyS4NEGJnuIhmClexilEtQGJYxcqHbJebDZpPBBhFMoCzkoA4520CtUaIVprRlzYZHUw8t3g1Whws4g
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB8326.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f67167-719c-4f0e-5151-08dd1b55d589
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 09:09:22.5102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yr4CF/ytt9c/oX/6DUvddnVmlPksY9k0ndlKfoxDdz5PDodyFer5W6HlX2kYOt4jcYWSbl7TjSAqW0Hcozt3oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB8031
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1734081393; x=1765617393;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding:
 mime-version;
 bh=Els8P7rAdt3aDfRXwksuYTgz2Yezxhm2zM86VGrRrQQ=;
 b=MNm269NgwmBi8FJVFQL/LDWBem3HB161lNHPhSk17Q55G5CoPDeFZMld
 Gn/YyWoVl5PyI2cxuZsiNxyrww8cg4phvqCLo2ZiTLXHxA9nh3fRsNQnJ
 zbcRcSw8KPWzxtl0QJ4RZ5uxQKtrSOvq2qQYn+L+J7JFy0d9Ur2tkHjiO
 ENDhHvd9WYs04ngvF/ht9OS6iTb9Dq/x015MyWBT+2a1CA0MPIFq0mOAo
 QbH7EDnlD6tOq7pW9EPe2tfKLhR34Sc2cv7XIID3p5WFewj8+CBIXOkQp
 BIT7cvP8wWBOp4mhhski4H4nNrxqPrcVKOdfLaZKRQycBWdb25LIna70f
 A==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAeNlfAJk4z7BkI5B8rk5/jWDuaBabueo2QbRqaHLoY=;
 b=GIjqOBGgNpEqUsLFHPZj8qE/2m59r6asffxY1hbEvMVR58Eq7R203hjtrOXmYOLIAXYrNBygZYl+i9ihVBJxsQIo3hB8SikU9DdTuDirKQgIT6oYH69XFabi78nyr0qEO48BTurxAgABjaHZNZJcaRO48Hoe9HljkU3xaW0SOzY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=MNm269Ng; 
 dkim=pass (1024-bit key,
 unprotected) header.d=sharedspace.onmicrosoft.com
 header.i=@sharedspace.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-sharedspace-onmicrosoft-com header.b=GIjqOBGg
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

[replying from an email address that is subscribed this time...]

On Fri, Dec 13, 2024 at 09:53:27AM +0100, Michael Walle wrote:
> Hi Niklas,
> 
> > -Dropped support for out-of-tree device tree overlays, as Linux 6.12 no
> >  longer supports building an out-of-tree device tree by simply copying
> >  it to the kernel source directory (without also modifying the Makefile).
> 
> Why is that? As it seems, it is not possible to compile it by simply
> copying to arch/<arch>/dts (which is buildroot doing currently)
> anymore. But copying it to arch/<arch>/dts/<vendor>/ is working.
> Correct?

I'm assuming that neither works anymore, see:
https://lore.kernel.org/buildroot/CAFOYHZDQmMRuK76TpOSAOFPdqAb4gpw=LNKfmpu=sqAD1EMhFg@mail.gmail.com/T/#u
https://lore.kernel.org/all/CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=6dHRcUg@mail.gmail.com/
https://lore.kernel.org/buildroot/Z1nq_gneO4ORw3EG@curiosity/T/#t


> 
> In that case, we should work on getting support for that in
> buildroot as well. Esp. buildroot is really lacking copying an
> actual device tree into that subdir too and currently it's a PITA to
> include a soc.dtsi for example. If you're using a device tree in
> buildroot you'd have to use '#include "vendor/soc.dtsi"' while in
> the kernel (as well as in yocto) you'll just use '#include
> "soc.dtsi"'.

Yes, it appears that buildroot folks have an idea that it should be possible to
restore BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in newer kernels by sed:ing the
Makefile.

However, I don't see any reason to defer this patch until then.


Once someone has written a patch that restores BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
support for recent kernels, you can submit an incremental path on top of this
that adds support for out-of-tree device tree overlays, if you so wish.

But honestly, considering that the only buildroot configurations that make use of
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH are:
- acmesystems_acqua_a5_256mb_defconfig (v6.6)
- acmesystems_acqua_a5_512mb_defconfig (v6.6)
- octavo_osd32mp1_brk_defconfig (v5.10)   
- octavo_osd32mp1_red_defconfig (v5.10)
- s6lx9_microboard_defconfig (v4.4.7)

are using really old kernel versions, nothing is broken in upstream buildroot,
so I expect that it might take quite a long time before anyone bothers to
restore BR2_LINUX_KERNEL_CUSTOM_DTS_PATH support in newer kernels.


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
