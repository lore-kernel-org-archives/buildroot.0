Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4E7C433FE
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 15:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 090BD4151D;
	Mon,  3 Oct 2022 15:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 090BD4151D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ByWSq_fpt_Sn; Mon,  3 Oct 2022 15:50:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E5D240911;
	Mon,  3 Oct 2022 15:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E5D240911
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0004B1BF398
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD44540911
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD44540911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQSRPdpvBGt8 for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 15:50:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E434086C
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45E434086C
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 15:50:53 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u26so8582224lfk.8
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 08:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GcVmfJFa3pHzWTEhsXBo5wkL8l9yH9RUaAhsR4Q0j0Y=;
 b=JmNoWF7HZ/JaprVvJ6GbcGU8A/nO1U+pU6JbWJdyor4aEz5iqVbcY6t2KQi3GuRtIo
 TbF12pWpoOAn1+n/RJU368Ph8i0cCWsy1e5Qo5RKtG8Nwmyzqsmno42l9n/cqJgp94Z7
 RAU3YICcBmBDReJsf8u+HtOfnVqskmOwxs1HoVnca1WNi36p73lYeDVYz6/p8E0GdPvS
 OHNMfYXB2OOpuSS5MQHp/N1yB+fbFCSvtGSQ60oVj7Onj1YtqMqtWXbzMBbYXRv6yLME
 lqk5eLV/Z+AH5hOKCbjtkApEiNagpafycC9U9T++kTkEgettZITnZ9ARePR3g/q8RJHD
 ZK8Q==
X-Gm-Message-State: ACrzQf0I0GSAFXCff5xY5bAB9XoZqczG4ZMT6RjyJohWrsarpFe8oT/J
 gcsTagTeChvrJEafUc9FQmBL4Ycb+FUibjMMd5WwqzIeiUS+ug==
X-Google-Smtp-Source: AMsMyM67v3jBRBbwqJ0YsZ7mBjhvEvF9qgmlyKFVytXcRHZnRspzy5DfpoO/nVJcIemXgTdaiGnVkjXu87yK3seOhmY=
X-Received: by 2002:a05:6512:401f:b0:49e:ea65:cd49 with SMTP id
 br31-20020a056512401f00b0049eea65cd49mr7241694lfb.419.1664812249999; Mon, 03
 Oct 2022 08:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-5-angelo@amarulasolutions.com>
 <87mtaxgfty.fsf@dell.be.48ers.dk>
In-Reply-To: <87mtaxgfty.fsf@dell.be.48ers.dk>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 3 Oct 2022 17:50:13 +0200
Message-ID: <CA+_SqVYnr_xyuxU1T84Op3eNdJqh1BbMo8OOD54kTF9YaTH5vg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GcVmfJFa3pHzWTEhsXBo5wkL8l9yH9RUaAhsR4Q0j0Y=;
 b=dvsK132kQvLJdt7IkvuJMQu03Xi/fwwqRyJV28APl2vE53sc1qeRjVM6Rxbd/CxIPb
 MPZphgayzyU+MqrzNqtAqGJUSrgXNSQpu9aX7hIRaCdo4K/XQ7AxpBkoQnGVy5NS8VLz
 8Ql+JTJRL3z1t95MR0vLMvJQH26I9ouvV6+ks=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dvsK132k
Subject: Re: [Buildroot] [PATCH v3 4/5] package/ifupdown-scripts: add wifi
 configuration when enabled
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
Content-Type: multipart/mixed; boundary="===============6107384676251991984=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6107384676251991984==
Content-Type: multipart/alternative; boundary="000000000000c7847905ea234e1a"

--000000000000c7847905ea234e1a
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 18, 2022 at 12:03 PM Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>
>  > Add a proper wpa-conf line to the interfaces files to let the system
>  > bringup the wifi interface and the related wpa supplicant.
>
>  > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>  > ---
>  > Changes:
>  > v3:
>  > * add "|| true" lo let the command exit without error when
>  >   BR2_SYSTEM_CONNECT_WIFI is empty (me)
>
>  >  package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
>  >  1 file changed, 2 insertions(+)
>
>  > diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk
> b/package/ifupdown-scripts/ifupdown-scripts.mk
>  > index 5ef032142c..ebaf234143 100644
>  > --- a/package/ifupdown-scripts/ifupdown-scripts.mk
>  > +++ b/package/ifupdown-scripts/ifupdown-scripts.mk
>  > @@ -28,6 +28,8 @@ define IFUPDOWN_SCRIPTS_DHCP
>  >              echo "  pre-up /etc/network/nfs_check"; \
>  >              echo "  wait-delay 15"; \
>  >              echo "  hostname \$$(hostname)"; \
>  > +            test -n "$(BR2_SYSTEM_CONNECT_WIFI)" && \
>  > +                    echo "  wpa-conf /etc/wpa_supplicant.conf" ||
> true; \
>  >      ) >> $(TARGET_DIR)/etc/network/interfaces
>
> Maybe we should do this unconditionally if we overwrite
> /etc/network/interfaces and wpa_supplicant is enabled?
>

