Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDFFC61DE2
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 01:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A936D40589;
	Mon, 31 Aug 2026 01:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDTJluVyGILR; Mon, 31 Aug 2026 01:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788140199;
	bh=7/VxiaTTjVOodRliZ48znsKotoUw/tz4DqNJ9HWf92Y=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvhbwZnJigx0qd2AWt+FtNj66uizQoO1R7Mhn8jYWgu9uMJdv8C7FiIvC+kpmDd75
	 BamDyz+ntejeFK0YbNUku4v9ieUcCeAb6eEEKLGjUAPavvC9qeyurVBtFbbIH79Ebn
	 JaYFD029Fw6X7Ry8b0rm1gwU8rXy9ncpSHHJ2oEp1O7yuSTZHzEXRWsUOqmDrAkLDx
	 xlZ+jaeGSkwUKik1r3lwGw1BT5RrwyWusNG+9Z55rHUJgR9KbveAt5y63ycqRWlJoe
	 vF9xo4hGSRS/grfkrr9Q2Ny464ag6VNtYNUQh55kX6e0heD8Ix2fnxf/d6bMoUXFP4
	 UlKrzk9vt0iQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B12E402BC;
	Mon, 31 Aug 2026 01:36:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C1F127
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 01:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24C7880C3D
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 01:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71QIQjSoCszY for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 01:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Q+kgKGK/
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D503980C23
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 01:36:36 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-966e7380109so2143547241.3
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 18:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788140195; cv=none;
 d=google.com; s=arc-20260327;
 b=O3igX7IFCkkr9Otr7HULcV2IQsaqXDnMlvNwg/lrowUn/9e6DnPBHudDx0NHYSwUeE
 m+weXdXeMxJdxhwAi+oSORt3zDinOLQb+bQH23HKbQObvLJyeEGPoTmGsC3r3PrBmam9
 nzCja4l0Vx+ntskW1Ax/a16Fy8Dog4MPdghVlBmmYmT8JXsBCmpEqot0M7hxKv9RGlnG
 dqc3TtE58vYn8s+DI/A/vv1Cm14HLKxFj9wR1HUmnf+uiKMMz2UP6knXzmN6ZqtYpeJ/
 /QH67Jn1dpLPVmdw3aO6BI/AB3FtG10w4SmgL7xEp45x//ekGrbb/AMHzOxVn24qbfIc
 8VnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SPD2sgM9p1i7ljldxyfsqcf//jFTyZCLGTx01931ums=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=bqa6S/dTY8GH9+h+wlYRUBce61yoUo3MTTIoEqOm19jgBkCj2lc3nSj2sbHnF+jZ9z
 cB4vWgBwkC1cebVfMdVddlhz3GhXiHFvg1YZAEvC+1Ic+Lfvs7mGJN0lrJockwxFUTLj
 VR7IheNKnT+WyZ1dnXHbxFL4hzjK0ZYSBe1gS+RljWkeEsixItwgKaQMiZBdQbNkrVB9
 6m1Bc8zdEaCD/evgDMcwHkeWpSz5RtPOgQmDs1fhP8zdOL2yenNsHDqjGTJQVWV6jwjN
 TKK80s/BdMLDdb+waRIDrOLIm0X97YO7A/YSRTT5Q71F+Am3dDtPFR4fBNfkBi6NLbv5
 XLkA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788140195; x=1788744995; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SPD2sgM9p1i7ljldxyfsqcf//jFTyZCLGTx01931ums=;
 b=Q+kgKGK/6Iyfvh0swaMgr983JRE/DclZ1Zh1fbaabwsUk3AikNxJhlyw3R/0UpA6iW
 ssRgY51HWJwekg/4TkTkscx8xnbI2k7WDuCdeek5iavhnwpaxujH0vppARk6Bdnf9Am3
 ZLIJm4BskmVMwV9z3WET+0tWO0F9p4aWVgYMjNVq4Ag0cgPCvsE4VxZHl5vbZjWljngu
 w33NjCbobN57qtF1/1s3zAz9a8bILKkrzSZGZMnImE1RK/79jiA8jNEOwwZNco7ZG317
 HaTIx8i8G2h+5IxXLckjEmY0Tp2tubjzwwwJrpNeY6gTPa1shFJ13usZEmoGFpNu7fux
 m+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788140195; x=1788744995;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SPD2sgM9p1i7ljldxyfsqcf//jFTyZCLGTx01931ums=;
 b=VD9paHOj3KwX/n6yC/MB+TioCp7lpyjHuj5fqnhmv90TXEoNPWOlyuxCU8WVroD6rd
 nuo+gFlHyHcYlj+OKSc/XMmnraP8WUqAFB5S5mGnqumoLPnP9UQD7M+DwcOw8CgntoVO
 vZHoWAC8k1AVzk1ILtxpvt0N+X6dLFONMq0KBhP9FVCqKuJb9SxIMTWJZlCkqM7QL83C
 zYkf4UuMAAkHeIAcmAgk6Nz78Cak+Ld39duO2HD823XzwydXCLWQw7fVZbHiPmfNEJnn
 fhlbd+U1PgjhAZ+fW/VdF6tPlx/Q7DcMOYVpSbQLuuhGY15PiRPkwjJLHYg7BOIbhePv
 8NXA==
