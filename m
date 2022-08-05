Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F7FC00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 14:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B022460ECD;
	Fri,  5 Aug 2022 14:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B022460ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIRMpfzAGu24; Fri,  5 Aug 2022 14:47:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0E360E7C;
	Fri,  5 Aug 2022 14:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0E360E7C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87A871BF868
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 14:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 625E583E9C
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 14:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 625E583E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bg75y8DH-KHb for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 14:47:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF63783E82
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF63783E82
 for <buildroot@busybox.net>; Fri,  5 Aug 2022 14:47:19 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t5so3635028edc.11
 for <buildroot@busybox.net>; Fri, 05 Aug 2022 07:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9SUQ8N63O+rvYT7j5yyTY3S0++wR8wLqVGRkZJkPcdA=;
 b=PI6UMivqCaypbeqWZTxeesP1N28WeAqWiY4O1d23Nil6glxxYA6Jaw7VhxBgW0tAC8
 lxDdwcngHVd6ESuuxG6Sy3DyxsqeVgPhd7Jd+BWraAT3KaDNLRRhVxrUm3rtMu7s1rGA
 emgv48G/LQS7rz/zM3I4uuLtxZOqMpNaAI0VlUrBWlWAMP4gXOqeh2Xbn9Su7yLj4XzG
 ntJ/AITw7Mqh3+AJzZrtLp3oq343KlGirkKhgl0gdom4R9eG7RzR7ffQU2jFkzz8zL8p
 2p2BieZmIpcIUb3fPRENrCvqI3lV5v80gfvRT3Ay2H6B6Rh/h/O0iJdixyYycYmBSM92
 rKpQ==
X-Gm-Message-State: ACgBeo39qCY3T6kh+wIeOjc8VnEdfgiHAdL5evmt88JgIKzkxjuLRqEG
 rBMHdnIQkGNFhK3TT7471XD9BlYlJbauRkSRKSH/Qq/F
X-Google-Smtp-Source: AA6agR7pZ+4XRUqH0bmLmxvN1L6EGhHjLcQspPQ1P804XsWE93LaQcLNlRK/YBAhMj9z/hdMy+ujpDG3Cu3GontsgsM=
X-Received: by 2002:a05:6402:3492:b0:43e:9666:ece2 with SMTP id
 v18-20020a056402349200b0043e9666ece2mr6393658edc.65.1659710837715; Fri, 05
 Aug 2022 07:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
 <20220805143625.16542-2-guillaume.bressaix@gmail.com>
In-Reply-To: <20220805143625.16542-2-guillaume.bressaix@gmail.com>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Fri, 5 Aug 2022 16:46:50 +0200
Message-ID: <CAJe0E3cL8MK4ipwq3tLDy_D6dqrEJ2gfi20J1rXEewW4fUSkcw@mail.gmail.com>
To: buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9SUQ8N63O+rvYT7j5yyTY3S0++wR8wLqVGRkZJkPcdA=;
 b=JYRTP8fwyUan4sYwQ12qsjQREjTirgprhyf26jLFe/HEkBcDtxo1kiJbBq+9GYkrXF
 c9fiLz7hZ3i4O2Xv3PXg0jtbTWRP2xp386oMICidWnpUToIpyvulScAnh5kTjcBHKNrC
 t4Ysj4wIGBPmERK/ND8cdxhps2p7m6tacWkKwBu5oy33zssK0ARi2a3YLUPFlRLLTC6G
 jXB/ee2VpGVmK5cJXchLwjmLhSljTsJ/Snwcr17BO5A8x5ovdvmcdHNTQEIYPA715Qry
 KMuor0REq6pFNOBiHIgMa6cNqOurGEJ1DFdzQBR6FX0bhUomll/5r1UnAqsS+F+vkxS2
 yNBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JYRTP8fw
Subject: Re: [Buildroot] [RFC v3 2/2] package/python-scipy: bump version to
 1.9.0
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
Cc: ralf.gommers@gmail.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============1440182378367258640=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1440182378367258640==
Content-Type: multipart/alternative; boundary="000000000000e9771705e57f8a49"

