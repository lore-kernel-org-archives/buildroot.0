Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122AFC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 09:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0CFB60F23;
	Tue,  4 Oct 2022 09:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0CFB60F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2qD-j9_k4WOS; Tue,  4 Oct 2022 09:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98E8860EF2;
	Tue,  4 Oct 2022 09:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98E8860EF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 606381BF27C
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36173410C2
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36173410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9ty9N-dGKLa for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 09:14:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F7E40AB9
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48F7E40AB9
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 09:14:47 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y5so585584lfl.4
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 02:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GeQ3PjPrVvTA0ywBbB479mMemtq6zPds0lE8kwMfudI=;
 b=kSYwk1SBbOEPNclZr69jmK9+EJeMHaxND9YhLtGABtmtVS1pSxLnvfe1yIJkJpozTP
 YnUdVMzlQ+vIM7vi1dUiaPpawMDiAsuIfOBzCJJGbooxOgWNB9WewXg0OnX71ewk3qAy
 03rIHye4tFoj5gXQg8LcrFopEPxt3+N6xBAGMDyjVmtSnBH8nl31PBp0MJT/+hOyU0lF
 KQJ31pZcQTYWn2T9CbqitOQ58Z9XqhjY/iWWp41ULacI8zoGfP1rfhH5EqEpRsAlq9sY
 +2e/ABVyppmHGnr2Uegz5kbqAbpbiSnsUxn27nBEzYWW4PAv0NdSajS2S0Y2D7L35fHt
 o0xQ==
X-Gm-Message-State: ACrzQf0A1P5RXvt7VfO7TAlmxZlv5XErTuAbnkPt76IHPnaZ2yyMj8il
 oGCwfdlusf8PcIwLjxPvaXA/Tm/MwIri9QwXtc0GpPZi3sc=
X-Google-Smtp-Source: AMsMyM6hffPdFYPE2e/w4U9TbI0g8S5t/cbCel18eqJOiuV8lBIl+QFJRLxgkwyTO+VFJ0vH51IkjwHZsraip6MieNg=
X-Received: by 2002:a05:6512:743:b0:4a2:3918:8457 with SMTP id
 c3-20020a056512074300b004a239188457mr3728034lfs.39.1664874885053; Tue, 04 Oct
 2022 02:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-2-angelo@amarulasolutions.com>
 <87v8plgg3p.fsf@dell.be.48ers.dk>
 <CA+_SqVYEAQa8hRCJGTM0iE7jbuq5td5zhUci3+KP0jdLPS218w@mail.gmail.com>
 <c20f316624d3d80cc3883023e9ae4cc4@umbiko.net>
In-Reply-To: <c20f316624d3d80cc3883023e9ae4cc4@umbiko.net>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 4 Oct 2022 11:14:07 +0200
Message-ID: <CA+_SqVZ7oQ1k=EvkNqeq3=qYdOy-c-LgA=5V3vqdiLkEmNQvsw@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GeQ3PjPrVvTA0ywBbB479mMemtq6zPds0lE8kwMfudI=;
 b=DeqfQdB/bN5e4gSLsdc8R/j4cbkhCNB6fb2mfbVgR3Bq1H5XLN3TtznaqIqdIOQ7AC
 IlBD0g7zi937VHpUl6y+e7zn4uz6HTYlrNH0Abp7PNAmNeGSQ+VXKYVSFpCdKffCp9ci
 CVOWv0bdjIenRkE6y+IryUsXjLBx+Kb+nEr6s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DeqfQdB/
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6496407824794453579=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6496407824794453579==
Content-Type: multipart/alternative; boundary="0000000000001e9cd505ea31e443"

--0000000000001e9cd505ea31e443
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 4, 2022 at 11:05 AM Andreas Ziegler <br015@umbiko.net> wrote:

> Hi Angelo, Peter, *,
>
> On 2022-10-03 15:42, Angelo Compagnucci wrote:
> > On Sun, Sep 18, 2022 at 11:57 AM Peter Korsgaard <peter@korsgaard.com>
> > wrote:
> >
> >> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com>
> writes:
> >>
> >>  > These options can be used by packages to configure a wifi card
> >>  > to connect at boot.
> >>
> >>  > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> >>  > ---
> >>  >  system/Config.in | 15 +++++++++++++++
> >>  >  1 file changed, 15 insertions(+)
> >>
> >>  > diff --git a/system/Config.in b/system/Config.in
> >>  > index 888c24ce81..9a5bdb2932 100644
> >>  > --- a/system/Config.in
> >>  > +++ b/system/Config.in
> >>  > @@ -418,6 +418,21 @@ comment "automatic network configuration via
> >> DHCP
> >> needs ifupdown or busybox or n
> >>  >      depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
> >>  >              BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)
> >>
> >>  > +config BR2_SYSTEM_CONNECT_WIFI
> >>  > +    bool "Connect to a default wifi access point"
> >>  > +    default n
>
> Depending on BR2_SYSTEM_DHCP would remove some unwanted side effects:
>
> +config BR2_SYSTEM_CONNECT_WIFI
> +    bool "Connect to a default wifi access point"
> +    depends on BR2_SYSTEM_DHCP != "" && BR2_PACKAGE_WPA_SUPPLICANT
>

