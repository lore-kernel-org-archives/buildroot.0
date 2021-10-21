Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358ACC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:22:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2F960C49
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C2F960C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eccles.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1702860676;
	Thu, 21 Oct 2021 19:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smjjomLNgAdk; Thu, 21 Oct 2021 19:22:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 428D0606AF;
	Thu, 21 Oct 2021 19:22:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97A8E1BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 878D483BFF
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XvBcMFs8Dl9X for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 19:22:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B3BF83BC2
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 19:22:12 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id w23so1683746lje.7
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 12:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IH+/HxP5MbCDrKh+3YmgVbew0IqZyTliK3583I86Mfg=;
 b=iscVxsKyuMGTtpAeD5pssTOAntJIMTZU/4O0Y1Ab+GO+FWtMxKkOBzpie9F3KjFMXO
 iCxEsn5/X2lhMUg+6Li/Ss2XReRB3Zl+K/Qk0T6RxKXsDdyTqmtcU0t14dNUhvbckAR6
 fut50Or0HijlWv1V/XH2MMMSfl6L3R3HCONbGw5oRjPn7qag6xz8XX/keUml29HtrD5K
 097fR8I6+8LLo3YwjFzvLKg9UZDCXs13WELihUgvaQmvxcUeHBT+vLUO9JVz+b1xmG37
 71qaW/XU0y8hug9wfSVEkkyH2MFMH2K5k8lKH0j6B6FCzj6eiysRROLcjiJYz+lqT65l
 tXYw==
X-Gm-Message-State: AOAM530SjF8F92FwqhARDlRmxMJKr6dUcCIP2kCE01Ier+bkedRqLsal
 V9PoFCRKy8beNXtMWdyrUsnQL5EEm83O
X-Google-Smtp-Source: ABdhPJz3cEZzwTzafjKuLcFKjiFifW7CZq9PTRRz5ES0bLzx5p72J/CnB415KRvW3kDH5HbxRU9cHA==
X-Received: by 2002:a2e:8948:: with SMTP id b8mr7919309ljk.499.1634844129931; 
 Thu, 21 Oct 2021 12:22:09 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id s2sm649594lji.1.2021.10.21.12.22.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 12:22:09 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id g8so1631443ljn.4
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 12:22:09 -0700 (PDT)
X-Received: by 2002:a2e:9c49:: with SMTP id t9mr8084988ljj.86.1634844129685;
 Thu, 21 Oct 2021 12:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211018203038.32453-1-will@eccles.dev>
 <20211021174616.GD2400@scaer>
In-Reply-To: <20211021174616.GD2400@scaer>
From: Will Eccles <will@eccles.dev>
Date: Thu, 21 Oct 2021 15:21:20 -0400
X-Gmail-Original-Message-ID: <CA+K4yG=iyRObouVv0DDYEhuFaJV1TG9RtkRL-r4f_hB7L9h-kQ@mail.gmail.com>
Message-ID: <CA+K4yG=iyRObouVv0DDYEhuFaJV1TG9RtkRL-r4f_hB7L9h-kQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/openssh: reset umask when init
 script exits
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
Content-Type: multipart/mixed; boundary="===============5876192095628226176=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5876192095628226176==
Content-Type: multipart/alternative; boundary="0000000000009cf4a605cee1cf14"

--0000000000009cf4a605cee1cf14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

Apologies, I have no idea how that typo even made it into the patch. That
is supposed to say "umask $(umask)". Not only did the typo make it in
there, but I haven't even noticed it until now (and the patch I applied to
my own says umask, so apparently I typo'd when formalizing it). In any
case, it's hardly worth correcting now, since the patch isn't useful.

