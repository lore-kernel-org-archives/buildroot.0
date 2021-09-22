Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4E9C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 14:00:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F001C60F43
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 14:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F001C60F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9902E4057E;
	Wed, 22 Sep 2021 14:00:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUiGvPZ4p2KZ; Wed, 22 Sep 2021 14:00:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC15740582;
	Wed, 22 Sep 2021 14:00:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D83561BF2EB
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 14:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D276740582
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 14:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3sjUfQXOQzeH for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 14:00:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B7DE4057E
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 14:00:50 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v5so10178419edc.2
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9XfaFwMSQXNXcRhX6SgaWNzNrsuuDcuUay93rgzc5do=;
 b=btdn9uZV4nrL+bk7nW1oE26MpW6jvlgkpcdk330VL28jVqTRYIkbxXUbixnm6S6zLZ
 CGPvdENyc6tF0VEuuQSg1BNUIOgmUaKVpmk5Q7X3OBPZYqHaflxRxY2zFMnWVQO5GtgZ
 401KRLoxfts+rfBe4pmp1Hs15GIdcuiNgKW8j0VBJMK1vx2x4C79ba/SkcILmOykRb63
 OEd1bq8xeAloIcYKFOUUYkqZcCb86YAOhwzDz1/TAwAuyq94fz5/6drSp04yizSe4k8I
 Da/b7luc350uOXQmyQ02OpgPDofHKwlDSipkpDXdDyDycQE3IQ5VHDtvJOqPdo+uWX4T
 Oh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9XfaFwMSQXNXcRhX6SgaWNzNrsuuDcuUay93rgzc5do=;
 b=phK1wML04m5BtXew8LxT84P+XpOsE/vwfuJuUmtqA5vt1Vft8UVaQH9tK/RVwKAB0M
 z28/Ax7msOWemDSx+ngMUV5LpJqDdO7cfjM8nj9RdaBUf1AqTTtENhGUm0uHB6idQxoD
 w+pU03141c4mW6DSLakvT7lHFNlV3o+dwW/Qy2WfxXSkuO8cAJe9LXFzAyQ2qMEGRLz0
 m2UzhtqrYcfWaxghHesY46tXHToVfNsunkGJaZIGZ/IhzSgn1ajA1RaIirVgg3tDaKD/
 ddp0itQ7v0RH4QKYJzg9Nks5P8Aw3KU476ZPo2FCQGt6HqiYsbgWuvKufFKlceBCQZ44
 EhZQ==
X-Gm-Message-State: AOAM5316d2pu5iccAgMYTolrt2d1It/NbJwQ1szB+FDQSImE3LtLoOp/
 0njSIon7ISBgSOuJOZSysA/wUtSSnIFzGRAVILBnpU9nteTNlg==
X-Google-Smtp-Source: ABdhPJw+VvwRknqfWHDuDdIfS9VH+WyNt34WS1tUZzD7sH1em1+yNmIdYy4J1PmPuaDbjcYvATmiDLhBQLxHVjLx+LU=
X-Received: by 2002:a17:906:1901:: with SMTP id
 a1mr42104918eje.129.1632319230382; 
 Wed, 22 Sep 2021 07:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
 <163213021612.4283.1135197152174473636@kwain>
 <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
 <163214406368.4283.14394760824414034461@kwain>
 <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
 <163214596519.4283.5229631383777844599@kwain>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
 <163220836697.4283.6363157164675068449@kwain>
 <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
 <163223176981.4283.2007173106051805069@kwain>
In-Reply-To: <163223176981.4283.2007173106051805069@kwain>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 22 Sep 2021 17:00:19 +0300
Message-ID: <CAJPV9Mp-6PBtw5G2YDORJ_5cqypjtrc2CR3cMrzfe36RpUW2oQ@mail.gmail.com>
To: Antoine Tenart <atenart@kernel.org>
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1644389105575103653=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============1644389105575103653==
Content-Type: multipart/alternative; boundary="000000000000e32e9a05cc95ef44"

