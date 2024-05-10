Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E17C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 07:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D02EB6151B;
	Fri, 10 May 2024 07:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 305i3yVIOXua; Fri, 10 May 2024 07:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAB226151F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAB226151F;
	Fri, 10 May 2024 07:56:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB4011BF5DC
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 07:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91772402E6
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 07:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jha3PMbFmpGe for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 07:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E24F4021C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E24F4021C
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E24F4021C
 for <buildroot@buildroot.org>; Fri, 10 May 2024 07:56:47 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-61be4b98766so19478477b3.3
 for <buildroot@buildroot.org>; Fri, 10 May 2024 00:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715327806; x=1715932606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AXHK8ji7tgitcfy9WoWmYYneKNjMyfR/q0fyZxgmll4=;
 b=UzgpGlIm4YBsn5iM0Ho3hlmcNl5miaNk9HYUbzWBxjBbQUGjBq+vKS8FtDfRS6wzXB
 F8bHihxnHHiw5W/cxIZ+1+SAubterhZ/PH3GXVUM0NRi1OJBY4WjLD62ZRRdQiUwwQZi
 V1L6QkSF5jfx2fs1E/KlI+h8b2HhpwB1B+6eWWA4H4GTJRO+pSAP0rgF6ObAPkr6CWUu
 bmeO+vRYWPiVuRgoSjW/X1aAOEgfuMkiSc/0zvpff6qNcCOIqudnSxX8kOMpnBgq02xd
 g9STJWQ28vo4vpO2Oh5vULEfPTdOnjSY6bGfRC9rQ4rSuFCr2qH3d6bofn9kQLvk2aS6
 SDcA==
X-Gm-Message-State: AOJu0YzHoLVkKX55j6LLaSdQbLP9Va9iI86NsJdS3Jgid6A+NtcZO08d
 FXPDVvC9Tj9CNCnS9+aXSm5ttBrrmMsoDqL5UWmjoFw0mbdWWo12yJjSH++9vdSTn41yIZFCamL
 pS3zoYlP6puSJlxfbkgphLv7w0u0=
X-Google-Smtp-Source: AGHT+IGsDJ1nel/8QO66O7RJ0LpOf0UgAs2Y6jkApagrtmhnE1v2O2TRjnjiMhhDda3+QcLBYbAem02S2mwa+8Lvt6k=
X-Received: by 2002:a05:690c:6902:b0:61a:c2fc:1128 with SMTP id
 00721157ae682-622aff9236amr21650767b3.28.1715327804735; Fri, 10 May 2024
 00:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
 <20240417080538.3451923-2-roy.kollen.svendsen@akersolutions.com>
 <20240509164225.4de0d2e3@windsurf>
In-Reply-To: <20240509164225.4de0d2e3@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 10 May 2024 09:56:32 +0200
Message-ID: <CA+R_derAPT=dYa=w20R-XqG0=vQL=24kEXBU5KQkOiL9ZwG66Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715327806; x=1715932606; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AXHK8ji7tgitcfy9WoWmYYneKNjMyfR/q0fyZxgmll4=;
 b=hFGpcSCL/LUqn8xxkxq0VNGSlYAJJI4QwYc2sR6ODpv5uwnaNl/8tAh4+poF8Jtbrs
 bVZG+x79qAD9qaaNIQGUkvKbFyj1Om6HtYjvnqx6aYl8hwCnyksk3Iu5Mmq/CDGaKHDr
 Hj8ERBT3Vs7Pmu3I8Jh98Xm30Scz1jdXYUi6/flNIaelfHeYEyeaXbJG/G3a/gTQ4l5d
 ycEWZ0tlICAR8zDMEPV3Id2MfMkzh9/UlzxQdCGKMHN5sS4yr15r6f4kpmTI/7J+H9ie
 jZphA7c2nuAkFoGec8lApuBGfoiPhgKkwaaoCer+gZ/S/zNecMUgD4AUgtUUnE2H8hob
 O0aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hFGpcSCL
Subject: Re: [Buildroot] [PATCH v2 02/11] package/qt6base: avoid enabling
 both desktop and es2 opengl
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
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4521093697350725148=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4521093697350725148==
Content-Type: multipart/alternative; boundary="00000000000079895d061814e06b"

--00000000000079895d061814e06b
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