X-Gm-Message-State: AFuF++kXc8Efne+/xIZj3l2CTwJ8nV1Tg/U8EIDUnGsnj1pAY9Mo1M80
 +tPt/eyShHlAveh9ljge/SggxUBSwQYmP4969PUzGtuUXZ4k1KevJ+lRhp0oi5REYceUXZZS8s8
 M1XuxYlZ0j+e9G0iWhIUXLzT4qnAt27s=
X-Gm-Gg: AR+sD10UwhvQn1IC6XZJznKZ+6biIlrWd77JCjxKydTbuSmAI4/pBXRe627dtYqdhc4
 OGJ9La1NskZAron92X6M2A9lwfaEukNn588SwOE/gXB5B5kejEMGJ4e9bSu+vXibHSuX6D/pnv9
 3cnNQDakPu3JDwbXESoVbPFKLEdmftkIXUx3mm5eC9g2KhJEDcpoIANf6id7ssy9/Z9op/0aU6i
 uTLYGTnVZ2TgmYTOTjxbQX1zPuqVzbdxXomwZ7y/wAe5LofX1YFv3JQ2TmL5HPQmbJJ+hS1jE9r
 fa2AudJ6yVPgAYiuFPfB1GDrmCFMJpPLxY8UtnzXLgb6Qtl/zB4jZFRYWgQdyU1Ww56QymzlNqz
 EQXxR
X-Received: by 2002:a05:6102:8099:b0:786:8a7:92e3 with SMTP id
 ada2fe7eead31-78608a79338mr8168942137.2.1788140194882; Sun, 30 Aug 2026
 18:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260826203304.387458-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20260826203304.387458-1-thomas.petazzoni@bootlin.com>
From: =?UTF-8?Q?Fran=C3=A7ois_PERRAD?= <francois.perrad.86@gmail.com>
Date: Mon, 31 Aug 2026 03:36:24 +0200
X-Gm-Features: AcwNN1V2z9RxRhJVLZFR-9Uw_UaqImXR0hp4w9Ie12pdux6o5YOyHqfS0evLWbI
Message-ID: <CAMTop8_0+4TiTOUDdwxngi8sY0DNTwD28D+-oYsbGh=rrzcLOA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/perl: fix build issue with musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1585464514018757852=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1585464514018757852==
Content-Type: multipart/alternative; boundary="0000000000001fe90d065a4dd53e"

--0000000000001fe90d065a4dd53e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas,

this commit currently breaks host-perl which is a dependency of every
package using the perl-package infrastructure.

the patch is against the content of the perl-cross tarball, not the content
of perl tarball.
unluckily, perl-cross is only extracted with perl, no with host-perl.

the easiest fix is to extract perl-cross also for host-perl.

HOST_PERL_POST_EXTRACT_HOOKS +=3D PERL_CROSS_EXTRACT
will do the job.

Francois


Le mer. 26 ao=C3=BBt 2026 =C3=A0 22:33, Thomas Petazzoni <thomas.petazzoni@=
bootlin.com>
a =C3=A9crit :

