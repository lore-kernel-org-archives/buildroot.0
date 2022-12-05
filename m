Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AABC4332F
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 15:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FB0440117;
	Mon,  5 Dec 2022 15:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB0440117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r1Q9p-R4LnXk; Mon,  5 Dec 2022 15:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F31640126;
	Mon,  5 Dec 2022 15:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F31640126
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7787D1BF424
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 15:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 134BD81D65
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 15:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 134BD81D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_ZHsqVTN1g6 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 15:48:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60F0E818C0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60F0E818C0
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 15:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDdjpd9PdMRSQCxc6MyRtOa4yLfhW2FGl3MwjGddI0gYEpZW6EUZiFYXYagvBiLtai8e9ox84InaeHWroUhHnbQVeQUbZxPDAcA1sH3JfqmimEPTKAEAfDfTFQ4wo5WUj8XJbKAJGd54eO7jmpX6ECoIQQFPyU67GM5hgR5kirnOi4Ldncb1Vt5oX4ycQSEW0SoAfjomWstBc3keIDU/WaBAq6d7rsL+a6k5XYQBPGuMOeEDf3XHw2zJjcY14YBqGdQ0iLdxDs0mb13mbcsErD6VzI+jxY7aK8SCm9ovccAxsx1sO0p0iJ7gPogAAQ+V88EU0c6q07OMWgd0gYlyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LL4WxYbNuwM9K5PwIU5rSwIljywzXBtch0diO1OK4I=;
 b=U5qvUvTiuNYeY2AJNIJwtxCIsYAIwxCTNMzEpYk/4YhKvU4QjvwLvK8bI9JnxHksy6PdSbYVKEEdmcHVjDkv4Z5BhGyExuaCdF7m0TdmaqzQ0kIYchqHsbymVXD6DvCdXNGxmrYKzMyqir73ci32lRGDHIJUnfXFUVljMXz6hwjIHBvIXBXPCIU7Vgnuic+avGqvDzF9WW0xKeWoFlbmEnyz2l+r+08OSFSzWeYuamUNQxSCDze/4VJzDC3CGg1HbvQn2idcKtzPlzQ1vF2Q+vDb9qIZWIcTejfY/XP3+KZ5uZ5LxoxsdTNtQX8HUSkDCY6TWtyKbckPS9OzA6WsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=orolia.com; dmarc=pass action=none header.from=orolia.com;
 dkim=pass header.d=orolia.com; arc=none
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4bf::21)
 by DU0P251MB0890.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3ca::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 5 Dec
 2022 15:48:16 +0000
Received: from AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::4886:9896:ef53:3d21]) by AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
 ([fe80::4886:9896:ef53:3d21%4]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 15:48:16 +0000
From: Nicolas Carrier <Nicolas.Carrier@orolia.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v3 1/1] package/shadow: new package
Thread-Index: AQHY3yHdMcxLwNGs8kaCEB78orb/0q5fwqIV
Date: Mon, 5 Dec 2022 15:48:16 +0000
Message-ID: <AS4P251MB0612963F6AA6FEE7CE98A96084189@AS4P251MB0612.EURP251.PROD.OUTLOOK.COM>
References: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
 <20221013163432.18545-1-raphael.pavlidis@gmail.com>
