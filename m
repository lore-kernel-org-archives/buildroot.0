Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A26C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 05:44:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 926856126A
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 05:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 926856126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F1A6065C;
	Mon, 23 Aug 2021 05:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRY7gQw6fne0; Mon, 23 Aug 2021 05:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A585F6066E;
	Mon, 23 Aug 2021 05:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90C1D1BF429
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 05:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80B7480CFA
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 05:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1m6KHAeouKv for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 05:44:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D39F80CC9
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 05:44:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g21so24400353edw.4
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 22:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j1WCXwUFDRtwNpLYtFdbUZ0C1gajkNDDzZcC6QXN4OU=;
 b=eguKF8aJOSX7f9iOY87NSJFqRJKN+7+lW0yKYciq7fqgf6gSTAKaVmRi2bZAAQ2FaS
 ZVlNvTKqWOpEQHwznn7LyDNm1TuctcP81lFk+8NDYq8KPR1T5iyQCkYsZSUV3VSya/UZ
 tf+sDpDJn0xSi1AiRqYrg5WLtxE9C7RNpkL+2PUhOszjPKiB9A1jfEmbXqy0yNVSBKZo
 zjQH8XgdmlGMwQzGmY+gzziTS2hxCtLAtYhBpov0ukdHm7GNZM3tUilboB+hGJtVJYSI
 w2dUbcZla4FNapFPxfHw3uOZq2nx71OHFd3/kZj2wP/uKyon4XCz4BWAljxGzxoMtf7P
 uyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j1WCXwUFDRtwNpLYtFdbUZ0C1gajkNDDzZcC6QXN4OU=;
 b=Ftvj/VvgB+ZtA+SAGNthVH+jHAE/FTq/ZT2x/v0bFOnqL+UmWBZoi0Rw2Cdr1HbO56
 IdVS/ybcIqKSLmtEYpU5lgUaGJqv3+dZ75H1HHs8LAnSpe/7L/4GHc+Y8m2HkF9b/ZMg
 hKTDk6GY1gdTf76p5uznrm6MmkUElpF8rfdcaecmQIAAPYkflGvhmFhKUEHEXGhFDT50
 Gp6FInRq/kmR+0mLpI3YLg4KONl1fczENw958ejzus6HkiA11CtulOpP19otBeUpL6m5
 B75ISLDUkHL/9e3SVUMMEtgIBzNtVkzUz9vOTLCmmlir4D1I+TqDeAYRy/CopvbwUmV7
 ZIcw==
X-Gm-Message-State: AOAM5310a1mPuuzuThzyvfh9b1qXrLDgz2dtdJOVwQSuDeSvt6enFg6B
 Up58aMbrZ5flMxMJt/5ouz5bpdkscItFV3tuMhw9Vg==
X-Google-Smtp-Source: ABdhPJxcK9VV7yW1M5552u/YzMJuw0yWvpiJXferaSGIGE9FTzGhDfrvtJy5DbQFtsY3CI7N+1wh2mKE8OvVxbKX3II=
X-Received: by 2002:a05:6402:375:: with SMTP id
 s21mr36518901edw.318.1629697445369; 
 Sun, 22 Aug 2021 22:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
 <20210819210517.GF27036@scaer>
 <CAJPV9Mqd-c_0JD82KQU5hMH32UVMy71ded1Ht7vtEr6iJhw+xg@mail.gmail.com>
 <20210820191656.GS27036@scaer>
In-Reply-To: <20210820191656.GS27036@scaer>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 23 Aug 2021 08:43:54 +0300
Message-ID: <CAJPV9Mo-6jFQb=hOGANwr6aD7NSzobYPk_kr+HCb=HuYBODzoA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v2] package/libselinux: Add autorelabel for
 first boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2185960528019496777=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2185960528019496777==
Content-Type: multipart/alternative; boundary="00000000000052a94f05ca338146"

