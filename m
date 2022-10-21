Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C67DFA373D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 15:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 041BE60E92;
	Fri, 21 Oct 2022 15:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 041BE60E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTDXkekHQtIz; Fri, 21 Oct 2022 15:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C07D860E77;
	Fri, 21 Oct 2022 15:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C07D860E77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5F7E1BF288
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 15:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD64441129
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 15:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD64441129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Du_P1hV5gcHj for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 15:44:13 +0000 (UTC)
X-Greylist: delayed 00:15:08 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 684EC4032A
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0078.outbound.protection.office365.us [23.103.208.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 684EC4032A
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 15:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=AwJSat4Y+rK+m72DFE8oojsV6rEdSS2FfOgM/knPnno9GwCVRM1sSxIgNaGNVITLHyMbMTyiusMqod4UgkSyEPT+qUHa+Y2fEF7zTykygtIyUnpkeyZYvrf0GYVMi1U80RFf71sylWrdARuwd4NEwMiRTG/XB3EC/0e/I5r42DwADRshBQiyZS8hkbdbATmoVh9R2U9/6mwO70UboUI/DFksxQbspUUtqoRTkBm2AYe5Ltnz2dxwZFT7JwDtiusVJDlOJRB2YgRHJCoiFyN1j/knTeJJuc1DoBUUQyTa6t9rCnQxIDW9w6E5DZJiSkuBxC8OvUKQJpa8vV6d0bqaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOYpchR/Rhqn0JggJ/k0NPx90YpTkWQH4kGEp5yWGdw=;
 b=FtuArLsFg673y3wCiptRDa5kGpejtE8+ZtwMWZnAfOuIQmTpC6+cpCYsTkYz2aYnM/N5r2pZsQTDfUCIWXdQPpALh9vMyAxipgIFakBl9+HXDPairN322xRJr2KwW61akzHtUZUsmw5ZR2hYSJwtaC3RPq/flB+tpxkzIpgMqP3G2ANrAmsw6Qhd7yPjxKwFcdj2+lTbQwkUAo1jEkLgg/atx9FsjiQQNE1RUJpiHcFxTgQuvzgf8L2KEv8EsCNHOucOd0Ot0WczP0Z5bxwgxlIvQvAZkEg2tKgWPDq0LI6EYCtltdmcRJ3qAjQrfPqaFvS8R5/l+csTL9TjlUyckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netacquire.com; dmarc=pass action=none
 header.from=netacquire.com; dkim=pass header.d=netacquire.com; arc=none
Received: from PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:174::11)
 by PH1P110MB1153.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.36; Fri, 21 Oct
 2022 15:29:00 +0000
Received: from PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM
 ([fe80::484e:4dd9:66f2:24f3]) by PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM
 ([fe80::484e:4dd9:66f2:24f3%7]) with mapi id 15.20.5723.036; Fri, 21 Oct 2022
 15:29:00 +0000
From: David Hauck <davidh@netacquire.com>
To: Romain Naour <romain.naour@smile.fr>, James Hilliard
 <james.hilliard1@gmail.com>, Romain Naour <romain.naour@gmail.com>
Thread-Topic: [Buildroot] [PATCH] package/glibc: Fix x86_64 builds with -Os
Thread-Index: AQHY2/TMKVMYea9siE6yF54cqKnNU64GuFyAgACFSoCAEcytEA==
Date: Fri, 21 Oct 2022 15:29:00 +0000
Message-ID: <PH1P110MB1068C08C780AD75F20DC9BF0A42D9@PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM>
References: <20221009153521.12444-1-romain.naour@gmail.com>
 <CADvTj4rNt5UFLkYpSvSPTiZHKgD0DB9LFp0yo-f_635mZrYE+Q@mail.gmail.com>
 <00204ef4-6f42-ff56-1f50-0fc6cc260976@smile.fr>