In-Reply-To: <20221013163432.18545-1-raphael.pavlidis@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P251MB0612:EE_|DU0P251MB0890:EE_
x-ms-office365-filtering-correlation-id: fdcd5734-e20d-46a3-4539-08dad6d8200c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VKqis1EwigSqwAqEjzksjC37e0e3VBaWphIecGtTPrxhv0ntLfNe9Df9AGVrQjewzFssVCYBnSDutxpjbL1QXnH9LlAJc/FFlq+Plyw6Yw0Msgi8/HS65M41i9j/lcIzYVmMrEY6Fe1AX455vQ9fUTslyRKynYk7JK/OSTHkuzUlDQTmjn7PEIlFKklk2ooYwg4gL/2AqKmi3Za/EfjS2WEENZvkqeg4CgbhgZp52LsvUh3l2DgeMM6zk+i8Pn1JirB1A4N7e8aM7gmzp8sYd4LUYOjWBwLL2kKJXE9fv3YBY43kzI+rvVP/Dzj9+TrCSzec2/ZIaYIeiyuR6bTs+acfEIpx9jhvYrbPxM6WA5Jyop/nPzm95IiYvqfzWnbxv4hlc4vQr1QuUU5izfRVdHiTUyG1UmPK2xAmXJNFVkAi8ho76H7rKdcY0zT1M6vMUBRp2ynqvJWvnbXBPDoeSYVP8YBk8ExoajS5ZbR1pPKnt5QcPIRjsA+9rotgUd3fqnS6OlSvrnRYa/dRtLhgSLD35somqkb+/LgFMVruEAXbxpBqt5ZI+/NleQb8/4KKKAY2r5YfR7SP272yMkzrpCoZJP41rbbZ1Dkf/vcIBcmnvfSKOGozfF0/TuMpmFUMTf3eTgVer+oR9nPdN9NjisNDewcFOfZTg6LAz83auBJDEcJiPm/T7rPea7VZabIUPsN+gMeJ0XavScVW/7ElR8RbuERfCvesYjLMrkmdVqcw+Vp8UIoK0e+v+f6iezjIENPzN402PYt1tkURB8UruizVDD8gZM2dfmZswury6UbnlnTEILbM3uCXWTwnCNgYVDFLcaQXNTANx2K8uD4lbA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4P251MB0612.EURP251.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39840400004)(366004)(396003)(376002)(451199015)(66899015)(38100700002)(86362001)(2906002)(41300700001)(8936002)(4326008)(5660300002)(38070700005)(122000001)(83380400001)(33656002)(66946007)(478600001)(66476007)(91956017)(66446008)(966005)(66556008)(316002)(54906003)(110136005)(71200400001)(55016003)(76116006)(8676002)(52536014)(64756008)(6506007)(186003)(9686003)(7696005)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rKRrlMZ2YSqMmwIDRqtmO2iH67+Os3uq44v/4DjJ5OulAY8ZHfK6mF4unk?=
 =?iso-8859-1?Q?qFsGLTgQYYGqi1JVfO6yKbAyZ1xOJDNeIWUghNg3XIqyf+TuXlEdpe1hpE?=
 =?iso-8859-1?Q?7Ivg0VB9wJlV3AVjCi5Bo/hJcPfSgRpTxBZ/SYrXGPgw+fahrte5ydg2sd?=
 =?iso-8859-1?Q?SjwcCxtlXAR/4bYJAaPtDdSC8m3xuMQmFLMgo4ra0VGbSl3D3El+rTKc4Z?=
 =?iso-8859-1?Q?QDM9k+LNS0qpx66hR3QBEzQ7+XgVud1R6Fow1CPizxUBp/2dwfSeMbw/T/?=
 =?iso-8859-1?Q?VSAs+zRSp3CbUAxSOeD4ZP3RaXRycrpQ+EwQUtaDp/owReb3uRmfdgjnOq?=
 =?iso-8859-1?Q?0IBFVNfsvCURi+iBQCDWQHn2Dc+sjqpT5sGoyeuYi+bKGyW37x54ZyQgEh?=
 =?iso-8859-1?Q?/BKqLTm9dB2vmLiY6D6dddh3zDkaDYmz+ajSbqQ3AixDIy0qYe5VJ6fOi9?=
 =?iso-8859-1?Q?CHAE4Cd1pfoUdSOnyn15uI8qzbUjog+ZF/fbRKeGclxhIah0WhWnsRAMZh?=
 =?iso-8859-1?Q?zxc/IuTfF524EgUbHBJ0ZT5MxDHgAQRsKfQso1MfOVsZgYRrTELAUH0+D6?=
 =?iso-8859-1?Q?vsNwHk2VCxJzBegk6IqW1C2ZB2AwQC0+a81Cdvcx/XHZ1hKTD4cXLNHHZO?=
 =?iso-8859-1?Q?1WyZWeJt6GzoSC49zPQrRI2wXNnubojK1OaZCyphZ6F+P0A2qCSlTh5Fe4?=
 =?iso-8859-1?Q?y6qvwrlPHWT/KYQOkQvV3vHSkWXfsehoiOpzd1cluUnPhAzyBw2QUl/NdF?=
 =?iso-8859-1?Q?5VZcEMJS6s6OUPHUqFf64XzR1ZaTBvzWI2sGzCR4alYr51sttQMWUbG6cq?=
 =?iso-8859-1?Q?lWXy+A/w0k8sfGugoRcyC9VryJpQ7iGhwmjLBUf2HxjYsQ72kgXuStHiDQ?=
 =?iso-8859-1?Q?ZIVX0gJNpohc6yNphait58nmkDQOVzZ/2fPny05hxzyRzsl1va4c11bjpj?=
 =?iso-8859-1?Q?2aeIRm0ggJBtBIsKdxqVlvDohmc/F+h7zZvuCI9bSjwDjXb7DjlciJ88x+?=
 =?iso-8859-1?Q?nrFnosPNL+XNT/fuUVKNcU57rWbSL+zPYmr/JC8gkQfz0odsjIF+m4c9y6?=
 =?iso-8859-1?Q?PlUWF0jImgOvgNY41cw3/ZcX/3dSfEObwlz6Drk6LKrJ//MUKvdDCs7FdF?=
 =?iso-8859-1?Q?YhSbfi5uA6wIvpBES8xd1CiqXsMISR1u81GsW/B+o3VCw+kJsPj4qUys1f?=
 =?iso-8859-1?Q?lP6cBEnEM7VKriemjfWupEfdrAVuiI/SiV6wNDJiul1LidSh9SiPh5e/2G?=
 =?iso-8859-1?Q?2zbPMKjVrzfGgQdC7ShzJ+aEQB5f4/VxxupPLyxLLIw2Jih+hN2sGiCiVE?=
 =?iso-8859-1?Q?p5ke7JSAS/I8IP3HK1sGP6E0i9HsyAyM3poWhoG5UjaiMo7Ms0UYQVTkS5?=
 =?iso-8859-1?Q?2ABR7DXiK70EV98z+7bFYO8oSQnGB9KQVpRt6m215Us9oFHkzXxYoKNg2q?=
 =?iso-8859-1?Q?emAmuD6Ke5OoQyHe9NTwNFd62lJGJSUKPwilR30WUA0oHHv7aeVDv+23rx?=
 =?iso-8859-1?Q?ReJvejTus5iymwjtnTVJPgfF00v2MnqAEGqWDOdt5hkhtUL6VqilEtUhhB?=
 =?iso-8859-1?Q?fXDB4WGH6huo1uixStrBDhAhr5DHjLEa1NZHWPylNFd0I21UJe91YhUHMM?=
 =?iso-8859-1?Q?IqRbX8PMs1qYbAKI4UpetfoS5YKEMjoMgG0AB42GXXZQxX1gpVV41jSPLq?=
 =?iso-8859-1?Q?gbocR6QiR89IoZM6Fs+DFgaFWvhH83JjrZZIAji4?=
