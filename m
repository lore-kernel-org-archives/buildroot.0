Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MIME_QP_LONG_LINE,
	SPF_HELO_NONE,SPF_PASS,T_KAM_HTML_FONT_INVALID,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BB6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 09:14:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C95A61250
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 09:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C95A61250
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6732F400FB;
	Sun, 22 Aug 2021 09:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JENvwRegmqLD; Sun, 22 Aug 2021 09:14:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA9ED401F1;
	Sun, 22 Aug 2021 09:14:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF571BF2C1
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 09:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B60E401F1
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 09:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1WQARwIqRgS for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 09:14:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb155.aruba.it (smtpweb155.aruba.it [62.149.158.155])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28C69400FB
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 09:14:34 +0000 (UTC)
Received: from smtpclient.apple ([89.164.10.203])
 by Aruba Outgoing Smtp  with ESMTPA
 id HjYkmfvr9a4UMHjYlmmJuL; Sun, 22 Aug 2021 11:14:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629623673; bh=wAxll4/Qz9q8I9xDX02NnAIzu0hzPk+/Z1DnronAUx8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=LRhU7RDjJ/zmRPXhd73/pQMyL7FHga7s2pa2CW0FmjjJVvtcuI7aAkw4JiO2ICN4N
 MSiOOOWNGSdPJ+Cpkx+9eMYhnltS4Y0TIc3cz2dK9ndxepPRe55JJNgrJZDtaEkEG3
 ynmNJvWnP65j03gO/DR5LqJeQMiiEYG6qgpKOsUoYCbOvxvKv+V1TqHHsKbk+f5OhR
 R+I/LNprR9mzRwAtIK+IKgDUZ1YSwmKSzoq4aCfFgE6ma4qdPKkA3SoxKKkW41YQqz
 /IvyZsJlj4M6NIZQc3KJ5uuz9mbaloEEatz8F20/jaj+XUEmunDaSDPJp0gkuxhpp+
 N04u9jvdtZRPw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 22 Aug 2021 11:14:30 +0200
Message-Id: <FE42D615-6AE8-462B-8B28-33B13B98BDCE@benettiengineering.com>
References: <CAAV5jBd+Z2o-8unyXtNeWJgcbMGobANYbUss-rOm=+K_OVbNDQ@mail.gmail.com>
In-Reply-To: <CAAV5jBd+Z2o-8unyXtNeWJgcbMGobANYbUss-rOm=+K_OVbNDQ@mail.gmail.com>
To: Bensuperpc <bensuperpc@gmail.com>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfEP/kwK6lcmdddIY1tvWjVXrP7vkDjExC2UOq9z1NfCyh9zodJvoYAsqSvlSItFrZZGrqomOMVfszLIRSyau8nUgHpxoGGs7aJJzFc6Q7RYckT6ui3uD
 9dHaM+wSjsZMWsiZ8chTP4ewN4iw2dJYNfj5RcgQ1bm1AMsYlDRBoPF92trNqBDJ8faU6ZF9DmcJYhzGbEwpYwdj+JjvohbvmqbVFV479YbSh03Qj+U7S7S+
 hYB3N5aTsUIm2X2SxY0hQjdf1zC5e53MzY8EEoIAzt28J1iQlD4BJys6VAz/mLmMtvwVVOpHX6CsgwgUYQrOFIhI5uIZAEqKV/2LA0Z8ZSiAwXQQLyuTGEvS
 b0/AYSQM
Subject: Re: [Buildroot] [PATCH 1/1] Enable quadmath on aarch64
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9022705820774637347=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>


--===============9022705820774637347==
Content-Type: multipart/alternative; boundary=Apple-Mail-9AAE0C6E-15D9-46A5-AE3E-A53FB16F0885
Content-Transfer-Encoding: 7bit


--Apple-Mail-9AAE0C6E-15D9-46A5-AE3E-A53FB16F0885
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bensuperpc,

you have to use your real name. Then you have to use plain text, no html at a=
ll in Mailing List.
This commit log seems written directly in email client, instead you should w=
rite it during git commit.

Also, you need to send v2 patch, so pass -v2 to git format-patch and indicat=
e V1->V2 changes(basically you=E2=80=99re written the commit log).

Best regards
Giulio Benetti

Inviato da iPhone

> Il giorno 22 ago 2021, alle ore 06:27, Bensuperpc <bensuperpc@gmail.com> h=
a scritto:
>=20
> =EF=BB=BF
> Some headers need quadmath to work (Ex: boost::multiprecision::float128),=20=