Nice indeed!


>
> Kind regards,
> Andreas
>
> >>
> >> 'n' is default, so drop that.
> >
> >
> > Right.
> >
> >
> >> This doesn't really do anything unless the
> >> user also configures BR2_SYSTEM_DHCP="wlan0", right?
> >>
> >
> > Right.
> >
> >
> >>
> >> I must say I am not really convinced. This is only useful for quite
> >> specific setups (E.G. a lot more specific than BR2_SYSTEM_DHCP which
> >> we
> >> use in a number of defconfigs) and hard codes a number of things (like
> >> WPA-PSK that may or may not make sense in the future).
> >>
> >
> > This is what we have now on several readme.txt on how to connect to a
> > wifi
> >
> > WiFi
> > ====
> >
> >  # wpa_passphrase ACCESSPOINTNAME >> /etc/wpa_supplicant.conf
> >    (type password and enter)
> >  # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
> >  # udhcpc -i wlan0
> >
> > I don't think this is nice.
> >
> > I'd like to see something like that:
> >
> > WiFi
> > ====
> >
> > # Enable BR2_SYSTEM_CONNECT_WIFI configure option
> > # Set the Wifi SSID with the option BR2_SYSTEM_CONNECT_WIFI_SSID
> > # Set the password with the option BR2_SYSTEM_CONNECT_WIFI_PASSWORD
> >
> > Nicer and easier. I know that the wpa-psk could change in the feature,
> > but
> > then we can change to whatever default mechanism will be in place at
> > that
> > moment.
> >
> >
> >>
> >> --
> >> Bye, Peter Korsgaard
> >>
> >
> >
> > --
> >
> > Angelo Compagnucci
> >
> > Software Engineer
> >
> > angelo@amarulasolutions.com
> > __________________________________
> > Amarula Solutions SRL
> >
> > Via le Canevare 30, 31100 Treviso, Veneto, IT
> >
> > T. +39 (0)42 243 5310
> > info@amarulasolutions.com
> >
> > www.amarulasolutions.com
> > [`as] https://www.amarulasolutions.com|
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

--0000000000001e9cd505ea31e443
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 4, 2022 at 11:05 AM Andre=
as Ziegler &lt;<a href=3D"mailto:br015@umbiko.net">br015@umbiko.net</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Angel=
o, Peter, *,<br>
<br>
On 2022-10-03 15:42, Angelo Compagnucci wrote:<br>
&gt; On Sun, Sep 18, 2022 at 11:57 AM Peter Korsgaard &lt;<a href=3D"mailto=
:peter@korsgaard.com" target=3D"_blank">peter@korsgaard.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; &gt;&gt;&gt;&gt;&gt; &quot;Angelo&quot; =3D=3D Angelo Compagnucci =
&lt;<a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angelo=
@amarulasolutions.com</a>&gt; writes:<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 &gt; These options can be used by packages to configure a wi=
fi card<br>
&gt;&gt;=C2=A0 &gt; to connect at boot.<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 &gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto=
:angelo@amarulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com=
</a>&gt;<br>
&gt;&gt;=C2=A0 &gt; ---<br>
&gt;&gt;=C2=A0 &gt;=C2=A0 system/Config.in | 15 +++++++++++++++<br>
&gt;&gt;=C2=A0 &gt;=C2=A0 1 file changed, 15 insertions(+)<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 &gt; diff --git a/system/Config.in b/system/Config.in<br>
&gt;&gt;=C2=A0 &gt; index 888c24ce81..9a5bdb2932 100644<br>
&gt;&gt;=C2=A0 &gt; --- a/system/Config.in<br>
&gt;&gt;=C2=A0 &gt; +++ b/system/Config.in<br>
&gt;&gt;=C2=A0 &gt; @@ -418,6 +418,21 @@ comment &quot;automatic network co=
nfiguration via <br>
&gt;&gt; DHCP<br>
&gt;&gt; needs ifupdown or busybox or n<br>
&gt;&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 depends on !(BR2_PACKAGE_BUSYBOX ||=
 BR2_PACKAGE_IFUPDOWN || \<br>
&gt;&gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_PAC=
KAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 &gt; +config BR2_SYSTEM_CONNECT_WIFI<br>
&gt;&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 bool &quot;Connect to a default wifi acc=
ess point&quot;<br>
&gt;&gt;=C2=A0 &gt; +=C2=A0 =C2=A0 default n<br>
<br>
Depending on BR2_SYSTEM_DHCP would remove some unwanted side effects:<br>
<br>
+config BR2_SYSTEM_CONNECT_WIFI<br>
+=C2=A0 =C2=A0 bool &quot;Connect to a default wifi access point&quot;<br>
+=C2=A0 =C2=A0 depends on BR2_SYSTEM_DHCP !=3D &quot;&quot; &amp;&amp; BR2_=
PACKAGE_WPA_SUPPLICANT<br></blockquote><div><br></div><div>Nice indeed!</di=
v><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Andreas<br>
<br>
&gt;&gt; <br>
&gt;&gt; &#39;n&#39; is default, so drop that.<br>
&gt; <br>
&gt; <br>
&gt; Right.<br>
&gt; <br>
&gt; <br>
&gt;&gt; This doesn&#39;t really do anything unless the<br>
&gt;&gt; user also configures BR2_SYSTEM_DHCP=3D&quot;wlan0&quot;, right?<b=
r>
&gt;&gt; <br>
&gt; <br>
&gt; Right.<br>
&gt; <br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; I must say I am not really convinced. This is only useful for quit=
e<br>
&gt;&gt; specific setups (E.G. a lot more specific than BR2_SYSTEM_DHCP whi=
ch <br>
&gt;&gt; we<br>
&gt;&gt; use in a number of defconfigs) and hard codes a number of things (=
like<br>
&gt;&gt; WPA-PSK that may or may not make sense in the future).<br>
&gt;&gt; <br>
&gt; <br>
&gt; This is what we have now on several readme.txt on how to connect to a =
<br>
&gt; wifi<br>
&gt; <br>
&gt; WiFi<br>
&gt; =3D=3D=3D=3D<br>
&gt; <br>
&gt;=C2=A0 # wpa_passphrase ACCESSPOINTNAME &gt;&gt; /etc/wpa_supplicant.co=
nf<br>
&gt;=C2=A0 =C2=A0 (type password and enter)<br>
&gt;=C2=A0 # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B<br>
&gt;=C2=A0 # udhcpc -i wlan0<br>
&gt; <br>
&gt; I don&#39;t think this is nice.<br>
&gt; <br>
&gt; I&#39;d like to see something like that:<br>
&gt; <br>
&gt; WiFi<br>
&gt; =3D=3D=3D=3D<br>
&gt; <br>
&gt; # Enable BR2_SYSTEM_CONNECT_WIFI configure option<br>
&gt; # Set the Wifi SSID with the option BR2_SYSTEM_CONNECT_WIFI_SSID<br>
&gt; # Set the password with the option BR2_SYSTEM_CONNECT_WIFI_PASSWORD<br=
>
&gt; <br>
&gt; Nicer and easier. I know that the wpa-psk could change in the feature,=
 <br>
&gt; but<br>
&gt; then we can change to whatever default mechanism will be in place at <=
br>
&gt; that<br>
&gt; moment.<br>
&gt; <br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; --<br>
&gt;&gt; Bye, Peter Korsgaard<br>
&gt;&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; Angelo Compagnucci<br>
&gt; <br>
&gt; Software Engineer<br>
&gt; <br>
&gt; <a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angel=
o@amarulasolutions.com</a><br>
&gt; __________________________________<br>
&gt; Amarula Solutions SRL<br>
&gt; <br>
&gt; Via le Canevare 30, 31100 Treviso, Veneto, IT<br>
&gt; <br>
&gt; T. +39 (0)42 243 5310<br>
&gt; <a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@am=
arulasolutions.com</a><br>
&gt; <br>
&gt; <a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer" target=
=3D"_blank">www.amarulasolutions.com</a><br>
&gt; [`as] <a href=3D"https://www.amarulasolutions.com" rel=3D"noreferrer" =
target=3D"_blank">https://www.amarulasolutions.com</a>|<br>
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

--0000000000001e9cd505ea31e443--

--===============6496407824794453579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6496407824794453579==--
