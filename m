Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65F9C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 09:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6544C60BCC;
	Mon, 20 Feb 2023 09:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6544C60BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppIlz-193BSu; Mon, 20 Feb 2023 09:19:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64B5060F9D;
	Mon, 20 Feb 2023 09:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64B5060F9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 653941BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F09881B6D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F09881B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FUVkiRTFtV1r for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 09:19:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0F0881AF5
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0F0881AF5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 09:19:45 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id h14so760886plf.10
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 01:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xhpYjRdwEAQwJsldHkmUD641IgI7d6sJWcESNK9htlA=;
 b=Vk/say73gqDrTjjHQhyffomJpsNbbky6EqFqLEAG8JTEWf8kwvGBmqCzmqo77oMqE2
 uGDcPb3ghxrYQeWhB5orB6+Irby03ToHnOisDBTCTJ+/9x80a2kCU4rsXRKD3eKg9r0I
 IAtqJe3QYFt2F3PfS407AN8qd1fFGcJwars2DfkURbXE9NL1jozhqG/IWGM08eK3RHDs
 ZMmki6y+BRpREi8igmftZdp8xwsZRvuhwZVWOTY8uMQqSveXGU4p0T5SDgbjF1R5SZQd
 d3Rb5PoN4vmlllgdxlopw6j+YxCiYnQNWU3iXisqHuWH9p+oSrhpuIGNScN1qZO2I+YL
 SNcw==
X-Gm-Message-State: AO0yUKXXktG1UPkJ5E6rAZ5gCtFgJl5gw4NGNgQiGDdkymoL/7Xqzfaq
 58MNJAlnMns07RM5AKaHPj4dXrsfxOwtpJhB4z8=
X-Google-Smtp-Source: AK7set/RSBfPgYTJRIOjFFPvEEYC/cGkks2ZTCbVSLzqd6iJgaGAqvJD/rXeB7+DCLbF/sisBynCKyqr9VvrpuwcXu0=
X-Received: by 2002:a17:90b:3881:b0:234:f45:c117 with SMTP id
 mu1-20020a17090b388100b002340f45c117mr490505pjb.76.1676884785179; Mon, 20 Feb
 2023 01:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20230219224546.1232023-1-fontaine.fabrice@gmail.com>
 <CAA3JqEcDxvRKNHt7NqeGkzs7XVzr9obQcXJ5UiFaFOCtaMUS+w@mail.gmail.com>
In-Reply-To: <CAA3JqEcDxvRKNHt7NqeGkzs7XVzr9obQcXJ5UiFaFOCtaMUS+w@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Feb 2023 10:19:33 +0100
Message-ID: <CAPi7W82RxSY0Vx6P7A8M82XcKf7ea8RysqPJVz+76yJivNpyCg@mail.gmail.com>
To: Aleksander Morgado <aleksander@aleksander.es>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xhpYjRdwEAQwJsldHkmUD641IgI7d6sJWcESNK9htlA=;
 b=Nu+z331AmiltTzCQvF8CdH3itv97eGdPOzXaB+6cwSE2/AO1beARsxEZbq1gv5atBG
 dLhXzWEVGfMysua3l226QeAxAPmo1VQRzuU06XvCuub5GhcouH6pIgtOogltF3XY33CQ
 6lxEpnA+e3TcXhxqJetiLRwWlwpj734LJDBncyPFcUn7F+5xixjmm0lGb784xuQ4iiPX
 2g9GxrC0j3MxH5p/a7UNpnWsSdK61RnA5nr25VSVp8IHlbg1d1SGaNchANzbJK2Q9EHr
 uYujX5Nq976AedC2oVCs+d6PPTBWmSAlGHlyd4ozmP8xGGk4PnmyVhlep3gfrUzuX3TZ
 xk8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Nu+z331A
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: fix static build
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
Content-Type: multipart/mixed; boundary="===============4898757007464889932=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4898757007464889932==
Content-Type: multipart/alternative; boundary="000000000000f32e2d05f51e299c"

--000000000000f32e2d05f51e299c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lun. 20 f=C3=A9vr. 2023 =C3=A0 09:28, Aleksander Morgado <aleksander@ale=
ksander.es>
a =C3=A9crit :