On Thu, Oct 21, 2021 at 1:46 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Will, All,
>
> On 2021-10-18 16:30 -0400, Will Eccles spake thusly:
> > S50sshd updates umask to 077, but does not reset it when it exits. This
> > results in the root user's umask being configured incorrectly (assuming
> > a default of 022 or otherwise). This patch adds a trap to reset umask
> > when the script exits. This is convenient on systems where, for example=
,
> > configs such as /etc/profile may not be sourced by the root user. It ma=
y
> > also prevent issues with other init scripts which may inherit this umas=
k
> > unintentionally, leading to improper permissions elsewhere in the
> > system.
> >
> > Signed-off-by: Will Eccles <will@eccles.dev>
>
> Besides what Arnout said (and which I agree with), I am not so sure this
> patch is even technically correct... See below...
>
> > ---
> > Backport to: 2021.02.6, 2021.08.1
> > (These are the releases on buildroot.org as of this writing, but as far
> > as I can tell, even releases as far back as 2012 have the same problem.=
)
> > ---
> >  package/openssh/S50sshd | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
> > index 22da41d1ca..94cf4c14e8 100644
> > --- a/package/openssh/S50sshd
> > +++ b/package/openssh/S50sshd
> > @@ -6,6 +6,8 @@
> >  # Make sure the ssh-keygen progam exists
> >  [ -f /usr/bin/ssh-keygen ] || exit 0
> >
> > +# Reset uname at exit
> > +trap "uname $(uname)" EXIT
>
> This does not even do what you said it does. This is 'uname', not
> 'umask'...
>
> Furthermore, the above code would fail anyway:
>
>     $ uname $(uname); echo $?
>     uname: extra operand =E2=80=98Linux=E2=80=99
>     Try 'uname --help' for more information.
>     1
>
> So, if this very patch makes it work for you, then your issue is not
> about umask being set below...
>
> Regards,
> Yann E. MORIN.
>
> >  umask 077
> >
> >  start() {
> > --
> > 2.33.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--0000000000009cf4a605cee1cf14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Yann,</div><div><br></div><div>Apologies, I have n=
o idea how that typo even made it into the patch. That is supposed to say &=
quot;umask $(umask)&quot;. Not only did the typo make it in there, but I ha=
ven&#39;t even noticed it until now (and the patch I applied to my own says=
 umask, so apparently I typo&#39;d when formalizing it). In any case, it&#3=
9;s hardly worth correcting now, since the patch isn&#39;t useful.<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Oct 21, 2021 at 1:46 PM Yann E. MORIN &lt;<a href=3D"mailto:yann.m=
orin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Will, All,<br>
<br>
On 2021-10-18 16:30 -0400, Will Eccles spake thusly:<br>
&gt; S50sshd updates umask to 077, but does not reset it when it exits. Thi=
s<br>
&gt; results in the root user&#39;s umask being configured incorrectly (ass=
uming<br>
&gt; a default of 022 or otherwise). This patch adds a trap to reset umask<=
br>
&gt; when the script exits. This is convenient on systems where, for exampl=
e,<br>
&gt; configs such as /etc/profile may not be sourced by the root user. It m=
ay<br>
&gt; also prevent issues with other init scripts which may inherit this uma=
sk<br>
&gt; unintentionally, leading to improper permissions elsewhere in the<br>
&gt; system.<br>
&gt; <br>
&gt; Signed-off-by: Will Eccles &lt;<a href=3D"mailto:will@eccles.dev" targ=
et=3D"_blank">will@eccles.dev</a>&gt;<br>
<br>
Besides what Arnout said (and which I agree with), I am not so sure this<br=
>
patch is even technically correct... See below...<br>
<br>
&gt; ---<br>
&gt; Backport to: 2021.02.6, 2021.08.1<br>
&gt; (These are the releases on <a href=3D"http://buildroot.org" rel=3D"nor=
eferrer" target=3D"_blank">buildroot.org</a> as of this writing, but as far=
<br>
&gt; as I can tell, even releases as far back as 2012 have the same problem=
.)<br>
&gt; ---<br>
&gt;=C2=A0 package/openssh/S50sshd | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd<br>
&gt; index 22da41d1ca..94cf4c14e8 100644<br>
&gt; --- a/package/openssh/S50sshd<br>
&gt; +++ b/package/openssh/S50sshd<br>
&gt; @@ -6,6 +6,8 @@<br>
&gt;=C2=A0 # Make sure the ssh-keygen progam exists<br>
&gt;=C2=A0 [ -f /usr/bin/ssh-keygen ] || exit 0<br>
&gt;=C2=A0 <br>
&gt; +# Reset uname at exit<br>
&gt; +trap &quot;uname $(uname)&quot; EXIT<br>
<br>
This does not even do what you said it does. This is &#39;uname&#39;, not<b=
r>
&#39;umask&#39;...<br>
<br>
Furthermore, the above code would fail anyway:<br>
<br>
=C2=A0 =C2=A0 $ uname $(uname); echo $?<br>
=C2=A0 =C2=A0 uname: extra operand =E2=80=98Linux=E2=80=99<br>
=C2=A0 =C2=A0 Try &#39;uname --help&#39; for more information.<br>
=C2=A0 =C2=A0 1<br>
<br>
So, if this very patch makes it work for you, then your issue is not<br>
about umask being set below...<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt;=C2=A0 umask 077<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 start() {<br>
&gt; -- <br>
&gt; 2.33.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--0000000000009cf4a605cee1cf14--

--===============5876192095628226176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5876192095628226176==--
