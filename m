Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FA5C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 08:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55A3A40128;
	Fri, 27 Jan 2023 08:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55A3A40128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQurzpZ3JRU5; Fri, 27 Jan 2023 08:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC0341773;
	Fri, 27 Jan 2023 08:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC0341773
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4B81BF363
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3340611FC
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 08:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3340611FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6p6hSQThpLvV for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 08:35:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09AEC610EB
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2074.outbound.protection.outlook.com [40.107.241.74])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09AEC610EB
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 08:35:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCgOrtBaqCb1xkGoCpmvD0cxonYTM8Za/+GU2au+DGT+PfyA1Lc6EIfXaEX/ecmSS4a7eQG78wtzoAP6g2s1f8iA0F04kbiOL8LbiyP0saln2Wrvh6d8p7G3KMt6Ni3dfXMPrtrldiz6ET22GS3r0cNjFusPDPpfYDn9iExQHSQ+X5P3JxBmnYjlaH/XDa4HWXUdZSN9agEl7eNKfejm6mUgJKfgxJAnu11smzMf3zIUdJStnvd5u6rFKGHBlGYj6lbt8z76Kt4VKpS6LjGNN5cqWhtIExzgKnhO30894bfM7hnKmEzjMUpPKxpmqz+R+NfatbzNATM5e4+/y4D7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4kqhw3nYyXZeJo7FnqPhw4PuZVR7P+zQlYrA4DZY2E=;
 b=dUdOQ3LMBTefPOW9BvlD5q7oAfP5zs/NypvgkB3EtnX99U3ETq078zfXwlcPfb63qQ/j5TK+atPA6K0lYLUKevMbvHWWsIaSncv1Hds9Aumo6crJ3RPbnFf0oPjjAqxDu6ZsLIxJ57EGHON+2S3e02nXLtdyt3f2GVdHNEOFeq89s75aZYkBYwbmDuyW5KIrhxH2zNgr7VMnbApmgQIxdTds+1P1Xuxrm0onlM4vV4aiDhYM/vNkVBKQ2KpCm1LssUaJs/SN8TtwNBzGObbGg9Sy+2AuZFZl40j1PQT2A92MfJCuJi/4f0Nw1m2Z89Qm5bsqplUtXmkBf3abxB2fJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM0P190MB0580.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:198::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 08:35:24 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::a6aa:bd17:e838:b0b0%3]) with mapi id 15.20.6002.033; Fri, 27 Jan 2023
 08:35:23 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2 8/8] package/tensorflow-lite: new package
Thread-Index: AQHZA1Nem7Tp5Yyy/k6Ow0lp3YVF6a6X3SCAgBXIXoCAA5yIAIABClLY
Date: Fri, 27 Jan 2023 08:35:23 +0000
Message-ID: <VI1P190MB0493634951C64EA9E4EF935B9FCC9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
 <20221128175851.1913859-8-james.hilliard1@gmail.com>
 <CAKcgs2xSo=YxmzpOA=eim5m9KOJ1sqasMJE1y4UCBJQ-0hs3qg@mail.gmail.com>
 <CADvTj4p4iYxqBY7wzKkcE3AZHaDNa_1oC9g0B0wmCt1Z1b4Nyg@mail.gmail.com>
 <AM5PR06MB3153FAF7691F764122FD9A5384CF9@AM5PR06MB3153.eurprd06.prod.outlook.com>