--000000000000e9771705e57f8a49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Thanks to Ralf Gommers from the Scipy dev team, we understand what was
wrong in the previous submissions, we have a fix, see my v3 submission.
I wanted to mark this one as ready for review, but decided not to.. Build
passes for standard platforms, but the runtime test fails.

$scipy/scipy/meson.build l70: the pybind11 include path is resolved to some
$(STAGING_DIR)/include location in the runtime test env,
which "does not exist". Scipy uses a "python import pybind" command to
deduce the pybind11 lib location, which is totally fine, but somehow leads
to faulty behavior in the qemu environment

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le ven. 5 ao=C3=BBt 2022 =C3=A0 16:37, Guillaume W. Bres <guillaume.bressai=
x@gmail.com>
a =C3=A9crit :

> SciPy is moving to a meson build infrastructure.
> The current meson build scripts deduce all internal
> locations based on the host-python location, which is incorrect
> when dealing with "npyrandom" and "npymath", that are included
> in code that gets cross-compiled.
>
> https://github.com/scipy/scipy/issues/14812
>
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
> As expected, moving to meson already makes things much easier for us,
> as meson is capable of deducing a cross-compilation context and can take
> advantage of pkg-config too. Also, the distutils approach will get remove=
d
> before 1.12.0.
>
> The npy core lib "problem" is acknowledged by the scipy dev team and we
> can expect improved
> behavior in the next releases. Ralf Gommers from the team provided
> valuable input for this patch serie, thank you!
>
> Run the runtime test with
> ./support/testing/run-tests -d dl -o test -k
> test.package.test_python_scipy.TestPythonPy3SciPy
> ---
>  ...uild-fix-numpy-core-include-location.patch | 33 +++++++++++++++
>  package/python-scipy/python-scipy.hash        |  2 +-
>  package/python-scipy/python-scipy.mk          | 42 +++++++++----------
>  3 files changed, 53 insertions(+), 24 deletions(-)
>  create mode 100644
> package/python-scipy/0001-scipy-meson.build-fix-numpy-core-include-locati=
on.patch
>
> diff --git
> a/package/python-scipy/0001-scipy-meson.build-fix-numpy-core-include-loca=
tion.patch
> b/package/python-scipy/0001-scipy-meson.build-fix-numpy-core-include-loca=
tion.patch
> new file mode 100644
> index 0000000000..3b5ee78f3e
> --- /dev/null
> +++
> b/package/python-scipy/0001-scipy-meson.build-fix-numpy-core-include-loca=
tion.patch
> @@ -0,0 +1,33 @@
> +From 3045d4ebc83dda5922175758adc74018aebccdd1 Mon Sep 17 00:00:00 2001
> +From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> +Date: Fri, 5 Aug 2022 16:02:21 +0200
> +Subject: [PATCH] scipy/meson.build: fix numpy core include location
> +
> +The numpy core location is deduced from host-python,
> +while we will include lib npyrandom and npymath when cross compiling.
> +These two must be previously cross-compiled.
> +
> +Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> +---
> + scipy/meson.build | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/scipy/meson.build b/scipy/meson.build
> +index 76bb3606e..f65601aee 100644
> +--- a/scipy/meson.build
> ++++ b/scipy/meson.build
> +@@ -52,9 +52,9 @@ inc_f2py =3D include_directories(incdir_f2py)
> + fortranobject_c =3D incdir_f2py / 'fortranobject.c'
> +
> + cc =3D meson.get_compiler('c')
> +-npymath_path =3D incdir_numpy / '..' / 'lib'
> ++npymath_path =3D @NUMPY_SYSROOT_INCDIR@ / '..' / 'lib'
> + npymath_lib =3D cc.find_library('npymath', dirs: npymath_path)
> +-npyrandom_path =3D incdir_numpy / '..' / '..' / 'random' / 'lib'
> ++npyrandom_path =3D @NUMPY_SYSROOT_INCDIR@ / '..' / '..' / 'random' / 'l=
ib'
> + # Note: `required: false` can be removed once numpy 1.19 is the minimum
> version
> + npyrandom_lib =3D cc.find_library('npyrandom', dirs: npyrandom_path,
> required: false)
> +
> +--
> +2.30.2
> +
> diff --git a/package/python-scipy/python-scipy.hash
> b/package/python-scipy/python-scipy.hash
> index 0274679c43..6637faf5b4 100644
> --- a/package/python-scipy/python-scipy.hash
> +++ b/package/python-scipy/python-scipy.hash
> @@ -1,5 +1,5 @@
>  # Locally generated
> -sha256  0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a1e9
> scipy-1.8.1.tar.xz
> +sha256  c0dfd7d2429452e7e94904c6a3af63cbaa3cf51b348bd9d35b42db7e9ad42791
> scipy-1.9.0.tar.gz
>  sha256  96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788a33da19c
> LICENSE.txt
>  sha256  37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35
> scipy/linalg/src/lapack_deprecations/LICENSE
>  sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609
> scipy/ndimage/LICENSE.txt
> diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/
> python-scipy.mk
> index b5006a2e15..cb0b078e0b 100644
> --- a/package/python-scipy/python-scipy.mk
> +++ b/package/python-scipy/python-scipy.mk
> @@ -4,8 +4,8 @@
>  #
>
>  ########################################################################=
########
>
> -PYTHON_SCIPY_VERSION =3D 1.8.1
> -PYTHON_SCIPY_SOURCE =3D scipy-$(PYTHON_SCIPY_VERSION).tar.xz
> +PYTHON_SCIPY_VERSION =3D 1.9.0
> +PYTHON_SCIPY_SOURCE =3D scipy-$(PYTHON_SCIPY_VERSION).tar.gz
>  PYTHON_SCIPY_SITE =3D
> https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
>  PYTHON_SCIPY_LICENSE =3D \
>         BSD-3-Clause, \
> @@ -23,6 +23,7 @@ PYTHON_SCIPY_LICENSE_FILES =3D \
>         scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
>         scipy/spatial/qhull_src/COPYING.txt
>  PYTHON_SCIPY_DEPENDENCIES +=3D \
> +       host-pkgconf \
>         host-python-numpy \
>         host-python-pythran \
>         zlib \
> @@ -31,26 +32,21 @@ PYTHON_SCIPY_DEPENDENCIES +=3D \
>         python-pybind
>  PYTHON_SCIPY_INSTALL_STAGING =3D YES
>
> -PYTHON_SCIPY_SETUP_TYPE =3D setuptools
> -PYTHON_SCIPY_BUILD_OPTS =3D config_fc --fcompiler=3Dgnu95
> -
> -PYTHON_SCIPY_LDFLAGS =3D $(TARGET_LDFLAGS) -shared \
> -       -L$(PYTHON3_PATH)/site-packages/numpy/core/lib
> -# -lnpyrandom localization
> -PYTHON_SCIPY_LDFLAGS +=3D \
> -
>  -L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/nu=
mpy/random/lib
> -
> -PYTHON_SCIPY_ENV =3D \
> -       F90=3D$(TARGET_FC) \
> -       LDFLAGS=3D"$(PYTHON_SCIPY_LDFLAGS)"
> -
> -# Provide system configuration options to numpy distutils extensions,
> telling
> -# to find all include files and libraries in staging directory.
> -define PYTHON_SCIPY_CONFIGURE_CMDS
> -       -rm -f $(@D)/site.cfg
> -       echo "[DEFAULT]" >> $(@D)/site.cfg
> -       echo "library_dirs =3D $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
> -       echo "include_dirs =3D $(STAGING_DIR)/usr/include" >> $(@D)/site.=
cfg
> +# the meson.build infrastructure, currently uses host-python
> +# for code generation, f2py invokation, but also to determine
> +# all internal dependencies location. It is incorrect regarging
> +# libnpyrandom and libnpymath because we need the cross-compiled version
> +# for these two
> +# sed -i 's/@NUMPY_SYSROOT_INCDIR@/$(STAGING_DIR)\/usr\/lib\/python$(PYT=
HON3_VERSION_MAJOR)\/site-packages\/numpy/'
> $(@D)/scipy/meson.build
> +define PYTHON_SCIPY_FIX_NUMPY_CORE_SYSROOT_LOCATION
> +       sed -i \
> +           "s:@NUMPY_SYSROOT_INCDIR@:'$(STAGING_DIR)\/usr\/lib\/python$(=
PYTHON3_VERSION_MAJOR)\/site-packages\/numpy\/core\/include\/':"
> \
> +               $(@D)/scipy/meson.build
>  endef
> +PYTHON_SCIPY_PRE_CONFIGURE_HOOKS +=3D
> PYTHON_SCIPY_FIX_NUMPY_CORE_SYSROOT_LOCATION
> +
> +PYTHON_SCIPY_CONF_OPTS =3D \
> +       -Dblas=3Dlapack \
> +       -Dlapack=3Dlapack
>
> -$(eval $(python-package))
> +$(eval $(meson-package))
> --
> 2.30.2
>
>

