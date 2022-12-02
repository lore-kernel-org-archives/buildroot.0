Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2A6C4321E
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 13:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE8341B8B;
	Fri,  2 Dec 2022 13:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE8341B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MrsllvWo2h9; Fri,  2 Dec 2022 13:47:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E688D41B8D;
	Fri,  2 Dec 2022 13:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E688D41B8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6323F1BF293
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 13:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FC7E82182
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 13:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC7E82182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uD_mFVf_ddFs for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 13:47:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9A2C8202B
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::621])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9A2C8202B
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 13:47:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQKqr5jt280JL7J28hHBIK2kQfZYrYnNl8PcUaOXbpL7qhWQdHUzzZpzcsmpDCKg5FfdrcFyvKgeBLZT7RSyp288BSYcU+BAhqI1i2qoOkXlIEtfd7BfXdp7jH8lwBnAFUa+wQ/HwHB95TQJuAtQWYy4qT2M8w7jbamqdjG/MmuGKT36Ne1fpa6i/fEly9+2kpTGxZsH/ppEH8zzdMhVvL2eNr9UyNZTUYthPt/IKAh8FqqslrEMxXRsoDDOQ1EvULyrdYqXPW6GjRwW+p3s6jR1OmRCcerka6YfvBE5T9qRWIHqxkR755mjwfYeWGeZoHtTegoDjM9aRTBUdHV8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9nBoSUJT+dIKietOcTTOo4Qpl0qzmqjd6mXh0nQoyA=;
 b=C6mD5Y74Yysn2aVzxWfxCKp4tZntgJPExG/5qF+edDbzzM558C43Bs3oRVuddlGOtEYox+8B/C8YsmmC/HpSCxy9K/iGmC21UEfDR29NX/M0DKCqaNcnB0Ih9GOFD4/UdMwwD0ixZd3hiLEjrpPqQBMsIT4L2U6Wvkzd9wuGFah/A3CurzIj16bDQFmOCWgYF48KQa/eDquAF3Bt0Ll3vAf4eRrTMq6wRqamR2i69mUF2qRcrj9eY/yL+T+lqhHCsrIicqnxyylIELD8MjGnfnYOXD7eDau2+8GM8bXll0qDWlkDMpBtaWjYOoSYoLBkyhHT8iGbGhpSow1Ms7ebrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 by DU0PR08MB7589.eurprd08.prod.outlook.com (2603:10a6:10:31e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 13:47:38 +0000
Received: from AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9]) by AS8PR08MB6870.eurprd08.prod.outlook.com
 ([fe80::55e2:7130:f584:9eb9%7]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 13:47:38 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thread-Topic: [Buildroot] [PATCH] support/download/dl-wrapper: make the whole
 dl_dir writeable for the group
Thread-Index: AQHZBMHgD6bhKwuAQkW/uxKBP8W5/65ZfLoAgAEa0+I=
Date: Fri, 2 Dec 2022 13:47:38 +0000
Message-ID: <AS8PR08MB6870CBA6B56FA36972D523AA81179@AS8PR08MB6870.eurprd08.prod.outlook.com>
References: <AS8PR08MB6870E377EFDB1E28448EBF5581049@AS8PR08MB6870.eurprd08.prod.outlook.com>
 <1669815827-23415-1-git-send-email-luca.pesce@vimar.com>
 <20221201202558.GB978091@scaer>
In-Reply-To: <20221201202558.GB978091@scaer>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB6870:EE_|DU0PR08MB7589:EE_
x-ms-office365-filtering-correlation-id: b39e3045-b48f-4334-d433-08dad46bc698
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hI6Dx37DN1kSLpKjpuf+7OMMUiXE/sOWzqLRQpvHUt0yLjAixhdjiBqWzB8rJS2QZywfZVwXv02NjL0/6bXlRSjC6pFuRG6tc+2yRVkgXn/HDoW0w2ZBY5XxUx/XJAdmzgNidZKlD3rdJEANbry7EGsk8NjjwklnXHHox8oEdomMF5DwzM8KK3pRMXUTZVgCQH1+jw+gB5fol2zee0o3l+xYUoKanZQTw1KYAyp8wocCm3VKiDoGNRHs2PpPekmuXytXMtXnBWKBbTIJBWPKrpj+L/IYLmJEeRT7ovxClQLXFSClpMg8CHuiEYvbeJM9Jm/rVZqach+SncABEuU1xCSsbYuVKdzYm9pGMuOSEdJLNG2+gSpRI/8mC/YXf0HYFVciKawPDtMRBnpnMnEFCNp95Ux9Lsn86M13bFwI7tGITYHm4Q5QEZSkRgEjNuOAuH0WEcbQtC86BQ8ANfL4Xcj0jpS2BeOcFVo8w1gFCKPestMfb5PEBX2P0JfHwVWunOpmSy7zKZ98j0jmaL2vQLZ/yTiaKGfGf5I/F5+qrqlSS2xCCKQwtmsdV7mTUeQ8NIv07I7uiH6Q/zQVDH8ejr6Q1hCq2SBwCU333PwYHdwI7Xt0yuBIZALp/b4Tk9Ep/spWHuCrdENlag4/JvqWrwJ4yr56TqqUJhsPEl/WrgVDv/ff4HodyTv8xnBtieoZEcujU5GQZbZW6zCq2Zp9DxgS3EHgJp6DPojIDYcKecEokt+Knwiiucm91zOYpSLKfA3LE7VMUbkZkQgT1w20so85Pd/83tv7X/8sS5N3G6g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB6870.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199015)(6506007)(9686003)(6916009)(26005)(71200400001)(478600001)(7696005)(186003)(316002)(122000001)(38100700002)(38070700005)(55016003)(86362001)(33656002)(66476007)(83380400001)(4326008)(66446008)(66946007)(64756008)(8676002)(91956017)(5660300002)(66556008)(52536014)(8936002)(41300700001)(76116006)(2906002)(4001150100001)(21314003)(41080700001)(15866825006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PZzDmUnKKr3cTwkvfps9abzwxUD+5afhk/aDpAuSx6W1U6Uhdd01c6eA8N?=
 =?iso-8859-1?Q?0hCav5EkE9nOknzkUg9nMPO9ZX5soBaA6+FB6C552DqtzphlZ0ej3zPBre?=
 =?iso-8859-1?Q?k6dat+GcYn54NWxLsEYQQYP0yHy8+ivK5AgGIHYIbZ3R1qf85PiZWKjUN4?=
 =?iso-8859-1?Q?BfmwmIMpzSoaZnpZELcgUGLavajac/W/OZNhD/iTgoWfZN+4YDB//5uu0+?=
 =?iso-8859-1?Q?2Xrw2RD3eocw00GSwKmr/SCHDpVw+WLugXuTiKPYQwEZYbPTyqE0BgNB2b?=
 =?iso-8859-1?Q?XFCve1Ii21JhOnLwbt+rqhXE0OL9kk9/OztsHAy3aZaXKJ5XEWmyPui9ju?=
 =?iso-8859-1?Q?DiArwVPIrZ8muuQ99HI0cxaPs+dg2wF2DbQ2hD254eWNQwD74tqKAVk6/D?=
 =?iso-8859-1?Q?fVeThQ5MsluZ8nPtf7F1pfXP3oVMfgnrUS6D9L4Gs4lRYBE4Tkggqw03Cc?=
 =?iso-8859-1?Q?ojbKQsfoGROUk4PJ6hQrTlpl5JEPywoTbYBbiS/MnS01k4lGajGUYuK3h3?=
 =?iso-8859-1?Q?fKYDA/hsK6gSld7hZV25hnBLeTFhC2Qj9T66oLtyQqVM4+QTPzy6Cw+PTf?=
 =?iso-8859-1?Q?tO4qYGEz4Nq+LL32cJmRkiNsmJRTpdwO/2UHUayLnRNy5ueipnfmfLrztL?=
 =?iso-8859-1?Q?q7c6Unu6b+jPEa3HBXSWd+pZOli2Ix3ZW0CbyCOPf1CWZ1dSgxZ5YKVdUc?=
 =?iso-8859-1?Q?84d7RXecENFSsvWCPTpXEVuIXeipPcRsuYcMnNgXDzX0egj5lpUU8rODbo?=
 =?iso-8859-1?Q?fFw+2eciuC0BfW89/u7MbCQV8XizGMyiyq+g7xCOJLj5pYWP37DOnCDrAF?=
 =?iso-8859-1?Q?RqorvxlnCygX0F/3qRGf7qhha85lEn64y/WZNhMjP2jl4l3ChtAljt1zmK?=
 =?iso-8859-1?Q?yorVsASM3w77HmRWIivQPGRXrBti1jHVfFObPRhiiBGxVqvV8CnNMUDFpl?=
 =?iso-8859-1?Q?mO/GYA4E61DigsG2DcMYGzFY7srPcpdxiPvWHiDmvn+phC5Enem8syG/41?=
 =?iso-8859-1?Q?wJ9QrTMHGM647Sg94ucTe+u7UmbFXsqvCwhs1cjec6/dYCW7NTgAhv8TRL?=
 =?iso-8859-1?Q?xEk0o8ODvQY+BYvFY7s73xOgX0t5/rUnNXrZM+6hzz5qQeXm0zpiusY2oi?=
 =?iso-8859-1?Q?rxmpTiP8GwrEg6BpzDhwAc25GvnEf/mKcc4ZSEK4dD8xXux1kcC6NoTrTN?=
 =?iso-8859-1?Q?hADoLVS/LlXcWSaTvA/zJnlCiZLDWxXVqBxC4vCHwRgAih17Guf1h71wXk?=
 =?iso-8859-1?Q?BkrVxB5V4SQbYsVwufeQC9uXIu3GpgpSyfUfznAD/HZQP4QHwIDnya31Qk?=
 =?iso-8859-1?Q?piNPUCoJpfC2YRLNwgSwmha+djNaDm6IDM+PUJoa5STt/4ualhecbh1T60?=
 =?iso-8859-1?Q?IfStF2/y92xIKdbn6RV+0NAlpkN2mslGsMou1E9PN0esaWutbbuPy1nQTV?=
 =?iso-8859-1?Q?0mzWyoJnghiA89/yr32wZYIyPb3voVV0F4dNQY10lK7nOjnjfcUscoHz63?=
 =?iso-8859-1?Q?qIOz1xw9OfCV1Nj+j8+Jw+gOwPQf2Rg0v3P06jOZhIhAFFOJEtMeNlt56U?=
 =?iso-8859-1?Q?SgWXxB7C7GwzcNC8Vbb/Bn7I4SnMhTXYDte4YSGnV9HyqApu5S8wSIWJU+?=
 =?iso-8859-1?Q?ij+R6ENHjIUEjgtGFIIN4t2oqVpYuURguZ?=
MIME-Version: 1.0
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6870.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39e3045-b48f-4334-d433-08dad46bc698
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 13:47:38.4215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoe8RM95PGUXJ7IEYOumsD98RyxBVB4kRoKVCabwldojewwQM5T/GD5vvqhwKueoSjid9VcOwM4lig0gQQHU2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7589
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vimar.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9nBoSUJT+dIKietOcTTOo4Qpl0qzmqjd6mXh0nQoyA=;
 b=FQbEoL4h35qsc8vvKsIES2ybg1K4SJ9quk6fGK2/BSPvS2UjSdCUx52V+MeHCY4XJ1vM2njBpL7PEiG4k/D3xniA2yuQACEcgwwlF49Lx17BlScQs2XC+cAZ76VGGnU0a6iOKLUphbR3Q8w8BAsDrzE7VbmaYX4OOvmyxecMKOo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vimar.com header.i=@vimar.com header.a=rsa-sha256
 header.s=selector1 header.b=FQbEoL4h
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vimar.com;
Subject: [Buildroot] R: [PATCH] support/download/dl-wrapper: make the whole
 dl_dir writeable for the group
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
From: Pesce Luca via buildroot <buildroot@buildroot.org>
Reply-To: Pesce Luca <Luca.Pesce@vimar.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

> Da: Yann E. MORIN <yann.morin.1998@free.fr>
> Inviato: gioved=EC 1 dicembre 2022 21:25
> A: Pesce Luca
> Cc: buildroot@buildroot.org
> Oggetto: Re: [Buildroot] [PATCH] support/download/dl-wrapper: make the wh=
ole dl_dir writeable for the group
> =

> Luca, All,
> =

> On 2022-11-30 14:43 +0100, Luca Pesce via buildroot spake thusly:
> > Root makefile imposes 'umask 0022', which means that every file/folder =
in
> > the per-package download directories has no write permission for the gr=
oup.
> > These are writeable just for the owner - the user that issued the first=
 build
> > that populated the per-package dl dir for the first time (say user A).
> > Thus, if a BR package changes its version (e.g. for buildroot update), =
and
> > another user (say user B, in the same group of A) starts a build, BR fa=
ils the
> > creation of package-xxx.tar.gz inside the dl dir, because user B has no=
 write
> > permissions on that path. Furthermore, in the case of the git backend, =
this
> > makes the git cache not updatable by a different user.
> >
> > So, to allow sharing of a rw BR2_DL_DIR location among users of the sam=
e group
> > on a host machine (e.g. a build server used by many users, all belongin=
g to a
> > certain "developers" group), set group write permission to the whole pa=
ckage
> > dl dir.
> >
> > Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
> > ---
> >  support/download/dl-wrapper | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> > index 09a6ac1..b7a4319 100755
> > --- a/support/download/dl-wrapper
> > +++ b/support/download/dl-wrapper
> > @@ -190,6 +190,10 @@ main() {
> >      new_mode=3D$(printf "%04o" $((0${new_mode} & ~0$(umask))))
> =

> This code was written before we enforced our umask, so it is now indeed
> incorrect (at least, the comment above is misleading).
> =

> >      chmod ${new_mode} "${tmp_output}"
> >
> > +    # Make the whole dl_dir writeable for the group, so other users wi=
thin
> > +    # the group can download new versions and update any vcs cache in =
it.
> > +    chmod -f -R g+w "${dl_dir}"
> =

> But what if the user initially had umask 0022 to begin with? By forcing
> the group authorization with the chmod, you are overriding the user's
> umask settings, which is not good... I for one would not want to have
> group-writable directories (or files) created when I would have not
> expected it.

Yes, I can agree with this. However, BR already overrides the user's umask,
and, at least in my case (umask=3D0002), this changes the user's default,
denying g+w by design.

> =

> Instead, what about something like:
> =

>     diff --git a/Makefile b/Makefile
>     index 827ab230ef..949f27f1eb 100644
>     --- a/Makefile
>     +++ b/Makefile
>     @@ -83,10 +83,15 @@ $(MAKECMDGOALS): _all
>      _all:
>         @umask $(REQ_UMASK) && \
>                 $(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
>     +                   BR_ORIG_UMASK=3D$(shell umask) \
>                         $(MAKECMDGOALS) $(EXTRAMAKEARGS)
> =

>      else # umask / $(CURDIR) / $(O)
> =

>     +# Save the user's original umask, as we may need it later on, like
>     +# during the download dl-wrapper
>     +export BR_ORIG_UMASK :=3D $(or $(BR_ORIG_UMASK),$(shell umask))
>     +
>      # This is our default rule, so must come first
>      all:
>      .PHONY: all
>     diff --git a/package/pkg-download.mk b/package/pkg-download.mk
>     index 0718f21aad..e9dfec635d 100644
>     --- a/package/pkg-download.mk
>     +++ b/package/pkg-download.mk
>     @@ -107,9 +107,11 @@ endif
>      #
>      ####################################################################=
############
> =

>     +# Use user's original umask, in case they have provisions set to sha=
re
>     +# the download directory with their group (or the whole world).
>      define DOWNLOAD
>     -$(Q)mkdir -p $($(2)_DL_DIR)
>     -           $(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
>     +   $(Q)umask $(BR_ORIG_UMASK); mkdir -p $($(2)_DL_DIR)
>     +   $(Q)umask $(BR_ORIG_UMASK); $(EXTRA_ENV) $($(2)_DL_ENV) \
>                 flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
>                 -c '$($(2)_DL_VERSION)' \
>                 -d '$($(2)_DL_DIR)' \
> =

> The comments are only mostly stubs and need being expanded a bit...

Yes, this looks good to me: you honor user's umask in the whole download
phase, and keep the 0022 for other files created by BR. So a better approac=
h,
for sure!

> =

> Regards,
> Yann E. MORIN.
> =


Thanks and regards,
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