--00000000000052a94f05ca338146
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2021 at 10:17 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Jos=C3=A9, All,
>
> +Matthew +Adam, our resident SELinux experts: questions for you toward
> the end...
>
> (resend as I acutally forgot to add them)
>
> On 2021-08-20 15:19 +0300, Jos=C3=A9 Pekkarinen spake thusly:
> > On Fri, Aug 20, 2021 at 12:05 AM Yann E. MORIN < [1]
> yann.morin.1998@free.fr> wrote:
> > > On 2021-08-19 12:29 +0300, Jos=C3=A9 Pekkarinen spake thusly:
> > > > Currently buildroot ship libselinux without triggering
> > > > this option, which often shows inconsistencies between
> > > > what the refpolicy defines as a label for a file and
> > > > what the actual file has. Triggering an initial relabel
> > > > would help activating enforcing state right away without
> > > > requiring to enter it once in permissive and tweak the
> > > > labels.
> [--SNIP--]
> > > Isn't this going to fail on read-only filesystems? Relabelling
> suposedly
> > > requires that extended attributes be added/updated/removed, and that
> > > requires a read-write filesystem...
> > > Can't we do the re-labelling at the time we create the filesystem, i.=
e.
> > > in fs/common.mk?
> > > And it seems we already have that:
> [--SNIP--]
> > > So why is the labelling wrong? Can't we fix it right there rather tha=
n
> > > at runtime?
> > It's is not wrong, it was just unnoticed by my eyeballs,
>
> :-)
>
> > however, there is a case this is not covering properly and preventing
> > the userspace to run right away in enforcing mode, because at
> > this time not all files in /dev are populated, and running it in
> > permissive mode multiple complains from selinux to the serial
> > devices turn up. If you have some suggestions how we can
> > improve this case, I'm happy to bring more changes.
>
> What I understand from your explanations, above, is that we have to have
> some labels (i.e. extended attributes) set on files in /dev, or the
> policy may reference objects that are not properly labeled.
>

You are right, since, for example, if you just activate

selinux  in permissive mode, you can see the following avcs
in the console coming up:

[    0.936152] audit: type=3D1400 audit(1629697223.045:3): avc:  denied  {
read write } for  pid=3D81 comm=3D"sh" path=3D"/dev/console" dev=3D"devtmpf=
s"
ino=3D13 scontext=3Dsystem_u:system_r:sysadm_t
tcontext=3Dsystem_u:object_r:device_t tclass=3Dchr_file permissive=3D1
[    0.940632] audit: type=3D1400 audit(1629697223.050:4): avc:  denied  {
open } for  pid=3D81 comm=3D"sh" path=3D"/dev/tty" dev=3D"devtmpfs" ino=3D1=
2
scontext=3Dsystem_u:system_r:sysadm_t tcontext=3Dsystem_u:object_r:device_t
tclass=3Dchr_file permissive=3D1
[    0.942731] audit: type=3D1400 audit(1629697223.052:5): avc:  denied  {
ioctl } for  pid=3D81 comm=3D"sh" path=3D"/dev/console" dev=3D"devtmpfs" in=
o=3D13
ioctlcmd=3D0x540f scontext=3Dsystem_u:system_r:sysadm_t
tcontext=3Dsystem_u:object_r:device_t tclass=3Dchr_file permissive=3D1
[    0.944298] ln (81) used greatest stack depth: 13272 bytes left
INIT: Entering runlevel: 3
Starting syslogd: OK
[    0.952061] audit: type=3D1400 audit(1629697223.061:6): avc:  denied  {
read write } for  pid=3D99 comm=3D"syslogd" path=3D"/dev/null" dev=3D"devtm=
pfs"
ino=3D5 scontext=3Dsystem_u:system_r:syslogd_t
tcontext=3Dsystem_u:object_r:device_t tclass=3Dchr_file permissive=3D1
[    0.953337] audit: type=3D1400 audit(1629697223.063:7): avc:  denied  {
read } for  pid=3D99 comm=3D"syslogd" name=3D"log" dev=3D"vda" ino=3D1891
scontext=3Dsystem_u:system_r:syslogd_t tcontext=3Dsystem_u:object_r:var_t
tclass=3Dlnk_file permissive=3D1
[    0.954209] audit: type=3D1400 audit(1629697223.063:8): avc:  denied  {
search } for  pid=3D99 comm=3D"syslogd" name=3D"/" dev=3D"tmpfs" ino=3D1
scontext=3Dsystem_u:system_r:syslogd_t tcontext=3Dsystem_u:object_r:tmpfs_t
tclass=3Ddir permissive=3D1
[    0.955091] audit: type=3D1400 audit(1629697223.064:9): avc:  denied  {
write } for  pid=3D99 comm=3D"syslogd" name=3D"/" dev=3D"tmpfs" ino=3D1
scontext=3Dsystem_u:system_r:syslogd_t tcontext=3Dsystem_u:object_r:tmpfs_t
tclass=3Ddir permissive=3D1
[    0.956182] audit: type=3D1400 audit(1629697223.064:10): avc:  denied  {
add_name } for  pid=3D99 comm=3D"syslogd" name=3D"messages"
scontext=3Dsystem_u:system_r:syslogd_t tcontext=3Dsystem_u:object_r:tmpfs_t
tclass=3Ddir permissive=3D1