In-Reply-To: <00204ef4-6f42-ff56-1f50-0fc6cc260976@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1068:EE_|PH1P110MB1153:EE_
x-ms-office365-filtering-correlation-id: b4e557ec-b659-475b-3b08-08dab378fa4b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 660inWp4OEntVGAmT4Za4LYKFBwYpjyxH1djuULYhor4sGYUVXkil463hDwTW2VnfzLAHgNkryjky4QUO/iDSk0Z+ExDAf9hLUCWbvBPRE0ZqCfP2z/HXHykMGRidxAt+kq/8sSpXXV8FcyVpvGQ85Lgi5PaPr/nYM77bP4rovFnhJh1O+2BEqz+LX/GEoXywokUXMC7j4p+K83QwtEedHZr1/Oi2eMrBy/s9v+c1724Mt67fx7g6Jvxnf7BLeSigdFh2dRLsQyR7yajvDjRQWacEISHiMRW3Oa9Lup6VOWkxzP3pjKzJLoiFcuTe5ZgdJQL+ViS/Q3HOP1Ej4hZd4SQlTqsP1vexTUdMmnBzSHZYCDuNHIsQf7PVOeNmyNPalUNOX5jD1owxxsc6cBMc+ByJyxNYW274UzPOFXShjGrXsLgjp39XJftepxGm4EoStTKUQhhPezBQIqhV7NA4tPY1b4ii+cwJm6PKXGC4SZf8E1PggZdsgVj+/tUAkkdzay5fT8xtCZCyfowiOh/si1vZSeKuER9n3vjbOMHfTbFJViLOGxagzotdOjx21MO2I9nMU7kuOi7WmaswzngqV1sk6icRNe87lIGA1oBqss24GmVmcFh+1rcyxalm+4F2Scz9Aiq1igCQm12qLGYS5aDtBsA+/WwGQWFEXD2C8zloCQSRPkmIJv64fowxsAIB3SVUwFZ/YAfHEJ1Qp5XZJenF5mA2eRE8PL2+/eEdOw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(396003)(39830400003)(451199015)(19627235002)(45080400002)(110136005)(53546011)(7696005)(66946007)(508600001)(4326008)(6506007)(71200400001)(76116006)(64756008)(66446008)(66556008)(8676002)(966005)(66476007)(52536014)(41300700001)(8936002)(9686003)(2906002)(186003)(26005)(5660300002)(66574015)(83380400001)(122000001)(33656002)(38070700005)(38100700002)(41320700001)(55016003)(86362001)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: NbFx8XRAE/1cEepV8Nur9bnh2BMQQqnlFu8jYssPw+dQiJT01nEKNOk1IMUzWwBoTGhC1hYGCLWqHgZnW5ouy8NnKIbsMmtCBNLkOQp+ebMLQXK3omeE/8SIoqKKGQO7TeiMkFQJuMQ924zIZ0RD6PB76QvM4jA1CCrfgDEHL7825nHUt7DKKJQ1tcxOLnthlBpKKpMpQBw4YaQGc6R9mmiU1qhWRYQRvdx9rBaaFswJiK4Zz+lE4zdQ+ALu52PdzOshoqm4zJXc8MiYKGS8w6lE+RsIU63LAQCMg2zvVEyOClXV8gQgaLTl1IV7YGvxdFYDnxSir56POB44LwiZf/wVEIjCqB+062bz1eNBPXtZ6PNCAoxAz6cupcgWSJJGFctzqakMfHFOSgKwb0ZNwuHRKT61Spdx6Cc5goAaMyg=
MIME-Version: 1.0
X-OriginatorOrg: netacquire.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1068.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e557ec-b659-475b-3b08-08dab378fa4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 15:29:00.2559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ec65e18e-ede2-4ced-bdab-49355e3f602d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1153
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netacquire.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOYpchR/Rhqn0JggJ/k0NPx90YpTkWQH4kGEp5yWGdw=;
 b=ZRvxmFGb6/rDdmMWj/jkC7Rk/aGiOPjhm8yxniRtpOV10IfKlPhwmdjbGm+KnD5DGrTecUDIBDL6TM3mfhhbAQsyLv3tR08Eo366yujtcHFLTl/0FB2Lkfbp/pYSeG5IGU+gjnKm8Z+jgiJZvSOa+iJ3rp3LQq5S95jMtZsZ+7sT4G2jPSeu12QFkGGvXN0ENEkgXKdHeWRPl7/E8+vnSJU4J4pVHMfPsI5/aIsAJrwkgXNq3oX4S9+zSbYdh0XwQ1Fkom474nOYzVdedh/ApD5XDHCH+yWlauW4n++gvY+xoOSbLUObMrn9ZkNtPlda4JZqqVqFEv1olB1spJyt4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=netacquire.com header.i=@netacquire.com
 header.a=rsa-sha256 header.s=selector1 header.b=ZRvxmFGb
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netacquire.com;
Subject: Re: [Buildroot] [PATCH] package/glibc: Fix x86_64 builds with -Os
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi there,
 =

