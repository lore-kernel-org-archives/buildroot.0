Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6F1C433FE
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 15:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1E4F60D59;
	Mon,  3 Oct 2022 15:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E4F60D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwQU3KVk52m1; Mon,  3 Oct 2022 15:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4DC660D52;
	Mon,  3 Oct 2022 15:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4DC660D52
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E9671BF398
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1647A60D52
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1647A60D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mfBi8bXdM-o for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 15:45:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF2060C26
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCF2060C26
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 15:45:00 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id t16so12260701ljh.3
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 08:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=j5aK4+keAjmS9jj6dEiNAOfWv+7gGtlWWFNgLDKzy54=;
 b=2FLUYyfe+a3y8zr1GNubjTxcWxQh5kKsMW25Dl6Z+wF1g+5dGuwcJneY2KyXk9ACw9
 E/UBfGEArBtQihW4z/0J4jFahkameqsDxaKJq43Re3vXVsKxtGWtbp7hqzZ8cdBPrqNa
 U73TwRc+1Cg0t1rV6losgm+BQpTXrTenIrKD6ff2iOeMsVGNWcUkMgEYMjEm4JJccKDl
 kTbogIevpnT03emzs+5UUoh1ZCiB0085ShmZUh3C1trsnCTvqKZMTwRD9yPKYXvMQEg7
 z77VtSjZh6I4UsdfTmWDxi6vGM3UK+GkA6766Qwn+boURO/rn/mhLWRXYd/GiOBA1KmM
 OQvg==
X-Gm-Message-State: ACrzQf02Ssi68l2HblXC9qaQrucpLRV3p9cGYkMllRn+A343RVOufsBT
 vHJZ/m5XxNuLYjWTBjx7dHM7FKlxMJuAur00PRpAVg==
X-Google-Smtp-Source: AMsMyM4fmtmiQIQUBENDjylXWApAxPluc8g8UF3KDsJ3r1O74qg4Jd47cBXrX1yvg83jG4pPW/kO7XJuv1BhTWjooLk=
X-Received: by 2002:a05:651c:110c:b0:26d:a099:8715 with SMTP id
 e12-20020a05651c110c00b0026da0998715mr7022219ljo.44.1664811898908; Mon, 03
 Oct 2022 08:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-4-angelo@amarulasolutions.com>
 <87r109gfyi.fsf@dell.be.48ers.dk>
In-Reply-To: <87r109gfyi.fsf@dell.be.48ers.dk>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 3 Oct 2022 17:44:21 +0200
Message-ID: <CA+_SqVZmXGNY4PZP3bpr-wc=-Wzk8jWsWMGhhNYgVLJeQrdDSA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=j5aK4+keAjmS9jj6dEiNAOfWv+7gGtlWWFNgLDKzy54=;
 b=bujNeCkalb0gP4+oqXeO+SqQ/XsiywjTffsxW4bbhebIsD3S/P+8oNVETqzv0CYco+
 WbXXenmo235OGSesmArQOpAx/QSf4B6pXbEghZVc/X+86BRPXxmJsh1L2sPc43BOAra/
 qbDrPWska5jz4lK0ucbMgmIpWSJaq16UcIhtA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bujNeCka
Subject: Re: [Buildroot] [PATCH v3 3/5] package/wpa_supplicant: configure
 wifi on systemd when enabled
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
Content-Type: multipart/mixed; boundary="===============5281394651131829424=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5281394651131829424==
Content-Type: multipart/alternative; boundary="000000000000da4e2e05ea23390e"

--000000000000da4e2e05ea23390e
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 18, 2022 at 12:00 PM Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>
>  > Configure a default basic wifi setup able to automatically connect
>  > to the selected access point.
>
>  > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>  > ---
>  >  package/wpa_supplicant/wpa_supplicant.mk | 10 ++++++++++
>  >  system/Config.in                         |  1 +
>  >  2 files changed, 11 insertions(+)
>
>  > diff --git a/package/wpa_supplicant/wpa_supplicant.mk
> b/package/wpa_supplicant/wpa_supplicant.mk
>  > index 09971654fe..157d45ee7f 100644
>  > --- a/package/wpa_supplicant/wpa_supplicant.mk
>  > +++ b/package/wpa_supplicant/wpa_supplicant.mk
>  > @@ -275,6 +275,15 @@ define WPA_SUPPLICANT_ENABLE_WIFI
>  >              echo "}"; \
>  >      ) >> $(TARGET_DIR)/etc/wpa_supplicant.conf
>  >  endef
>  > +define WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD
>  > +    $(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/wpa_supplicant/
>  > +    ln -sf ../wpa_supplicant.conf \
>  > +
> $(TARGET_DIR)/etc/wpa_supplicant/wpa_supplicant-$(BR2_SYSTEM_DHCP).conf
>
> How do you know BR2_SYSTEM_DHCP is set to something sensible here?
>

Not enforced, but if a user put a nonexistent interface, that file simply
won't work. It is up to the user knowing which interface he wants to enable
dhcp onto.


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

--000000000000da4e2e05ea23390e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 18, 2022 at 12:00 PM Pete=
r Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&=
gt;&gt;&gt;&gt;&gt; &quot;Angelo&quot; =3D=3D Angelo Compagnucci &lt;<a hre=
f=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angelo@amarulaso=
lutions.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Configure a default basic wifi setup able to automatically conne=
ct<br>
=C2=A0&gt; to the selected access point.<br>
<br>
=C2=A0&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@a=
marulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<=
br>
=C2=A0&gt; ---<br>
=C2=A0&gt;=C2=A0 package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk=
" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> | 10 +++++++++=
+<br>
=C2=A0&gt;=C2=A0 system/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0&gt;=C2=A0 2 files changed, 11 insertions(+)<br>
<br>
=C2=A0&gt; diff --git a/package/wpa_supplicant/<a href=3D"http://wpa_suppli=
cant.mk" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> b/packa=
ge/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"noreferrer" t=
arget=3D"_blank">wpa_supplicant.mk</a><br>
=C2=A0&gt; index 09971654fe..157d45ee7f 100644<br>
=C2=A0&gt; --- a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk=
" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a><br>
=C2=A0&gt; +++ b/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk=
" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a><br>
=C2=A0&gt; @@ -275,6 +275,15 @@ define WPA_SUPPLICANT_ENABLE_WIFI<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;}&quo=
t;; \<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 ) &gt;&gt; $(TARGET_DIR)/etc/wpa_supplicant.=
conf<br>
=C2=A0&gt;=C2=A0 endef<br>
=C2=A0&gt; +define WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD<br>
=C2=A0&gt; +=C2=A0 =C2=A0 $(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/wpa_suppl=
icant/<br>
=C2=A0&gt; +=C2=A0 =C2=A0 ln -sf ../wpa_supplicant.conf \<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_DIR)/etc/wpa=
_supplicant/wpa_supplicant-$(BR2_SYSTEM_DHCP).conf<br>
<br>
How do you know BR2_SYSTEM_DHCP is set to something sensible here?<br></blo=
ckquote><div><br></div><div>Not enforced, but if a user put a nonexistent i=
nterface, that file simply won&#39;t work. It is up to the user knowing whi=
ch interface he wants to enable dhcp onto.<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
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

--000000000000da4e2e05ea23390e--

--===============5281394651131829424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5281394651131829424==--
