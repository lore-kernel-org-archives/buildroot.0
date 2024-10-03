Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5C7CF31BF
	for <buildroot@archiver.kernel.org>; Thu,  3 Oct 2024 05:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C5CC401FE;
	Thu,  3 Oct 2024 05:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bz8WibOSw-lh; Thu,  3 Oct 2024 05:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24E5E40236
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24E5E40236;
	Thu,  3 Oct 2024 05:40:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6307E1BF83C
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 05:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F4F0401FE
 for <buildroot@lists.busybox.net>; Thu,  3 Oct 2024 05:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FL8F4PsdhFEG for <buildroot@lists.busybox.net>;
 Thu,  3 Oct 2024 05:40:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2c13::801;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=fran.millocs@live.com.ar; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 15A34403A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15A34403A2
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn20801.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2c13::801])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15A34403A2
 for <buildroot@buildroot.org>; Thu,  3 Oct 2024 05:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qjc0/uopPf0vdgbFExSR/aZcfJ7+E+K1iiJPVl3F6OSgVSZydXfR71XL65CJq9cjklRYWoNoRQgE90IiAlzN0RXtkWmb9DEyRDatdpynp0oIhbXgQFApbFgVYs08G0dLVDJSLwLxi4OOwXMCdYK1ZV9hEXeSkCSyFou8opsYCW0Hy4+K51WYolM2ZXA6knoztE17L7HxvRjAzBnPKNEVU9WWaCAYBieOCsMsV4AU8n9MwheFZ8Zv/IsLLPTkGCBSya8xMe35bFtZ9HB/StuFcjJTBRUXjywDKXKaBMlPa+FS1X/xDxdgzCBzTVkfl3QT7XnveVBDxwHqRv6YuT5H+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZWr4BeJb0aOd2e+5YWWqJ+yLKQNGpYB8lMoZi4N1sY=;
 b=CNTo8ma1bOft4OX/6aNLVYyw6N0ws/A81xroCpO/R7xqyyxQVF7JPdfVkZrqea9snTTR1dR3vOyM6PRYVX0KTBvBl2OnqR4+YmLvKs5CIts3SrC4bXTFDSDmtKHRVy27pyrQUMnu6Ds5jHQA0ZCfs2/ssdiUxlKf0lHGCACTzv2NMNbhLXBay6DISJJLxtydBn8FDfGpqD9mlFYBLljjCh6QvegH1cUqDgSmLpl3CF8hRZEX0RWZVFsKdhFMFVEt237RqLH76yWm3jS7I3zLM+WshLGyByeijlfWZYxepcCRYBI3o9eKJtXnPbwccFUU1Q3xhY7xmAE0mVVdEksP3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from PH7P222MB1231.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:316::9)
 by LV8P222MB0837.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:1cb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.29; Thu, 3 Oct
 2024 05:40:41 +0000