Not sure if this is the correct place to follow-up but I'm wondering why th=
is patch/backport hasn't yet been committed to 'master' (these x86_64 'glib=
c' autobuild failures appear to still be occurring)?
 =

Regards,
-David
 =

On Monday, October 10, 2022 12:35 AM, buildroot <buildroot-bounces@buildroo=
t.org> On Behalf Of Romain Naour wrote:
> Hello James,
> =

> Le 10/10/2022 =E0 01:37, James Hilliard a =E9crit :
>> On Sun, Oct 9, 2022 at 11:35 AM Romain Naour <romain.naour@gmail.com> wr=
ote:
>>> =

>>> Backport upstream commit for x86_64 builds with -Os reported by [1].
>>> =

>>> [1]
>>> https://usg02.safelinks.protection.office365.us/?url=3Dhttps%3A%2F%2Fso
>>> urceware.org%2Fbugzilla%2Fshow_bug.cgi%3Fid%3D29576&amp;data=3D05%7C01%
>>> 7Cdavidh%40netacquire.com%7C1d8703ac22ce434eb90108daaa91f777%7Cec65e1
>>> 8eede24cedbdab49355e3f602d%7C0%7C0%7C638009841155558315%7CUnknown%7CT
>>> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
>>> I6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DkM71qKfb2s%2FJpdiq7raXX5QGiCZSgYG5
>>> %2BF7sDJsivHs%3D&amp;reserved=3D0
>>> =

>>> Fixes:
>>> https://usg02.safelinks.protection.office365.us/?url=3Dhttps%3A%2F%2Fgi
>>> tlab.com%2Fbuildroot.org%2Fbuildroot%2F-%2Fjobs%2F3134229902&amp;data
>>> =3D05%7C01%7Cdavidh%40netacquire.com%7C1d8703ac22ce434eb90108daaa91f777
>>> %7Cec65e18eede24cedbdab49355e3f602d%7C0%7C0%7C638009841155558315%7CUn
>>> known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
>>> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DnLa36c%2FtkIs3S6dkSlmJ2QA
>>> 6C4sHpmeg5ZxrXheTjes%3D&amp;reserved=3D0
>>> https://usg02.safelinks.protection.office365.us/?url=3Dhttps%3A%2F%2Fgi
>>> tlab.com%2Fbuildroot.org%2Fbuildroot%2F-%2Fjobs%2F3134229956&amp;data
>>> =3D05%7C01%7Cdavidh%40netacquire.com%7C1d8703ac22ce434eb90108daaa91f777
>>> %7Cec65e18eede24cedbdab49355e3f602d%7C0%7C0%7C638009841155558315%7CUn
>>> known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
>>> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Dz7VVflV9eoBkHtPjL6DF8qQnC
>>> %2FyBUmXxARjDgo6DErA%3D&amp;reserved=3D0
>> =