MIME-Version: 1.0
X-OriginatorOrg: orolia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P251MB0612.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcd5734-e20d-46a3-4539-08dad6d8200c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 15:48:16.4677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a263030c-9c1b-421f-9471-1dec0b29c664
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wta3q7szz7JgvMu4hekLR5u+udPrZCP7e+pgm95NbZOM4v4h+GqGNg9e+Pz3/hseWbFgjmkpLQPbv/vix/UbyNV6EAtE5sqYCkQFJgHT4BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P251MB0890
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orolia.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LL4WxYbNuwM9K5PwIU5rSwIljywzXBtch0diO1OK4I=;
 b=UhirKge6au8nsOXKbvEzOXzx4v5UfTUGBemmJApy6Oj8iT/zJc7j6KkxBiDKOz+r82fgrgzNJ6dySSxw8JfcuvhIG+I1Y02xHmth/RTX/R/eGZPkzVoiF6y2zLfAlnFTFrJc2vOqSvRvRkM0MYhdQkp0mc98T7Sl9M3ICoIvnhE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=orolia.com header.i=@orolia.com header.a=rsa-sha256
 header.s=selector1 header.b=UhirKge6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=orolia.com;
Subject: Re: [Buildroot] [PATCH v3 1/1] package/shadow: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I tested it with a basic config (in fact, a draft unit test) and it compile=
s fine and the commands I tested worked fine.

