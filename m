Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664C6C433FE
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 15:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7541408CA;
	Mon,  3 Oct 2022 15:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7541408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 82c794gF2zYb; Mon,  3 Oct 2022 15:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D132A408C4;
	Mon,  3 Oct 2022 15:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D132A408C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 859C81BF398
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57FC840226
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FC840226
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igez-tRNPomT for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 15:43:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76C44030A
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B76C44030A
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 15:43:10 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id bs18so10647586ljb.1
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 08:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=amYddvMfaH/LPRdhJiw/WR7YCHKLMUO/kXTFpx6gR5E=;
 b=Xrr5SFMNPmCHPfKnxj6mt6X/5TZ8AeMpAx7BBOJMupvSoPFyaEUHcMnZ8vXnQZQYLS
 BpjBM2QfIlyxoRd6QbwqNX+BsYG3MDDwjk3TJbpQFdJSWPn5KG//YkbcK+c7FO9sg1uU
 ci9V/AjyYlLVo0a2KSlauhWIM+nImjinpwnv3trPwyg/49FppdmZLNqNmyQk+lt82p+n
 Pnsaw9gRWqbppsgUhE7D7uRPdBBG57X4OUKhKtJleunefcMTDX0oAOIRFkdnI0W5fyTk
 tb/eiClzzLbQ6kjMA7IdgHvXkvEgeD+vTMWt4ehjt+6rPIGAkdup/+/0hMwT64A4XSzL
 7Ytg==
X-Gm-Message-State: ACrzQf1/Vg82cH61CcllcOukZ5kD4NUvr+lrouH9hG+eS1bzqYBlML5B
 kOfRKeZNzo7iZv7+lmwYhHMLp+FtjQD4dFUe5LeolUMEuGiXhg==
X-Google-Smtp-Source: AMsMyM6ibmueFwaL0ZNal9CypP/e1O7NjyHvFzzYx1pog6DYkZUOJ4h30kvOwXEAzfjXRq/G1kCAOV/0mLUrbB7YT0A=
X-Received: by 2002:a2e:9d9a:0:b0:26d:d0d2:2ed1 with SMTP id
 c26-20020a2e9d9a000000b0026dd0d22ed1mr2660916ljj.515.1664811788617; Mon, 03
 Oct 2022 08:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-2-angelo@amarulasolutions.com>
 <87v8plgg3p.fsf@dell.be.48ers.dk>
In-Reply-To: <87v8plgg3p.fsf@dell.be.48ers.dk>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 3 Oct 2022 17:42:31 +0200
Message-ID: <CA+_SqVYEAQa8hRCJGTM0iE7jbuq5td5zhUci3+KP0jdLPS218w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=amYddvMfaH/LPRdhJiw/WR7YCHKLMUO/kXTFpx6gR5E=;
 b=Av/bzLFXzDp/nuA1i6VTdI1TIW0Gkx6DnOVIq0uOWfc0esbbqrhNZz6xbHYTVxu3aJ
 iOkHxOKAUSlJ2l4ThuPha6iHCJMHhVTf/ezYuYGyBU2lENUiyrrT6pA8VlEQnCHKG83/
 DFPunFvLsTGPLIxBCKdP0qtVYDATQz8NaG+4c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Av/bzLFX
Subject: Re: [Buildroot] [PATCH v3 1/5] system: adding options for
 configuring wifi
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
Cc: br015@umbiko.net, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2651847887386201741=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2651847887386201741==
Content-Type: multipart/alternative; boundary="0000000000004764ba05ea2333bb"

--0000000000004764ba05ea2333bb
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 18, 2022 at 11:57 AM Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>
>  > These options can be used by packages to configure a wifi card
>  > to connect at boot.
>
>  > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>  > ---
>  >  system/Config.in | 15 +++++++++++++++
>  >  1 file changed, 15 insertions(+)
>
>  > diff --git a/system/Config.in b/system/Config.in
>  > index 888c24ce81..9a5bdb2932 100644
>  > --- a/system/Config.in
>  > +++ b/system/Config.in
>  > @@ -418,6 +418,21 @@ comment "automatic network configuration via DHCP
> needs ifupdown or busybox or n
>  >      depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
>  >              BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)
>
>  > +config BR2_SYSTEM_CONNECT_WIFI
>  > +    bool "Connect to a default wifi access point"
>  > +    default n
>
> 'n' is default, so drop that.


Right.


> This doesn't really do anything unless the
> user also configures BR2_SYSTEM_DHCP="wlan0", right?
>

Right.