>> I think this also fixes an issue in autobuilders, see:
>> https://usg02.safelinks.protection.office365.us/?url=3Dhttps%3A%2F%2Fpat
>> chwork.ozlabs.org%2Fproject%2Fbuildroot%2Fpatch%2F20220927031702.29184
>> 14-1-james.hilliard1%40gmail.com%2F&amp;data=3D05%7C01%7Cdavidh%40netacq
>> uire.com%7C1d8703ac22ce434eb90108daaa91f777%7Cec65e18eede24cedbdab4935
>> 5e3f602d%7C0%7C0%7C638009841155558315%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
>> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
>> C%7C&amp;sdata=3D%2Fk1U8hJG0c8ms2%2F0zEeQu2Z8PQA%2BvSVoGTjO50qMfIo%3D&am
>> p;reserved=3D0
> =

> Sorry I missed it in the patchwork it was on the second page already...
> =

>> =

>> https://usg02.safelinks.protection.office365.us/?url=3Dhttp%3A%2F%2Fauto
>> build.buildroot.net%2Fresults%2F5b4%2F5b442f95587ddc65a995bbd9e310c88a
>> 66c55b1f&amp;data=3D05%7C01%7Cdavidh%40netacquire.com%7C1d8703ac22ce434e
>> b90108daaa91f777%7Cec65e18eede24cedbdab49355e3f602d%7C0%7C0%7C63800984
>> 1155558315%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI
>> iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3Drn7GhsxgoxAG
>> Qofv375ApEGTHMKtCiAz4s6e10yLe9A%3D&amp;reserved=3D0
>> =

>>> =

>>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> =

>> Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
>> =

>>> ---
>>>  .../0002-x86-Fix-Os-build-BZ-29576.patch      | 48 +++++++++++++++++++
>>>  1 file changed, 48 insertions(+)
>>>  create mode 100644
>>> package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
>>> =

