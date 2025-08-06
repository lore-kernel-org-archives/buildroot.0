Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559F7C87FD1
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 06:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C22B8442F;
	Wed,  6 Aug 2025 06:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJaKAIiLBLZC; Wed,  6 Aug 2025 06:14:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF4928442A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF4928442A;
	Wed,  6 Aug 2025 06:14:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA07FD79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 06:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94A9D84429
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 06:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMz-ooM0v4Xc for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 06:14:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c20c::4;
 helo=fr5p281cu006.outbound.protection.outlook.com;
 envelope-from=hhansen@avt-nbg.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C84EE84426
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C84EE84426
Received: from FR5P281CU006.outbound.protection.outlook.com
 (mail-germanywestcentralazlp170120004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c20c::4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C84EE84426
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 06:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/vQJiSEWCEjcWrniS8ZBW6WOpj0oBf5rzSpY/Lqc++CJkH78e3QSJKTnPsro/K7lT5/WdbyHogtjluC4WlZODKIt008gDpTub9mLcBoTr9/mh7d2gME5MctmNmd3MWr9R/d2HoXWC7BdV4xlAItlZ+4WEWChC4pY/mPf1EahRl8VojXIvYwcWNHRhrihli452GGkltui3q5TLc1Msen2SqgXMOJIyWW3yzv+ja0AUuK692KTkJe5AaFL/aCtJMF2Zz0m8atVgx6sst1bw5Eq4L2G97EZP3s9EB5BdV9tdt5xhNCNfktAlLrKeLP9CSVQppcK1TaAvoMq+9tkR9N6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVVg8rBUZdvSh8uhWSef08QYQO9lkB7NF1V1iT5e7yI=;
 b=qfPhDj8csWT/ego+ljqyJ61vIwqBRgWfgrrnUMaOxY8QWEJ/nLAqMI6FW6Z4S+CEQ6Wey2R83tiV2lPEW6EIp/rPRwoYzyU/OiopCF9rc3XMDLlXawyXUt3SI5swPfmXgVn/LP3hluZo3eECNn4Er6bntU58UrIFj5Mh38GzDp/y1HbKwsbRGJ6qD8Rk6a9rwil3dlBli9bqytkBOhFjq9zEzZI/sOncksidI+aswamFTNlSo+osDjP7qdpLAtulI42xxypOif5fRZimejILNLcoV676DfiTteOxc+zylW2T6z3z2V4M8CFIOqP/PVYbEp+2yQoCxrqvD4gGz38dng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=avt-nbg.de; dmarc=pass action=none header.from=avt-nbg.de;
 dkim=pass header.d=avt-nbg.de; arc=none
Received: from FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:191::13)
 by FR5P281MB5244.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:191::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 06:14:00 +0000