>=20
> I am getting following compile error on aarch64 without BR2_TOOLCHAIN_HAS_=
LIBQUADMATH=3Dy :
> boost/multiprecision/float128.hpp:40:10: fatal error: 'quadmath.h' file no=
t found
> when I use float128 in boost.
>=20
> Config file: https://github.com/dockcross/dockcross/blob/master/linux-arm6=
4-full/buildroot.config
>=20
> Bensuperpc,
>=20
>=20
>> Le sam. 21 ao=C3=BBt 2021 =C3=A0 23:27, Thomas Petazzoni <thomas.petazzon=
i@bootlin.com> a =C3=A9crit :
>> On Sat, 21 Aug 2021 21:44:01 +0200
>> Bensuperpc <bensuperpc@gmail.com> wrote:
>>=20
>> > Enable quadmath on aarch64
>> >=20
>> > Signed-off-by: Bensuperpc <bensuperpc@gmail.com>
>>=20
>> We do need a real name to accept contributions.
>>=20
>> > ---
>> >  toolchain/Config.in | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >=20
>> > diff --git a/toolchain/Config.in b/toolchain/Config.in
>> > index 1d0469a13e..b4cd6d511f 100644
>> > --- a/toolchain/Config.in
>> > +++ b/toolchain/Config.in
>> > @@ -794,6 +794,6 @@ config BR2_TOOLCHAIN_HAS_ATOMIC
>> >  # - When available, libquadmath requires wchar support.
>> >  config BR2_TOOLCHAIN_HAS_LIBQUADMATH
>> >       bool
>> > -     default y if BR2_i386 || BR2_x86_64
>> > +     default y if BR2_i386 || BR2_x86_64 || BR2_aarch64
>>=20
>> This option is not about "enabling" something, but about saying whether
>> libquadmath is supported/available on a given CPU architecture. Since
>> when is libquadmath available/supported by gcc?
>>=20
>> What was the motivation behind this change?
>>=20
>> Thanks!
>>=20
>> Thomas
>> --=20
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com

--Apple-Mail-9AAE0C6E-15D9-46A5-AE3E-A53FB16F0885
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Bensuperpc,<div><br></div><div>you have t=
o use your real name. Then you have to use plain text, no html at all in Mai=
ling List.</div><div>This commit log seems written directly in email client,=
 instead you should write it during git commit.</div><div><br></div><div>Als=
o, you need to send v2 patch, so pass -v2 to git format-patch and indicate V=
1-&gt;V2 changes(basically you=E2=80=99re written the commit log).</div><div=
><br></div><div>Best regards</div><div>Giulio Benetti<br><br><div dir=3D"ltr=
">Inviato da iPhone</div><div dir=3D"ltr"><br><blockquote type=3D"cite">Il g=
iorno 22 ago 2021, alle ore 06:27, Bensuperpc &lt;bensuperpc@gmail.com&gt; h=
a scritto:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"l=
tr">=EF=BB=BF<div dir=3D"ltr">Some headers need quadmath to work (Ex: boost:=
:multiprecision::float128),&nbsp;<br><div><br></div><div>I am getting follow=
ing compile error on aarch64 without&nbsp;<span style=3D"color:rgb(80,0,80)"=
><i><b>BR2_TOOLCHAIN_HAS_LIBQUADMATH=3Dy</b>&nbsp;</i></span>:</div><div><i>=
boost/multiprecision/float128.hpp:40:10: fatal error: 'quadmath.h' file not f=
ound</i><br></div><div>when I use&nbsp;<span style=3D"font-family:inherit;fo=
nt-style:inherit;font-variant-ligatures:inherit;font-variant-caps:inherit;fo=
nt-weight:inherit;background-color:transparent;white-space:inherit;font-size=
:13px">float128 in boost.</span></div><div><br></div><div>Config file:&nbsp;=
<a href=3D"https://github.com/dockcross/dockcross/blob/master/linux-arm64-fu=
ll/buildroot.config" target=3D"_blank">https://github.com/dockcross/dockcros=
s/blob/master/linux-arm64-full/buildroot.config</a></div><div><br></div><div=
>Bensuperpc,</div><div><b><br></b></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Le&nbsp;sam. 21 ao=C3=BBt 2021 =C3=A0=
&nbsp;23:27, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin=
.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit&nb=
sp;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 21 Aug=
 2021 21:44:01 +0200<br>
Bensuperpc &lt;<a href=3D"mailto:bensuperpc@gmail.com" target=3D"_blank">ben=
superpc@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Enable quadmath on aarch64<br>
&gt; <br>
&gt; Signed-off-by: Bensuperpc &lt;<a href=3D"mailto:bensuperpc@gmail.com" t=
arget=3D"_blank">bensuperpc@gmail.com</a>&gt;<br>
<br>
We do need a real name to accept contributions.<br>
<br>
&gt; ---<br>
&gt;&nbsp; toolchain/Config.in | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/toolchain/Config.in b/toolchain/Config.in<br>
&gt; index 1d0469a13e..b4cd6d511f 100644<br>
&gt; --- a/toolchain/Config.in<br>
&gt; +++ b/toolchain/Config.in<br>
&gt; @@ -794,6 +794,6 @@ config BR2_TOOLCHAIN_HAS_ATOMIC<br>
&gt;&nbsp; # - When available, libquadmath requires wchar support.<br>
&gt;&nbsp; config BR2_TOOLCHAIN_HAS_LIBQUADMATH<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;bool<br>
&gt; -&nbsp; &nbsp; &nbsp;default y if BR2_i386 || BR2_x86_64<br>
&gt; +&nbsp; &nbsp; &nbsp;default y if BR2_i386 || BR2_x86_64 || BR2_aarch64=
<br>
<br>
This option is not about "enabling" something, but about saying whether<br>
libquadmath is supported/available on a given CPU architecture. Since<br>
when is libquadmath available/supported by gcc?<br>
<br>
What was the motivation behind this change?<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:/=
/bootlin.com</a><br>
</blockquote></div>
</div></blockquote></div></body></html>=

--Apple-Mail-9AAE0C6E-15D9-46A5-AE3E-A53FB16F0885--

--===============9022705820774637347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============9022705820774637347==--
