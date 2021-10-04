Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26398C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 05:57:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 768B96124F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 05:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 768B96124F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03E13415ED;
	Mon,  4 Oct 2021 05:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmPTb5Sg3ype; Mon,  4 Oct 2021 05:57:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 346DC415F9;
	Mon,  4 Oct 2021 05:57:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF6CF1BF390
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 05:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E00484AB7
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 05:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GtLvK2xSaAPp for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 05:57:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D38184AB4
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 05:57:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id l7so36595469edq.3
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 22:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ugyhoMunrAQWW/kNsdqdpjYkQSSch9z1jsGysk/XKq8=;
 b=a6p/Hq8OcGNxP3/81DL2kisXMNTgllibZHTAeUOM7pYjOUL6QkGztPHrgQCFv9YDx/
 2i8vrAJkoFvQDnwHuZll0SvKbKeG9Yobh32gmZVhg5IOFaK4mYPzjJ+v9P3/CwSE4TSb
 rAVZexc04VQ07yDqh88REPWV1sfVq6UaDtyX9PsZ59Bn38VNIO7SU56/1RbjCrF5CUbM
 CJMsV09Pvu5CW6YYVN1t+8Lh5yprNaJ3roRHJUdWus4nSIxmsDlu6GNbwOuYhzHqzQ5q
 R7AFd5xnFudLaJFAFjJanK+BiyhSBTVL0DsqbbTVZbodx0Br+Yaa+1XouRNHsTJZBWvd
 qYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ugyhoMunrAQWW/kNsdqdpjYkQSSch9z1jsGysk/XKq8=;
 b=YKLppkisC/pThkidMKGoVkePjz3mSeaItIJLayujXf4A2hNaMOBBd5AUlQJ8kDFRQz
 OmI7fZ3Sdrf69TWrj09kN0LLzkRSMNs0lmiThqdIIMwMd7g+YhGIIBtSynHyDHv35x1U
 ltkXpjpNFO8MNlaTxjgMU1bwk2pP+O1eZYdTXrrxDiTR83EkgC5ghi0kF/oLOY3eKdVq
 8j27VdgSJhYelCGGbEnvg4lqsMSOt0yTpk9WvsCiMddF4ETcb56jF6npamv/YcEpBpp2
 N9qcLhk0siERJETqCRYp+MSYfrvBvWV8q9sa0e0SgWMhmLnuvT28Fwmx/4aAvimK6NCS
 jn/g==
X-Gm-Message-State: AOAM531z+JVHShZP64Wq7whkdqhR5z3IPayOR9p477GKCzucJvsp8kYZ
 Qishd5EGaKOgLb/us9xcwK6apn7Ads7i8oB7dnTr4Q==
X-Google-Smtp-Source: ABdhPJzW89I+oHXXj4CN+n+DlvLDnWcYwQeTpB/h4LulyyfSm+ZOiiXsHS+qefLOLykPalh4/plspgUC22Yz0nfjlwE=
X-Received: by 2002:a17:906:1901:: with SMTP id
 a1mr15487869eje.129.1633327020095; 
 Sun, 03 Oct 2021 22:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211001062052.770583-1-jose.pekkarinen@unikie.com>
 <07d1425c-7351-cc34-381c-a6fde26185fd@mind.be>
In-Reply-To: <07d1425c-7351-cc34-381c-a6fde26185fd@mind.be>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 4 Oct 2021 08:56:49 +0300
Message-ID: <CAJPV9Mpn1vDk5oGcZD2rxZRyJ7uYmcZpHm8xzyt=4HOeQtdH3Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] package/audit: Fix type output on log
 folder creation
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9189461475142078712=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9189461475142078712==
Content-Type: multipart/alternative; boundary="000000000000d5da2d05cd809402"

