Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257A5C352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 17:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A50A94012F;
	Sat,  3 Dec 2022 17:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A50A94012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPG6GVCRn17d; Sat,  3 Dec 2022 17:38:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D226040102;
	Sat,  3 Dec 2022 17:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D226040102
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42F101BF32E
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 17:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DF93812E1
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 17:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DF93812E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BaCw3MtNog8 for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 17:38:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E99C812B6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E99C812B6
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 17:38:45 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so11125195pjc.3
 for <buildroot@buildroot.org>; Sat, 03 Dec 2022 09:38:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SBbb2VTKj4Pa39GUbA5zol9VpltDP0D23ZxQ+xDpjUI=;
 b=n+mkKnL9VbxSXFZ8osAKlmtCe4YQRFA9Q2QsMOEiSpcWI64xwp581NNSUAlDbfymCb
 HTjTOD1ylQ97D5pKFESW4KCvCpa/LH16FgjEWHZxHvPJ77Sy5u/lU/QRM5+NN15ghUEf
 QXBfkcuTYED2X2F/DOjzhksV4n8bsmeEHHbLycGOE08i7BmVfAzdMYsZFXsMDY41w4LQ
 Vz8LOo7fZROK+HmfthoN2wSGupXu2zo4QnWVMw/j51e/tY3vKd1TnxpBlPxDtcxdvn7W
 QRdV0h1HCGqggpW/gOvHvlQPoWpPJMdflGwETLoljccXJhxGSjQJ00k4BbUpPi7FPPnm
 6RbA==
X-Gm-Message-State: ANoB5pnnttvbQKzQaYuvdCR2xQH9N5IXt2G1cYwj8amUjnesYOX4vetJ
 D1kt12EShCeW9Nr0YXd3AjR61AdrsOHyxqHKumOxjqrV
X-Google-Smtp-Source: AA0mqf7kxD2ivHz7JRicEQsMwTlTA74SOimeJzVUrXDiTMdzrnO7vUtQB8N0vuUTsVBzfDLzA8veePuWazb1QNYm09Y=
X-Received: by 2002:a17:902:708a:b0:189:7372:1451 with SMTP id
 z10-20020a170902708a00b0018973721451mr38161378plk.122.1670089125341; Sat, 03
 Dec 2022 09:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20221203172347.331603-1-fontaine.fabrice@gmail.com>
 <d9e758a6-c84d-67af-16a0-692235894d64@benettiengineering.com>
In-Reply-To: <d9e758a6-c84d-67af-16a0-692235894d64@benettiengineering.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 3 Dec 2022 18:38:34 +0100
Message-ID: <CAPi7W80d0n-Xn2n2SYH538tuLhh8e=32T-CyJP6A7C0NZR3Uvg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SBbb2VTKj4Pa39GUbA5zol9VpltDP0D23ZxQ+xDpjUI=;
 b=er4MtuCG7tKz+6kIIa1xUlDM5GfasEl/JNE0ZayIcw1YPDD4UJbottWLjWO4uw9tjP
 8nvym+oyexpt15zmscbOGJWlCs92U7V1l+W6cM+42AZS3cVJqMv8BvMSPKynI2o6j4y4
 o4IbuFKb2NUBLjXp/zev8dUNl2ocvR9kWzQE5ubZZOJIjjYnneO/LuiFIQlMcCqGuUbe
 6CcgN8FOd2HNNVEGQVQWArK8sFYv4p5sHKV72B433cCd6nHB+OqR1lZYav/91qHulPuZ
 eBy5AENPfGBXYzMVu4Dag/+5MwyY7sJu/49wmC5v3tjzyMd/p6AEzJsj7DqG+YRsIYMV
 NC9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=er4MtuCG
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8723bu: add
 RTL8723BU_LINUX_CONFIG_FIXUPS
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
Content-Type: multipart/mixed; boundary="===============6961535911223985067=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6961535911223985067==
Content-Type: multipart/alternative; boundary="0000000000000f2e8005eeefed7b"

--0000000000000f2e8005eeefed7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le sam. 3 d=C3=A9c. 2022 =C3=A0 18:26, Giulio Benetti <
giulio.benetti@benettiengineering.com> a =C3=A9crit :

> Hi Fabrice,
>
> thank you but there is my pending patch for this here:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20220919132035.47951=
0-1-giulio.benetti@benettiengineering.com/


Indeed, I missed it. I'll set mine as Not Applicable.