Tested-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Approved-by: Nicolas Carrier <nicolas.carrier@orolia.com>


Nicolas Carrier | Software Developer | nicolas.carrier@orolia.com


De : buildroot <buildroot-bounces@buildroot.org> de la part de Raphael Pavl=
idis <raphael.pavlidis@gmail.com>
Envoy=E9 : jeudi 13 octobre 2022 18:34
=C0 : buildroot@buildroot.org <buildroot@buildroot.org>
Cc=A0: Raphael Pavlidis <raphael.pavlidis@gmail.com>; Yann E . MORIN <yann.=
morin.1998@free.fr>; Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Objet : [Buildroot] [PATCH v3 1/1] package/shadow: new package =

=A0
CAUTION: This email originated from outside of the organization.
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

shadow provides utilities to deal with user accounts.

The shadow package includes the necessary programs for converting UNIX
password files to the shadow password format, plus programs for managing
user and group accounts. Especially it is useful if rootless podman
container should be used, which requires newuidmap and newgidmap.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
Changes v2 -> v3:
- remove nscd support
- remove sssd support
- remove group name max length parameter
- remove su build
- improve help text of subordinate-ids
- use a define instead of variable for SHADOW_ACCOUNT_TOOLS_SETUID
 =A0SHADOW_SUBORDINATE_IDS_PERMISSIONS and

Changes v1 -> v2:
- DEVELOPERS: add Raphael Pavlids for shadow

=A0DEVELOPERS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 3 +-
=A0package/Config.in =A0 =A0 =A0 =A0 =A0| =A0 1 +
=A0package/shadow/Config.in =A0 | =A061 +++++++++++++++++
=A0package/shadow/shadow.hash | =A0 3 +
=A0package/shadow/shadow.mk =A0 | 133 +++++++++++++++++++++++++++++++++++++
=A05 files changed, 200 insertions(+), 1 deletion(-)
=A0create mode 100644 package/shadow/Config.in
=A0create mode 100644 package/shadow/shadow.hash
=A0create mode 100644 package/shadow/shadow.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 59121c6a54..0dad0ba0ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2474,7 +2474,8 @@ F: =A0 =A0 =A0 =A0support/testing/tests/package/test_=
python_jmespath.py
=A0F: =A0 =A0 support/testing/tests/package/test_python_rsa.py
=A0F: =A0 =A0 support/testing/tests/package/test_python_s3transfer.py

-N: =A0 =A0 Raphael Pavlidis <raphael.pavlidis@googlemail.com>
+N: =A0 =A0 Raphael Pavlidis <raphael.pavlidis@gmail.com>
+F: =A0 =A0 package/shadow/
=A0F: =A0 =A0 package/slirp4netns/

=A0N: =A0 =A0 Refik Tuzakli <tuzakli.refik@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..d9ead48647 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2642,6 +2642,7 @@ menu "System tools"
 =A0 =A0 =A0 =A0source "package/sdbus-cpp/Config.in"
 =A0 =A0 =A0 =A0source "package/sdbusplus/Config.in"
 =A0 =A0 =A0 =A0source "package/seatd/Config.in"
