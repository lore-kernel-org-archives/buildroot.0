Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C128CCD184
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 16:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1300183CDF;
	Tue, 14 Oct 2025 16:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVLtFK9LM2cI; Tue, 14 Oct 2025 16:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1844583BF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1844583BF1;
	Tue, 14 Oct 2025 16:18:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 91A5D294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 16:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7861341422
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 16:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tL0kbCyxMk0g for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 16:18:51 +0000 (UTC)
X-Greylist: delayed 1957 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 14 Oct 2025 16:18:50 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AFDA4111C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AFDA4111C
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::61c;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on061c.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::61c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AFDA4111C
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 16:18:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=SsesQRmUM5NCAZXtb0DhgdtU+/Ynzo/bKR1990pDuLS3m1c3kU4T+MPvNSwqteBEw0ZRLN3EVROeTTynFGkvfcZ79QilHF139n1HAhqcfDEr0E69eJ3oA5grYm9KDZS88WNRY3oG+CoGErnDu6LwL4MDntW/xKchowbbKRIEys9vAYxFck87KH+dpt9W1u1gNyJbvVi8M5WKC10YwpohzFjNX9aETVVNtJMdmDFHiHmKBnfksSKlpunnKu0wsCuuhZPBoyAMFJ4JTtKw5YPAyC/AbQMKh2m3A9UXH2pZSdga1TQMbcq1yP1L0iq1KEXKvV7EaRAAiI1UNxvZdWNztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLGO0/Y3T+6w/rD9XUIgz6KffWaJRveOSTKUKPTDSAw=;
 b=1CUHoM/FChzqrvavwUGGTLTpec16ckBDIoVkRH97EXREx6DcaE2EpqqhVkpR89slFrSnwjhO2ZkDj14P+/+s8rCtA/xIJK6WZ1EcNhVFKe7mvPMN//j0ZhPvKUxMcYIMSa3Xy7tV8QARukcZ0oavQ3QII4B7VBSYMGZItBrwNbJFJWKR/lOWByJ31hEmq045COtezSa4rvvK+TAqd597YXtB2KAA6Nlwf2VbPVZ942cSqBx6xa3AMy2W6AsGc42KGt3IqBuJQvrvrh3D04GGMxLQLKs0GMZkv2SFSor35dusU3zh2K4Yef2uptwadVzK8lR3NGzJgCKlIH8nmgXafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH3P110MB2264.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:1b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 14 Oct
 2025 15:46:09 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%3]) with mapi id 15.20.9182.017; Tue, 14 Oct 2025
 15:46:08 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
CC: James Hilliard <james.hilliard1@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] - [Buildroot] [PATCH] package/python-anyio: bump to
 4.11.0
