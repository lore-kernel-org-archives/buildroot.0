Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7CDC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 18:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393CA402B7;
	Tue, 14 Mar 2023 18:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393CA402B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmKq8OiA9TWE; Tue, 14 Mar 2023 18:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CAD2402DC;
	Tue, 14 Mar 2023 18:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CAD2402DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F30B71BF3BB
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 18:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF8B1402B7
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 18:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF8B1402B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRXfxAuGQyr8 for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 18:43:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D54B402DC
Received: from MW2PR02CU001-vft-obe.outbound.protection.outlook.com
 (mail-westus2azlp170120001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c005::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D54B402DC
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 18:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fo22EdnXNfoqquMFJP+iRpAfJQGcvU9CPQOCl89gTUfoCTyt5PmysmGUPWOoWOIvBrkfL3cc9WcWJxPXNJelZYx4DiwTezvEHrm8BhXo9H8gXm69wSp1ODrcuf8Zqdykw5YP2VX0RH6MFMl8fJBKho5zwi4dw0D4GlyvSI9aVecUbgs7V1Bm0WhfJMKHGxzBLROMnSXkqgJoChV3OubPQPGMgcyWprFr6Gz5Lf6xGh2B/RoJ+5I51VlZ0ZE5ZeWwvKteKsCEqwkO7l1da73qdZENTIq5ipjvahtIBT7fBoRITkPptJQBqFYpIQPyZ2kR1rgaoWJTbEM9yJSf77EQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0nIeahJXrFIJPynmYStqoFu9RAnpTNcWD+jGtCZ2x4=;
 b=bzvA16yFVw2MpwMtIxdL0kiOrFZpNyhXqCZc1ciN7xdX40pzuubdB25T9YHDgKW8wYob22MMz0Xdkbiea4DNsSVjaC/uUjwG3snydNwS9Wkmia+2djApDjggdXNkv7cKJBOb5aizlXPBFSnaCE2EWBSLA1M9wOGiTAMyLEzoP4JP06QI8ADGC4oGj1vTSulfZHQG1AApaNrdr2J5ncDN1FpN6KBIIxjXfjyuLqca/tv9Oo/fWrPMQ5+CCdVNOX//Dd5uP2hnR1GbuBhcZn42zLkt2LEjDGj+3ypWzOIGVZBSZwYTi/rhT8IMxH4OvvHmMMD9VZ/p93YMYja6Fisa0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR05MB7625.namprd05.prod.outlook.com (2603:10b6:a03:2ab::17)
 by PH0PR05MB8222.namprd05.prod.outlook.com (2603:10b6:510:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 18:43:29 +0000
Received: from SJ0PR05MB7625.namprd05.prod.outlook.com
 ([fe80::1178:ca4f:682d:1c84]) by SJ0PR05MB7625.namprd05.prod.outlook.com
 ([fe80::1178:ca4f:682d:1c84%4]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 18:43:29 +0000
From: C D <dellicker@live.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] Forcing linker to look at right library path?
Thread-Index: AQHZVf9+ezz2XZsLZEmD2c4DuBHbRa756YCAgACsQK8=
Date: Tue, 14 Mar 2023 18:43:29 +0000
Message-ID: <SJ0PR05MB7625BB7889E5DD3876C01E89D4BE9@SJ0PR05MB7625.namprd05.prod.outlook.com>
References: <SJ0PR05MB7625D8C1B77DE29365DEDB13D4B99@SJ0PR05MB7625.namprd05.prod.outlook.com>
 <20230314085823.5a37e5e9@windsurf>
In-Reply-To: <20230314085823.5a37e5e9@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [P+goZF39/dHqx1sNz8n+hinWRUr4bUhF]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR05MB7625:EE_|PH0PR05MB8222:EE_
x-ms-office365-filtering-correlation-id: faeb504d-bcb8-4492-5e9c-08db24bc0137
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h9LK5jDN/XkcB6UHAGPnoVpRnI3EZ3RbbZLCZ7TBgZT34D9gfx+ojS771jEKL7+xNtJUdKFLF7lDY2uMOdYQiqvhao7+ePXA6Q36pTjogHfXlZus+RRi7HeM+SHW5vmgp2kLaLO4EtphF1oPgvbA/RiiLqmqLukkqDk9h124kyMHQZRUz6QirKOCzPujLwEtQ/ACab3Ynb1vdyTb7PgO4XvIbfZr5eUAXd9gIwv6U0elmW4qSfcWBuUZ3oAgagLCv0Wt2S7rRys0LGCT3GogShfgnHYyVvgwIzD4lJjmxj2gjSoFCOlcSXK2d6/lBdYAgv71d/xY0imOewWPLBHMYzf+0ui2aE4+G414toqhdtwBgFm26Zr4/LNEvC0BD0vuehzAsYZlV2dQd1AYmBXdZJWg6RNAONmL5iYFn9dZKdNuUta5bFgkS27SPwhzgKjN6Aepl1HQqfiNl179kmMJ0lCY37Eq7YnDfCsaYS+kKtcySsbQ44vLy586VNCS97Un3+qmuiuXYvdUbZ+RZKIM/CgCmVHJBd15pGLaVnTVLlaN9z48Tj2HrCOaD133OqARVyEB4G0rfLP52Cj5mxG9qkdwWxuuCmY1d7zKb40MctOud1oN+oIBnSQvyHQ//xydeH1qdbH7jGhVaQqhNk/UvQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jZ6vXeelkAnoSNQIKbA4ZmbiHVKryDzqzKjHI3cdckwBJmkGLOiUQHaf53?=
 =?iso-8859-1?Q?R90e/61ERkAjsSRiRJXJaPAB8a++SFpdayovtpOr3Dr43wk55Ee655EGt2?=
 =?iso-8859-1?Q?NBQGR6THJkVMsV8b/IYNoFGT3JmWn8/Zd5JN2PWekYL8uQh0+caUlMSIMg?=
 =?iso-8859-1?Q?crxBDjuq3R3EkXD0506HVjk4VFw7KG3HAOG/zJ+IECucVv3zwQsoek+OLo?=
 =?iso-8859-1?Q?/0nOR0SIdTAUePZwhFXIUA5weJ4cNvrUEl7sWJAE5xuzFB4l+/B+ur/JR1?=
 =?iso-8859-1?Q?frBm6OGoY7bxizbtl15W2IPyI4sAbrwnwdWjx3GLglrvEXcBEMB/gyg0JU?=
 =?iso-8859-1?Q?f9OgmkAqSbyB3/HCWY4RWcRPIzX0U4csvPs+JvTj/hSugw9yCTDvoIDmqM?=
 =?iso-8859-1?Q?BW3G4M/xmJ+Mjxybx6G9qEwXWb2nVwrd+Ez/2ga60RJWwy4HpfvwxustGe?=
 =?iso-8859-1?Q?xMajrDUX9TDd7kKW61BXYSwUWO3GDMfeM898y/xVYd3q2BZBSGxVjbFzFA?=
 =?iso-8859-1?Q?xfmI9fs2zY3zlxirZYfK5W++Utdc3dRMC9LrKqxI2ZzBxPmla1Ez21c+QE?=
 =?iso-8859-1?Q?X7OOqXWWJFl7/PZk7ciVQHcmPopdYhMQ32yJSWs9QiHkmtlxIebuZ7h4gm?=
 =?iso-8859-1?Q?EteD8K86V3vBJNaU13YiLgnKFy6mG/KUSWiDVyI6EaR0X/0R3rkMtKyBHL?=
 =?iso-8859-1?Q?hKMAJX+n6cc+XrJ5s/KC7KS07DCjB33t1QdLEZZ1seQDvcBVknEP6Z/0so?=
 =?iso-8859-1?Q?svqMq6VkZctXklxH57rHmz2hGnccTfhVR/sxGwPp+Ns3MTcEK4adLKeoL7?=
 =?iso-8859-1?Q?d8N9V58Law3W9ffU2atI85R6Wg1bvlzyH56JT82DLqqQuyWpLHheySp6cO?=
 =?iso-8859-1?Q?ekm3HFT9pSG6ROgm7OWKrSGP1xpwvyr6azjpeBxmoLEnWsEHYd/2LpkghN?=
 =?iso-8859-1?Q?JmezD4qEiRZtxxXrph98cT3PZ56sk3Qsc+Ye3jwU/vQl2hEj/0rze29St4?=
 =?iso-8859-1?Q?slfzv51fAKr7skaS+2n3w9FoT6Go8Pwwq/zzzpRcPg/fYyOUTjtAxw5q5f?=
 =?iso-8859-1?Q?KWgiP5w116k9X8ayI3l1N8/9XoxUbkI0lvHUHz6DiKO1J6h6mYHBlYJ+AM?=
 =?iso-8859-1?Q?4Lb+9W1vRKSP4mxk0oodk/fnhbzGrBofo4j3uvmfc68P0QKX4oJpf1A9KU?=
 =?iso-8859-1?Q?ZK9DCCGlDwtFeyfTtNr1dTInxYh8Oz9VhiHs0z3+PkgqGJ0J1oiiJaow0U?=
 =?iso-8859-1?Q?E2M8Pm+vrY841GHEhk4LGlrNvnxEEd6wYrLfST2drWBgj9uEN5q+oOwe4h?=
 =?iso-8859-1?Q?+KUg?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR05MB7625.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: faeb504d-bcb8-4492-5e9c-08db24bc0137
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 18:43:29.5289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB8222
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0nIeahJXrFIJPynmYStqoFu9RAnpTNcWD+jGtCZ2x4=;
 b=ut/sGV962WqljbIwYyQp7hpl0MvNm9YGvuQVyUYp6bw1mXav5f33bZptPQfEe0EoJZshUXY/irqbzWB3rm4V49wPqTEyuhjs4UXFcJN+8HEVjiq9MCKlDsDudXCkFw92weY/AYEk/I9MXTICNGpK9eLQ9UBkaxy7AJPXml8AQUXh2uNAHsK2eupQoOpxSSIzEa8PGs5H6eL97GCptA15KlDCRHJlmVSsVqIw5usX7nJwCIRUv/ybet5JkzCn8S5estyVCkUsB641dLgPBbuLg+HC9C5fl6IJ+WkC1XIY08qdHraM7eEwPTRNTnnZ0hCqvpNkBGifqlTSyikH9wyQBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=ut/sGV96
Subject: Re: [Buildroot] Forcing linker to look at right library path?
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

> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, March 14, 2023 12:58 AM
> To: C D
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] Forcing linker to look at right library path?
> =

> Hello,
> =

> On Mon, 13 Mar 2023 23:33:45 +0000
> C D <dellicker@live.com> wrote:
> =

> > I'm running in to an issue with a package linking against libubsan
> > and libasan. =A0I've figured out how to compile Buildroot so that it
> > copies those libraries to the correct output/target/lib and
> > output/target/lib64 locations, but it seems like the package is
> > linking to the versions installed in my OS (RHEL 8.7) in /usr/lib64
> > instead.
> >
> > So, in /usr/lib64 I have libasan.so.5 and libubsan.so.1, and in
> > Buildroot's output/target/lib64 I have libasan.so.6; when I boot into
> > Buildroot and run my program, it errors out because it's looking for
> > libasan.so.5.
> =

> The Buildroot cross-compiler doesn't look for libraries in
> target/usr/lib, but in staging/usr/lib. Having shared libraries in
> target/usr/lib is important for your applications to work at run-time
> on the target, but those shared libraries should also be present in
> staging/usr/lib for the cross-compiler to find them at build time.

Thanks, this makes sense.  I've confirmed that the required libraries are
in both staging and target directories.
 =

> > What do I need to do for it to point to the correct library location
> > when linking? =A0Is this a Buildroot config option, or something I need
> > to set up in my Makefile?
> =

> The answer entirely depends on which package you're trying to build.
> However, first thing would be to make sure that libasan and libubsan
> are both in staging/usr/lib. This should already help significantly, as
> it means the cross-compiler will find them.

I'm trying to build sedcli (https://github.com/sedcli/sedcli); the version
I'm building is a slightly modified private branch (added some debugging), =
but
the Makefile and configure script are basically identical.  I went through =

the Makefile and added $(DESTDIR) in appropriate locations to make the files
go where they need to, but after running a "make sedcli-reconfigure" I real=
ized
the configure script isn't taking any off options Buildroot is using to att=
empt
to make it do the right thing, and I'm assuming this is where my problem is.
The output I get from it is:

Wrong option: --target=3Dx86_64-buildroot-linux-gnu
Wrong option: --host=3Dx86_64-buildroot-linux-gnu
Wrong option: --build=3Dx86_64-pc-linux-gnu
Wrong option: --prefix=3D/usr
Wrong option: --exec-prefix=3D/usr
Wrong option: --sysconfdir=3D/etc
Wrong option: --localstatedir=3D/var
Wrong option: --program-prefix=3D
Wrong option: --disable-gtk-doc
Wrong option: --disable-gtk-doc-html
Wrong option: --disable-doc
Wrong option: --disable-docs
Wrong option: --disable-documentation
Wrong option: --with-xmlto=3Dno
Wrong option: --with-fop=3Dno
Wrong option: --disable-dependency-tracking
Wrong option: --enable-ipv6
Wrong option: --disable-nls
Wrong option: --disable-static
Wrong option: --enable-shared


> =

> Best regards,
> =

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootli=
n.com%2F&data=3D05%7C01%7C%7C949137e634e94cd4b4dd08db2461e466%7C84df9e7fe9f=
640afb435aaaaaaaaaaaa%7C1%7C0%7C638143775080541793%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7=
C%7C%7C&sdata=3DzeXwvCO%2Fuj%2FGysbE7uhyVKJfrFA6dGa0cMe%2B5yQvh2I%3D&reserv=
ed=3D0

Thanks,
Chris
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
