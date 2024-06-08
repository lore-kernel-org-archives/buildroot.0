Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C90C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 10:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 883AA81189;
	Sat,  8 Jun 2024 10:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1P6vx5akU-JP; Sat,  8 Jun 2024 10:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B694811AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B694811AC;
	Sat,  8 Jun 2024 10:31:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3CEB1BF41F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC5B5811AC
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vncln2OXVii8 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 10:31:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8EDC81189
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8EDC81189
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8EDC81189
 for <buildroot@uclibc.org>; Sat,  8 Jun 2024 10:31:23 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-62a0849f8e5so30238797b3.2
 for <buildroot@uclibc.org>; Sat, 08 Jun 2024 03:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717842682; x=1718447482;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6404xKQkcPT5+EQWnUU5AVh8oiQxhVVg8dzhMCqxEhs=;
 b=RovWX4SRQInoR2vlgVLey3EOHUePz5qv3Hnb807Dzlnic2SToyckF1nuwZTUROM0dN
 byWfwwI0+JRC6eAKTvN0Hhidw7F+hDD4QipXM5ljOyDbxSAUWaFX0iFpjYw+ceGTEfw5
 407eWRIf2247DFOO9CsD+eAHbybzvrFyEWumlywD3eKJkfVz/GucKMq9la0Kx3DsTqbQ
 ikEnuCBt3RrqrYv28s6veC1oVxgSgbnFMCxf4gyAktJ32VG7azvDlrP3+GU5HsLc/7nV
 Pipqaz9jq8lp38jVNC1Kn6bd01p8mOP1x3mVXLMWYgKuLyPmnczmVNrt2oLyR7nwJ+7G
 5ayA==
X-Gm-Message-State: AOJu0YztXFwY60r9Ioz8y7xfVgf7iDb9XGaWYaUGcSynGJJrcStxmreL
 E2cynijv9j+/AnuAUZ3vVY0Qe8jR9p5L3yK8gKYiZVUODwCoBdsNR0q0vFJH5SOKZJ2lgLdFs5Z
 9YqNwADkq4rEHMMtNkY2uquN9SWfXvg==
X-Google-Smtp-Source: AGHT+IFm5vVik74H/CZcm264LvsqcTNRKBpwoPY0YbQesrYnvP8adckVESjZSQ26cksqYlpSULFZTt9c34H4ij3nfKs=
X-Received: by 2002:a0d:cd41:0:b0:61b:3454:dbeb with SMTP id
 00721157ae682-62cd5693268mr48037107b3.46.1717842680531; Sat, 08 Jun 2024
 03:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <bug-16090-163@https.bugs.busybox.net/>
In-Reply-To: <bug-16090-163@https.bugs.busybox.net/>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sat, 8 Jun 2024 12:31:08 +0200
Message-ID: <CA+R_depXcierA3+vu++-AZje1jc73Kp5xqzNEYMK_eEGLAyHLw@mail.gmail.com>
To: bugzilla@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717842682; x=1718447482; darn=uclibc.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6404xKQkcPT5+EQWnUU5AVh8oiQxhVVg8dzhMCqxEhs=;
 b=XXtqoHKeBOOjgMhZGh9t3MPgTcE+bobDAOZf8J3Mrw6rraKjEPyJezFRelthmgzDow
 vQJTu7ELMlwqd69fcCXdBzbb9Qby6RrBiL/uTva3Y3+q19sL9g7tdGxqTMyTP8iWpMMx
 dRSYxuTZwIM8EuNEzOQIPNpkA2JxEPSgf7ak3LaBlODQLTW8OGxVfTihoh6vSEycpdB3
 OStWdYSUespdTr9FVHpge2D23BwXnHjkIobhbeDPWzk4TqwXC4vXoLOAuyFA0DVZrWX+
 7malocDBvl9lx+m+Tu9TpAbbR8cNKWWv9lI9xobpYJEXvHCh/Sge/kRppg8IFYDpdhdW
 bICQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XXtqoHKe
Subject: Re: [Buildroot] [Bug 16090] New: Buildroot-2024-02-2 error building
 libffi
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
Cc: buildroot@uclibc.org
Content-Type: multipart/mixed; boundary="===============1424648750976798360=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1424648750976798360==
Content-Type: multipart/alternative; boundary="000000000000c0d4c8061a5e6a69"

--000000000000c0d4c8061a5e6a69
Content-Type: text/plain; charset="UTF-8"

http://patchwork.ozlabs.org/project/buildroot/patch/20240605090652.3156836-1-roy.kollen.svendsen@akersolutions.com/

tir. 4. jun. 2024, 02:19 skrev <bugzilla@busybox.net>:

> https://bugs.busybox.net/show_bug.cgi?id=16090
>
>             Bug ID: 16090
>            Summary: Buildroot-2024-02-2 error building libffi
>            Product: buildroot
>            Version: unspecified
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: blocker
>           Priority: P5
>          Component: Outdated package
>           Assignee: unassigned@buildroot.uclibc.org
>           Reporter: rmderbes@gmail.com
>                 CC: buildroot@uclibc.org
>   Target Milestone: ---
>
> When trying to build root image for zynq target, it throws this error:
> ....
> ../src/tramp.c: In function 'ffi_tramp_get_temp_file':
> ../src/tramp.c:262:22: error: implicit declaration of function
> 'open_temp_exec_file' [-Wimplicit-function-declaration]
>   262 |   tramp_globals.fd = open_temp_exec_file ();
> ....
> Host OS: Fedora 40
> Kernel: 6.8.10-300.fc40.x86_64
> gcc : version 14.1.1 20240522 (Red Hat 14.1.1-4) (GCC)
>
> Problem: libffi-3.4.4 does not compile with gcc > 14.
>
> Solution:
> 1) Edit buildroot-2024.02.2/package/libffi/libffi.mk and change libffi
> version
> LIBFFI_VERSION = 3.4.6
>
> 2) Edit buildroot-2024.02.2/package/libffi/libffi.hash and change hashes:
> # For libffi-3.4.6.tar.gz
> sha256  b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a4e
> libffi-3.4.6.tar.gz
> sha256  67894089811f93fca47a76f85e017da6f8582d4ba0905963c6e0f1ad6df7a195
> LICENSE
>
> I have tried it only for zynq target, but I assume that this fix works for
> all
> targets that compile libffi and all systems  where GCC > 14
> Regards
>
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000c0d4c8061a5e6a69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><a href=3D"http://patchwork.ozlabs.org/project/buildroot/=
patch/20240605090652.3156836-1-roy.kollen.svendsen@akersolutions.com/">http=
://patchwork.ozlabs.org/project/buildroot/patch/20240605090652.3156836-1-ro=
y.kollen.svendsen@akersolutions.com/</a></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">tir. 4. jun. 2024, 02:19 skrev  &lt=
;<a href=3D"mailto:bugzilla@busybox.net">bugzilla@busybox.net</a>&gt;:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><a href=3D"https://bugs.busybox.net/sho=
w_bug.cgi?id=3D16090" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://bugs.busybox.net/show_bug.cgi?id=3D16090</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Bug ID: 16090<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Summary: Buildroot-2024-02-2 error=
 building libffi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Product: buildroot<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Version: unspecified<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hardware: All<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OS: Linux<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Status: NEW<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Severity: blocker<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Priority: P5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Component: Outdated package<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Assignee: <a href=3D"mailto:unassigned@b=
uildroot.uclibc.org" target=3D"_blank" rel=3D"noreferrer">unassigned@buildr=
oot.uclibc.org</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Reporter: <a href=3D"mailto:rmderbes@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">rmderbes@gmail.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC: <a href=3D"mail=
to:buildroot@uclibc.org" target=3D"_blank" rel=3D"noreferrer">buildroot@ucl=
ibc.org</a><br>
=C2=A0 Target Milestone: ---<br>
<br>
When trying to build root image for zynq target, it throws this error:<br>
....<br>
../src/tramp.c: In function &#39;ffi_tramp_get_temp_file&#39;:<br>
../src/tramp.c:262:22: error: implicit declaration of function<br>
&#39;open_temp_exec_file&#39; [-Wimplicit-function-declaration]<br>
=C2=A0 262 |=C2=A0 =C2=A0tramp_globals.fd =3D open_temp_exec_file ();<br>
....<br>
Host OS: Fedora 40<br>
Kernel: 6.8.10-300.fc40.x86_64<br>
gcc : version 14.1.1 20240522 (Red Hat 14.1.1-4) (GCC)<br>
<br>
Problem: libffi-3.4.4 does not compile with gcc &gt; 14.<br>
<br>
Solution: <br>
1) Edit buildroot-2024.02.2/package/libffi/<a href=3D"http://libffi.mk" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libffi.mk</a> and change libff=
i version<br>
LIBFFI_VERSION =3D 3.4.6<br>
<br>
2) Edit buildroot-2024.02.2/package/libffi/libffi.hash and change hashes:<b=
r>
# For libffi-3.4.6.tar.gz<br>
sha256=C2=A0 b0dea9df23c863a7a50e825440f3ebffabd65df1497108e5d437747843895a=
4e <br>
libffi-3.4.6.tar.gz<br>
sha256=C2=A0 67894089811f93fca47a76f85e017da6f8582d4ba0905963c6e0f1ad6df7a1=
95 <br>
LICENSE<br>
<br>
I have tried it only for zynq target, but I assume that this fix works for =
all<br>
targets that compile libffi and all systems=C2=A0 where GCC &gt; 14<br>
Regards<br>
<br>
-- <br>
You are receiving this mail because:<br>
You are on the CC list for the bug.<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"norefer=
rer">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div>

--000000000000c0d4c8061a5e6a69--

--===============1424648750976798360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1424648750976798360==--