--000000000000e9771705e57f8a49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<br><br>Thanks to Ralf Gommers from the Scipy=
 dev team, we understand what was wrong in the previous submissions, we hav=
e a fix, see my v3 submission.<br>I wanted to mark this one as ready for re=
view, but decided not to.. Build passes for standard platforms, but the run=
time test fails.<br><br>$scipy/scipy/meson.build l70: the pybind11 include =
path is resolved to some $(STAGING_DIR)/include location in the runtime tes=
t env, <br>which &quot;does not exist&quot;. Scipy uses a &quot;python impo=
rt pybind&quot; command to deduce the pybind11 lib location, which is total=
ly fine, but somehow leads to faulty behavior in the qemu environment<br><b=
r clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><div><div><div><font face=3D"arial,helvetica,sans-serif">G=
uillaume W. Bres<br></font></div><font face=3D"arial,helvetica,sans-serif">=
Software engineer</font><br></div><font face=3D"arial,helvetica,sans-serif"=
></font></div><font face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mail=
to:guillaume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail=
.com</a>&gt;<br></font></div></div></div></div></div></div><br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven.=
 5 ao=C3=BBt 2022 =C3=A0=C2=A016:37, Guillaume W. Bres &lt;<a href=3D"mailt=
o:guillaume.bressaix@gmail.com">guillaume.bressaix@gmail.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">S=
ciPy is moving to a meson build infrastructure.<br>
The current meson build scripts deduce all internal<br>
locations based on the host-python location, which is incorrect<br>
when dealing with &quot;npyrandom&quot; and &quot;npymath&quot;, that are i=
ncluded<br>
in code that gets cross-compiled.<br>
<br>
<a href=3D"https://github.com/scipy/scipy/issues/14812" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/scipy/scipy/issues/14812</a><br>
<br>
Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bressaix@g=
mail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
---<br>
As expected, moving to meson already makes things much easier for us,<br>
as meson is capable of deducing a cross-compilation context and can take<br=
>
advantage of pkg-config too. Also, the distutils approach will get removed =
before 1.12.0.<br>
<br>
The npy core lib &quot;problem&quot; is acknowledged by the scipy dev team =
and we can expect improved<br>
behavior in the next releases. Ralf Gommers from the team provided<br>
valuable input for this patch serie, thank you!<br>
<br>
Run the runtime test with<br>
./support/testing/run-tests -d dl -o test -k test.package.test_python_scipy=
.TestPythonPy3SciPy<br>
---<br>
=C2=A0...uild-fix-numpy-core-include-location.patch | 33 +++++++++++++++<br=
>
=C2=A0package/python-scipy/python-scipy.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A0package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D"norefe=
rrer" target=3D"_blank">python-scipy.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 42 +++++++++----------<br>
=C2=A03 files changed, 53 insertions(+), 24 deletions(-)<br>
=C2=A0create mode 100644 package/python-scipy/0001-scipy-meson.build-fix-nu=
mpy-core-include-location.patch<br>
<br>
diff --git a/package/python-scipy/0001-scipy-meson.build-fix-numpy-core-inc=
lude-location.patch b/package/python-scipy/0001-scipy-meson.build-fix-numpy=
-core-include-location.patch<br>
new file mode 100644<br>
index 0000000000..3b5ee78f3e<br>
--- /dev/null<br>
+++ b/package/python-scipy/0001-scipy-meson.build-fix-numpy-core-include-lo=
cation.patch<br>
@@ -0,0 +1,33 @@<br>
+From 3045d4ebc83dda5922175758adc74018aebccdd1 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Guillaume W. Bres&quot; &lt;<a href=3D"mailto:guillaume.bressa=
ix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
+Date: Fri, 5 Aug 2022 16:02:21 +0200<br>
+Subject: [PATCH] scipy/meson.build: fix numpy core include location<br>
+<br>
+The numpy core location is deduced from host-python,<br>
+while we will include lib npyrandom and npymath when cross compiling.<br>
+These two must be previously cross-compiled.<br>
+<br>
+Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bressaix@=
gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
+---<br>
+ scipy/meson.build | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/scipy/meson.build b/scipy/meson.build<br>
+index 76bb3606e..f65601aee 100644<br>
+--- a/scipy/meson.build<br>
++++ b/scipy/meson.build<br>
+@@ -52,9 +52,9 @@ inc_f2py =3D include_directories(incdir_f2py)<br>
+ fortranobject_c =3D incdir_f2py / &#39;fortranobject.c&#39;<br>
+ <br>
+ cc =3D meson.get_compiler(&#39;c&#39;)<br>
+-npymath_path =3D incdir_numpy / &#39;..&#39; / &#39;lib&#39;<br>
++npymath_path =3D @NUMPY_SYSROOT_INCDIR@ / &#39;..&#39; / &#39;lib&#39;<br=
>
+ npymath_lib =3D cc.find_library(&#39;npymath&#39;, dirs: npymath_path)<br=
>
+-npyrandom_path =3D incdir_numpy / &#39;..&#39; / &#39;..&#39; / &#39;rand=
om&#39; / &#39;lib&#39;<br>
++npyrandom_path =3D @NUMPY_SYSROOT_INCDIR@ / &#39;..&#39; / &#39;..&#39; /=
 &#39;random&#39; / &#39;lib&#39;<br>
+ # Note: `required: false` can be removed once numpy 1.19 is the minimum v=
ersion<br>
+ npyrandom_lib =3D cc.find_library(&#39;npyrandom&#39;, dirs: npyrandom_pa=
th, required: false)<br>
+ <br>
+-- <br>
+2.30.2<br>
+<br>
diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/=
python-scipy.hash<br>
index 0274679c43..6637faf5b4 100644<br>
--- a/package/python-scipy/python-scipy.hash<br>
+++ b/package/python-scipy/python-scipy.hash<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# Locally generated<br>
-sha256=C2=A0 0140dd24d14ce194fdb3df496c2190f0896ca84ac98bf5d69c3b3fb7bde1a=
1e9=C2=A0 scipy-1.8.1.tar.xz<br>
+sha256=C2=A0 c0dfd7d2429452e7e94904c6a3af63cbaa3cf51b348bd9d35b42db7e9ad42=
791=C2=A0 scipy-1.9.0.tar.gz<br>
=C2=A0sha256=C2=A0 96599f8ec69a2cc609265eed13fc75090aacb28742260e55ce623788=
a33da19c=C2=A0 LICENSE.txt<br>
=C2=A0sha256=C2=A0 37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f=
1b4f7b35=C2=A0 scipy/linalg/src/lapack_deprecations/LICENSE<br>
=C2=A0sha256=C2=A0 606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5f=
bcc89609=C2=A0 scipy/ndimage/LICENSE.txt<br>
diff --git a/package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D=
"noreferrer" target=3D"_blank">python-scipy.mk</a> b/package/python-scipy/<=
a href=3D"http://python-scipy.mk" rel=3D"noreferrer" target=3D"_blank">pyth=
on-scipy.mk</a><br>
index b5006a2e15..cb0b078e0b 100644<br>
--- a/package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D"norefe=
rrer" target=3D"_blank">python-scipy.mk</a><br>
+++ b/package/python-scipy/<a href=3D"http://python-scipy.mk" rel=3D"norefe=
rrer" target=3D"_blank">python-scipy.mk</a><br>
@@ -4,8 +4,8 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-PYTHON_SCIPY_VERSION =3D 1.8.1<br>
-PYTHON_SCIPY_SOURCE =3D scipy-$(PYTHON_SCIPY_VERSION).tar.xz<br>
+PYTHON_SCIPY_VERSION =3D 1.9.0<br>
+PYTHON_SCIPY_SOURCE =3D scipy-$(PYTHON_SCIPY_VERSION).tar.gz<br>
=C2=A0PYTHON_SCIPY_SITE =3D <a href=3D"https://github.com/scipy/scipy/relea=
ses/download/v$(PYTHON_SCIPY_VERSION)" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)<=
/a><br>
=C2=A0PYTHON_SCIPY_LICENSE =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BSD-3-Clause, \<br>
@@ -23,6 +23,7 @@ PYTHON_SCIPY_LICENSE_FILES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYIN=
G \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scipy/spatial/qhull_src/COPYING.txt<br>
=C2=A0PYTHON_SCIPY_DEPENDENCIES +=3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-python-numpy \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-python-pythran \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 zlib \<br>
@@ -31,26 +32,21 @@ PYTHON_SCIPY_DEPENDENCIES +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python-pybind<br>
=C2=A0PYTHON_SCIPY_INSTALL_STAGING =3D YES<br>
<br>
-PYTHON_SCIPY_SETUP_TYPE =3D setuptools<br>
-PYTHON_SCIPY_BUILD_OPTS =3D config_fc --fcompiler=3Dgnu95<br>
-<br>
-PYTHON_SCIPY_LDFLAGS =3D $(TARGET_LDFLAGS) -shared \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(PYTHON3_PATH)/site-packages/numpy/core/lib<=
br>
-# -lnpyrandom localization<br>
-PYTHON_SCIPY_LDFLAGS +=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-L$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSIO=
N_MAJOR)/site-packages/numpy/random/lib<br>
-<br>
-PYTHON_SCIPY_ENV =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0F90=3D$(TARGET_FC) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;$(PYTHON_SCIPY_LDFLAGS)&quot;<b=
r>
-<br>
-# Provide system configuration options to numpy distutils extensions, tell=
ing<br>
-# to find all include files and libraries in staging directory.<br>
-define PYTHON_SCIPY_CONFIGURE_CMDS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-rm -f $(@D)/site.cfg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;[DEFAULT]&quot; &gt;&gt; $(@D)/site.=
cfg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;library_dirs =3D $(STAGING_DIR)/usr/=
lib&quot; &gt;&gt; $(@D)/site.cfg<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;include_dirs =3D $(STAGING_DIR)/usr/=
include&quot; &gt;&gt; $(@D)/site.cfg<br>
+# the meson.build infrastructure, currently uses host-python<br>
+# for code generation, f2py invokation, but also to determine<br>
+# all internal dependencies location. It is incorrect regarging<br>
+# libnpyrandom and libnpymath because we need the cross-compiled version<b=
r>
+# for these two<br>
+# sed -i &#39;s/@NUMPY_SYSROOT_INCDIR@/$(STAGING_DIR)\/usr\/lib\/python$(P=
YTHON3_VERSION_MAJOR)\/site-packages\/numpy/&#39; $(@D)/scipy/meson.build<b=
r>
+define PYTHON_SCIPY_FIX_NUMPY_CORE_SYSROOT_LOCATION<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;s:@NUMPY_SYSROOT_INCDIR@:&#=
39;$(STAGING_DIR)\/usr\/lib\/python$(PYTHON3_VERSION_MAJOR)\/site-packages\=
/numpy\/core\/include\/&#39;:&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/scipy/meson.b=
uild<br>
=C2=A0endef<br>
+PYTHON_SCIPY_PRE_CONFIGURE_HOOKS +=3D PYTHON_SCIPY_FIX_NUMPY_CORE_SYSROOT_=
LOCATION<br>
+<br>
+PYTHON_SCIPY_CONF_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dblas=3Dlapack \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dlapack=3Dlapack<br>
<br>
-$(eval $(python-package))<br>
+$(eval $(meson-package))<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--000000000000e9771705e57f8a49--

--===============1440182378367258640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1440182378367258640==--