>
>
> Best regards
> --
> Giulio Benetti
> CEO/CTO@Benetti Engineering sas
>
> Il 03/12/2022 18:23, Fabrice Fontaine ha scritto:
> > Fix the following build failures raised since the addition of the
> > package in commit 80d22997334b0ad76f488913e1159b922804c579:
> >
> > ERROR: modpost: "usb_alloc_urb"
> [/home/autobuild/autobuild/instance-2/output-1/build/rtl8723bu-d79a676a8d=
3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko]
> undefined!
> > ERROR: modpost: "usb_free_urb"
> [/home/autobuild/autobuild/instance-2/output-1/build/rtl8723bu-d79a676a8d=
3f0bb6ac8af126689c6ac6869cb6f2/./8723bu.ko]
> undefined!
> >
> > [...]
> >
> > ERROR: modpost: ".wiphy_apply_custom_regulatory"
> [/home/thomas/autobuild/instance-1/output-1/build/rtl8723bu-d79a676a8d3f0=
bb6ac8af126689c6ac6869cb6f2/./8723bu.ko]
> undefined!
> > ERROR: modpost: ".cfg80211_remain_on_channel_expired"
> [/home/thomas/autobuild/instance-1/output-1/build/rtl8723bu-d79a676a8d3f0=
bb6ac8af126689c6ac6869cb6f2/./8723bu.ko]
> undefined!
> >
> > Fixes:
> >   -
> http://autobuild.buildroot.org/results/ab6482975befba0ad74bb7d91b37373b9b=
0f300e
> >   -
> http://autobuild.buildroot.org/results/7f3637760ad88d314e6812865f3667d1de=
091957
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >   package/rtl8723bu/rtl8723bu.mk | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/
> rtl8723bu.mk
> > index 3da8d9cecf..9113a3ef0a 100644
> > --- a/package/rtl8723bu/rtl8723bu.mk
> > +++ b/package/rtl8723bu/rtl8723bu.mk
> > @@ -16,5 +16,13 @@ define RTL8723BU_INSTALL_TARGET_CMDS
> >       $(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin
> $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723b_fw.bin
> >   endef
> >
> > +define RTL8723BU_LINUX_CONFIG_FIXUPS
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_USB)
> > +endef
> > +
> >   $(eval $(kernel-module))
> >   $(eval $(generic-package))
>
>
Best Regards,

Fabrice

--0000000000000f2e8005eeefed7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 3 d=C3=A9c. 2022 =C3=A0=
=C2=A018:26, Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com">giulio.benetti@benettiengineering.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Fabrice,=
<br>
<br>
thank you but there is my pending patch for this here:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20220919132=
035.479510-1-giulio.benetti@benettiengineering.com/" rel=3D"noreferrer" tar=
get=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/2022091=
9132035.479510-1-giulio.benetti@benettiengineering.com/</a></blockquote><di=
v><br></div><div>Indeed, I missed it. I&#39;ll set mine as Not Applicable.<=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
CEO/CTO@Benetti Engineering sas<br>
<br>
Il 03/12/2022 18:23, Fabrice Fontaine ha scritto:<br>
&gt; Fix the following build failures raised since the addition of the<br>
&gt; package in commit 80d22997334b0ad76f488913e1159b922804c579:<br>
&gt; <br>
&gt; ERROR: modpost: &quot;usb_alloc_urb&quot; [/home/autobuild/autobuild/i=
nstance-2/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2=
/./8723bu.ko] undefined!<br>
&gt; ERROR: modpost: &quot;usb_free_urb&quot; [/home/autobuild/autobuild/in=
stance-2/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2/=
./8723bu.ko] undefined!<br>
&gt; <br>
&gt; [...]<br>
&gt; <br>
&gt; ERROR: modpost: &quot;.wiphy_apply_custom_regulatory&quot; [/home/thom=
as/autobuild/instance-1/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af12668=
9c6ac6869cb6f2/./8723bu.ko] undefined!<br>
&gt; ERROR: modpost: &quot;.cfg80211_remain_on_channel_expired&quot; [/home=
/thomas/autobuild/instance-1/output-1/build/rtl8723bu-d79a676a8d3f0bb6ac8af=
126689c6ac6869cb6f2/./8723bu.ko] undefined!<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 =C2=A0- <a href=3D"http://autobuild.buildroot.org/results/ab6482=
975befba0ad74bb7d91b37373b9b0f300e" rel=3D"noreferrer" target=3D"_blank">ht=
tp://autobuild.buildroot.org/results/ab6482975befba0ad74bb7d91b37373b9b0f30=
0e</a><br>
&gt;=C2=A0 =C2=A0- <a href=3D"http://autobuild.buildroot.org/results/7f3637=
760ad88d314e6812865f3667d1de091957" rel=3D"noreferrer" target=3D"_blank">ht=
tp://autobuild.buildroot.org/results/7f3637760ad88d314e6812865f3667d1de0919=
57</a><br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/rtl8723bu/<a href=3D"http://rtl8723bu.mk" rel=3D"n=
oreferrer" target=3D"_blank">rtl8723bu.mk</a> | 8 ++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/rtl8723bu/<a href=3D"http://rtl8723bu.mk" rel=3D"=
noreferrer" target=3D"_blank">rtl8723bu.mk</a> b/package/rtl8723bu/<a href=
=3D"http://rtl8723bu.mk" rel=3D"noreferrer" target=3D"_blank">rtl8723bu.mk<=
/a><br>
&gt; index 3da8d9cecf..9113a3ef0a 100644<br>
&gt; --- a/package/rtl8723bu/<a href=3D"http://rtl8723bu.mk" rel=3D"norefer=
rer" target=3D"_blank">rtl8723bu.mk</a><br>
&gt; +++ b/package/rtl8723bu/<a href=3D"http://rtl8723bu.mk" rel=3D"norefer=
rer" target=3D"_blank">rtl8723bu.mk</a><br>
&gt; @@ -16,5 +16,13 @@ define RTL8723BU_INSTALL_TARGET_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $=
(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723b_fw.bin<br>
&gt;=C2=A0 =C2=A0endef<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +define RTL8723BU_LINUX_CONFIG_FIXUPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NET)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_USB)<br>
&gt; +endef<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0$(eval $(kernel-module))<br>
&gt;=C2=A0 =C2=A0$(eval $(generic-package))<br>
<br></blockquote><div><br></div><div>Best Regards,</div><div><br></div><div=
>Fabrice <br></div></div></div>

--0000000000000f2e8005eeefed7b--

--===============6961535911223985067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6961535911223985067==--
