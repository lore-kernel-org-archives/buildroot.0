Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A880C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 16:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B5340606;
	Fri, 31 May 2024 16:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_Igl1dSv6KO; Fri, 31 May 2024 16:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE9FA406D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9FA406D4;
	Fri, 31 May 2024 16:23:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D27571D4DC5
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 16:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA0EE404F4
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 16:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtL1QzbbkGCp for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 16:23:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:2804::800;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=jdavid.norena@hotmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6F8D400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F8D400D8
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn20800.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2804::800])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6F8D400D8
 for <buildroot@buildroot.org>; Fri, 31 May 2024 16:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEz8xBZi6ELQw7kKZieko1z1zrUyuasLcpumvMQhs3hQwqcfG+6cb3UkC4VBACBTeK0FRE3pUhfBX+zNJY+4KKr0UlJ6SGCsPmBmJjEXj2ee1qfAyDHdzR/J4YJM22gpUnQBLw47TL5R1JtA/ibU/ot/l3msKr4is8stxc9u2Zy44MLk8anTJiurVQMY8jRoqWfY3q3L4UTxssIJN0LdeMRutfgLzz62o/0wbciBwbpphm55s2fAUjoQqt+6m5UOrxunFEtLeXq1Q45zHnM/STpqXs+S+tRDcPYgdmQhuNh/BwRpbnVeN4G2PM8iEn/RQOv0bdbWgKcCbqu0X/7/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WQsr0xRr2N67vxz8aUJVZmX3CtAmY0Q4YbVsmVLg+0=;
 b=J/L1y2WykRCYExQ8UkTOeFPFcHzOpLslNbiO0i3eaZjwryqdWPprAiWKYmXuvj8TXVzilnrEflaGwmPkHP22x5JSVwBkT/GJ/BtpRIAssgYzgkS7XWKAOjeliDagZvekSopoKqrra9cR3+Hth1GZ+d6T7Qsjt7ToIKIY7OYiM7CEGVz7ftupcUu6kZeUHmxQaNGmAglvzsVTi3hUZr4+eZ1WCQCoRzv3P2Cu0W4FPqWae3bVl5lyfXhtrF7V4wISx3ZCXj6dqadhlUhL8Vjf/Yqjxq63I3vgRFPO1m63c0ws2jSUi8PL0YS6lFqsZNmF7IUNcDJC8J56EHHNwDW3yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BL0PR02MB5426.namprd02.prod.outlook.com (2603:10b6:208:85::21)
 by MW4PR02MB7201.namprd02.prod.outlook.com (2603:10b6:303:79::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 31 May
 2024 16:23:43 +0000
Received: from BL0PR02MB5426.namprd02.prod.outlook.com
 ([fe80::b16f:5339:f3a0:c063]) by BL0PR02MB5426.namprd02.prod.outlook.com
 ([fe80::b16f:5339:f3a0:c063%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 16:23:43 +0000
From: =?iso-8859-1?Q?David_Nore=F1a_Perez?= <david.norena@linux.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: llvm-project: add support for lldb and bump version to 16
Thread-Index: AQHas3aLkvOvb18DkECFiwgj2AS5rw==
Date: Fri, 31 May 2024 16:23:43 +0000
Message-ID: <BL0PR02MB542629F97F36146AD2B45C90ECFC2@BL0PR02MB5426.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 2
x-tmn: [H2KsN0n2QYjQSZY3C3j1IwMermub+m3Y]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB5426:EE_|MW4PR02MB7201:EE_
x-ms-office365-filtering-correlation-id: 24658e1f-23a5-4a26-8466-08dc818e0a00
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199019|102099023|440099019|3412199016; 
x-microsoft-antispam-message-info: Bs2NbpKZPMJ/4Uig/Fw1MECTMGWlOjIlEF3+rpmAAFi++JjrTDPP8yEN67ay/hBhJDSG7bpdmp0CSKcjKSXhcGkY97oxwAkXwmF9flXYWT9BIRkOVuWORy0IJkfnSGDbNk9pNXocN2O/s9IGOvLsIfqSg8shD30fZ3gALXg5gRqA66tnVVhnkqrEwc095BIh2QShr+Wtg/VFjazIOqSRLQJX3mtwrDKO/qGDBnXCi+7sNdWhceLP9c4P6wZ+px0O4MdxAoEgN2eNI/Fg1vMi754sYMZHyLIW347jLjy+QRFy6a9AF5zj86VNOTVvpZkdbJKKKqDeRo18EQaYnqrtQMspetPBpQEbbgPAr588Vp9qDx4f1bKBHSrwu2twtNmm2Oo6ThcisO5DT80t3x5lj37DzvC2Mgq52/X5D6PJQN0aVLRzvpfZuhIt1Hw7fAQOtC90tOARz7VFR+Fcten70LgSW0AxCJXCRRsf9duu5NhawMWqwkVltMrPLEA8QJy44L1EWP1sDEbOeEvP9fZkk1USaFm2dTUQAiZ+KJ3Hd3lvHO7XnaF3K4CNWZA9aaGK
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RHOjyd0sEqlATgWQtdkxkTErq19G0dDWIodaps11HpbsQAAD3kMjdVFh0L?=
 =?iso-8859-1?Q?FTUpNylklIBb2UCJCZBmh9zBov80Dd3vTCXfNwSv5JASvyTEV6EgrrVk+1?=
 =?iso-8859-1?Q?hy8UmxeK3ApG+XZ3gg//F4Vs0LXrSjV2lwcq0jc9DjOwPWbz8YKpDlp7mF?=
 =?iso-8859-1?Q?QQ5/6l61N3f5N/XTEwh8GDvUF6f9QcT00OLZnNXE/Rx3qXcurMK4lqhLin?=
 =?iso-8859-1?Q?XrS9fTi+LGu3Iwij+w7dHJO3QUWxjMY5jg2RPE6GE7wD/N8gMhnJR1KZOL?=
 =?iso-8859-1?Q?czvQhb1jjQvWtNvVSJNolNZ9cuRF4mGe/P6EnUZ+FKluQnIN5Ki9qncnnB?=
 =?iso-8859-1?Q?I8WojHxH4JdxUvGmfPx7EpV/N52w3oGsTrt/cDw/lcfgfj2DhV5bbbXx4Z?=
 =?iso-8859-1?Q?VMABviBN3XBxeX0FpF1sZupFZvuyaQkC3ljo2OlbrJWNKHlfzU53hqxkiS?=
 =?iso-8859-1?Q?uUp4tHgJ+de58AwohCJ2Y5nMnI8K/pwCPLrxEIy4fvOJezuiOchPufi3Y2?=
 =?iso-8859-1?Q?izinnBtvEsmfrm4pj3vN2vZmq/OD7qxOqFWI+Mvf9uOQVOgiUeMfOawG9O?=
 =?iso-8859-1?Q?wLvWnMZ8eADZ539AA37vbquFemIrYBTRcOLV17bUM9wPS3OuUl9OQXZhi9?=
 =?iso-8859-1?Q?CIXEO76Sw+YSaR8Bgs7CzxQ7zDDZzxNiXBY0XsWmgINNHg7MiwzGx0Yu6Y?=
 =?iso-8859-1?Q?U/AM/et/XrH1aE4UYtEm56Ws1LH+YeyglXWx414AGTQr79+fhYsqkOHWQF?=
 =?iso-8859-1?Q?rVhF1W9b+zs+jy7FiuoHdsQ1ji5oOrdcRoOL/M1HTdRuMTvBicHkMdnN7k?=
 =?iso-8859-1?Q?YyyLSDCUKXQNowjqnQsFz5pWEXOqunMzDuJMFvvDry7v4oE9f7Pc3sYUOz?=
 =?iso-8859-1?Q?9eHhLnAmtFDCPgAeFnQ5/ub1PHDHej0zEsSQk/tkzzP+Yl9bDVyvF1/IA5?=
 =?iso-8859-1?Q?Mr25/rRULiKPgjT+yJJ6jvUWxDe/MTbt/TwUyusVCUPz9MyLnIZt4PLTAp?=
 =?iso-8859-1?Q?EAYYoXTlsx8XoZRG9wMlJ8hd6jZaN2nK40/SRvbShn9IFZXMD7wxSwYsN4?=
 =?iso-8859-1?Q?Oi+biSFVzayOIb+JPxW4a2J9rhi413mMBZ6QrXO01sDKe/IqksoRVLxIwT?=
 =?iso-8859-1?Q?9BmvuUKO0ZLW4Su9akZlEu/x6vJbjoRtJm33gTQGoOS7RVoZc1NheHBtoS?=
 =?iso-8859-1?Q?3CNhF7HN2oZG5VbJE5riofUIcyw6QFNxPit3Gb+W5OkQD0kbuAoqlsH9jO?=
 =?iso-8859-1?Q?ext0dR3sntvqyoKMNb1cmC+afwZPfde6ii/Yy7n7s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3d941.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB5426.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 24658e1f-23a5-4a26-8466-08dc818e0a00
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 16:23:43.2358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7201
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WQsr0xRr2N67vxz8aUJVZmX3CtAmY0Q4YbVsmVLg+0=;
 b=D5uN0mApuzwjf12+/Te6uYoVkdjlXQKC8DT6qq6QK2gK/asY7f45/d+YRUXcVCmEymgE86/cyn5DdbMB+TFFbGGRyhLYoffizOjMqzWN1WKbXSNvqgpHb+hV8xwJ36sGzBd75/aNC3wCOSG8Qa0Q7DBdYBeBalfEx9GZ8wYe6NR4U1ABNwtO0UWJqKjJKB8tKQ/vObPGPqr1sKLz8duc+WuwC+adRQrkip7Xb/wVqXyjBQiBpHdQB/ZMuTKTtMFS2WonDyQCpXyy/VqFKXO4HBjTZBcS6tQ2rO45jDQXVpc4iiUGLdUKPCBHTYnXISP/mOf5Pfo37N+uIqjrz/ET8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=linux.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=D5uN0mAp
Subject: [Buildroot] llvm-project: add support for lldb and bump version to
 16
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
Content-Type: multipart/mixed; boundary="===============2285606847334316293=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2285606847334316293==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BL0PR02MB542629F97F36146AD2B45C90ECFC2BL0PR02MB5426namp_"

--_000_BL0PR02MB542629F97F36146AD2B45C90ECFC2BL0PR02MB5426namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello people

I did a few changes in the code for adding support to lldb component from t=
he llvm project which is a debugger tool with more features than the gdb, m=
y question is can I create a pull request in the github repository, or how =
to proceed to make a pull request and get the code reviewed.

Thanks a lot and amazing project, hope to contribute more on this.

Cordialmente,

David Nore=F1a Perez

--_000_BL0PR02MB542629F97F36146AD2B45C90ECFC2BL0PR02MB5426namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello people<br>
<br>
I did a few changes in the code for adding support to lldb component from t=
he llvm project which is a debugger tool with more features than the gdb, m=
y question is can I create a pull request in the github repository, or how =
to proceed to make a pull request
 and get the code reviewed.<br>
<br>
Thanks a lot and amazing project, hope to contribute more on this.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div style=3D"background-color: rgb(255, 255, 255);">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Cordialmente,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>David Nore=F1a Perez</b></div>
</div>
</div>
</body>
</html>

--_000_BL0PR02MB542629F97F36146AD2B45C90ECFC2BL0PR02MB5426namp_--

--===============2285606847334316293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2285606847334316293==--
