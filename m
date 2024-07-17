Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED28C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 15:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7271D6089B;
	Wed, 17 Jul 2024 15:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMs5Rh_vhDQs; Wed, 17 Jul 2024 15:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A44360AAD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A44360AAD;
	Wed, 17 Jul 2024 15:52:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09CDB1BF3E3
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 15:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02E9B4049C
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 15:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XlQ2M_Hkn_m for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 15:52:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 41CC340492
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41CC340492
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41CC340492
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 15:52:50 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e03d49ff259so6267141276.2
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 08:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721231569; x=1721836369;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pNn0TalIwScWjOtz22aFUPam7xmEfwj/ASjcaFxjmUE=;
 b=QRLKLl2ZnnAB3JWPDyhzKMjcfFmADDkyEG9AIiSqUTHNP9CLbo6UArJzCAaxwtui3j
 JaYQP8TwDrQhPW1rDVTysPnsunLrb+faFg69dEDltuvQr1a+3u40s3QNqOM3WyedAx+E
 UxOp55EXUWSoZDgkQ5F+XLrpVCRnpN+AZ0d09iCXGxgTU41XahTuSny6a/IhaYoCzJxP
 ZScYi3mwp9GjB8LL0k/Z46YgajI6U1S717sOGW2wIssnoliw6Hd85Vu7LX7/XtDYyh1g
 LcEJJGqmb3a7ImXse5WAlurCWhKSrK7MisLtTqR3of2P6+iqZLlxOAtRl2/uFuAKnQ0k
 suBw==
X-Gm-Message-State: AOJu0YwZ5dIg0rQDmNpWmu1IS8a6l6SR9RXRx0+1wnuWRPr/BId4FPWo
 0IvF4eBBqrRfjzE3qrDwxWs/cEmEClFN1yPUOiGNVMm++cfVcu6XUCWms33lqHhxjOP0e2KqWYD
 +RBz5F6hOoOyyM4UJR+JQsHBv3XQwgA==
X-Google-Smtp-Source: AGHT+IESeC22lWld8GKn2j7MgqjOT1d+fb71/wV2RLR+q9F/ryg/G5/8/figy5stGWePNe2pwOqrD5RCI8BW/qRiVpw=
X-Received: by 2002:a05:6902:178e:b0:e02:b44f:d1b4 with SMTP id
 3f1490d57ef6-e05ed7c1bdemr2181148276.55.1721231568969; Wed, 17 Jul 2024
 08:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
 <20240717121147.1353901-1-fred.lefranc+evs@gmail.com>
 <20240717165841.4b643240@windsurf>
In-Reply-To: <20240717165841.4b643240@windsurf>
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
Date: Wed, 17 Jul 2024 17:52:38 +0200
Message-ID: <CAGkXw1WaOM+x0zVmqDBHZ9pFG_fi=jQwetdOmtakn8ROANtp=A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721231569; x=1721836369; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pNn0TalIwScWjOtz22aFUPam7xmEfwj/ASjcaFxjmUE=;
 b=jv66oBhL2EFaAo91xELuU53w8vqJ82US3Bzk2Jv0DS1tq1xBSsLo112mzsrQ3d9spL
 fz5dnJKAgX3/uid6P1TmFCt5kO4uhAk/rFnynsS8VGxVxg+igL3b7lWaPX4jzru8c6GS
 vGu6XHpnuilqm+F9ctkzULhSiDjgwHWnnGHcXIHuexzk9+O+G5v3eaDHR3PZHcrM1vGi
 JDGcYiSX156rqJ6C8eKpf9kM1zAiMbLwhT2HBeCw3yM362FNGpq47UnxLvZlWEuU6e+l
 gtrY6k8jQeNw9euiugNow65qM1x/Zdk1apOTiYLziFKWiNraUUpI1N6BJc8nV5glsDQJ
 ACAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jv66oBhL
Subject: Re: [Buildroot] [PATCH v4] package/busybox: fix build with glibc
 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1158439041621900323=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1158439041621900323==
Content-Type: multipart/alternative; boundary="0000000000003ea98e061d7374fc"

--0000000000003ea98e061d7374fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Thomas