In-Reply-To: <AM5PR06MB3153FAF7691F764122FD9A5384CF9@AM5PR06MB3153.eurprd06.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM0P190MB0580:EE_
x-ms-office365-filtering-correlation-id: 6a336686-1f65-4282-be66-08db00416f09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vw3MFzwbThXnMoq+w3J3QdsbYgBdaVPvx3cLtGe524PKeL4EHNt6G2kHg6gnYPphTIDn5/BNBrhR3woL9b1ScXUXr+gT2aiv/C70LbYcgbT6ZDHjHkmGzzpzm9Uky3eebN3k97za6GFEw01lex3bhpDHlGuzfhhs84vIHzatE8QOUpJ0PBQIBMwNi2NDDn3M69HRJdyohMECLMn27ce2BT/Qd9HN8nGVaZTY8XHkfqieJsthLm8GNkEPC5gk9h7fiDtmpJCgwd2LwcRgbjs6S1ZlfovhqKUH6lHbcjSnCg6rH5URXxRRbcQWftxRuahAUOOo29ufRMdDE0wek9w/zZAkcdFmv+8+yD3L9zXhe8WlWlSrCfQa7y5X1QbpwyUkGRAPy87XK3ZUb19zKUXHWinXAhaWfouolKjFqYjceTeaivei9ZwK3ytdqe4YrZnIOO6i77mUzlInUYC+VPYK+92lBag4sg8+iew9+UO9y8SGZHUv3Rdx+bCB15dNwghaEHPLn+SokPLYPDlAsakn2587koPASw7M1/DxYiw2oyoc/eXVdUMHIPspLOSRmNuWpTAWjau4Klcav9nbEmNFlnZrBC6kzPIfokb2+9oZjGBffy+67FBu8wGvMg+BMMZxM2+gIe3EiPSy0KvQ+6YM2XtkRKiDXJRZRgZuI5Jas/YGJWNhvc7QhlBU5bDlfhZrdJVbeGM7BPyIWFuodAZcPH0EXDI44o7dgO4pqTn3CUE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39840400004)(136003)(366004)(376002)(346002)(451199018)(26005)(186003)(9686003)(6506007)(53546011)(83380400001)(38070700005)(33656002)(55016003)(86362001)(38100700002)(122000001)(66574015)(52536014)(8936002)(41300700001)(66899018)(2906002)(5660300002)(966005)(478600001)(71200400001)(7696005)(76116006)(66946007)(316002)(4326008)(6916009)(66446008)(66476007)(66556008)(64756008)(8676002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?i4O3z2vvU8sT/Z2hoFpvX3gL6yUoG4VnmRA8x6OwLVupam8nJ5ONLeE776?=
 =?iso-8859-1?Q?fu+6s+Y1wqJX8smklizE/rKCXk+k8DT9BcX+TFtcoCuEapK+Jk1ZQm/9uJ?=
 =?iso-8859-1?Q?OzUuvR/hNwdvlxYM0K6NpuBuHk+D33LbUw/X7ybc7tAZpREm1V2Dtf3v9/?=
 =?iso-8859-1?Q?NywfCfJJ0Pjd2woh/+oFNsUPofGlZkOzu20aXEbUt7emvYp2PajxoJi/x4?=
 =?iso-8859-1?Q?qkKc+TUVLIsn3Ld8PRkmB6g6PzojEzqg1KjMaQxM3eWNThFgR3x+lblEaN?=
 =?iso-8859-1?Q?YXriIL9/PDORFDfMLtm0CrxTn492kyBsWJLinMWJ9omYxkSMl86YCgOnHU?=
 =?iso-8859-1?Q?Ew/8/cF6RKIV8Ia9gdd018gH6jHTrieC4wlD/sPQrSvzjQkVX2IGPinjEO?=
 =?iso-8859-1?Q?BrRSjma3U8G78soFMQrq0zuZcmXMwRB0T5dKblpsIT8wNsSdO0WMYs6olw?=
 =?iso-8859-1?Q?lmxon7JoKAk0OxXiTUVSbMFi3DGbXPbiX3pVYjWvlgi/PNx+yC2u/3OIhi?=
 =?iso-8859-1?Q?H6WHt902TVeFgC9AYuKQzKa5+jW5NB1R7+3wARMcgRpVX+9qryWxnL5QBg?=
 =?iso-8859-1?Q?BEwoCTg8kLb1Cv51vNykFaNqLi1Zbz1htkXZTPSDAfHXFLu0poN5DKrnlA?=
 =?iso-8859-1?Q?oR+GzbbUAzgSH/lHUj3+VPOWu3N011tP+cYEIXBSYpn+Srw5tayD6LGGNH?=
 =?iso-8859-1?Q?cUD84RLnr6wWtw2caFERuqPYdIet+IHP3xvKTMDACyOOXeaL7LxTAxx8bU?=
 =?iso-8859-1?Q?b2r3J4pnSGV9Yob/Vz3TztN8As7DN0U9I8mZjue2ysL/3q2A/i/3XRsvQt?=
 =?iso-8859-1?Q?JcmI1/NoJLEeMJ86qNrv9MNPm2cuJz8M3iTg6Dt+z1YcaV8aunnJrOMmIT?=
 =?iso-8859-1?Q?uvNm2xIV06Tf/zTXA+5GfiOrKqKbz7ivDTGDfZXslH+t0Wf9+9zIWlKWRZ?=
 =?iso-8859-1?Q?RtMaIjiE3czKh5BW5lMEX8wP8VPt++OIcM4RaZ99XsNWy7JoLamE0jwm7F?=
 =?iso-8859-1?Q?2OJ2um5w2Q55SHlunLKulJwQDybuamWU5qcOfbQ8GxwmYtNbVJ2DaxpnaO?=
 =?iso-8859-1?Q?StSUWLxMn8FgML/S+fegrdJ0uEWpDbtmMpo0pteCIh3OO6sCDlj6bX41uc?=
 =?iso-8859-1?Q?igZfw50A46EncQdgWKNh3fo7/3dLVy4q7ORTengNnsW5ISV7eAZMTMsmeM?=
 =?iso-8859-1?Q?k9RUHzTAg5Bsg9Jq4s/lLHnWDdEdVNPYViCKaKaJ7NN2LqqZezB4X3qi63?=
 =?iso-8859-1?Q?MEZ0Qw9ejqXUtG9dM9ZSa5ecnx1+YFtxij9G+oAQ8ODw5El8bN8tDu2KOT?=
 =?iso-8859-1?Q?4cz9SHgM5f0VtZzyxldHYxC/Ij53R/sBWhyBXWnpCgGHv1utu4Xf9og2GX?=
 =?iso-8859-1?Q?IuFm2U/dwAB5RLIjhJBR10JmceI/6ORlZt3p8IwzdxqrjylQlkOzT+xg2l?=
 =?iso-8859-1?Q?usBgTjf2mecSPemmFm3m+eVKhQesbFas8xq6xKqQuY12oHZDhp4lyQuCJF?=
 =?iso-8859-1?Q?g524VMIJBpLpVh30BFl5ZDQjQsCWF3At6/qbGrwjOpXwY2YZe9bYyxfXc7?=
 =?iso-8859-1?Q?20lonyntm3ArWX9SwpqIHh44nvFThWT9RZR5jTMFPItC7nfcEDLKxHevFL?=
 =?iso-8859-1?Q?urBxY1jBYnv9Y=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a336686-1f65-4282-be66-08db00416f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 08:35:23.8215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hh8C/mH8d9k3J48+f0lm6fxFvgl1VBwo1IOwdQRdoUh99hnm+dQXdsrfl330qErigtXKemNwqmWnhZ5KEBF+lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P190MB0580
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4kqhw3nYyXZeJo7FnqPhw4PuZVR7P+zQlYrA4DZY2E=;
 b=SjIXwXmWhnF7PKTeOsDraN+cCwnFSlv+VifDduuenckFiuZ0wFBb0WLzEjUKHI82eGWZNe8+P+1DQVTJMLaJj6W8DLLTA/gEhGG/rlw4d3b+mngRlRkpBYyYuzkFRC/5kdmZ4ceCAwfmSxv67ETOk9tADfsV9bshtJQwQVFUn0U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=SjIXwXmW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: Re: [Buildroot] [PATCH v2 8/8] package/tensorflow-lite: new package
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Hager Stefan <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

> > From: James Hilliard <james.hilliard1@gmail.com>
> > Sent: Tuesday, January 24, 2023 10:27
> > To: Gilles Talis <gilles.talis@gmail.com>
> > Cc: buildroot@buildroot.org <buildroot@buildroot.org>; Hager Stefan <St=
efan.Hager@ginzinger.com>; Samuel Martin <s.martin49@gmail.com>; Fabrice Fo=
ntaine <fontaine.fabrice@gmail.com>; Thomas Petazzoni <thomas.petazzoni@boo=
tlin.com>
> > Subject: Re: [Buildroot] [PATCH v2 8/8] package/tensorflow-lite: new pa=
ckage
> > =

> > On Tue, Jan 10, 2023 at 5:49 AM Gilles Talis <gilles.talis@gmail.com> w=
rote:
> > >
> > > Hi James, Hi Stefan,
> > >
> > > fyi, I could build and successfully test tensorflow lite on an aarch64
> > > platform with Cortex A53 cores.
> > > a few comments though.
> > >
> > > Le lun. 28 nov. 2022 =E0 19:00, James Hilliard
> > > <james.hilliard1@gmail.com> a =E9crit :
> > > >
> > > > From: Stefan Hager <stefan.hager@ginzinger.com>
> > > >
> > > > This package adds the tensorflow lite runtime to buildroot.
> > > >
> > > > Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > ---
> > > > Changes v1 -> v2:
> > > >   - fix label_image build
> > > >   - more explicit cmake config
> > > > ---

[SNIP]

> > > > diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow=
-lite/Config.in
> > > > new file mode 100644
> > > > index 0000000000..9231d674bd
> > > > --- /dev/null
> > > > +++ b/package/tensorflow-lite/Config.in
> > > > @@ -0,0 +1,32 @@
> > > > +config BR2_PACKAGE_TENSORFLOW_LITE
> > > > +       bool "tensorflow-lite"
> > > > +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
> > > Can you please add to comment that explains why this version of GCC i=
s needed?
> > =

> > I'm not sure why this is, maybe Stephan Hager can clarify.
> =

> The Tensorflow-lite build documentation for cmake on ARM uses gcc.arm.8.3=
 in their example. =

> BR offers the GCC Variables BR2_TOOLCHAIN_GCC_AT_LEAST_8, BR2_TOOLCHAIN_G=
CC_AT_LEAST_9 and ships with GCC 10/11/12.
> So choosing BR2_TOOLCHAIN_GCC_AT_LEAST_9 seemed a good solution to me. =

> Since i do not have prebuilt GCC8.0...GCC9.0 on hand selectiong 9 as mini=
mum would be safe.
> =

> I tried setting to BR2_TOOLCHAIN_GCC_AT_LEAST_8 in the config and run the=
 'utils/./test-pkg -a'. =

> Only 3 out of 44 possible toolchains were used for testing (the same as w=
hen using BR2_TOOLCHAIN_GCC_AT_LEAST_9), =

> but none of them uses GCC 8.
> =

> Maybe someone can test and proof that it also works with GCC Versions < 9?
> =


I successfully compiled and tested v3 of this patch series.
tensorflow-lite and the label_image example build for armv7
with GCC 8.4 and GCC 7.5.
So I guess BR2_TOOLCHAIN_GCC_AT_LEAST_7 should be enough.
The justification for GCC 7 being tensorflows need for C++17.

> > =

> > >
> > > > +       depends on BR2_TOOLCHAIN_USES_GLIBC
> > > > +       depends on BR2_INSTALL_LIBSTDCPP
> > > > +       depends on BR2_TOOLCHAIN_HAS_THREADS
> > > > +       depends on BR2_SHARED_LIBS
> > > > +       depends on ( BR2_arm && BR2_ARM_CPU_ARMV7A ) || ( BR2_aarch=
64 && BR2_ARM_CPU_ARMV8A )
> > > > +       select BR2_PACKAGE_CPUINFO
> > > > +       select BR2_PACKAGE_EIGEN
> > > > +       select BR2_PACKAGE_FARMHASH
> > > > +       select BR2_PACKAGE_FFT2D
> > > > +       select BR2_PACKAGE_FLATBUFFERS
> > > > +       select BR2_PACKAGE_GEMMLOWP
> > > > +       select BR2_PACKAGE_LIBABSEIL_CPP
> > > > +       select BR2_PACKAGE_NEON_2_SSE
> > > > +       select BR2_PACKAGE_RUY
> > > > +       help
> > > > +         Tensorflow Lite dynamic library and headers: Inference en=
gine to run previously trained machine learning models.
> > > The text is too long. Please run "utils/check-package" to see the
> > > warning that it generates.
> > =

> > Fixed in v3:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20230124092235.806=
969-8-james.hilliard1@gmail.com/
> > =

> > >
> > > A couple of suggestions:
> > > 1) would it be possible to add an option to build and install the
> > > label_image example? It is always handy to be able to test this
> > > package once it is built.
> > > 2) would it be possible to add an option to build and install the
> > > benchmark_model tool? This tool provides useful performance
> > > information.
> > =