> perl does not build with musl due to memrchr() being unavailable. This
> is caused by a perl-cross bug, which does function availability
> detection with _GNU_SOURCE defined, but then does the build without
> _GNU_SOURCE defined. At least OpenEmbedded and NixOS have faced the
> same issue, and worked it around in slightly different ways.
>
> On our side, we create a patch, which was submitted upstream, to solve
> the issue.
>
> This issue has been introduced in perl-cross commit b40c560f5d5e,
> which was first merged in perl-cross release 1.4.1. From a Buildroot
> perspective, we bumped from perl-cross 1.4 to 1.4.1 in commit
> 8a289667f5dba6fffb3a21faa14517e9b49726a4, which was merged
> 2023.05. And indeed the build failure can be reproduced even on our
> LTS 2025.02.x, so the fix needs to be backported there.
>
> It should be noted that even if the patch is against perl-cross, we
> add it to package/perl/ directly, as patches in perl are applied after
> perl has been extracted *and* perl-cross has been extracted on top.
>
> Fixes:
>
>
> https://autobuild.buildroot.net/results/3e47ade0963642988fd8e1be9a6e80427=
00619ec/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...gure-keep-_GNU_SOURCE-in-build-flags.patch | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644
> package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
>
> diff --git
> a/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
> b/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
> new file mode 100644
> index 0000000000..497e58c502
> --- /dev/null
> +++ b/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch
> @@ -0,0 +1,55 @@
> +From 6bdfdff24f4a7d17d3b7d9d02bca3eac11c235a4 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Wed, 26 Aug 2026 19:34:39 +0200
> +Subject: [PATCH] configure: keep _GNU_SOURCE in build flags
> +
> +The checkfunc() function probes available libc functions with _GNU_SOURC=
E
> +defined. The generated config.sh did not retain that define in ccflags, =
so
> +the actual cross build could use functions whose prototypes remain hidde=
n
> by
> +feature-test macros. This breaks musl builds, where memrchr is declared
> only
> +with _GNU_SOURCE.
> +
> +To fix this, append _GNU_SOURCE to explicit -Dccflags values while parsi=
ng
> +configure arguments. Such values are locked before configure_tool.sh can
> +append flags. This keeps the function-availability checks and subsequent
> +compilation in the same feature set, including when flags are supplied
> +through CFLAGS.
> +
> +This fixes the regression introduced by b40c560f5d5e (configure_func.sh:
> Add
> +_GNU_SOURCE define and function signatures).
> +
> +It fixes the following build issue with musl:
> +
> +    In file included from op.c:163:
> +    op.c: In function 'Perl_newATTRSUB_x':
> +    perl.h:2385:25: error: implicit declaration of function 'memrchr'; d=
id
> +    you mean 'memchr'? [-Wimplicit-function-declaration]
> +     2385 | #    define my_memrchr  memrchr
> +          |                         ^~~~~~~
> +
> +This issue is worked around in several build systems:
> +
> +- In OpenEmbedded:
> +  https://github.com/openembedded/openembedded-core/commit/6422e62
> +
> +- In NixOS:
> +  https://github.com/NixOS/nixpkgs/pull/441527
> +
> +Fixes: https://github.com/arsv/perl-cross/issues/158
> +Upstream: https://github.com/arsv/perl-cross/pull/180
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +
> +diff --git a/cnf/configure_args.sh b/cnf/configure_args.sh
> +index 5bc4c6b..65ffc96 100644
> +--- a/cnf/configure_args.sh
> ++++ b/cnf/configure_args.sh
> +@@ -225,6 +225,9 @@ while [ $i -le $# -o -n "$n" ]; do
> +               host|target|build) ;;
> +               # original Configure options
> +               D)
> ++                      if [ "$k" =3D 'ccflags' ]; then
> ++                              v=3D"$v -D_GNU_SOURCE"
> ++                      fi
> +                       setordefine "$k" "$x" "$v" 'define' 'true'
> +                       ;;
> +               U)
> --
> 2.55.0
>
>

--0000000000001fe90d065a4dd53e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thomas,<br><br>this commit currently brea=
ks host-perl which is a dependency of every package using the perl-package =
infrastructure.<br><br>the patch is against the content of the perl-cross t=
arball, not the content of perl tarball.</div><div dir=3D"ltr"><span class=
=3D"gmail-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz"><span class=3D"gma=
il-ryNqvb">unluckily</span></span></span>, perl-cross is only extracted wit=
h perl, no with host-perl.<br><br>the easiest fix is to extract perl-cross =
also for host-perl.<br><br>HOST_PERL_POST_EXTRACT_HOOKS +=3D PERL_CROSS_EXT=
RACT<br>will do the job.<br><br>Francois<br><br></div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=
=A0mer. 26 ao=C3=BBt 2026 =C3=A0=C2=A022:33, Thomas Petazzoni &lt;<a href=
=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&g=
t; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">perl does not build with musl due to memrchr() being unavailable. Th=
is<br>
is caused by a perl-cross bug, which does function availability<br>
detection with _GNU_SOURCE defined, but then does the build without<br>
_GNU_SOURCE defined. At least OpenEmbedded and NixOS have faced the<br>
same issue, and worked it around in slightly different ways.<br>
<br>
On our side, we create a patch, which was submitted upstream, to solve<br>
the issue.<br>
<br>
This issue has been introduced in perl-cross commit b40c560f5d5e,<br>
which was first merged in perl-cross release 1.4.1. From a Buildroot<br>
perspective, we bumped from perl-cross 1.4 to 1.4.1 in commit<br>
8a289667f5dba6fffb3a21faa14517e9b49726a4, which was merged<br>
2023.05. And indeed the build failure can be reproduced even on our<br>
LTS 2025.02.x, so the fix needs to be backported there.<br>
<br>
It should be noted that even if the patch is against perl-cross, we<br>
add it to package/perl/ directly, as patches in perl are applied after<br>
perl has been extracted *and* perl-cross has been extracted on top.<br>
<br>
Fixes:<br>
<br>
=C2=A0 <a href=3D"https://autobuild.buildroot.net/results/3e47ade0963642988=
fd8e1be9a6e8042700619ec/" rel=3D"noreferrer" target=3D"_blank">https://auto=
build.buildroot.net/results/3e47ade0963642988fd8e1be9a6e8042700619ec/</a><b=
r>
<br>
Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
---<br>
=C2=A0...gure-keep-_GNU_SOURCE-in-build-flags.patch | 55 ++++++++++++++++++=
+<br>
=C2=A01 file changed, 55 insertions(+)<br>
=C2=A0create mode 100644 package/perl/0001-configure-keep-_GNU_SOURCE-in-bu=
ild-flags.patch<br>
<br>
diff --git a/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.pa=
tch b/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch<br>
new file mode 100644<br>
index 0000000000..497e58c502<br>
--- /dev/null<br>
+++ b/package/perl/0001-configure-keep-_GNU_SOURCE-in-build-flags.patch<br>
@@ -0,0 +1,55 @@<br>
+From 6bdfdff24f4a7d17d3b7d9d02bca3eac11c235a4 Mon Sep 17 00:00:00 2001<br>
+From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com"=
 target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