I'm using the reference policy version 32. If this

is executed in enforcing mode, at this time there would be
no process remaining in the system.

Thanks!

Jos=C3=A9.

--00000000000052a94f05ca338146
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 20, 2021 at 10:17 PM Yann=
 E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@fr=
ee.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Jos=C3=A9, All,<br>
<br>
+Matthew +Adam, our resident SELinux experts: questions for you toward<br>
the end...<br>
<br>
(resend as I acutally forgot to add them)<br>
<br>
On 2021-08-20 15:19 +0300, Jos=C3=A9 Pekkarinen spake thusly:<br>
&gt; On Fri, Aug 20, 2021 at 12:05 AM Yann E. MORIN &lt; [1]<a href=3D"mail=
to:yann.morin.1998@free.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&g=
t; wrote:<br>
&gt; &gt; On 2021-08-19 12:29 +0300, Jos=C3=A9 Pekkarinen spake thusly:<br>
&gt; &gt; &gt; Currently buildroot ship libselinux without triggering<br>
&gt; &gt; &gt; this option, which often shows inconsistencies between<br>
&gt; &gt; &gt; what the refpolicy defines as a label for a file and<br>
&gt; &gt; &gt; what the actual file has. Triggering an initial relabel<br>
&gt; &gt; &gt; would help activating enforcing state right away without<br>
&gt; &gt; &gt; requiring to enter it once in permissive and tweak the<br>
&gt; &gt; &gt; labels.<br>
[--SNIP--]<br>
&gt; &gt; Isn&#39;t this going to fail on read-only filesystems? Relabellin=
g suposedly<br>
&gt; &gt; requires that extended attributes be added/updated/removed, and t=
hat<br>
&gt; &gt; requires a read-write filesystem...<br>
&gt; &gt; Can&#39;t we do the re-labelling at the time we create the filesy=
stem, i.e.<br>
&gt; &gt; in fs/<a href=3D"http://common.mk" rel=3D"noreferrer" target=3D"_=
blank">common.mk</a>?<br>
&gt; &gt; And it seems we already have that:<br>
[--SNIP--]<br>
&gt; &gt; So why is the labelling wrong? Can&#39;t we fix it right there ra=
ther than<br>
&gt; &gt; at runtime?<br>
&gt; It&#39;s is not wrong, it was just unnoticed by my eyeballs,<br>
<br>
:-)<br>
<br>
&gt; however, there is a case this is not covering properly and preventing<=
br>
&gt; the userspace to run right away in enforcing mode, because at<br>
&gt; this time not all files in /dev are populated, and running it in<br>
&gt; permissive mode multiple complains from selinux to the serial<br>
&gt; devices turn up. If you have some suggestions how we can<br>
&gt; improve this case, I&#39;m happy to bring more changes.<br>
<br>
What I understand from your explanations, above, is that we have to have<br=
>
some labels (i.e. extended attributes) set on files in /dev, or the<br>
policy may reference objects that are not properly labeled.<br></blockquote=
><div><br></div></div><blockquote style=3D"margin:0 0 0 40px;border:none;pa=
dding:0px"><div class=3D"gmail_quote"><div>You are right, since, for exampl=
e, if you just activate</div></div></blockquote>selinux=C2=A0 in permissive=
 mode, you can see the following avcs<div>in the console coming up:</div><d=
iv><br></div><div>[ =C2=A0 =C2=A00.936152] audit: type=3D1400 audit(1629697=
223.045:3): avc: =C2=A0denied =C2=A0{ read write } for =C2=A0pid=3D81 comm=
=3D&quot;sh&quot; path=3D&quot;/dev/console&quot; dev=3D&quot;devtmpfs&quot=
; ino=3D13 scontext=3Dsystem_u:system_r:sysadm_t tcontext=3Dsystem_u:object=
_r:device_t tclass=3Dchr_file permissive=3D1<br>[ =C2=A0 =C2=A00.940632] au=
dit: type=3D1400 audit(1629697223.050:4): avc: =C2=A0denied =C2=A0{ open } =
for =C2=A0pid=3D81 comm=3D&quot;sh&quot; path=3D&quot;/dev/tty&quot; dev=3D=
&quot;devtmpfs&quot; ino=3D12 scontext=3Dsystem_u:system_r:sysadm_t tcontex=
t=3Dsystem_u:object_r:device_t tclass=3Dchr_file permissive=3D1<br>[ =C2=A0=
 =C2=A00.942731] audit: type=3D1400 audit(1629697223.052:5): avc: =C2=A0den=
