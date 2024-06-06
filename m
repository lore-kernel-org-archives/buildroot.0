Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72013C27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 20:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F42780D16;
	Thu,  6 Jun 2024 20:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjGIbeySF6eV; Thu,  6 Jun 2024 20:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C29980D19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C29980D19;
	Thu,  6 Jun 2024 20:08:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B828A1BF577
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 20:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68EBB608EA
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 20:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UX4AHfgq7lvx for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 20:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20957607AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20957607AD
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20957607AD
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 20:08:45 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-627ecda47d0so14394657b3.2
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 13:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717704524; x=1718309324;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wQvN1X4359NqdstvsXxUjeFCqnAe3zAO912HnQoibfQ=;
 b=NknCfXO1pHqcZjxAMWG0CHZdApT6enDcikko2CYAqqv96cESmxHLVinYfrO1SfQAm9
 eGU6/tddSoHNiXIJHhxPL47e5iB1REI4YVdUAI9H0dMxGQzOXsoQNZ4c7HwwdpCEt4Pu
 SGg/skw5sI1xxuPTk0Oj9HKM+0+ExvF+PxSB86u5+nrUtgurSgSq0qtqvMbsenhFcO1U
 CB8uDa4DcGlo8URkm20HSi/8BwXXbwp6c6v7JP2Enhalejbo78ukGnmbd0KLiqq29t23
 IB1qQlDvH7g0amX8ilivGiCwy8wQUBNtzecmw+rOYFv1CNsXMKQlS5naMJB5+HO925Va
 a3uQ==
X-Gm-Message-State: AOJu0Yysryze/AjLCKQUyQLiTmeEP84uDMWswfkHAyWo2PClcte2w5y0
 LySjtipxOLRuYwy7BgMAt1U4n5AaVlxFq7a55fQNFudtBHKDtahShEWk4M8LQ8D9Ru7RAF8oais
 W+Cwv99g3RRL+42BXKhgJ2NV1Wvz17SUE
X-Google-Smtp-Source: AGHT+IGR5AwwpPyTAEd/uP03bTTT/WEtnESqYN34tR1c0QXqk6ysiznrmeSFw4masXWp1oLJQOTOgsUwEqUe8Zu3FpU=
X-Received: by 2002:a81:7654:0:b0:620:2ec0:9797 with SMTP id
 00721157ae682-62cd55f581emr3874837b3.23.1717704524199; Thu, 06 Jun 2024
 13:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240510073213.806802-1-roy.kollen.svendsen@akersolutions.com>
 <8da659ac-9fc1-4c27-9e78-c6e6d4171177@mind.be>
In-Reply-To: <8da659ac-9fc1-4c27-9e78-c6e6d4171177@mind.be>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 6 Jun 2024 22:08:32 +0200
Message-ID: <CA+R_deruX3Xrsj4y3QCt9aRkr2nY3TQODanip9SiZE3QB5r8qQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717704524; x=1718309324; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wQvN1X4359NqdstvsXxUjeFCqnAe3zAO912HnQoibfQ=;
 b=RbvDfqBwyeom57i9f+ccnjQUDfkx5r8Qe2YB4Pqo1ctIMNXwooRCmoC/UU3tBtgnRv
 ikaEFn+7MQDfjjjZixpzMZyKqzqxrX1tH8ZXVN4JlhMeXV5pP+2uNxsY9ey8L8LtCYcR
 yL5rmCYG/NPyKks8GPzcDVi1X33KvDjXIscLm9XxRk4z7HJ9sBUY3QsywZMRBpmGPMPs
 NBAyrxe5td1AK5WrcS8hh5GpTOg1Z1dRoPbMDzNRzf4/dJteeIuPglUSHoVOxMLI+EkA
 4Nio4Oe4DPauDLAGfALxpLL+OMLs6zXX11NQfOXD6n6XjduakrV5hqvPu6iEZ44YJY/d
 ytCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RbvDfqBw
Subject: Re: [Buildroot] [PATCH v2 1/1] package/qt6base: avoid enabling both
 desktop and es2 opengl
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7894036483090001203=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7894036483090001203==
Content-Type: multipart/alternative; boundary="000000000000fe7e61061a3e3fff"

--000000000000fe7e61061a3e3fff
Content-Type: text/plain; charset="UTF-8"

Hi Arnout,

Thanks for your feedback. I'lll try to simplify my commit messages.

Best regards,
Roy