> > Not sure there's really a good way to do this without adding a config
> > flag upstream.
> > =

> > >
> > > > +
> > > > +comment "tensorflow-lite needs needs a toolchain w/ gcc >=3D 9"
> > > > +       depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9
> > > > +
> > > > +comment "tensorflow-lite needs a toolchain w/ glibc, C++, threads"
> > > > +       depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTD=
CPP || \
> > > > +                       !BR2_TOOLCHAIN_HAS_THREADS
> > > > +
> > > > +comment "tensorflow-lite needs a toolchain w/ shared libraries"
> > > > +       depends on !BR2_SHARED_LIBS
> > > > +
> > > > +comment "tensorflow-lite in buildroot currently only supports arm =
+ armv7a cpu or arm64 + armv8a cpu targets"
> > > > +       depends on ( BR2_arm && !BR2_ARM_CPU_ARMV7A ) || ( BR2_aarc=
h64 && !BR2_ARM_CPU_ARMV8A) || (!BR2_arm && !BR2_aarch64)
> > > > diff --git a/package/tensorflow-lite/tensorflow-lite.hash b/package=
/tensorflow-lite/tensorflow-lite.hash
> > > > new file mode 100644
> > > > index 0000000000..7d9035707b
> > > > --- /dev/null
> > > > +++ b/package/tensorflow-lite/tensorflow-lite.hash
> > > > @@ -0,0 +1,4 @@
> > > > +# Locally calculated
> > > > +sha256  99c732b92b1b37fc243a559e02f9aef5671771e272758aa4aec7f34dc9=
2dac48  tensorflow-lite-2.11.0.tar.gz
> > > > +# License files, locally calculated
> > > > +sha256  71c6915d04265772a0339bed47276942c678b45cc01534210ebe6984fd=
1aec65  LICENSE
> > > > diff --git a/package/tensorflow-lite/tensorflow-lite.mk b/package/t=
ensorflow-lite/tensorflow-lite.mk
> > > > new file mode 100644
> > > > index 0000000000..1f75f3813c
> > > > --- /dev/null
> > > > +++ b/package/tensorflow-lite/tensorflow-lite.mk
> > > > @@ -0,0 +1,49 @@
> > > > +##################################################################=
##############
> > > > +#
> > > > +# tensorflow-lite
> > > > +#
> > > > +##################################################################=
##############
> > > > +
> > > > +TENSORFLOW_LITE_VERSION =3D 2.11.0
> > > > +TENSORFLOW_LITE_SITE =3D  $(call github,tensorflow,tensorflow,v$(T=
ENSORFLOW_LITE_VERSION))
> > > > +TENSORFLOW_LITE_INSTALL_STAGING =3D YES
> > > > +TENSORFLOW_LITE_LICENSE =3D Apache-2.0
> > > > +TENSORFLOW_LITE_LICENSE_FILES =3D LICENSE
> > > > +TENSORFLOW_LITE_SUBDIR =3D tensorflow/lite
> > > > +TENSORFLOW_LITE_SUPPORTS_IN_SOURCE_BUILD =3D NO
> > > > +TENSORFLOW_LITE_DEPENDENCIES +=3D \
> > > > +       host-pkgconf \
> > > > +       host-flatbuffers \
> > > > +       cpuinfo \
> > > > +       eigen \
> > > > +       farmhash \
> > > > +       fft2d \
> > > > +       flatbuffers \
> > > > +       gemmlowp \
> > > > +       libabseil-cpp \
> > > > +       neon-2-sse \
> > > > +       ruy
> > > > +
> > > > +TENSORFLOW_LITE_CONF_OPTS =3D \
> > > > +       -Dabsl_DIR=3D$(STAGING_DIR)/usr/lib/cmake/absl \
> > > > +       -DBUILD_SHARED_LIBS=3DON \
> > > > +       -DCMAKE_CXX_FLAGS=3D"$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/us=
r/include/gemmlowp" \
> > > > +       -DCMAKE_FIND_PACKAGE_PREFER_CONFIG=3DON \
> > > > +       -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
> > > > +       -DEigen3_DIR=3D$(STAGING_DIR)/usr/share/eigen3/cmake \
> > > > +       -DFARMHASH_SOURCE_DIR=3D$(FARMHASH_DIR) \
> > > > +       -Dfarmhash_DIR=3D$(STAGING_DIR)/usr/lib \
> > > > +       -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \
> > > > +       -DFETCHCONTENT_QUIET=3DOFF \
> > > > +       -DFFT2D_SOURCE_DIR=3D$(STAGING_DIR)/usr/include/fft2d \
> > > > +       -DFlatBuffers_DIR=3D$(STAGING_DIR)/usr/lib/cmake/flatbuffer=
s \
> > > > +       -DNEON_2_SSE_DIR=3D$(STAGING_DIR)/usr/lib/cmake/NEON_2_SSE \
> > > > +       -DTFLITE_ENABLE_EXTERNAL_DELEGATE=3DON \
> > > > +       -DTFLITE_ENABLE_GPU=3DOFF \
> > > > +       -DTFLITE_ENABLE_INSTALL=3DON \
> > > > +       -DTFLITE_ENABLE_MMAP=3DON \
> > > > +       -DTFLITE_ENABLE_NNAPI=3DON \
> > > I thought NNAPI was used in Android. Can you explain why it is requir=
ed here?
> > =

> > Disabled in v3:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20230124092235.806=
969-8-james.hilliard1@gmail.com/
> > =

> > >
> > > > +       -DTFLITE_ENABLE_RUY=3DON \
> > > > +       -DTFLITE_ENABLE_XNNPACK=3DOFF
> > > any reason why xnnpack is not enabled? It would be great to enable it
> > > as an option.
> > =

> > Mostly since it's not a required dependency and haven't added the
> > dependency yet. Will look into adding that as a followup once this is
> > merged.
> =

> I agree, it would be a nice addition, but not a necessity for the initial=
 merge.
> =

> > =

> > >
> > > > +
> > > > +$(eval $(cmake-package))
> > > > --
> > > > 2.34.1
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot@buildroot.org
> > > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > > thanks
> > > Gilles.
> =

> Regards,
> Stefan

Regards,
Daniel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