> Hey,
>
> On Sun, Feb 19, 2023 at 11:45 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > Commit d769cfc13f6c2544f8bc5b6339d23763319a2383 was incomplete as
> > plugins/meson.build still unconditionally calls shared_module. So
> > disable plugins to fix the following static build failure raised since
> > bump to version 1.20.2 in commit
> > b95334b71fbdde0f7621b58ed35fa98df9e0966d:
> >
> > [238/417] Linking target plugins/libmm-shared-telit.so
> > FAILED: plugins/libmm-shared-telit.so
> >
> > Plugins could be enabled back through builtin_plugins as soon as
> >
> https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/commit/1c4=
da332ee6e0d948f85a63f74cb27e89075c011
> > lands in a stable release
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/deb2a752accb021392bb9dc3d06b2b1bf1=
51535c
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/modem-manager/modem-manager.mk | 44 ++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/package/modem-manager/modem-manager.mk
> b/package/modem-manager/modem-manager.mk
> > index 979a80a8e9..824b9eda5a 100644
> > --- a/package/modem-manager/modem-manager.mk
> > +++ b/package/modem-manager/modem-manager.mk
> > @@ -80,6 +80,50 @@ else
> >  MODEM_MANAGER_CONF_OPTS +=3D -Dbash_completion=3Dfalse
> >  endif
> >
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +MODEM_MANAGER_CONF_OPTS +=3D \
> > +       -Dplugin_generic=3Ddisabled \
> > +       -Dplugin_altair_lte=3Ddisabled \
> > +       -Dplugin_anydata=3Ddisabled \
> > +       -Dplugin_broadmobi=3Ddisabled \
> > +       -Dplugin_cinterion=3Ddisabled \
> > +       -Dplugin_dell=3Ddisabled \
> > +       -Dplugin_dlink=3Ddisabled \
> > +       -Dplugin_fibocom=3Ddisabled \
> > +       -Dplugin_foxconn=3Ddisabled \
> > +       -Dplugin_gosuncn=3Ddisabled \
> > +       -Dplugin_haier=3Ddisabled \
> > +       -Dplugin_huawei=3Ddisabled \
> > +       -Dplugin_intel=3Ddisabled \
> > +       -Dplugin_iridium=3Ddisabled \
> > +       -Dplugin_linktop=3Ddisabled \
> > +       -Dplugin_longcheer=3Ddisabled \
> > +       -Dplugin_mbm=3Ddisabled \
> > +       -Dplugin_motorola=3Ddisabled \
> > +       -Dplugin_mtk=3Ddisabled \
> > +       -Dplugin_nokia=3Ddisabled \
> > +       -Dplugin_nokia_icera=3Ddisabled \
> > +       -Dplugin_novatel=3Ddisabled \
> > +       -Dplugin_novatel_lte=3Ddisabled \
> > +       -Dplugin_option=3Ddisabled \
> > +       -Dplugin_option_hso=3Ddisabled \
> > +       -Dplugin_pantech=3Ddisabled \
> > +       -Dplugin_qcom_soc=3Ddisabled \
> > +       -Dplugin_quectel=3Ddisabled \
> > +       -Dplugin_samsung=3Ddisabled \
> > +       -Dplugin_sierra_legacy=3Ddisabled \
> > +       -Dplugin_sierra=3Ddisabled \
> > +       -Dplugin_simtech=3Ddisabled \
> > +       -Dplugin_telit=3Ddisabled \
> > +       -Dplugin_thuraya=3Ddisabled \
> > +       -Dplugin_tplink=3Ddisabled \
> > +       -Dplugin_ublox=3Ddisabled \
> > +       -Dplugin_via=3Ddisabled \
> > +       -Dplugin_wavecom=3Ddisabled \
> > +       -Dplugin_x22x=3Ddisabled \
> > +       -Dplugin_zte=3Ddisabled
> > +endif
> > +
>
> You can disable all plugins altogether with
> "-Dauto_features=3Ddisabled"; it is the recommended way to do so in MM
> 1.20.
> But I wonder, is it only to have the build with static libs pass? MM
> 1.20 without plugins will not be usable at all, at least one plugin is
> required, so not sure how useful that is.
>

Thanks for your review, I'll send a v2 that disables building statically
modem-manager 1.20.


>
> In MM 1.22 (or git main) there is the new "-Dbuiltin_plugins=3Dtrue"
> option that will embed all selected plugins within the ModemManager
> daemon binary itself.
>
> Cheers!
>

Best Regards,

Fabrice