I moved this change into a separate patch, since it also applies to the
current Qt6.4.3 version, and updated the commit message with a defconfig
for recreating the build failure.

I intend to remove the change from this patch series and fix the other
issues.

Best regards,
Roy

tor. 9. mai 2024 kl. 16:42 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> On Wed, 17 Apr 2024 10:05:23 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > Fixes the following error:
> >
> > ERROR: Feature "opengles2": Forcing to "ON" breaks its condition:
> >     NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop AND
> GLESv2_FOUND
> > Condition values dump:
> >     WIN32 = ""
> >     WATCHOS = "0"
> >     QT_FEATURE_opengl_desktop = "ON"
> >     GLESv2_FOUND = "TRUE"
> >
> > CMake Error at cmake/QtBuildInformation.cmake:209 (message):
> >   Check the configuration messages for an error that has occurred.
> > Call Stack (most recent call first):
> >   cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)
> >   cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)
> >   CMakeLists.txt:208 (qt_build_repo_end)
> >
> > Signed-off-by: Roy Kollen Svendsen <
> roy.kollen.svendsen@akersolutions.com>
>
> I don't see any failures for this in our autobuilders. Could you
> provide a simple Buildroot defconfig that exhibits this issue?
>
> Also, does this issue already appears with qt6base 6.4.3 that we have
> in Buildroot today, or only after the bump to qt 6.7 ? This is
> important to understand if the fix needs to be backported to our stable
> branches or not.
>
> Thanks a lot,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000079895d061814e06b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div>I moved this chan=
ge into a separate patch, since it also applies to the</div><div>current Qt=
6.4.3 version, and updated the commit message with a defconfig</div><div>fo=
r recreating the build failure.</div><div><br></div><div>I intend to remove=
 the change from this patch series and fix the other</div><div>issues.<br><=
/div><div><br></div><div>Best regards,<br></div><div>Roy<div class=3D"gmail=
-yj6qo gmail-ajU"><div id=3D"gmail-:2be" class=3D"gmail-ajR" role=3D"button=
" tabindex=3D"0" aria-label=3D"Vis forkortet innhold" aria-expanded=3D"fals=
e"><img class=3D"gmail-ajT" src=3D"https://ssl.gstatic.com/ui/v1/icons/mail=
/images/cleardot.gif"></div></div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">tor. 9. mai 2024 kl. 16:42 skrev Th=
omas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.p=
etazzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hello Roy,<br>
<br>
On Wed, 17 Apr 2024 10:05:23 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fixes the following error:<br>
&gt; <br>
&gt; ERROR: Feature &quot;opengles2&quot;: Forcing to &quot;ON&quot; breaks=
 its condition:<br>
&gt;=C2=A0 =C2=A0 =C2=A0NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl=
_desktop AND GLESv2_FOUND<br>
&gt; Condition values dump:<br>
&gt;=C2=A0 =C2=A0 =C2=A0WIN32 =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0WATCHOS =3D &quot;0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0QT_FEATURE_opengl_desktop =3D &quot;ON&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0GLESv2_FOUND =3D &quot;TRUE&quot;<br>
&gt; <br>
&gt; CMake Error at cmake/QtBuildInformation.cmake:209 (message):<br>
&gt;=C2=A0 =C2=A0Check the configuration messages for an error that has occ=
urred.<br>
&gt; Call Stack (most recent call first):<br>
&gt;=C2=A0 =C2=A0cmake/QtBuildInformation.cmake:39 (qt_configure_print_summ=
ary)<br>
&gt;=C2=A0 =C2=A0cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summa=
ry)<br>
&gt;=C2=A0 =C2=A0CMakeLists.txt:208 (qt_build_repo_end)<br>
&gt; <br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.sv=
endsen@akersolutions.com" target=3D"_blank">roy.kollen.svendsen@akersolutio=
ns.com</a>&gt;<br>
<br>
I don&#39;t see any failures for this in our autobuilders. Could you<br>
provide a simple Buildroot defconfig that exhibits this issue?<br>
<br>
Also, does this issue already appears with qt6base 6.4.3 that we have<br>
in Buildroot today, or only after the bump to qt 6.7 ? This is<br>
important to understand if the fix needs to be backported to our stable<br>
branches or not.<br>
<br>
Thanks a lot,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000079895d061814e06b--

--===============4521093697350725148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4521093697350725148==--