+ =A0 =A0 =A0 source "package/shadow/Config.in"
 =A0 =A0 =A0 =A0source "package/smack/Config.in"
 =A0 =A0 =A0 =A0source "package/start-stop-daemon/Config.in"
 =A0 =A0 =A0 =A0source "package/supervisor/Config.in"
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
new file mode 100644
index 0000000000..6b1fe0a61f
--- /dev/null
+++ b/package/shadow/Config.in
@@ -0,0 +1,61 @@
+menuconfig BR2_PACKAGE_SHADOW
+ =A0 =A0 =A0 bool "shadow"
+ =A0 =A0 =A0 depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+ =A0 =A0 =A0 help
+ =A0 =A0 =A0 =A0 Utilities to deal with user accounts.
+
+ =A0 =A0 =A0 =A0 https://github.com/shadow-maint/shadow
+
+if BR2_PACKAGE_SHADOW
+
+config BR2_PACKAGE_SHADOW_SHADOWGRP
+ =A0 =A0 =A0 bool "shadowgrp"
+ =A0 =A0 =A0 help
+ =A0 =A0 =A0 =A0 Enable shadow group support.
+
+config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
+ =A0 =A0 =A0 bool "account-tools-setuid"
+ =A0 =A0 =A0 depends on BR2_USE_MMU =A0# linux-pam
+ =A0 =A0 =A0 depends on BR2_ENABLE_LOCALE =A0# linux-pam
+ =A0 =A0 =A0 depends on BR2_USE_WCHAR =A0# linux-pam
+ =A0 =A0 =A0 depends on !BR2_STATIC_LIBS =A0# linux-pam
+ =A0 =A0 =A0 select BR2_PACKAGE_LINUX_PAM
+ =A0 =A0 =A0 help
+ =A0 =A0 =A0 =A0 Install the user and group management tools (e.g. groupad=
d) with setuid and
+ =A0 =A0 =A0 =A0 authenticate the callers via PAM.
+
+comment "account-tools-setuid needs a toolchain w/ shared libs, wchar, loc=
ale"
+ =A0 =A0 =A0 depends on BR2_USE_MMU
+ =A0 =A0 =A0 depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_ENABLE_L=
OCALE
+
+config BR2_PACKAGE_SHADOW_UTMPX
+ =A0 =A0 =A0 bool "utmpx"
+ =A0 =A0 =A0 help
+ =A0 =A0 =A0 =A0 Enable loggin in utmpx / wtmpx.
+
+config BR2_PACKAGE_SHADOW_SUBORDINATE_IDS
+ =A0 =A0 =A0 bool "subordinate-ids"
+ =A0 =A0 =A0 help
+ =A0 =A0 =A0 =A0 Support subordinate ids. Helpful to use container solutio=
n like podman
+ =A0 =A0 =A0 =A0 without root.
+
+config BR2_PACKAGE_SHADOW_SHA_CRYPT
+ =A0 =A0 =A0 bool "sha-crypt"
+ =A0 =A0 =A0 default y
+ =A0 =A0 =A0 help
+ =A0 =A0 =A0 =A0 Allow the SHA256 and SHA512 password encryption algorithm=
s.
+
+config BR2_PACKAGE_SHADOW_BCRYPT
+ =A0 =A0 =A0 bool "bcrypt"
+ =A0 =A0 =A0 help
+ =A0 =A0 =A0 =A0 Allow the bcrypt password encryption algorithm.
+
+config BR2_PACKAGE_SHADOW_YESCRYPT
+ =A0 =A0 =A0 bool "yescrypt"
+ =A0 =A0 =A0 help
+ =A0 =A0 =A0 =A0 Allow the yescrypt password encryption algorithm.
+
+endif # BR2_PACKAGE_SHADOW
+
+comment "shadow needs a toolchain w/ headers >=3D 4.14"
+ =A0 =A0 =A0 depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
new file mode 100644
index 0000000000..6b9faac10f
--- /dev/null
+++ b/package/shadow/shadow.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 =A041f093ce58b2ae5f389a1c5553e0c18bc73e6fe27f66273891991198a7707c95=
 =A0shadow-4.11.1.tar.xz
+sha256 =A03d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a=
 =A0COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