--000000000000f32e2d05f51e299c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 20 f=C3=A9vr. 2023 =
=C3=A0=C2=A009:28, Aleksander Morgado &lt;<a href=3D"mailto:aleksander@alek=
sander.es">aleksander@aleksander.es</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hey,<br>
<br>
On Sun, Feb 19, 2023 at 11:45 PM Fabrice Fontaine<br>
&lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=3D"_blank">fontain=
e.fabrice@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Commit d769cfc13f6c2544f8bc5b6339d23763319a2383 was incomplete as<br>
&gt; plugins/meson.build still unconditionally calls shared_module. So<br>
&gt; disable plugins to fix the following static build failure raised since=
<br>
&gt; bump to version 1.20.2 in commit<br>
&gt; b95334b71fbdde0f7621b58ed35fa98df9e0966d:<br>
&gt;<br>
&gt; [238/417] Linking target plugins/libmm-shared-telit.so<br>
&gt; FAILED: plugins/libmm-shared-telit.so<br>
&gt;<br>
&gt; Plugins could be enabled back through builtin_plugins as soon as<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/mobile-broadband/ModemManage=
r/-/commit/1c4da332ee6e0d948f85a63f74cb27e89075c011" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.freedesktop.org/mobile-broadband/ModemManager=
/-/commit/1c4da332ee6e0d948f85a63f74cb27e89075c011</a><br>
&gt; lands in a stable release<br>
&gt;<br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/deb2a752accb=
021392bb9dc3d06b2b1bf151535c" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/deb2a752accb021392bb9dc3d06b2b1bf151535c</a>=
<br>
&gt;<br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/modem-manager/<a href=3D"http://modem-manager.mk" rel=3D=
"noreferrer" target=3D"_blank">modem-manager.mk</a> | 44 ++++++++++++++++++=
++++++++<br>
&gt;=C2=A0 1 file changed, 44 insertions(+)<br>
&gt;<br>
&gt; diff --git a/package/modem-manager/<a href=3D"http://modem-manager.mk"=
 rel=3D"noreferrer" target=3D"_blank">modem-manager.mk</a> b/package/modem-=
manager/<a href=3D"http://modem-manager.mk" rel=3D"noreferrer" target=3D"_b=
lank">modem-manager.mk</a><br>
&gt; index 979a80a8e9..824b9eda5a 100644<br>
&gt; --- a/package/modem-manager/<a href=3D"http://modem-manager.mk" rel=3D=
"noreferrer" target=3D"_blank">modem-manager.mk</a><br>
&gt; +++ b/package/modem-manager/<a href=3D"http://modem-manager.mk" rel=3D=
"noreferrer" target=3D"_blank">modem-manager.mk</a><br>
&gt; @@ -80,6 +80,50 @@ else<br>
&gt;=C2=A0 MODEM_MANAGER_CONF_OPTS +=3D -Dbash_completion=3Dfalse<br>
&gt;=C2=A0 endif<br>
&gt;<br>
&gt; +ifeq ($(BR2_STATIC_LIBS),y)<br>
&gt; +MODEM_MANAGER_CONF_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_generic=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_altair_lte=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_anydata=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_broadmobi=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_cinterion=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_dell=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_dlink=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_fibocom=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_foxconn=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_gosuncn=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_haier=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_huawei=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_intel=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_iridium=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_linktop=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_longcheer=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_mbm=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_motorola=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_mtk=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_nokia=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_nokia_icera=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_novatel=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_novatel_lte=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_option=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_option_hso=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_pantech=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_qcom_soc=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_quectel=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_samsung=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_sierra_legacy=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_sierra=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_simtech=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_telit=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_thuraya=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_tplink=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_ublox=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_via=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_wavecom=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_x22x=3Ddisabled \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dplugin_zte=3Ddisabled<br>
&gt; +endif<br>
&gt; +<br>
<br>
You can disable all plugins altogether with<br>
&quot;-Dauto_features=3Ddisabled&quot;; it is the recommended way to do so =
in MM<br>
1.20.<br>
But I wonder, is it only to have the build with static libs pass? MM<br>
1.20 without plugins will not be usable at all, at least one plugin is<br>
required, so not sure how useful that is.<br></blockquote><div><br></div><d=
iv>Thanks for your review, I&#39;ll send a v2 that disables building static=
ally modem-manager 1.20.<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
In MM 1.22 (or git main) there is the new &quot;-Dbuiltin_plugins=3Dtrue&qu=
ot;<br>
option that will embed all selected plugins within the ModemManager<br>
daemon binary itself.<br>
<br>
Cheers!<br></blockquote><div><br></div><div>Best Regards,</div><div><br></d=
iv><div>Fabrice <br></div></div></div>

--000000000000f32e2d05f51e299c--

--===============4898757007464889932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4898757007464889932==--