>>> diff --git a/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
>>> b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
>>> new file mode 100644
>>> index 0000000000..4470324f1c
>>> --- /dev/null
>>> +++ b/package/glibc/0002-x86-Fix-Os-build-BZ-29576.patch
>>> @@ -0,0 +1,48 @@
>>> +From 3935b543adcb9a46ab79f8931bc489068b049378 Mon Sep 17 00:00:00
>>> +2001
>>> +From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
>>> +Date: Wed, 21 Sep 2022 10:51:08 -0300
>>> +Subject: [PATCH] x86: Fix -Os build (BZ #29576)
>>> +
>>> +The compiler might transform __stpcpy calls (which are routed to
>>> +__builtin_stpcpy as an optimization) to strcpy and x86_64 strcpy
>>> +multiarch implementation does not build any working symbol due
>>> +ISA_SHOULD_BUILD not being evaluated for IS_IN(rtld).
>>> +
>>> +Checked on x86_64-linux-gnu.
>>> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
>>> +Tested-by: Carlos O'Donell <carlos@redhat.com>
>>> +
>>> +(cherry picked from commit 9dc4e29f630c6ef8299120b275e503321dc0c8c7)
>> =

>> This is probably better than mine since I had applied from patchwork
>> before it was applied upstream.
> =

> Yes maybe... even it doesn't come from the 2.36 stable branch.
> I replied on the bug report, so the commit may be backported soon.
> =

> Best regards,
> Romain
> =

>> =

>>> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
>>> +---
>>> + sysdeps/x86_64/multiarch/rtld-strcpy.S | 18 ++++++++++++++++++
>>> + 1 file changed, 18 insertions(+)
>>> + create mode 100644 sysdeps/x86_64/multiarch/rtld-strcpy.S
>>> +
>>> +diff --git a/sysdeps/x86_64/multiarch/rtld-strcpy.S
>>> +b/sysdeps/x86_64/multiarch/rtld-strcpy.S
>>> +new file mode 100644
>>> +index 0000000000..19439c553d
>>> +--- /dev/null
>>> ++++ b/sysdeps/x86_64/multiarch/rtld-strcpy.S
>>> +@@ -0,0 +1,18 @@
>>> ++/* Copyright (C) 2022 Free Software Foundation, Inc.
>>> ++   This file is part of the GNU C Library.
>>> ++
>>> ++   The GNU C Library is free software; you can redistribute it and/or
>>> ++   modify it under the terms of the GNU Lesser General Public
>>> ++   License as published by the Free Software Foundation; either
>>> ++   version 2.1 of the License, or (at your option) any later version.
>>> ++
>>> ++   The GNU C Library is distributed in the hope that it will be usefu=
l,
>>> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> ++   Lesser General Public License for more details.
>>> ++
>>> ++   You should have received a copy of the GNU Lesser General Public
>>> ++   License along with the GNU C Library; if not, see
>>> ++
>>> ++ <https://usg02.safelinks.protection.office365.us/?url=3Dhttps%3A%2F%
>>> ++ 2Fwww.gnu.org%2Flicenses%2F&amp;data=3D05%7C01%7Cdavidh%40netacquire
>>> ++ .com%7C1d8703ac22ce434eb90108daaa91f777%7Cec65e18eede24cedbdab4935
>>> ++ 5e3f602d%7C0%7C0%7C638009841155558315%7CUnknown%7CTWFpbGZsb3d8eyJW
>>> ++ IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
>>> ++ 000%7C%7C%7C&amp;sdata=3DHK7%2FnPI%2Fo9tp%2FG2N3gDgo%2BIo5vMUfQdrh7d
>>> ++ 1JIPRYgU%3D&amp;reserved=3D0>.  */
>>> ++
>>> ++#include "../strcpy.S"
>>> +--
>>> +2.34.3
>>> +
>>> --
>>> 2.34.3
>>> =

>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot@buildroot.org
>>> https://usg02.safelinks.protection.office365.us/?url=3Dhttps%3A%2F%2Fli
>>> sts.buildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&amp;data=3D05%7C01%7
>>> Cdavidh%40netacquire.com%7C1d8703ac22ce434eb90108daaa91f777%7Cec65e18
>>> eede24cedbdab49355e3f602d%7C0%7C0%7C638009841155558315%7CUnknown%7CTW
>>> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
>>> 6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DiK4ThBYjF%2BC4i9HrvoUnw%2FUQCK4Sn%2
>>> B6mrl0m6txsY5g%3D&amp;reserved=3D0
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://usg02.safelinks.protection.office365.us/?url=3Dhttps%3A%2F%2Flis
>> ts.buildroot.org%2Fmailman%2Flistinfo%2Fbuildroot&amp;data=3D05%7C01%7Cd
>> avidh%40netacquire.com%7C1d8703ac22ce434eb90108daaa91f777%7Cec65e18eed
>> e24cedbdab49355e3f602d%7C0%7C0%7C638009841155558315%7CUnknown%7CTWFpbG
>> Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
>> 3D%7C3000%7C%7C%7C&amp;sdata=3DiK4ThBYjF%2BC4i9HrvoUnw%2FUQCK4Sn%2B6mrl0
>> m6txsY5g%3D&amp;reserved=3D0
> =

 _______________________________________________ buildroot mailing list bui=
ldroot@buildroot.org
 https://usg02.safelinks.protection.office365.us/?url=3Dhttps%3A%2F%2Flists=
.buildroot.org%2Fmailman
 %2Flistinfo%2Fbuildroot&amp;data=3D05%7C01%7Cdavidh%40netacquire.com%7C1d8=
703ac22ce434eb9
 0108daaa91f777%7Cec65e18eede24cedbdab49355e3f602d%7C0%7C0%7C63800984115555=
8315%7CUn
 known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%
 3D%7C3000%7C%7C%7C&amp;sdata=3DiK4ThBYjF%2BC4i9HrvoUnw%2FUQCK4Sn%2B6mrl0m6=
txsY5g%3 D&amp;reserved=3D0 External Email Warning! Use
 caution before clicking links or opening attachments.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