--000000000000e32e9a05cc95ef44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 4:42 PM Antoine Tenart <atenart@kernel.org> wrote:

> Quoting Jos=C3=A9 Pekkarinen (2021-09-21 15:32:32)
> > On Tue, Sep 21, 2021 at 10:12 AM Antoine Tenart <[1]atenart@kernel.org>
> > wrote:
> >
> > I tested today to build the system with buildroot 2021.05.2(without
> > the patch) and it reproduces exactly the same behaviour,
> > policy/modules.conf doesn't receive the line to activate the secure
> > module, and if I search in policy.conf or policy.32 through sesearch I
> > find no sign of the policies defined in the module.  I'll attempt the
> > upgrade to 2021.08, but that will require a bit more time.
>
> Alternatively you can just test with newer refpolicy versions, outside
> of Buildroot and look at the generated modules.conf. This will give the
> same information and should be easier to do. (My feeling is this won't
> change and we'll have to dive into the refpolicy logic for enabling
> modules when running 'make conf').
>

The config generator requires a summary line in the module.if file

to be added in policy/modules.conf, otherwise it doesn't process any
further.
It seems to be something tricky to address, in your end developing a check
the summary is in place doesn't make sense, in their end, not using that
hook to learn the modules from the xml make be also complicated. All
in all, thanks for the comments, at least I have a way out without this
patch. If there is something I can address for you in this topic, feel free
to ask.

Best regards.

Jos=C3=A9.

--000000000000e32e9a05cc95ef44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 21, 2021 at 4:42 PM Antoi=
ne Tenart &lt;<a href=3D"mailto:atenart@kernel.org" target=3D"_blank">atena=
rt@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Quoting Jos=C3=A9 Pekkarinen (2021-09-21 15:32:32)<br>
&gt; On Tue, Sep 21, 2021 at 10:12 AM Antoine Tenart &lt;[1]<a href=3D"mail=
to:atenart@kernel.org" target=3D"_blank">atenart@kernel.org</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; I tested today to build the system with buildroot 2021.05.2(without<br=
>
&gt; the patch) and it reproduces exactly the same behaviour,<br>
&gt; policy/modules.conf doesn&#39;t receive the line to activate the secur=
e<br>
&gt; module, and if I search in policy.conf or policy.32 through sesearch I=
<br>
&gt; find no sign of the policies defined in the module.=C2=A0 I&#39;ll att=
empt the<br>
&gt; upgrade to 2021.08, but that will require a bit more time.<br>
<br>
Alternatively you can just test with newer refpolicy versions, outside<br>
of Buildroot and look at the generated modules.conf. This will give the<br>
same information and should be easier to do. (My feeling is this won&#39;t<=
br>
change and we&#39;ll have to dive into the refpolicy logic for enabling<br>
modules when running &#39;make conf&#39;).<br></blockquote><div><br></div><=
/div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div c=
lass=3D"gmail_quote"><div>The config generator requires a summary line in t=
he module.if file</div></div></blockquote>to be added in policy/modules.con=
f, otherwise it doesn&#39;t process any further.<div><div>It seems to be so=
mething tricky to address, in your end developing a check</div><div>the sum=
mary is in place doesn&#39;t make sense, in their end, not using that</div>=
<div>hook to learn the modules from the xml make be also complicated. All</=
div><div>in all, thanks for the comments, at least I have a way out without=
 this</div><div>patch. If there is something I can address for you in this =
topic, feel free</div><div>to ask.</div><div><br></div><blockquote style=3D=
"margin:0 0 0 40px;border:none;padding:0px"><div>Best regards.</div><div><b=
r></div></blockquote><div dir=3D"ltr"><div dir=3D"ltr"><blockquote style=3D=
"margin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></=
div></div></div></div>

--000000000000e32e9a05cc95ef44--

--===============1644389105575103653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1644389105575103653==--