tor. 6. juni 2024 kl. 21:40 skrev Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 10/05/2024 09:32, Roy Kollen Svendsen wrote:
> > Fixes the following error:
> >
> > ERROR: Feature "opengles2": Forcing to "ON" breaks its condition:
> >      NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop AND
> GLESv2_FOUND
> > Condition values dump:
> >      WIN32 = ""
> >      WATCHOS = "0"
> >      QT_FEATURE_opengl_desktop = "ON"
> >      GLESv2_FOUND = "TRUE"
> >
> > CMake Error at cmake/QtBuildInformation.cmake:209 (message):
> >    Check the configuration messages for an error that has occurred.
> > Call Stack (most recent call first):
> >    cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)
> >    cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)
> >    CMakeLists.txt:208 (qt_build_repo_end)
> >
> > To recreate the error, use the following defconfig (based on
> freescale_imx8mmevk_defconfig):
> >
>
> [snip]
>
>   You could have made that a little bit smaller :-)
>
> > Signed-off-by: Roy Kollen Svendsen <
> roy.kollen.svendsen@akersolutions.com>
>
>   This doesn't match your Author line. Was it committed with your
> akersolutions
> address on your side? Normally, git send-email should insert a From line
> if it
> then sends with a different From address and you wouldn't have this
> issue...
>
>   Anyway, I fixed it up (changed the Author) and applied to master, thanks.
>
>   Regards,
>   Arnout
>
> > ---
> > Changes v1 -> v2:
> >    - Increase BR2_TARGET_ROOTFS_EXT2_SIZE in the defconfig above to make
> room for
> >      the qt6.
> >
> >   package/qt6/qt6base/qt6base.mk | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/
> qt6base.mk
> > index 6857725ef5..211808d2af 100644
> > --- a/package/qt6/qt6base/qt6base.mk
> > +++ b/package/qt6/qt6base/qt6base.mk
> > @@ -259,10 +259,15 @@ QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
> >   endif
> >
> >   ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
> > -QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
> > +QT6BASE_CONF_OPTS += \
> > +     -DFEATURE_opengl=ON \
> > +     -DFEATURE_opengl_desktop=ON
> >   QT6BASE_DEPENDENCIES += libgl
> >   else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
> > -QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
> > +QT6BASE_CONF_OPTS += \
> > +     -DFEATURE_opengl=ON \
> > +     -DFEATURE_opengles2=ON \
> > +     -DFEATURE_opengl_desktop=OFF
> >   QT6BASE_DEPENDENCIES += libgles
> >   else
> >   QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
>

--000000000000fe7e61061a3e3fff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Arnout,</div><div><br></div><div>Thanks for your f=
eedback. I&#39;lll try to simplify my commit messages.<br></div><div><br></=
div><div>Best regards,</div><div>Roy</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">tor. 6. juni 2024 kl. 21:40 skrev=
 Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be<=
/a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 10/05/2024 09:32, Roy Kollen Svendsen wrote:<br>
&gt; Fixes the following error:<br>
&gt; <br>
&gt; ERROR: Feature &quot;opengles2&quot;: Forcing to &quot;ON&quot; breaks=
 its condition:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_openg=
l_desktop AND GLESv2_FOUND<br>
&gt; Condition values dump:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 WIN32 =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 WATCHOS =3D &quot;0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QT_FEATURE_opengl_desktop =3D &quot;ON&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 GLESv2_FOUND =3D &quot;TRUE&quot;<br>
&gt; <br>
&gt; CMake Error at cmake/QtBuildInformation.cmake:209 (message):<br>
&gt;=C2=A0 =C2=A0 Check the configuration messages for an error that has oc=
curred.<br>
&gt; Call Stack (most recent call first):<br>
&gt;=C2=A0 =C2=A0 cmake/QtBuildInformation.cmake:39 (qt_configure_print_sum=
mary)<br>
&gt;=C2=A0 =C2=A0 cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summ=
ary)<br>
&gt;=C2=A0 =C2=A0 CMakeLists.txt:208 (qt_build_repo_end)<br>
&gt; <br>
&gt; To recreate the error, use the following defconfig (based on freescale=
_imx8mmevk_defconfig):<br>
&gt; <br>
<br>
[snip]<br>
<br>
=C2=A0 You could have made that a little bit smaller :-)<br>
<br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.sv=
endsen@akersolutions.com" target=3D"_blank">roy.kollen.svendsen@akersolutio=
ns.com</a>&gt;<br>
<br>
=C2=A0 This doesn&#39;t match your Author line. Was it committed with your =
akersolutions <br>
address on your side? Normally, git send-email should insert a From line if=
 it <br>
then sends with a different From address and you wouldn&#39;t have this iss=
ue...<br>
<br>
=C2=A0 Anyway, I fixed it up (changed the Author) and applied to master, th=
anks.<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; ---<br>
&gt; Changes v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0 - Increase BR2_TARGET_ROOTFS_EXT2_SIZE in the defconfig a=
bove to make room for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the qt6.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"n=
oreferrer" target=3D"_blank">qt6base.mk</a> | 9 +++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6base.mk</a> b/package/qt6/qt6base/<a href=
=3D"http://qt6base.mk" rel=3D"noreferrer" target=3D"_blank">qt6base.mk</a><=
br>
&gt; index 6857725ef5..211808d2af 100644<br>
&gt; --- a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"norefer=
rer" target=3D"_blank">qt6base.mk</a><br>
&gt; +++ b/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"norefer=
rer" target=3D"_blank">qt6base.mk</a><br>
&gt; @@ -259,10 +259,15 @@ QT6BASE_CONF_OPTS +=3D -DFEATURE_eglfs=3DOFF<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)<br>
&gt; -QT6BASE_CONF_OPTS +=3D -DFEATURE_opengl=3DON -DFEATURE_opengl_desktop=
=3DON<br>
&gt; +QT6BASE_CONF_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DFEATURE_opengl=3DON \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DFEATURE_opengl_desktop=3DON<br>
&gt;=C2=A0 =C2=A0QT6BASE_DEPENDENCIES +=3D libgl<br>
&gt;=C2=A0 =C2=A0else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)<br>
&gt; -QT6BASE_CONF_OPTS +=3D -DFEATURE_opengl=3DON -DFEATURE_opengles2=3DON=
<br>
&gt; +QT6BASE_CONF_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DFEATURE_opengl=3DON \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DFEATURE_opengles2=3DON \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DFEATURE_opengl_desktop=3DOFF<br>
&gt;=C2=A0 =C2=A0QT6BASE_DEPENDENCIES +=3D libgles<br>
&gt;=C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0QT6BASE_CONF_OPTS +=3D -DFEATURE_opengl=3DOFF -DINPUT_open=
gl=3Dno<br>
</blockquote></div>

--000000000000fe7e61061a3e3fff--

--===============7894036483090001203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7894036483090001203==--