Received: from FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4aa:48f0:ce1d:f268]) by FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM
 ([fe80::4aa:48f0:ce1d:f268%3]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 06:14:00 +0000
From: Hans-Heinrich Hansen <hhansen@avt-nbg.de>
To: Peter Korsgaard <peter@korsgaard.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: AW: Buildroot with Advantech EIO-IS200-DRIVER
Thread-Index: AQHcBTNxKSIr2Pk5DkClUIVtQdWYqLRS0b5GgACkLqeAAB089YABhlUo
Date: Wed, 6 Aug 2025 06:14:00 +0000
Message-ID: <FR5P281MB507889A3AEA35D1FD5240DA7872DA@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
References: <FR5P281MB50782986E33353F9AFF80C468723A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 <87y0rzkkf7.fsf@dell.be.48ers.dk>
 <FR5P281MB5078D44083ABDE1AAC41FC828722A@FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM>
 <87ms8ejodi.fsf@dell.be.48ers.dk>
In-Reply-To: <87ms8ejodi.fsf@dell.be.48ers.dk>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR5P281MB5078:EE_|FR5P281MB5244:EE_
x-ms-office365-filtering-correlation-id: ce4e07b9-84f5-4845-ff8b-08ddd4b06f75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|376014|7053199007|4053099003|4013099003|8096899003|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IH04OjqAINHsIXL92kLG6YB7PB+YTd+1E8zgcX2icehhNJ/8nqf0gQZm6bWx?=
 =?us-ascii?Q?70uhhlaNbWs6utMgEsPT4VyVaXXSCkNkREtx05fpuSgtNY0nQn9JbMA594nE?=
 =?us-ascii?Q?zfRGXbb66XEgCwWIjU/EjrUlBLlaM2mPg17ByzGEWIhFps7M+JLSAKapUFv8?=
 =?us-ascii?Q?kTeDVoQegmxVviVUWXclvWSDODn9Ah0xwKjQ0jU2vLPwrPcHiknxaOKfVoPS?=
 =?us-ascii?Q?LK4MUFKNp+cCzEX5GRqctmWw5F27fc5nRODTJRmswGHTPJFTZ8SXykk29s2d?=
 =?us-ascii?Q?uVHpKhe3kAgUTF8YL99gt0jAYRc230VIZO0TwXuRxeyucpmq9QY7ATt5aQM3?=
 =?us-ascii?Q?SF1y+y9Lc7ab3ABS7njcFa3nklLvTit1cbtkC7UHpqUEX1DvkoAjBt370KQe?=
 =?us-ascii?Q?WnP4G6x1XQi9gAQFYhzbA+Apq7B4WChXJAYzKhGhdJl4tlmS5h2T6S15DYXl?=
 =?us-ascii?Q?F7nn99XaHl5SBy3lfCPoRzs3NVPKG/EH0YbgPeLBKpXXZDPbBtXGWSozfA3o?=
 =?us-ascii?Q?vQMepG4hSF+G+rYQ5reapBYbdOh6p/jy4wR2pMQ+9PrGZyusGw1/GkOl0WOD?=
 =?us-ascii?Q?kLcILRYKmH2wYIpxCfAMjGMjuAQWBKef5yI2MmlB9aQguJwoaKA8Sqmt10Vy?=
 =?us-ascii?Q?O4jbBqzSLwIWGzNqs3hh1aOmFdW6jpIBSYewt4k/I8jX60Eeq4b1T5HimLX2?=
 =?us-ascii?Q?yHkHA0jCCs+VbIm1epoAkgSIjdoPwTVS3/FjftQ3elkbFItHBA24CSCEO2PN?=
 =?us-ascii?Q?lB9IZuYLpQfaLDceEZ/hfhO0u5T1xnyUiXalz92oxEa8Cr+iM9dCKbLslLsz?=
 =?us-ascii?Q?h9VEwUCaCV3C7nx9eZPsfSzxhzpu8ZvUf3htikSWr95HUBaZlVt0d1QapiGS?=
 =?us-ascii?Q?Y66cYbFOfXoiJv8GyJ2iAX0a294hJ4hMjw79X0E6QHsoBrssTm0wobqHE3X6?=
 =?us-ascii?Q?rsvISqX/3aUKNu5oawVMWEZCXLc8MMhm0YhNVm56p2LQgnsYc8F3v8FE/Yul?=
 =?us-ascii?Q?vNuKScsnq7VWCB7NNvsdcG9yDJCjuRp+7Yvfh6Wu3naTtXM2LrpB6zGABdeb?=
 =?us-ascii?Q?41sFszLy6wpdYXijjaXoZqubuaC4bOEd1Hro8k6zdyVEURC6j3d23iScutWu?=
 =?us-ascii?Q?AGjsuAo8gN+vR4SMANISkfnF1vJ0rK0mxL0GjuTVSMaQwK9a8oRvXLRnW8Zi?=
 =?us-ascii?Q?WMxKNja+h9eYAnlwo4KwZA+5YVc1asb2XxEQ8Zw3gg9gzYWblLTHtt4YcUig?=
 =?us-ascii?Q?M0vfS7JXW+Wzy/Sl35B3XBGRidh5baQSj/raXHpszZesnDTRCu0llAJqHU+H?=
 =?us-ascii?Q?wO9iwiS8m3aU/3NMn3rze9HOQckNClXOzdc6wEsa9xxPqtW0AQiwipfQ5Y/O?=
 =?us-ascii?Q?tY1ubKgPXXgy44nkSTInZHMsP12+Ygf8Jgd2F/MGXvsCkH8f79kWTL8iMY9D?=
 =?us-ascii?Q?gaaC6YMkjH8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7053199007)(4053099003)(4013099003)(8096899003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KvUQxkq9SnzzzlXWJ8Kyp1vm83Sxiz6jCZ8lFD4RLiV3lZ7b832Ims73Dz8f?=
 =?us-ascii?Q?Hiww6yfdmTrckOgTUV/pQv70ORC0uPHJBt30uhn0Z3HTexn6cdTigfLhXjst?=
 =?us-ascii?Q?K8sImIqaMUsyqKU+bsBiyRr2dXRbOq0rWHCwYATj0ezPESJlDRK9l8Ng4Gvr?=
 =?us-ascii?Q?6cNyB5yufPutZMDpjiDs96TZjlg4IEqArHCG9PjSDlTAvjeX94ufitwvyYZN?=
 =?us-ascii?Q?AGJVq3rqp1DBcAoK0gp8Sc8b6p3M8L0THRRMj2zMa7BgN9Ywc9f8XuViX/1J?=
 =?us-ascii?Q?2nFml8McgVwAEzr4Qwpen0UsxMNIk18QJUmstzXlwmn9bq/pM8boWm01IZEo?=
 =?us-ascii?Q?R1eD2XEqbz2dsbohYTYQ/TkcFkOv0at1RGg3TAuQCPta7+Pbw/ogvg6Tmly6?=
 =?us-ascii?Q?0Y4K7DJI2wrPcSl40Xcmm+lM2Yeqs8DVdSugMnb8a723gVjuOZrB56YV3aW3?=
 =?us-ascii?Q?Z01Y6UlA+2zJuT1G/vvtvoKjVViU0CfgTXLVYQJiQfRVGzzhQVDze5d87XR8?=
 =?us-ascii?Q?5LuWj/UUG/xOSmGvc+tixFAF7JEzB50i+YJeIERdCg5mifE2VnhCWtRfecWc?=
 =?us-ascii?Q?Xcjb8KJ5GPjzY4YAsgugAck0ENKgb9DGjga8B/Ntufn4/QjSWqlUSYCKfNQx?=
 =?us-ascii?Q?NimFSVeEQjM7jt/4R+kCJNxlhDZ559r2/ytywXuCZQN2lg0jUNX3PJk8kxlJ?=
 =?us-ascii?Q?jbEOCoW4bk8pKxMAAnWm+7HxbCXIenI6PqZsrfiwtqdqzU9UHx4isDD7oAu4?=
 =?us-ascii?Q?isOf1EbNoK6AKg0XEEwc4y7zy0/k79hlNQMJZ2WsWqnGdLteiZT3E5vM4D4J?=
 =?us-ascii?Q?P6cneRBTKSlPH9aVtLaNASdzzzGc8nY0XYhN5ZdLGDGtUEXXKxbRgGiOGUT8?=
 =?us-ascii?Q?/YofG0Ara27CcTpLx2D0H7zVIzxGqpxIvpo8ql/V7PG8QsoZTs08SfM833hS?=
 =?us-ascii?Q?mNrD+gQjdIW2WoakmEmUUSc+e26Wa7zQvsn8Qk2JoIq3JEVLN6t1T58Aqc/3?=
 =?us-ascii?Q?h4+LQMpR2XYfv34hPuj9wKFPBj+d2NiAaw9q/jt9RI1UlM8R2N63lp7BoT7Z?=
 =?us-ascii?Q?PpBtwhXd9YD4BFZkJkUbz7FNH4sMZMMhoGoqQj6hqhedUYOZ6OFUGbIiyBtp?=
 =?us-ascii?Q?BjrJ1sZ4w3RaewVyF3tOc85R9uy9ACAXd37xBIHj+p+orLI0pgGyOPqBW2eS?=
 =?us-ascii?Q?qphXGxDr8q+4B4yzRP1GoLLUTthaTIljmNGTc8dGDBkzSECrPDLFabjqPJKo?=
 =?us-ascii?Q?OYBnTgcK2RkKxInKPrjWWrtVkK76YALSBgTvFm989/BZeSeIwu1NqrpQkt24?=
 =?us-ascii?Q?S8MnjmowzAE5wiBLElBb7QYA4NNAEEYml5oUgZKviBxxvugeXV/CGyMP5dRD?=
 =?us-ascii?Q?50I9rOWbNPexQjlImCoh3F3JU++akEaTu06mgeWmMunw/I2e1kAyYM4x7CeA?=
 =?us-ascii?Q?FT1ec9wjFw2d9w9Z0GM3aO0x4kRcI8Nsx8kFuWoDjJrSAu1mEYeKfC4PKUBn?=
 =?us-ascii?Q?alycIuEVS6bzLx27KNI04dMg+L4R3A41/+3iIJbEDINW3dcsdJiNMLaSmdEr?=
 =?us-ascii?Q?fc0OfIcNvcbNOH22zR0=3D?=
Content-Type: multipart/mixed;
 boundary="_004_FR5P281MB507889A3AEA35D1FD5240DA7872DAFR5P281MB5078DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: avt-nbg.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR5P281MB5078.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4e07b9-84f5-4845-ff8b-08ddd4b06f75
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 06:14:00.5790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: afd236f4-ec47-4463-84a2-069e92c28673
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qFo97oU9Vu3UJ1qM0QziG2P8xzkcr0mfyi2KAowuIavDsEaJv+8eHBUw04qhPf4c+BEZ7I8w8P7b9f9BwBM6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB5244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=avtechnologies.onmicrosoft.com; s=selector2-avtechnologies-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVVg8rBUZdvSh8uhWSef08QYQO9lkB7NF1V1iT5e7yI=;
 b=25tB8Sai4lRfhKzM/7/irDX1jwo+ClAgzdYvYBylz4AJSrWC2i4rgbVf5+R+LDmaiPC+LiB4Tu5+0hZatBP8q/IauBULflBsbdznVhqxBAzeo18BCSsLCSqXXgWM/8zFQ9pLblVSxTauZJVvlxf2Hm5HQ7gcoGPe1iGGowMhRZI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=avt-nbg.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=avtechnologies.onmicrosoft.com
 header.i=@avtechnologies.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-avtechnologies-onmicrosoft-com header.b=25tB8Sai
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=avt-nbg.de;
Subject: Re: [Buildroot] Buildroot with Advantech EIO-IS200-DRIVER
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--_004_FR5P281MB507889A3AEA35D1FD5240DA7872DAFR5P281MB5078DEUP_
Content-Type: multipart/alternative;
	boundary="_000_FR5P281MB507889A3AEA35D1FD5240DA7872DAFR5P281MB5078DEUP_"

--_000_FR5P281MB507889A3AEA35D1FD5240DA7872DAFR5P281MB5078DEUP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

thank you for your assistance!

I've enabled again the loadable module support (CONFIG_MODULES=3Dy), but it=
 seems that the source code (EIO_IS200_DRIVER_SITE =3D $(call github,ADVANT=
ECH-Corp,eio-is200-linux-kernel-driver,$(EIO_IS200_DRIVER_VERSION))) isn't =
downloaded. I think that it must be found in the output/build/buildroot-con=
fig/br2/external folder, but my output/build/buildroot-config/br2/external =
shows only the following directories and header files. All header files (cr=
eated by buildroot?) are empty:
.:
eio  names.h
./eio:
is200
./eio/is200:
driver
./eio/is200/driver:
path.h  version.h

There must be an issue with my configuration, but I can't find it out. The =
folders "buildroot" and "buildroot-external"(attached zip file) are located=
 in the same directory. "buildroot" contains the latest buildroot version. =
I've built it with "make BR2_EXTERNAL=3D../buildroot-external". Please do y=
ou have any idea how to proceed?

Yes, the EIO_IS200_DRIVER should build some kernel modules (thermal, watchd=
og, ...) for a newer Advantech embedded board.

Thank you,
Hans

________________________________
Von: Peter Korsgaard <peter@korsgaard.com>
Gesendet: Dienstag, 5. August 2025 08:04
An: Hans-Heinrich Hansen <hhansen@avt-nbg.de>; buildroot@buildroot.org <bui=
ldroot@buildroot.org>
Betreff: Re: AW: Buildroot with Advantech EIO-IS200-DRIVER

>>>>> "Hans-Heinrich" =3D=3D Hans-Heinrich Hansen <hhansen@avt-nbg.de> writ=
es:

Hello Hans,

Please keep Buildroot discussion on the mailing list, thanks.

 > Hi Peter,
 > my problem is indeed the "out-of-tree kernel module". Btw. I've tried
 > it with loadable module support enabled and disabled.

You will need to enable modules support in your kernel in order to build
and load external modules.

 > It seems that the eio-is200 is not used by the buildroot process.
 > I've followed the buildroot instructions. I'm sure that I've made a
 > mistake. Please can you check my attached configuraton files?

For reference, the custom package is:

###########################################################################=
#####
#
# eio_is200_driver
#
###########################################################################=
#####

EIO_IS200_DRIVER_VERSION =3D 082e737c59aa92bba2c29db46a06cdd0e5beb600
EIO_IS200_DRIVER_DEPENDENCIES =3D linux
EIO_IS200_DRIVER_SITE =3D $(call github,ADVANTECH-Corp,eio-is200-linux-kern=
el-driver,$(EIO_IS200_DRIVER_VERSION))
EIO_IS200_DRIVER_LICENSE =3D GPL-2.0
EIO_IS200_DRIVER_LICENSE_FILES =3D COPYING

$(eval $(kernel-module))
$(eval $(generic-package))

Which looks sensible to me (didn't check the details of the upstream
eio-is100-linux-kernel-driver Makefiles). Does it build some kernel
modules? What happens if you modprobe/insmod them?

--
Bye, Peter Korsgaard

--_000_FR5P281MB507889A3AEA35D1FD5240DA7872DAFR5P281MB5078DEUP_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hello Peter,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
thank you for your assistance!</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">I've enabled again the loadable module sup=
port (<b>CONFIG_MODULES=3Dy</b>), but it seems that the source code (</span=
><span style=3D"font-size: 11pt;">EIO_IS200_DRIVER_SITE =3D $(call github,A=
DVANTECH-Corp,eio-is200-linux-kernel-driver,$(EIO_IS200_DRIVER_VERSION))</s=
pan><span style=3D"font-size: 12pt;">)
 isn't downloaded. I think that it must be found in the <b>output/build/bui=
ldroot-config/br2/external</b>&nbsp;folder, but my
<b>output/build/buildroot-config/br2/external</b>&nbsp;shows only the follo=
wing directories and header files. All
<b>header files</b>&nbsp;(created by buildroot?) are empty:</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
.:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
eio &nbsp;<b>names.h</b></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
./eio:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
is200</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
./eio/is200:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
driver</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
./eio/is200/driver:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<b>path.h &nbsp;version.h</b></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
There must be an issue with my configuration, but I can't find it out. <spa=
n style=3D"color: black;">
The folders &quot;buildroot&quot; and &quot;buildroot-external&quot;(attach=
ed zip file) are located in the same directory. &quot;buildroot&quot; conta=
ins the latest buildroot version. I've built it with &quot;make BR2_EXTERNA=
L=3D../buildroot-external&quot;. Please do you have any idea how to proceed=
?</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);" class=3D"elementToPro=
of">
<span style=3D"font-size: 12pt;">Yes, the </span><span style=3D"font-size: =
11pt;">EIO_IS200_DRIVER should build some kernel modules (thermal, watchdog=
, ...) for a newer Advantech embedded board.</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thank you,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hans</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> Peter Korsgaard &lt;pe=
ter@korsgaard.com&gt;<br>
<b>Gesendet:</b> Dienstag, 5. August 2025 08:04<br>
<b>An:</b> Hans-Heinrich Hansen &lt;hhansen@avt-nbg.de&gt;; buildroot@build=
root.org &lt;buildroot@buildroot.org&gt;<br>
<b>Betreff:</b> Re: AW: Buildroot with Advantech EIO-IS200-DRIVER</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">&gt;&gt;&gt;&gt;&gt; &quot;Hans-Heinrich&quot; =3D=
=3D Hans-Heinrich Hansen &lt;hhansen@avt-nbg.de&gt; writes:<br>
<br>
Hello Hans,<br>
<br>
Please keep Buildroot discussion on the mailing list, thanks.<br>
<br>
&nbsp;&gt; Hi Peter,<br>
&nbsp;&gt; my problem is indeed the &quot;out-of-tree kernel module&quot;. =
Btw. I've tried<br>
&nbsp;&gt; it with loadable module support enabled and disabled.<br>
<br>
You will need to enable modules support in your kernel in order to build<br=
>
and load external modules.<br>
<br>
&nbsp;&gt; It seems that the eio-is200 is not used by the buildroot process=
.<br>
&nbsp;&gt; I've followed the buildroot instructions. I'm sure that I've mad=
e a<br>
&nbsp;&gt; mistake. Please can you check my attached configuraton files?<br=
>
<br>
For reference, the custom package is:<br>
<br>
###########################################################################=
#####<br>
#<br>
# eio_is200_driver<br>
#<br>
###########################################################################=
#####<br>
<br>
EIO_IS200_DRIVER_VERSION =3D 082e737c59aa92bba2c29db46a06cdd0e5beb600<br>
EIO_IS200_DRIVER_DEPENDENCIES =3D linux<br>
EIO_IS200_DRIVER_SITE =3D $(call github,ADVANTECH-Corp,eio-is200-linux-kern=
el-driver,$(EIO_IS200_DRIVER_VERSION))<br>
EIO_IS200_DRIVER_LICENSE =3D GPL-2.0<br>
EIO_IS200_DRIVER_LICENSE_FILES =3D COPYING<br>
<br>
$(eval $(kernel-module))<br>
$(eval $(generic-package))<br>
<br>
Which looks sensible to me (didn't check the details of the upstream<br>
eio-is100-linux-kernel-driver Makefiles). Does it build some kernel<br>
modules? What happens if you modprobe/insmod them?<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</div>
</span></font></div>
</body>
</html>