On Wed, Jul 17, 2024 at 4:58=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Wed, 17 Jul 2024 14:11:46 +0200
> Fred Lefranc <fred.lefranc.evs@gmail.com> wrote:
>
> > When glibc was bumped to version 2.39 in commit
> b5680f53d60acf8ff6010082f873438a39bd5d97,
> > it removed the deprecated libcrypt support.
> >
> > In such a situation, until the upgrade of glibc to 2.39, Busybox could
> rely on the
> > libcrypt provided by glibc. Since version 2.39, glibc no longer provide=
s
> libcrypt,
> > causing a build failure with Busybox configurations that have
> CONFIG_USE_BB_CRYPT
> > disabled.
> >
> > To fix this, add the libxcrypt dependency to Busybox when
> BR2_PACKAGE_LIBXCRYPT is
> > selected. The user is still responsible for enabling
> BR2_PACKAGE_LIBXCRYPT when
> > their Busybox configuration has CONFIG_USE_BB_CRYPT disabled.
> >
> > Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
> > ---
> > Changes v3 -> v4
> >   - fix commit message to explain the non-working case
> > Changes v2 -> v3
> >   - fix commit message
> > Changes v1 -> v2
> >   - busybox.mk: fix BUSYBOX_DEPENDENCIES ident & remove the check
> > for BR2_TOOLCHAIN_USES_GLIBC (req by Thomas)
> >   - Config.in: remove libxcrypt mandatory dependency
> > (req by Thomas)
> > ---
> >  package/busybox/busybox.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
>
> Thanks for your persistence, patch applied! The lines of the commit log
> were a bit too long, so I rewrapped the paragraphs.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000003ea98e061d7374fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Thomas<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 17, 2024 at 4:58=E2=80=AFPM T=
homas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.=
petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Wed, 17 Jul 2024 14:11:46 +0200<br>
Fred Lefranc &lt;<a href=3D"mailto:fred.lefranc.evs@gmail.com" target=3D"_b=
lank">fred.lefranc.evs@gmail.com</a>&gt; wrote:<br>
<br>
&gt; When glibc was bumped to version 2.39 in commit b5680f53d60acf8ff60100=
82f873438a39bd5d97,<br>
&gt; it removed the deprecated libcrypt support.<br>
&gt; <br>
&gt; In such a situation, until the upgrade of glibc to 2.39, Busybox could=
 rely on the<br>
&gt; libcrypt provided by glibc. Since version 2.39, glibc no longer provid=
es libcrypt,<br>
&gt; causing a build failure with Busybox configurations that have CONFIG_U=
SE_BB_CRYPT<br>
&gt; disabled.<br>
&gt; <br>
&gt; To fix this, add the libxcrypt dependency to Busybox when BR2_PACKAGE_=
LIBXCRYPT is<br>
&gt; selected. The user is still responsible for enabling BR2_PACKAGE_LIBXC=
RYPT when<br>
&gt; their Busybox configuration has CONFIG_USE_BB_CRYPT disabled.<br>
&gt; <br>
&gt; Signed-off-by: Fred Lefranc &lt;<a href=3D"mailto:fred.lefranc%2Bevs@g=
mail.com" target=3D"_blank">fred.lefranc+evs@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes v3 -&gt; v4<br>
&gt;=C2=A0 =C2=A0- fix commit message to explain the non-working case<br>
&gt; Changes v2 -&gt; v3<br>
&gt;=C2=A0 =C2=A0- fix commit message<br>
&gt; Changes v1 -&gt; v2<br>
&gt;=C2=A0 =C2=A0- <a href=3D"http://busybox.mk" rel=3D"noreferrer" target=
=3D"_blank">busybox.mk</a>: fix BUSYBOX_DEPENDENCIES ident &amp; remove the=
 check<br>
&gt; for BR2_TOOLCHAIN_USES_GLIBC (req by Thomas)<br>
&gt;=C2=A0 =C2=A0- Config.in: remove libxcrypt mandatory dependency<br>
&gt; (req by Thomas)<br>
&gt; ---<br>
&gt;=C2=A0 package/busybox/<a href=3D"http://busybox.mk" rel=3D"noreferrer"=
 target=3D"_blank">busybox.mk</a> | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
<br>
Thanks for your persistence, patch applied! The lines of the commit log<br>
were a bit too long, so I rewrapped the paragraphs.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000003ea98e061d7374fc--

--===============1158439041621900323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1158439041621900323==--