--000000000000d5da2d05cd809402
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 3, 2021 at 1:15 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 01/10/2021 08:20, Jos=C3=A9 Pekkarinen wrote:
> > Testing buildroot 2021.05 I observed that after first
> > boot I was having the following folders:
> >
> > /context:
> > /system_u:object_r:auditd_log_t
> >
> > The root of this problem turned to be a difference in the
> > output of $(selabel_lookup -b file -k /var/log/audit) called
> > by S02auditd that from this verison on looks like:
> >
> > $ selabel_lookup -b file -k /var/log/audit
> > Default context: system_u:object_r:auditd_log_t
>
>   What is the chance that this output format is going to change again?
> Does
> selabel_lookup has a "scriptable" output format that we can rely on not t=
o
> change?
>

I'm afraid I have tried both all the options around

without any clearer output, for instance, -r(of raw) still
writes the 'Default context:' piece, as well as the -t(of type).
I know it doesn't look elegant, but for now it seems the
best we can afford.

Best regards.

Jos=C3=A9.



>
> >
> > This patch will cut it to retrieve the type piece only.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> > ---
> >   package/audit/S02auditd | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/audit/S02auditd b/package/audit/S02auditd
> > index 0eef881cee..dd3dc22d6d 100644
> > --- a/package/audit/S02auditd
> > +++ b/package/audit/S02auditd
> > @@ -20,7 +20,7 @@ start(){
> >       # the directory with SELinux permissions if possible
> >       command -v selabel_lookup >/dev/null 2>&1
> >       if [ $? =3D 0 ]; then
> > -             mkdir -p /var/log/audit -Z `selabel_lookup -b file -k
> /var/log/audit`
> > +             mkdir -p /var/log/audit -Z `selabel_lookup -b file -k
> /var/log/audit | cut -d ' ' -f 3`
> >       else
> >               mkdir -p /var/log/audit
> >       fi
> >

--000000000000d5da2d05cd809402
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 3, 2021 at 1:15 PM Arnout=
 Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 01/10/2021 08:20, Jos=C3=A9 Pekkarinen wrote:<br>
&gt; Testing buildroot 2021.05 I observed that after first<br>
&gt; boot I was having the following folders:<br>
&gt; <br>
&gt; /context:<br>
&gt; /system_u:object_r:auditd_log_t<br>
&gt; <br>
&gt; The root of this problem turned to be a difference in the<br>
&gt; output of $(selabel_lookup -b file -k /var/log/audit) called<br>
&gt; by S02auditd that from this verison on looks like:<br>
&gt; <br>
&gt; $ selabel_lookup -b file -k /var/log/audit<br>
&gt; Default context: system_u:object_r:auditd_log_t<br>
<br>
=C2=A0 What is the chance that this output format is going to change again?=
 Does <br>
selabel_lookup has a &quot;scriptable&quot; output format that we can rely =
on not to change?<br></blockquote><div><br></div></div><blockquote style=3D=
"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div=
>I&#39;m afraid I have tried both all the options around</div></div></block=
quote>without any clearer output, for instance, -r(of raw) still<div>writes=
 the &#39;Default context:&#39; piece, as well as the -t(of type).</div><di=
v>I know it doesn&#39;t look elegant, but for now it seems the</div><div>be=
st we can afford.</div><div><br></div><div><blockquote style=3D"margin:0 0 =
0 40px;border:none;padding:0px"><div>Best regards.</div><div><br></div></bl=
ockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px">Jo=
s=C3=A9.</blockquote><div class=3D"gmail_quote"><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><br>
&gt; <br>
&gt; This patch will cut it to retrieve the type piece only.<br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/audit/S02auditd | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/audit/S02auditd b/package/audit/S02auditd<br>
&gt; index 0eef881cee..dd3dc22d6d 100644<br>
&gt; --- a/package/audit/S02auditd<br>
&gt; +++ b/package/audit/S02auditd<br>
&gt; @@ -20,7 +20,7 @@ start(){<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# the directory with SELinux permissions if =
possible<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0command -v selabel_lookup &gt;/dev/null 2&gt=
;&amp;1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? =3D 0 ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p /var/log/aud=
it -Z `selabel_lookup -b file -k /var/log/audit`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p /var/log/aud=
it -Z `selabel_lookup -b file -k /var/log/audit | cut -d &#39; &#39; -f 3`<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p /var/lo=
g/audit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;</blockquote></div></div></div>

--000000000000d5da2d05cd809402--

--===============9189461475142078712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9189461475142078712==--