Thread-Index: AQHcPRcIb6SjVOfAkEmhBI0iiaT9HrTByICA
Date: Tue, 14 Oct 2025 15:46:08 +0000
Message-ID: <PH1P110MB1603E98157823E32754215B79FEBA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20251014142954.2579135-1-buildroot@bubu1.eu>
In-Reply-To: <20251014142954.2579135-1-buildroot@bubu1.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH3P110MB2264:EE_
x-ms-office365-filtering-correlation-id: 9e3deab0-1926-4fae-0048-08de0b38cb43
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BSrNZ2pDN6nQ3ktZrQFUynDruGioc16vmvEaVOaif6aFFEqrwvHa/kNFdH1q?=
 =?us-ascii?Q?ars1JTOmDIz7olg+eArlJPotzvoyKnCe6wQrCOTyJwtKvRih64ehlfcHawus?=
 =?us-ascii?Q?Z67SGdaShu/jhpTL7bM0V9tqbtSe0Pjj5yd01nC+uKZAenIhgmY22HtzmKD2?=
 =?us-ascii?Q?sGGAjdxmDNmMfEvsi1uDKjc3PTx3O0+WmVow0GOdWoRT9DFONr3i5ah5FWph?=
 =?us-ascii?Q?llaKu5oYVSoAkN16y10QijMGwvLs4taUCVIoogKhUhM/Fj062oez3GNX98J7?=
 =?us-ascii?Q?vhdPmWMudLrIk2czp+iCNVP+2bxS9Mx+VofVC9exTBbenhGj0NQwzUvs2Nge?=
 =?us-ascii?Q?4RCet77hBckZu9MBajMutxSLWon+ZfgckuHr7b/N29KccLs2175k9cEdsVsW?=
 =?us-ascii?Q?CnJt13V4TDbjeOnjV1cUAyRohEXv2REsmLgY+0Ey3OxbwgR3DD1ws6Jmr5s1?=
 =?us-ascii?Q?NyUsNHTKn7Ssu9zpcrLPSofXgMyQli3K5JPE0JvDyTKZH/FbEy//3pJFGZua?=
 =?us-ascii?Q?RuhFE773XEm0MwZnXSOoGsckw7QPrXLxmYScGEwZ6vuKRY4PoZuCQxOOu3lx?=
 =?us-ascii?Q?2c/Dwr+CYnr4L/Owo56s/Sup7BBxRI7DCCAnGM/hw7xslVsBzinYpqt/SEb1?=
 =?us-ascii?Q?FbZ7H/FUFojbZlTt2xLoMs5kPmNsJkotWOiS0UZ19SazmlscIiunp31ZaQYy?=
 =?us-ascii?Q?UYmTSHphZOuGoUub/b37omncuVGXsAjWlA9VrurhaGMYseo3Qm6tOj+zLui7?=
 =?us-ascii?Q?p3YAsX0fdMDFknLUYYc0BGFjR6O9GVHXep63B97o07RbZyA5sjaE1evIgB7S?=
 =?us-ascii?Q?AQNzmjzdhzT9OWCKsRKdiuD5nkDVSx1X4VKQrzXSrAGoJhynQmG4VRdwLvR5?=
 =?us-ascii?Q?/ga+l+UnTIMrCqrOirNOW2lQE4Y1ic33K01B2gyHVrlt61c2sDI7HH7wJ6Ip?=
 =?us-ascii?Q?1il9Y3GG0zh8FLXG6+ZL52WD28RSj03lq5cEp3YAyA7UWXI0QUtoheKT0Y8X?=
 =?us-ascii?Q?tx6C9XPWERvUY3DootIkp467FWXAnWbJ963a0EdkcQ6aEBl8hOtCKdWUaOse?=
 =?us-ascii?Q?9FmE7B35koQWtt4672Ed/23mNewwaobdzLo89DAXKV/UxTkIu9ya0UwRoAm6?=
 =?us-ascii?Q?7EDp4pdoTNIU0FBOcVJePSxKrWcrOTJ52bovcZaCxmkSOhNVFSd/JsoqVKrp?=
 =?us-ascii?Q?qUDJA2B/Db2AvYAHhMuIl2PoyKuNUKkKQ+ZPTyYRBCRGp7C9970aTO/E9Br/?=
 =?us-ascii?Q?ln3J4wQE7VM7AaPrQwAMItyYGybcRo8sR4ipIMJWsh/XnVHNzSpvA7X+Dp5x?=
 =?us-ascii?Q?x+PNVwtYlAvhL8upj2dULrsxPRve77I2NZPz6EjyAtJ8BRLNUwasP1z+e9dI?=
 =?us-ascii?Q?Qaa1wEPFNfuNWx04Xx0rzY+CZrMN7d8gLN+ePJaaEEJ5po88a4npqoX1YAQb?=
 =?us-ascii?Q?H75paFtWLLoTo04d5tnarnY+V+fRSH78qQWiuFbDrTXEQzSm4SpvUg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XJjnQ1nY85p+5Lgihz69F2FQ0P1Ul8UrQCKG2c42jUMazvpXTs/U5ggM7/y3?=
 =?us-ascii?Q?w5e3aNrh9+tjjTtZqpzso7AUBoAMigZ4I6W8ISzvQf7lF9lvE/tAf701TFTi?=
 =?us-ascii?Q?S1IK/DVCL8d3YYhFjT2WQ9Bi0Sv5LC+j/VEl+1jhnu2RYWv6ZNbndNAP2MXS?=
 =?us-ascii?Q?t1AalV+xSAEodRNiL3WgV1ifevLQNBIDFyXJ4qvoJJYt4RVykB3aUI39B++1?=
 =?us-ascii?Q?I0+6ZmlfM3QV07FxW9xFVRlZ8DtiygO3N7gm5Gdpr7APy+eKvm05pHWmqJiw?=
 =?us-ascii?Q?XvnqnWm6z+gMftqKu/IHBK8i35hxY1nIv7uuqufFyroiTjonu9qShNwjGh9W?=
 =?us-ascii?Q?kRHqxnx3lfdEizAInps0gf9qVLK7SsjKFdwCckbTq+WZDYs8+53x4TG46hKO?=
 =?us-ascii?Q?CSc7O1QXSjhI3ojPqcQeLRGTq7YUGKAlX+5LK3+Rbfa8mu3q2TVb5L5QsM7G?=
 =?us-ascii?Q?CLhcvsbtdC0Qhr1V9Ht6KzcmHPQmWvppnDJowyrBcRtJ13Ago245O+BZ/cST?=
 =?us-ascii?Q?7Gfv4o9eFfB+rWfPBNPJj/MKit4I5T7StBJrRoCo4XuZK1BPbnq3Q+ei/Jto?=
 =?us-ascii?Q?vrY1GE6I2cv6s0sp+lUBDZ86hXaNsTzMJfrVkre8ijSnoPRhby4RI2X703gb?=
 =?us-ascii?Q?CYn8h8kCgEbR+8lzMB++8F9mNPlL1FE8xJxjGHKDi4ysftXoUEJdVZTU4mbM?=
 =?us-ascii?Q?dtcMZCqN5PrPN2IDiPX8Q/U1vqi2QI6yK3Gx0TZLbABW7F4NZt3nKnAmGhgw?=
 =?us-ascii?Q?4HM8K2JK/J7Yjyz58+02x8cwzeGvU24c9sq+ZLMOHVGUF5Vi/3klJ575Vvv9?=
 =?us-ascii?Q?mBGKrrCVtb99DkDJvrf0FSqkwiSnuDil38g0up5H94b5i1KdmrtFbEf4apMr?=
 =?us-ascii?Q?qAmTLf2uReExF4zQwsC7ZR5dz0vqgpMFnkJ5r8XGVCtaL7nHOBVWq/eEfDXr?=
 =?us-ascii?Q?iTEq0Sdnx61jtUT5Soja4ofvmSrSlEB/348oTn0TcwzcYfaWXKz2bM3iEckp?=
 =?us-ascii?Q?wBB0+dXeNy+o31uNr/PIoo9x1sOh4VvT3mQ8GNiyIPD5YE1ppOptUy/OE4W5?=
 =?us-ascii?Q?umxBxs7JwqQFEB5GzbE1vYVHUVlVw53MQDQA7nL6GR+LjQqgZ+2lJpGN8wYT?=
 =?us-ascii?Q?pAp0Bo/E+XBkSRDuzx/QADiVrr7JUVhpjcsZhvaY/YF7oJEwFZD4QSJd1YJq?=
 =?us-ascii?Q?5Nf96hQHwsq2DsrOeDzYt6JCsQwIKYJnY8htj9fI3Sy1BesTBjQ2lqYWTR3q?=
 =?us-ascii?Q?vqLVLEnUjHD76cpk/UHoPjP2YPNMsqK0x3ljXKZ9KnHBjaSBuOdefIQbQhNS?=
 =?us-ascii?Q?u4z8+MBsI/QZMJrn4fao11unxuuE4U5/lDiLOK4eh6cun/UIAjgH/LAQRjzy?=
 =?us-ascii?Q?COWoPnsFtvyDPQqghqct71J+tT/1nJhLx0WR2doJzJIlLPjfYTUGA4wKVp8p?=
 =?us-ascii?Q?dqf+0bf/fjSxqJuXkzIM31c1dCKopJv7RNzJi830CJ5TW4yqht4nCovbFo/W?=
 =?us-ascii?Q?V/ZLcuj3bZUoXwU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3deab0-1926-4fae-0048-08de0b38cb43
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 15:46:08.9075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3P110MB2264
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLGO0/Y3T+6w/rD9XUIgz6KffWaJRveOSTKUKPTDSAw=;
 b=4dknsCnefqX/zRhAhZgZ6howklOqvAh6/CiREjcGcO68oKz3ZJrioAXORSKzwuyRhVJ/eR459+eXF2qic8c9XEPxBKBE+hER+rJEEacJVOlsoj3umR66JbiHZPxfYcYfWmzgbOSYybAvXi1BAF2i51n5vQvcj0XLz1/MkdSC5fEMTUoB9R16vu//N4AxolITqb/0t7dYdzwsQHVe5KEuUgJrxVzn9LXyLU2pUXUAiVORkTp/I1n6OqGZzh3Q1n4HCxJHbYOgRg679fj2DMIPGteCYCU8ySypf4WNmPclYXGJ13d4CQYEbzN3WimYjq3QhY7oglrMzwK/0B7wVT2rQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=4dknsCne
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH] package/python-anyio: bump to
 4.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Apologies to Marcus and James for getting this twice, the last email had a Reply-to and I didn't see the list was excluded from my response

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Marcus
> Hoffmann via buildroot
> Sent: Tuesday, October 14, 2025 9:30 AM
> To: buildroot@buildroot.org
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Subject: [Buildroot] [PATCH] package/python-anyio: bump to
> 4.11.0
> 
> Release Notes: https://github.com/agronholm/anyio/releases/tag/4.11.0
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-anyio/python-anyio.hash | 4 ++--
>  package/python-anyio/python-anyio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-anyio/python-anyio.hash b/package/python-
> anyio/python-anyio.hash
> index 297188db48..f93986fb9d 100644
> --- a/package/python-anyio/python-anyio.hash
> +++ b/package/python-anyio/python-anyio.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/anyio/json
> -md5  cb471a6d2338e026d7ba9eed50cf8fff  anyio-4.10.0.tar.gz
> -sha256
> 3f3fae35c96039744587aa5b8371e7e8e603c0702999535961dd336026973ba6
> anyio-4.10.0.tar.gz
> +md5  9bbd9262979f576a9023389e48204037  anyio-4.11.0.tar.gz
> +sha256
> 82a8d0b81e318cc5ce71a5f1f8b5c4e63619620b63141ef8c995fa0db95a57c4
> anyio-4.11.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256
> 5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0
> LICENSE
> diff --git a/package/python-anyio/python-anyio.mk b/package/python-
> anyio/python-anyio.mk
> index 122900f3c7..431eb5f286 100644
> --- a/package/python-anyio/python-anyio.mk
> +++ b/package/python-anyio/python-anyio.mk
> @@ -4,9 +4,9 @@
>  #
> 
> ##########################################################
> ######################
> 
> -PYTHON_ANYIO_VERSION = 4.10.0
> +PYTHON_ANYIO_VERSION = 4.11.0

Just as a heads up, if anyio 4.11 is being used with trio as the backend, it requires trio 0.31:
https://github.com/agronholm/anyio/commit/b2c933cd5540b4e703d0ee204ec6b64641dd180f

I don't think the bump to trio 0.31 has been submitted to the ML yet?

-Vincent


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