>
> I must say I am not really convinced. This is only useful for quite
> specific setups (E.G. a lot more specific than BR2_SYSTEM_DHCP which we
> use in a number of defconfigs) and hard codes a number of things (like
> WPA-PSK that may or may not make sense in the future).
>

This is what we have now on several readme.txt on how to connect to a wifi

WiFi
====

 # wpa_passphrase ACCESSPOINTNAME >> /etc/wpa_supplicant.conf
   (type password and enter)
 # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
 # udhcpc -i wlan0

I don't think this is nice.

I'd like to see something like that:

WiFi
====

# Enable BR2_SYSTEM_CONNECT_WIFI configure option
# Set the Wifi SSID with the option BR2_SYSTEM_CONNECT_WIFI_SSID
# Set the password with the option BR2_SYSTEM_CONNECT_WIFI_PASSWORD

Nicer and easier. I know that the wpa-psk could change in the feature, but
then we can change to whatever default mechanism will be in place at that
moment.


>
> --
> Bye, Peter Korsgaard
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--0000000000004764ba05ea2333bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 18, 2022 at 11:57 AM Pete=
r Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&=
gt;&gt;&gt;&gt;&gt; &quot;Angelo&quot; =3D=3D Angelo Compagnucci &lt;<a hre=
f=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angelo@amarulaso=
lutions.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; These options can be used by packages to configure a wifi card<b=
r>
=C2=A0&gt; to connect at boot.<br>
<br>
=C2=A0&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@a=
marulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<=
br>
=C2=A0&gt; ---<br>
=C2=A0&gt;=C2=A0 system/Config.in | 15 +++++++++++++++<br>
=C2=A0&gt;=C2=A0 1 file changed, 15 insertions(+)<br>
<br>
=C2=A0&gt; diff --git a/system/Config.in b/system/Config.in<br>
=C2=A0&gt; index 888c24ce81..9a5bdb2932 100644<br>
=C2=A0&gt; --- a/system/Config.in<br>
=C2=A0&gt; +++ b/system/Config.in<br>
=C2=A0&gt; @@ -418,6 +418,21 @@ comment &quot;automatic network configurati=
on via DHCP needs ifupdown or busybox or n<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACK=
AGE_IFUPDOWN || \<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_PACKAGE_SYST=
EMD_NETWORKD || BR2_PACKAGE_NETIFRC)<br>
<br>
=C2=A0&gt; +config BR2_SYSTEM_CONNECT_WIFI<br>
=C2=A0&gt; +=C2=A0 =C2=A0 bool &quot;Connect to a default wifi access point=
&quot;<br>
=C2=A0&gt; +=C2=A0 =C2=A0 default n<br>
<br>
&#39;n&#39; is default, so drop that. </blockquote><div><br></div><div>Righ=
t. <br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">This doesn&#39;t really do anything unless the<br>
user also configures BR2_SYSTEM_DHCP=3D&quot;wlan0&quot;, right?<br></block=
quote><div><br></div><div>Right.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
I must say I am not really convinced. This is only useful for quite<br>
specific setups (E.G. a lot more specific than BR2_SYSTEM_DHCP which we<br>
use in a number of defconfigs) and hard codes a number of things (like<br>
WPA-PSK that may or may not make sense in the future).<br></blockquote><div=
><br></div><div>This is what we have now on several readme.txt on how to co=
nnect to a wifi</div><div><br></div><div>WiFi<br>=3D=3D=3D=3D<br><br>=C2=A0=
# wpa_passphrase ACCESSPOINTNAME &gt;&gt; /etc/wpa_supplicant.conf<br>=C2=
=A0 =C2=A0(type password and enter)<br>=C2=A0# wpa_supplicant -i wlan0 -c /=
etc/wpa_supplicant.conf -B<br>=C2=A0# udhcpc -i wlan0</div><div><br></div><=
div>I don&#39;t think this is nice.</div><div><br></div><div>I&#39;d like t=
o see something like that:</div><div><br></div><div>WiFi<br>=3D=3D=3D=3D</d=
iv><div><br></div><div># Enable BR2_SYSTEM_CONNECT_WIFI configure option</d=
iv><div># Set the Wifi SSID with the option BR2_SYSTEM_CONNECT_WIFI_SSID</d=
iv><div># Set the password with the option BR2_SYSTEM_CONNECT_WIFI_PASSWORD=
</div><div><br></div><div>Nicer and easier. I know that the wpa-psk could c=
hange in the feature, but then we can change to whatever default mechanism =
will be in place at that moment.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--0000000000004764ba05ea2333bb--

--===============2651847887386201741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2651847887386201741==--