+Date: Wed, 26 Aug 2026 19:34:39 +0200<br>
+Subject: [PATCH] configure: keep _GNU_SOURCE in build flags<br>
+<br>
+The checkfunc() function probes available libc functions with _GNU_SOURCE<=
br>
+defined. The generated config.sh did not retain that define in ccflags, so=
<br>
+the actual cross build could use functions whose prototypes remain hidden =
by<br>
+feature-test macros. This breaks musl builds, where memrchr is declared on=
ly<br>
+with _GNU_SOURCE.<br>
+<br>
+To fix this, append _GNU_SOURCE to explicit -Dccflags values while parsing=
<br>
+configure arguments. Such values are locked before configure_tool.sh can<b=
r>
+append flags. This keeps the function-availability checks and subsequent<b=
r>
+compilation in the same feature set, including when flags are supplied<br>
+through CFLAGS.<br>
+<br>
+This fixes the regression introduced by b40c560f5d5e (configure_func.sh: A=
dd<br>
+_GNU_SOURCE define and function signatures).<br>
+<br>
+It fixes the following build issue with musl:<br>
+<br>
+=C2=A0 =C2=A0 In file included from op.c:163:<br>
+=C2=A0 =C2=A0 op.c: In function &#39;Perl_newATTRSUB_x&#39;:<br>
+=C2=A0 =C2=A0 perl.h:2385:25: error: implicit declaration of function &#39=
;memrchr&#39;; did<br>
+=C2=A0 =C2=A0 you mean &#39;memchr&#39;? [-Wimplicit-function-declaration]=
<br>
+=C2=A0 =C2=A0 =C2=A02385 | #=C2=A0 =C2=A0 define my_memrchr=C2=A0 memrchr<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~<br>
+<br>
+This issue is worked around in several build systems:<br>
+<br>
+- In OpenEmbedded:<br>
+=C2=A0 <a href=3D"https://github.com/openembedded/openembedded-core/commit=
/6422e62" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembed=
ded/openembedded-core/commit/6422e62</a><br>
+<br>
+- In NixOS:<br>
+=C2=A0 <a href=3D"https://github.com/NixOS/nixpkgs/pull/441527" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/NixOS/nixpkgs/pull/441527</a>=
<br>
+<br>
+Fixes: <a href=3D"https://github.com/arsv/perl-cross/issues/158" rel=3D"no=
referrer" target=3D"_blank">https://github.com/arsv/perl-cross/issues/158</=
a><br>
+Upstream: <a href=3D"https://github.com/arsv/perl-cross/pull/180" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/arsv/perl-cross/pull/180</a=
><br>
+Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boo=
tlin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt;<br>
+<br>
+diff --git a/cnf/configure_args.sh b/cnf/configure_args.sh<br>
+index 5bc4c6b..65ffc96 100644<br>
+--- a/cnf/configure_args.sh<br>
++++ b/cnf/configure_args.sh<br>
+@@ -225,6 +225,9 @@ while [ $i -le $# -o -n &quot;$n&quot; ]; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host|target|build) =
;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# original Configur=
e options<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0D)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if [ &quot;$k&quot; =3D &#39;ccflags&#39; ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=3D&quot;$v -D_GNU_SOURCE&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0setordefine &quot;$k&quot; &quot;$x&quot; &quot;$v&quot; &#39;def=
ine&#39; &#39;true&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0U)<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--0000000000001fe90d065a4dd53e--

--===============1585464514018757852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1585464514018757852==--
