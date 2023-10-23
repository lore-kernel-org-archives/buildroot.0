Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF119C25B47
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB2242278;
	Mon, 23 Oct 2023 17:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB2242278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTBdGmpQAlqo; Mon, 23 Oct 2023 17:22:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD6DC4227C;
	Mon, 23 Oct 2023 17:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD6DC4227C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF0BD1BF371
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B77E54227C
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77E54227C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7jzhSTaUYQhz for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:22:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn20818.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::818])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72C3942278
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72C3942278
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a59bCivAvCX/o+WqsUoUrsOxe5eyv75684ESC/iQBJdXTqQJkyfaV9EIkz1++1X57Y0Q6wNpAA0YbOw+qBH1kH9/tY5UF+kp+tYMY7yFuwyiW9GtiSNpRxtVBUlJsG7QT7ihg/tqEWs1cqDro/PnTe7U7QMXEYlMgBBxKXrZgQL4hLDQ7dQT6Vajrh5JHxJqqmB4e3mSPUqw2Q5XNQuVe5AobbcVyEORCQ3dG+ZFh9VQ07LPsX8WnsfAKs6r1HQgS/b+d/QVSEIUYJJGpVXlHrP+yzBN6xBn3X4wvv5AIoZuFB+Ev58iZ/qpN0+1hHzLVWmJPyCM3pzpi3S4pI9NLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ9TqGJm1gyipQrqw1WYz1qievb7agu2qsjvqpml3WM=;
 b=CPpyBFc+ibf97yFT7tYiYtTeMb7BnlDfIN67F9aKx0B7crrm8GEu+iqRYLjeHdi5hsZW2gqPS9LAzFTiswnGLdJvNYdM3+pj3jcd2SJh4xzlv61SffhPirkmZuEoHkIJCv0HclTPEEcROFyAZtg45HINCOl821hdEkDoH+53vK4G/06rAfl2H/Zo6S2P3FCUz+jLMic0pm0YI9uzQ8QE9bLo6IMSkBhxz+KO1wkP924NPu4eDPTW5awWyvqmK/qXC7RN0zmakiVymP6RXrxp3ZAIPHjqKE/zQhtt+t1V8MCmtyWbfy3LELIrqdPZuTFKaQbyG1BC1jUa/KCXx8jfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB9P190MB1434.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:25d::22)
 by AM9P190MB1490.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:3e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 17:22:01 +0000