new file mode 100644
index 0000000000..261f28dd28
--- /dev/null
+++ b/package/shadow/shadow.mk
@@ -0,0 +1,133 @@
+##########################################################################=
######
+#
+# shadow
+#
+##########################################################################=
######
+
+SHADOW_VERSION =3D 4.11.1
+SHADOW_SITE =3D https://github.com/shadow-maint/shadow/releases/download/v=
$(SHADOW_VERSION)
+SHADOW_SOURCE =3D shadow-$(SHADOW_VERSION).tar.xz
+SHADOW_LICENSE =3D BSD-3-Clause
+SHADOW_LICENSE_FILES =3D COPYING
+
+SHADOW_CONF_OPTS =3D \
+ =A0 =A0 =A0 --disable-man \
+ =A0 =A0--without-btrfs \
+ =A0 =A0--without-nscd \
+ =A0 =A0--without-skey \
+ =A0 =A0--without-sssd \
+ =A0 =A0--without-su \
+ =A0 =A0--without-tcb
+
+ifeq ($(BR2_PACKAGE_SHADOW_SHADOWGRP),y)
+SHADOW_CONF_OPTS +=3D --enable-shadowgrp
+else
+SHADOW_CONF_OPTS +=3D --disable-shadowgrp
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID),y)
+SHADOW_CONF_OPTS +=3D --enable-account-tools-setuid
+define SHADOW_ACCOUNT_TOOLS_SETUID_PERMISSIONS
+ =A0 =A0 =A0 /usr/sbin/chgpasswd f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/sbin/chpasswd f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/sbin/groupadd f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/sbin/groupdel f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/sbin/groupmod f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/sbin/newusers f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/sbin/useradd f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/sbin/usermod f 4755 0 0 - - - - -
+endef
+else
+SHADOW_CONF_OPTS +=3D --disable-account-tools-setuid
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_UTMPX),y)
+SHADOW_CONF_OPTS +=3D --enable-utmpx
+else
+SHADOW_CONF_OPTS +=3D --disable-utmpx
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_SUBORDINATE_IDS),y)
+SHADOW_CONF_OPTS +=3D --enable-subordinate-ids
+define SHADOW_SUBORDINATE_IDS_PERMISSIONS
+ =A0 =A0 =A0 /usr/bin/newuidmap f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/bin/newgidmap f 4755 0 0 - - - - -
+endef
+else
+SHADOW_CONF_OPTS +=3D --disable-subordinate-ids
+endif
+
+ifeq ($(BR2_PACKAGE_ACL),y)
+SHADOW_CONF_OPTS +=3D --with-acl
+SHADOW_DEPENDENCIES +=3D acl
+else
+SHADOW_CONF_OPTS +=3D --without-acl
+endif
+
+ifeq ($(BR2_PACKAGE_ATTR),y)
+SHADOW_CONF_OPTS +=3D --with-attr
+SHADOW_DEPENDENCIES +=3D attr
+else
+SHADOW_CONF_OPTS +=3D --without-attr
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+SHADOW_CONF_OPTS +=3D --with-audit
+SHADOW_DEPENDENCIES +=3D audit
+else
+SHADOW_CONF_OPTS +=3D --without-audit
+endif
+
+ifeq ($(BR2_PACKAGE_CRACKLIB),y)
+SHADOW_CONF_OPTS +=3D --with-libcrack
+SHADOW_DEPENDENCIES +=3D cracklib
+else
+SHADOW_CONF_OPTS +=3D --without-libcrack
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+SHADOW_CONF_OPTS +=3D --with-selinux
+SHADOW_DEPENDENCIES +=3D libselinux libsemanage
+else
+SHADOW_CONF_OPTS +=3D --without-selinux
+endif
+
+# linux-pam is also used without account-tools-setuid enabled
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+SHADOW_CONF_OPTS +=3D --with-libpam
+SHADOW_DEPENDENCIES +=3D linux-pam
+else
+SHADOW_CONF_OPTS +=3D --without-libpam
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_SHA_CRYPT),y)
+SHADOW_CONF_OPTS +=3D --with-sha-crypt
+else
+SHADOW_CONF_OPTS +=3D --without-sha-crypt
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_BCRYPT),y)
+SHADOW_CONF_OPTS +=3D --with-bcrypt
+else
+SHADOW_CONF_OPTS +=3D --without-bcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_SHADOW_YESCRYPT),y)
+SHADOW_CONF_OPTS +=3D --with-yescrypt
+else
+SHADOW_CONF_OPTS +=3D --without-yescrypt
+endif
+
+define SHADOW_PERMISSIONS
+ =A0 =A0 =A0 /usr/bin/chage f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/bin/chfn f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/bin/chsh f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/bin/expiry f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/bin/gpasswd f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/bin/newgrp f 4755 0 0 - - - - -
+ =A0 =A0 =A0 /usr/bin/passwd f 4755 0 0 - - - - -
+ =A0 =A0 =A0 $(SHADOW_ACCOUNT_TOOLS_SETUID)
+ =A0 =A0 =A0 $(SHADOW_SUBORDINATE_IDS_PERMISSIONS)
+endef
+
+$(eval $(autotools-package))
--
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