ied =C2=A0{ ioctl } for =C2=A0pid=3D81 comm=3D&quot;sh&quot; path=3D&quot;/=
dev/console&quot; dev=3D&quot;devtmpfs&quot; ino=3D13 ioctlcmd=3D0x540f sco=
ntext=3Dsystem_u:system_r:sysadm_t tcontext=3Dsystem_u:object_r:device_t tc=
lass=3Dchr_file permissive=3D1<br>[ =C2=A0 =C2=A00.944298] ln (81) used gre=
atest stack depth: 13272 bytes left<br>INIT: Entering runlevel: 3<br>Starti=
ng syslogd: OK<br>[ =C2=A0 =C2=A00.952061] audit: type=3D1400 audit(1629697=
223.061:6): avc: =C2=A0denied =C2=A0{ read write } for =C2=A0pid=3D99 comm=
=3D&quot;syslogd&quot; path=3D&quot;/dev/null&quot; dev=3D&quot;devtmpfs&qu=
ot; ino=3D5 scontext=3Dsystem_u:system_r:syslogd_t tcontext=3Dsystem_u:obje=
ct_r:device_t tclass=3Dchr_file permissive=3D1<br>[ =C2=A0 =C2=A00.953337] =
audit: type=3D1400 audit(1629697223.063:7): avc: =C2=A0denied =C2=A0{ read =
} for =C2=A0pid=3D99 comm=3D&quot;syslogd&quot; name=3D&quot;log&quot; dev=
=3D&quot;vda&quot; ino=3D1891 scontext=3Dsystem_u:system_r:syslogd_t tconte=
xt=3Dsystem_u:object_r:var_t tclass=3Dlnk_file permissive=3D1<br>[ =C2=A0 =
=C2=A00.954209] audit: type=3D1400 audit(1629697223.063:8): avc: =C2=A0deni=
ed =C2=A0{ search } for =C2=A0pid=3D99 comm=3D&quot;syslogd&quot; name=3D&q=
uot;/&quot; dev=3D&quot;tmpfs&quot; ino=3D1 scontext=3Dsystem_u:system_r:sy=
slogd_t tcontext=3Dsystem_u:object_r:tmpfs_t tclass=3Ddir permissive=3D1<br=
>[ =C2=A0 =C2=A00.955091] audit: type=3D1400 audit(1629697223.064:9): avc: =
=C2=A0denied =C2=A0{ write } for =C2=A0pid=3D99 comm=3D&quot;syslogd&quot; =
name=3D&quot;/&quot; dev=3D&quot;tmpfs&quot; ino=3D1 scontext=3Dsystem_u:sy=
stem_r:syslogd_t tcontext=3Dsystem_u:object_r:tmpfs_t tclass=3Ddir permissi=
ve=3D1<br>[ =C2=A0 =C2=A00.956182] audit: type=3D1400 audit(1629697223.064:=
10): avc: =C2=A0denied =C2=A0{ add_name } for =C2=A0pid=3D99 comm=3D&quot;s=
yslogd&quot; name=3D&quot;messages&quot; scontext=3Dsystem_u:system_r:syslo=
gd_t tcontext=3Dsystem_u:object_r:tmpfs_t tclass=3Ddir permissive=3D1</div>=
<div><br></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;padd=
ing:0px"><div>I&#39;m using the reference policy version 32. If this</div><=
/blockquote>is executed in enforcing mode, at this time there would be</div=
><div>no process remaining in the system.</div><div><br></div><div><blockqu=
ote style=3D"margin:0 0 0 40px;border:none;padding:0px">Thanks!<br><br>Jos=
=C3=A9.</blockquote><div class=3D"gmail_quote"><div>=C2=A0</div></div></div=
></div>

--00000000000052a94f05ca338146--

--===============2185960528019496777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2185960528019496777==--