Received: from DB9P190MB1434.EURP190.PROD.OUTLOOK.COM
 ([fe80::5dfd:c5c3:1f39:e89b]) by DB9P190MB1434.EURP190.PROD.OUTLOOK.COM
 ([fe80::5dfd:c5c3:1f39:e89b%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 17:22:01 +0000
From: Nicolas Formichella <stigpro@outlook.fr>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: make GTK Config bug
Thread-Index: AQHaBdJClsRxi0yVL0q+oUSPoxW46A==
Date: Mon, 23 Oct 2023 17:22:00 +0000
Message-ID: <DB9P190MB1434D77AD228EDDE0C7C8D59CDD8A@DB9P190MB1434.EURP190.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [ZLflNgZOOBHyaDAmCDdslMMdCFP2zfLQrHGV/uVIdvCls3DJV/0GscpHTz76Acdy]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P190MB1434:EE_|AM9P190MB1490:EE_
x-ms-office365-filtering-correlation-id: ebf92fa7-8357-4de8-e7c8-08dbd3ec917f
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LO7Zq7VKspT3dEnvq987WS7Fn4pk16hYqiR06xtwXjvSY8YxM+BJHrUcdME7e56c0fEyKRbtur1SUwtWmAFbGYqQ7sNSicBUOlHh4txxy7sMUpAC3YuegBCW0xDfaZ7ud+M7fDiIGUW0np7xJb8Gfa7cZfVB0nIquiNj49McdxRxBeKoOn7TzpPc/51QQarDNczx6IUmlR4zVniAQ48tUGzwfcxBqj1oGORhsynLLKcvOIw701oPtrXiK6GF7KFnaamoU8Wyz7hTFKQPIVHqihExpletEGovWfUsuFxx++X237tzVIw8S5DsJaohZBCD+DO1GbN2kTQyh/zg2KFVplrUxJEgVd/3KYul/GIf+F4uYfbW+aZanQavKryHGZsCdCXUxGzumjCiSqrMj+Hgq1cnxXIXMbY6rvjrLlr9tLFqgIRsgnR1hqFIAWLzOF1mBTTDH9FqiaTIZhH2lDUYObozr0POya9I8Gv28bBkbP5I19xYOyr5J+Ve10DR9CT3WWGNHVyoKWviC0qZJu1rk54hcJHHJgMedbrxhUYUvnI=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?q3tEo+rdoAY0/43YeHq+j8Zb60I43hdMJejj2rFZotep0G+y1ZJ4iOv4gc?=
 =?iso-8859-1?Q?4lDzcQWmNVlS+ufkHDxVcHB8e2HKN7K22oKKSwU1WkCt9d39qzx9hSwq34?=
 =?iso-8859-1?Q?Ydl6X1CpKzph8U0hCgS/SSYSkI5j20CoV5m5qcDVhXdRAioCmbPdQ1wcQm?=
 =?iso-8859-1?Q?uoluDV237gRN3Jt7LC5RhV847T1zPqvLhnUru6LQEJdUdIp+HsLRWikaBP?=
 =?iso-8859-1?Q?78JxHGT6+/impw9/Xe+UrMuou9a9R7rAPU+l6Eft8PY6VoNDPz90QPgGnE?=
 =?iso-8859-1?Q?vs0w00RqWm+02f6lExd/6Fypn/gbywWdIUs+QZ8E4QozgPpzEaVjH1duNK?=
 =?iso-8859-1?Q?DHYreT4j04Fa3D59AUcXGm6raUKO3PHdab03fD81fio0MIQtBSl8AJj8Zl?=
 =?iso-8859-1?Q?PQQLrTQI8XWI1MvAmnLYmGBHtUvlD6I0TErCBaNPRzdQLPE5jSeRoPILXb?=
 =?iso-8859-1?Q?oUcS+rzvIgrVbE43BGNrFw+KiXMc5ulhP1NnjsovFyHwdshGWOZtiXOVcq?=
 =?iso-8859-1?Q?12LL+PmuJ60LD3e2kgQ88sRI3HY3IJ2P+VvO1khiDe9Xa+JD7Q+WbtaWru?=
 =?iso-8859-1?Q?z5UP0MvScgWRgKNg9qfb748Wuo//Pgo+YT7cG8Q2q+Ndl0KkTIaey0dNca?=
 =?iso-8859-1?Q?LaxjVHkD2UVYaotyDIHXFE8iHK5HKTE2ekUOog4J3BOqOhQl9QtGcOEpy0?=
 =?iso-8859-1?Q?gJluNUu2Yp5XW2EMClzFuPxgb6czOGkKsXw05tXYM4vE3y/Mikrd62rzBJ?=
 =?iso-8859-1?Q?1IGJUuA83/dFSNOzrcTBsybiJL/40YgV+ltrGs/336bE8Uz6ENa5ybMdKX?=
 =?iso-8859-1?Q?dgPgI8jiDtYcMfv5MelaEXLrBVaOYI6m5PBdTupS38IdQFXxHsDOw2A49h?=
 =?iso-8859-1?Q?tQtSd3C0fRMYeNxw99gLVO0XmlEqThQX/NEfj8igumdQjXBHd7uemOvKRj?=
 =?iso-8859-1?Q?b5CO3d9e/Ubez7rx3FKsXiyRtGRbnD1HwcrWHut1potTzOLKQ1UUJdiU6V?=
 =?iso-8859-1?Q?ErYh3HaXzFFQAfHu/HGMjJzqqtVU/pHMTechquZKE5PZcoKrNuXC8XxX9B?=
 =?iso-8859-1?Q?DfoXkBgEFGw+Do/ODvIii7mTCaRezaprc9kYjikejgQd7i09vx1M5aa8jQ?=
 =?iso-8859-1?Q?PCkC2Sq8BY/y/AyHWA2f/tDpuQrxuY+/XyNvV7K1vhGwPWmqCJlFLJWwpu?=
 =?iso-8859-1?Q?8vU55M9VOlUPJwRvzG38t0qq+kSKQghbSiGHKNvdsQ6g5fkLI/gpVpVryQ?=
 =?iso-8859-1?Q?rPOhHa0FCsXcP0rcYKvcA5d4C3yQZRXQi1V3FzXodWiBxrUKe+gg2EjzD6?=
 =?iso-8859-1?Q?1vk0?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-91991.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P190MB1434.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf92fa7-8357-4de8-e7c8-08dbd3ec917f
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 17:22:00.9528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P190MB1490
Subject: [Buildroot] make GTK Config bug
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I am sending this to report bugs (being unable to log in to Bugzilla) regarding the GTK config frontend

1:

Unable to launch `make gconfig` even with the mentioned dependencies

If you run `make gconfig`, it fails every time with the following error[1], digging deeper (mainly with `make V=1 -d gconfig`[2]), it appears to be unable to create the `/output/build/buildroot-config/.tmp_gtkcheck` file required by the next make target

`pkg-config --exists gtk+-2.0 gmodule-2.0 libglade-2.0` and `pkg-config --atleast-version=2.0.0 gtk+-2.0` both succeed, which should trigger the file creation (L1376[2]), but it doesn't

Creating the file manually works

Ran on openSUSE Tumbleweed 20231022 in a fully non-root configuration

[1]: https://paste.opensuse.org/pastes/98fb4a9abb60
[2]: https://paste.opensuse.org/pastes/8bdb46c5b940d

Regards,
Nicolas FORMICHELLLA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