Not entirely sure to understand this comment. We need to enable the
"wpa-conf" line only when a user enables BR2_SYSTEM_CONNECT_WIFI.

If a user overwrites /etc/network/interfaces in a overlay, he must ensure
it is compiling also wpa_supplicant.

Are suggesting to add code somewhere to check if a user enabled "wpa-conf"
line in his own overlay and then enable wpa_supplicant package for him?


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

--000000000000c7847905ea234e1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 18, 2022 at 12:03 PM Pete=
r Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&=
gt;&gt;&gt;&gt;&gt; &quot;Angelo&quot; =3D=3D Angelo Compagnucci &lt;<a hre=
f=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angelo@amarulaso=
lutions.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Add a proper wpa-conf line to the interfaces files to let the sy=
stem<br>
=C2=A0&gt; bringup the wifi interface and the related wpa supplicant.<br>
<br>
=C2=A0&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@a=
marulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<=
br>
=C2=A0&gt; ---<br>
=C2=A0&gt; Changes:<br>
=C2=A0&gt; v3:<br>
=C2=A0&gt; * add &quot;|| true&quot; lo let the command exit without error =
when<br>
=C2=A0&gt;=C2=A0 =C2=A0BR2_SYSTEM_CONNECT_WIFI is empty (me)<br>
<br>
=C2=A0&gt;=C2=A0 package/ifupdown-scripts/<a href=3D"http://ifupdown-script=
s.mk" rel=3D"noreferrer" target=3D"_blank">ifupdown-scripts.mk</a> | 2 ++<b=
r>
=C2=A0&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0&gt; diff --git a/package/ifupdown-scripts/<a href=3D"http://ifupdown=
-scripts.mk" rel=3D"noreferrer" target=3D"_blank">ifupdown-scripts.mk</a> b=
/package/ifupdown-scripts/<a href=3D"http://ifupdown-scripts.mk" rel=3D"nor=
eferrer" target=3D"_blank">ifupdown-scripts.mk</a><br>
=C2=A0&gt; index 5ef032142c..ebaf234143 100644<br>
=C2=A0&gt; --- a/package/ifupdown-scripts/<a href=3D"http://ifupdown-script=
s.mk" rel=3D"noreferrer" target=3D"_blank">ifupdown-scripts.mk</a><br>
=C2=A0&gt; +++ b/package/ifupdown-scripts/<a href=3D"http://ifupdown-script=
s.mk" rel=3D"noreferrer" target=3D"_blank">ifupdown-scripts.mk</a><br>
=C2=A0&gt; @@ -28,6 +28,8 @@ define IFUPDOWN_SCRIPTS_DHCP<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=
=A0 pre-up /etc/network/nfs_check&quot;; \<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=
=A0 wait-delay 15&quot;; \<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=
=A0 hostname \$$(hostname)&quot;; \<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -n &quot;$(BR2_S=
YSTEM_CONNECT_WIFI)&quot; &amp;&amp; \<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo &quot;=C2=A0 wpa-conf /etc/wpa_supplicant.conf&quot; || true; \=
<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 ) &gt;&gt; $(TARGET_DIR)/etc/network/interfa=
ces<br>
<br>
Maybe we should do this unconditionally if we overwrite<br>
/etc/network/interfaces and wpa_supplicant is enabled?<br></blockquote><div=
><br></div><div>Not entirely sure to understand this comment. We need to en=
able the &quot;wpa-conf&quot; line only when a user enables BR2_SYSTEM_CONN=
ECT_WIFI.</div><div><br></div><div>If a user overwrites /etc/network/interf=
aces in a overlay, he must ensure it is compiling also wpa_supplicant.</div=
><div><br></div><div>Are suggesting to add code somewhere to check if a use=
r enabled &quot;wpa-conf&quot; line in his own overlay and then enable wpa_=
supplicant package for him?<br></div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
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

--000000000000c7847905ea234e1a--

--===============6107384676251991984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6107384676251991984==--