Received: from PH7P222MB1231.NAMP222.PROD.OUTLOOK.COM
 ([fe80::7a0e:44d:cc74:141c]) by PH7P222MB1231.NAMP222.PROD.OUTLOOK.COM
 ([fe80::7a0e:44d:cc74:141c%4]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 05:40:41 +0000
From: franco ariel <fran.millocs@live.com.ar>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Thread-Topic: [Help] Qt5WebEngine Crashing on Khadas VIM3 (ARM64) 
Thread-Index: AQHbFVZNmUQTkLkhgk+Im1ZcTvPSEw==
Date: Thu, 3 Oct 2024 05:40:41 +0000
Message-ID: <PH7P222MB1231C70837725FB7416DE9BCD0712@PH7P222MB1231.NAMP222.PROD.OUTLOOK.COM>
Accept-Language: es-AR, en-US
Content-Language: es-AR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7P222MB1231:EE_|LV8P222MB0837:EE_
x-ms-office365-filtering-correlation-id: 8f184caf-a9b3-4716-f739-08dce36deb2b
x-microsoft-antispam: BCL:0;
 ARA:14566002|7092599003|15080799006|461199028|8060799006|15030799003|8062599003|19110799003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: /fgZWFnxO4TWp72mq70kukEedJq3V1ORzVXlSFqOl9YoLivwYyvPEY8oHcr2mQetHCeFGRDkL1q35VtClyWsr1uUYBlN10RCqUT/X8rYvXRL3CdNAAfOoPml7stBZBYI1J+E6DLWhNbQ4WtSfeaeeLSTiAMGO1o14xDa9I3HbvQE+nix0JS5LTY07J3aPzA0cJxkzywWoGmWe2GXzpcf+Dp07oQXb5l70ybdjcxRWzjyKjGix4LUHn7xq4gYiSelwRf86lpyx1BnHa+Up6Qdsv5q+iXu0JWp+Ej9yP/E5z1KibeI43mjtPIzNWlsrMoE/Cq5HtptRO3u21+vloeTsu8qWlVaubC6xOHXSeoUpvtm2jKXKBgtndTsKDU3EqWy5xQAg7rr8UV0uuw78omwR/i/ou05mpVsNSsoRtFIiFvqQpSl2EekrLINVYffAE8DCH5ldx5mKw8y1jYxVtlojrXSQYfOW5rUx5mhJDawJfbixexsr1VXZlJUHVLu/l50s0fg4RInqN6APRa/igjkdu203cCjpeWp2fMsxYmE/Or8T3Fc0g3RsZUI1APDNzJX48I7QKwlZXfY9r4mE+Li+kmoZ01M/o/Qkuuik+9ziZRbK9gUpVq7KehxZ9XmpkAe5TqHAJUOYKDdoPEugUAOdB2dRnPCVfBgTK/v8IdQNDBGjw6zPLZrMaae+3jRuaMAb1ROJAwwH99IKnBwedfA+3zOqJqHXauDfH82FM/3J2stOHGY/sOnz7vxEOr/AyR6PblsxS0WLabQOdAkjKlXZA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+5S+xWpe49VTCsyuHD68q/B7Jb+pVhCfFXADtj3hI+HwfU/lkFv1tSyXi1?=
 =?iso-8859-1?Q?CJUarfJntfzgDZQa5UBKOt7bWPpHRj00pnt1XIOnkAGRZnJM1iOk0Sa8kO?=
 =?iso-8859-1?Q?J2Borru/xPo6F0U4U172ABlbQT+S9ru6Uu/aFSjB42aeQ7pulJrO7Zao75?=
 =?iso-8859-1?Q?al7R3SW6oYzL/AtCMXOHfa19azTgYet2QMRh1qmYVoHc+TcNWeQJ9G8/RY?=
 =?iso-8859-1?Q?8qLQPoh/sUPy6q1Fj34fLD1Xn5cS8Lg2W/YkXWodvMlKfrakDdHGOVgiSl?=
 =?iso-8859-1?Q?txfRSuLEF9rJgtp8NUj4zSexrrm+yCtMjU8kDvVmxGIEBagKWXNYBNuoXN?=
 =?iso-8859-1?Q?T4A47pNotb4wZ/OHbq3DoN+Om/i+B/rU1sbuW+bnPGuvwPVX319ETmB9xB?=
 =?iso-8859-1?Q?sbpbmw1KDQko7WMMeUgekBIXvyEQHa+qHBVpGcbbnwsjR+43PzZgZRAOCp?=
 =?iso-8859-1?Q?N43tOVFpBXhJkRVkV/a3vAtmtVudXK4+eb6b4tMExvs1YVxA1RGUwrJHgc?=
 =?iso-8859-1?Q?eaehzckPtG6bFqgelBOG5h7CgLLF9KXt6lW6ytVaisPKeH1Yw7SEqk+o2W?=
 =?iso-8859-1?Q?1JgFgHYtfuIW8ISCBEbst2RCcx+wzXzrTDo19nAU1+4oIZLYj6u9AKje0Z?=
 =?iso-8859-1?Q?QgKbGNmVU3AyX36JPYJv7nvT3Wzqcmk9BVU8FDd8u874qfmj6MJMYPNX2M?=
 =?iso-8859-1?Q?Nf4FS2xzgN87epkjbflOZDM3QrChNps3ItjczYmVSqEoAcFmvHsqx8fMCl?=
 =?iso-8859-1?Q?zYKxPOEaiDx5ncFQtj2jDBVSQutHXgh+nCFQ/bseqZlnnmtboAPNpxRYvN?=
 =?iso-8859-1?Q?7VFRJV5QVvE07dNFmVI9vB97IqkiCYkZjxssgrlzZtTRVinPrNfsLPHTYr?=
 =?iso-8859-1?Q?3zgLgJtYgJjq+upeGpSgpYlkAmqZEWRutohELZCnKNmaLp5Ddl4E8fPjTn?=
 =?iso-8859-1?Q?AbDb4CoCw0wzoFsH2IarfZVm6Y8ztoPRba1nBp3eJ9eJcObv5YoxyykLFv?=
 =?iso-8859-1?Q?eZsOB9b9aLXewIs1og1cZa4749GLYmFIKRuteSwH9xh5oMXe0d36ErK9PG?=
 =?iso-8859-1?Q?s3qYWQp+se0YQ5jaXEKeSMSedrAp3eYwP6bkI9RvUikQd7RfORbevIVI1j?=
 =?iso-8859-1?Q?QRYfL2MCFOWzvmc80TwTL/6uhBAj+/mq5dX3z51IY0PCybpwVuV7mTBSW4?=
 =?iso-8859-1?Q?g4jlH+rdXNn8JDTo1trO44NG13rEghOjC8jp+6jviZ5GeznFE0dH4uZkHa?=
 =?iso-8859-1?Q?iVXPhyvIP4iTLPGzSyOLBUpJ1WY9um0KVdAz5ZddYqKI486QePRN0dplgx?=
 =?iso-8859-1?Q?YaA1BzLEMygrW6udY0Z4pw5hWlPc+3a2y6XP5tWW2Dq+T7w=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-6509f.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7P222MB1231.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f184caf-a9b3-4716-f739-08dce36deb2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 05:40:41.5761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8P222MB0837
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LIVE.COM.AR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZWr4BeJb0aOd2e+5YWWqJ+yLKQNGpYB8lMoZi4N1sY=;
 b=UOAnGMllunfaKI82D0zCNE/Z6lYzRv+GS991pJI6XvVT9fFrNBcOmsjm4GzI0MtW2eK67c1dEvMzlkf5Hc7cxD6GVQRp/0URIWhgPy8F80WHgMMaowzvPp8fqqWVx0wQI4sxkUEk0lIWgx3du6BupdbuZSulO/FHF4E9//QU+Wcqbo2pUnu06j/8tFgWOKGSMAWQ74yD+Y8gQG5bPm/4e/lgQalyX7lOMJCKm30/Yi7s4pDl8otVqAc7yw/xZy+NjV7qgKwWgCj5iPsNdPq09M1PFvx/nUkQTWIzh+Fw96kJOwTrgl+vz24GTi0vtAjvDT2MYITChXB47Cn0RfNKWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=live.com.ar
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=LIVE.COM.AR header.i=@LIVE.COM.AR header.a=rsa-sha256
 header.s=selector1 header.b=UOAnGMll
Subject: [Buildroot] [Help] Qt5WebEngine Crashing on Khadas VIM3 (ARM64)
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
Content-Type: multipart/mixed; boundary="===============8578471745690153655=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8578471745690153655==
Content-Language: es-AR
Content-Type: multipart/alternative;
	boundary="_000_PH7P222MB1231C70837725FB7416DE9BCD0712PH7P222MB1231NAMP_"

--_000_PH7P222MB1231C70837725FB7416DE9BCD0712PH7P222MB1231NAMP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I am encountering an issue when running a Qt 5.12.2 application with QtWebE=
ngine on a Khadas VIM3 board (ARM64) using Buildroot. The application crash=
es when transitioning to the WebEngineView with the following error:

[ 4021.882789] audit: type=3D1701 audit(1727931778.322:7): auid=3D429496729=
5 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2253 comm=3D"test" exe=3D"/home/te=
st" sig=3D5 res=3D1 Trace/breakpoint trap (core dumped)


Steps to Reproduce:

  1.  I have a simple Qt application with a button that switches to a WebEn=
gineView when clicked.
  2.  On Windows 11, the application runs without issues, and I can success=
fully view web content.
  3.
On the Khadas VIM3 (ARM64), the application crashes immediately when I pres=
s the button and switch to the WebEngineView.

Questions:

  1.
Is there a known issue with QtWebEngine on ARM64 in Buildroot?
  2.
Has anyone successfully run a QtWebEngine application on a similar ARM-base=
d board?

Any guidance or suggestions on how to debug or resolve this issue would be =
greatly appreciated!
Thank you for your time and assistance.


--_000_PH7P222MB1231C70837725FB7416DE9BCD0712PH7P222MB1231NAMP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hello everyone,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I am encountering an issue when running a Qt 5.12.2 application with <code>=
QtWebEngine</code>&nbsp;on a Khadas VIM3 board (ARM64) using Buildroot. The=
 application crashes when transitioning to the
<code>WebEngineView</code>&nbsp;with the following error:</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
[ 4021.882789] audit: type=3D1701 audit(1727931778.322:7): auid=3D429496729=
5 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2253 comm=3D&quot;test&quot;&nbsp;=
exe=3D&quot;/home/test&quot;&nbsp;sig=3D5 res=3D1 Trace/breakpoint trap&nbs=
p;(core dumped)</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>Steps to Reproduce:</b></div>
<ol start=3D"1">
<li style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; =
color: rgb(0, 0, 0);">
I have a simple Qt application with a button that switches to a <code>WebEn=
gineView</code>&nbsp;when clicked.</li><li style=3D"font-family: Calibri, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
On Windows 11, the application runs without issues, and I can successfully =
view web content.</li><li style=3D"font-family: Calibri, Helvetica, sans-se=
rif; font-size: 12pt; color: rgb(0, 0, 0);">
<div class=3D"elementToProof">On the Khadas VIM3 (ARM64), the application c=
rashes immediately when I press the button and switch to the
<code>WebEngineView</code>.</div>
</li></ol>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<b>Questions:</b></div>
<ol start=3D"1">
<li style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; =
color: rgb(0, 0, 0);">
<div class=3D"elementToProof">Is there a known issue with QtWebEngine on AR=
M64 in Buildroot?</div>
</li><li style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">
<div class=3D"elementToProof">Has anyone successfully run a QtWebEngine app=
lication on a similar ARM-based board?</div>
</li></ol>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
Any guidance or suggestions on how to debug or resolve this issue would be =
greatly appreciated!</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Calibri, He=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thank you for your time and assistance.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_PH7P222MB1231C70837725FB7416DE9BCD0712PH7P222MB1231NAMP_--

--===============8578471745690153655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8578471745690153655==--