--_000_FR5P281MB507889A3AEA35D1FD5240DA7872DAFR5P281MB5078DEUP_--

--_004_FR5P281MB507889A3AEA35D1FD5240DA7872DAFR5P281MB5078DEUP_
Content-Type: application/x-zip-compressed; name="buildroot-external.zip"
Content-Description: buildroot-external.zip
Content-Disposition: attachment; filename="buildroot-external.zip"; size=3650;
	creation-date="Wed, 06 Aug 2025 06:03:15 GMT";
	modification-date="Wed, 06 Aug 2025 06:03:56 GMT"
Content-Transfer-Encoding: base64

UEsDBBQAAAAAADY1BVsAAAAAAAAAAAAAAAATACAAYnVpbGRyb290LWV4dGVybmFsL3V4CwABBAAA
AAAEAAAAAFVUDQAHiYuRaN2LkWgii5FoUEsDBBQACAAIAHNlBFsAAAAAAAAAAAAAAAAcACAAYnVp
bGRyb290LWV4dGVybmFsL0NvbmZpZy5pbnV4CwABBAAAAAAEAAAAAFVUDQAH2o6QaDeLkWgji5Fo
K84vLUpOVVBScQoyineNCHEN8nP0iXf19I/3DDYyMIh3CfIMcw2KD3AM8dAvSEzOTkxP1U/NzI/P
LAbJphRllqUW6Tvn56Vlputl5ikBAFBLBwiR9TbuTwAAAE8AAABQSwMEFAAIAAgAvE3yWgAAAAAA
AAAAAAAAACAAIABidWlsZHJvb3QtZXh0ZXJuYWwvZXh0ZXJuYWwuZGVzY3V4CwABBAAAAAAEAAAA
AFVUDQAHtPt5aDeLkWgji5Foy0vMTbVScPX0j/cMNjIwiHcJ8gxzDeJKSS1OBgsrgIUVoMIAUEsH
CD334HYkAAAALgAAAFBLAwQUAAgACADuTvBaAAAAAAAAAAAAAAAAHgAgAGJ1aWxkcm9vdC1leHRl
cm5hbC9leHRlcm5hbC5ta3V4CwABBAAAAAAEAAAAAFVUDQAH8Vp3aCOLkWgji5Foy8xLzilNSVVQ
0SjOLyoBUuWZOSnJiUUpQKZTkFG8a0SIa5Cfo0+8q6d/vGewkYFBvEuQZ5hrUHyAY4iHpn5BYnJ2
Ynqqvpa+ll5utqYmAFBLBwhTF9IMTwAAAFAAAABQSwMEFAAAAAAA52QEWwAAAAAAAAAAAAAAABkA
IABidWlsZHJvb3QtZXh0ZXJuYWwvbGludXgvdXgLAAEEAAAAAAQAAAAAVVQNAAfSjZBo3YuRaCOL
kWhQSwMEFAAIAAgA3GQEWwAAAAAAAAAAAAAAACYAIABidWlsZHJvb3QtZXh0ZXJuYWwvbGludXgv
Q29uZmlnLmV4dC5pbnV4CwABBAAAAAAEAAAAAFVUDQAHwY2QaCOLkWgji5FoS87PS8tMV3AKMor3
8fQLjYj3dg3yc/WJd40IiXf19I/3DDYyMIh3CfIMcw3i4kxJTYtPys/PUVBKzcyPzywGyaUUZZal
FimBJRNLc0oUKrk4M1JzCrg4FRSAJiiATVCAmgAAUEsHCJPSGl1jAAAAbwAAAFBLAwQUAAgACABz
ZQRbAAAAAAAAAAAAAAAALAAgAGJ1aWxkcm9vdC1leHRlcm5hbC9saW51eC9laW9faXMyMDBfZHJp
dmVyLm1rdXgLAAEEAAAAAAQAAAAAVVQNAAfajpBoI4uRaCOLkWitkMFrgzAYxe/+FUI9WGZGyFZb
Dz0UzbqARKmutKeQxOBCMy1ulv35i7bs4nbrF77L9x7v/chsdt9x7HOVbpn+RBCyqtMX1Q3He/c4
KaFvB4YPJaYFyWjhPqynxQ4mGSPFcEl2ZI93zO5gd9cuXCG1fFrKRcR5hITgSKKoEs8hh6GsKqgW
QokQwmlGgnNME0xjggsbZHTTf09dBSmxVT1fcmPcWn+99yLYJPsNLXH8CuK2OwcWGIzAYAwBJ9U1
yoArfeD5/+HP59O+lMT2K4bKbZ4C9PgH+M3CXkg6ksdZfiR06ziery7cWNYbwEdb9UbZll+hVo3q
tARnLk+8HqQfUEsHCGZM0MMAAQAAOwIAAFBLAwQUAAgACABGZQRbAAAAAAAAAAAAAAAAIAAgAGJ1
aWxkcm9vdC1leHRlcm5hbC9saW51eC9LY29uZmlndXgLAAEEAAAAAAQAAAAAVVQNAAeFjpBoI4uR
aCOLkWhz9fSP9ww2MjCIdwnyDHMNivd29vdz83SPd/P0cVWwVVDRcAoyineNCHEN8nP0iXdFVx7g
GOKhqV+QmJydmJ6qn5qZH59ZDJJOKcosSy3Sd87PS8tM18vM4wIAUEsHCEgPJzNbAAAAaQAAAFBL
AwQUAAAAAAA6ZQRbAAAAAAAAAAAAAAAAGwAgAGJ1aWxkcm9vdC1leHRlcm5hbC9wYWNrYWdlL3V4
CwABBAAAAAAEAAAAAFVUDQAHcI6QaN2LkWgji5FoUEsDBBQAAAAAAExlBFsAAAAAAAAAAAAAAAAs
ACAAYnVpbGRyb290LWV4dGVybmFsL3BhY2thZ2UvZWlvX2lzMjAwX2RyaXZlci91eAsAAQQAAAAA
BAAAAABVVA0AB5GOkGjdi5FoI4uRaFBLAwQUAAgACABGZQRbAAAAAAAAAAAAAAAANQAgAGJ1aWxk
cm9vdC1leHRlcm5hbC9wYWNrYWdlL2Vpb19pczIwMF9kcml2ZXIvQ29uZmlnLmludXgLAAEEAAAA
AAQAAAAAVVQNAAeFjpBoI4uRaCOLkWhFjrEOgjAURWf4ioa9ljC6VWi0gaApStwagQKNtW2gGP17
BWLcXu69OefVRreyAzsW8ROOU7wnnNAjp0UUhjyj+eXKE0ZLwgrfa0TLK2MUCIQ0XI7zpBnkUwzB
Ut4m5cB7Pq3QzQiMXrgrJSUsJ5nv9UJZ3wPgb/nx57R3zo5bhDrp+qna1OaBcFLi/EziA4zNYNFX
DRc1VFJPL3gXgxYKrn/MiA9QSwcIf7RWe6UAAADSAAAAUEsDBBQACAAIAFJlBFsAAAAAAAAAAAAA
AAA/ACAAYnVpbGRyb290LWV4dGVybmFsL3BhY2thZ2UvZWlvX2lzMjAwX2RyaXZlci9laW9faXMy
MDBfZHJpdmVyLm1rdXgLAAEEAAAAAAQAAAAAVVQNAAedjpBoI4uRaCOLkWitkMFrgzAUxu/+FUI9
WDAlZKudhx1KzLqARKmlsJMk8WFDMy1ulv35i67s4nbrC++S7/F9P77F4r7jueeD6SrzQTCu6t5c
oR8/753jMZ5XvBxD0j0/sn3ltuS58J99/ERg87DR60TKhCgliSZJrR5jiWNd1xjWClSM8dwjZQUT
KROUs9IZWdMOX/Orkh+YU4NQS2v9xnyeBhVt0+NWHBh9RbTrL5HrAE0doMkEnaFvwaKfQqIg/A9/
uZznZZwyUY6RuyJDZPUH+O2keuHZRE7z4o2LnecFIVyldaw3gPeuHiy4lF+hgRZ6o9FF6rNsRukb
UEsHCOwMivjxAAAAFQIAAFBLAQIUAxQAAAAAADY1BVsAAAAAAAAAAAAAAAATABgAAAAAAAAAAAD/
QQAAAABidWlsZHJvb3QtZXh0ZXJuYWwvdXgLAAEEAAAAAAQAAAAAVVQFAAGJi5FoUEsBAhQDFAAI
AAgAc2UEW5H1Nu5PAAAATwAAABwAGAAAAAAAAAAAALaBUQAAAGJ1aWxkcm9vdC1leHRlcm5hbC9D
b25maWcuaW51eAsAAQQAAAAABAAAAABVVAUAAdqOkGhQSwECFAMUAAgACAC8TfJaPffgdiQAAAAu
AAAAIAAYAAAAAAAAAAAAtoEKAQAAYnVpbGRyb290LWV4dGVybmFsL2V4dGVybmFsLmRlc2N1eAsA
AQQAAAAABAAAAABVVAUAAbT7eWhQSwECFAMUAAgACADuTvBaUxfSDE8AAABQAAAAHgAYAAAAAAAA
AAAAtoGcAQAAYnVpbGRyb290LWV4dGVybmFsL2V4dGVybmFsLm1rdXgLAAEEAAAAAAQAAAAAVVQF
AAHxWndoUEsBAhQDFAAAAAAA52QEWwAAAAAAAAAAAAAAABkAGAAAAAAAAAAAAP9BVwIAAGJ1aWxk
cm9vdC1leHRlcm5hbC9saW51eC91eAsAAQQAAAAABAAAAABVVAUAAdKNkGhQSwECFAMUAAgACADc
ZARbk9IaXWMAAABvAAAAJgAYAAAAAAAAAAAAtoGuAgAAYnVpbGRyb290LWV4dGVybmFsL2xpbnV4
L0NvbmZpZy5leHQuaW51eAsAAQQAAAAABAAAAABVVAUAAcGNkGhQSwECFAMUAAgACABzZQRbZkzQ
wwABAAA7AgAALAAYAAAAAAAAAAAAtoGFAwAAYnVpbGRyb290LWV4dGVybmFsL2xpbnV4L2Vpb19p
czIwMF9kcml2ZXIubWt1eAsAAQQAAAAABAAAAABVVAUAAdqOkGhQSwECFAMUAAgACABGZQRbSA8n
M1sAAABpAAAAIAAYAAAAAAAAAAAAtoH/BAAAYnVpbGRyb290LWV4dGVybmFsL2xpbnV4L0tjb25m
aWd1eAsAAQQAAAAABAAAAABVVAUAAYWOkGhQSwECFAMUAAAAAAA6ZQRbAAAAAAAAAAAAAAAAGwAY
AAAAAAAAAAAA/0HIBQAAYnVpbGRyb290LWV4dGVybmFsL3BhY2thZ2UvdXgLAAEEAAAAAAQAAAAA
VVQFAAFwjpBoUEsBAhQDFAAAAAAATGUEWwAAAAAAAAAAAAAAACwAGAAAAAAAAAAAAP9BIQYAAGJ1
aWxkcm9vdC1leHRlcm5hbC9wYWNrYWdlL2Vpb19pczIwMF9kcml2ZXIvdXgLAAEEAAAAAAQAAAAA
VVQFAAGRjpBoUEsBAhQDFAAIAAgARmUEW3+0VnulAAAA0gAAADUAGAAAAAAAAAAAALaBiwYAAGJ1
aWxkcm9vdC1leHRlcm5hbC9wYWNrYWdlL2Vpb19pczIwMF9kcml2ZXIvQ29uZmlnLmludXgLAAEE
AAAAAAQAAAAAVVQFAAGFjpBoUEsBAhQDFAAIAAgAUmUEW+wMivjxAAAAFQIAAD8AGAAAAAAAAAAA
ALaBswcAAGJ1aWxkcm9vdC1leHRlcm5hbC9wYWNrYWdlL2Vpb19pczIwMF9kcml2ZXIvZWlvX2lz
MjAwX2RyaXZlci5ta3V4CwABBAAAAAAEAAAAAFVUBQABnY6QaFBLBQYAAAAADAAMAPsEAAAxCQAA
AAA=

--_004_FR5P281MB507889A3AEA35D1FD5240DA7872DAFR5P281MB5078DEUP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_004_FR5P281MB507889A3AEA35D1FD5240DA7872DAFR5P281MB5078DEUP_--
