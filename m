Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1359C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 14:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DA5960A71;
	Mon,  6 Feb 2023 14:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA5960A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vt_MtGzmpt3G; Mon,  6 Feb 2023 14:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 256D860AF0;
	Mon,  6 Feb 2023 14:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 256D860AF0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7C071BF343
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 14:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDEB940990
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 14:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDEB940990
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KWWnU6T_W0Vt for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 14:22:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B657E4098A
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B657E4098A
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 14:22:18 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id r28so9848131oiw.3
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 06:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n5jiGGhDaf0h1co8OqEZL3wxIxzvcyWPGJlW4RQzzQU=;
 b=Uj23JDpHIy1wQ969q63diy5Qwp9wshw1eAnbVN3GfURNYuM82MauhHjkCRi9JUR9On
 6ofYrpTVzvAjotz1+O2AwdZMt4W1Ge4Nb/mdggcFEPJDMmP2VitYppAAQYFuBtx7T4Uk
 zGjtbB8v8gXew0I20URXK+BagR+iQCE8+7h/YTwrChSRcs5VyZdlBBRaYb0aBrjosKdi
 h6sdhH5/IXZjMTznmyjIOeeLdNJBD2ue8AWGcc3ibVhp3i7IV0S1yggobNk5hLX03J77
 6RtkJOytRo0XRR/66M4/KKVMio1T1HMnLrzFwsXvZwFh9lonG9M/J0BavzUupBpkAHKH
 MY4Q==
X-Gm-Message-State: AO0yUKVn5l92x0vCOlL5FMb/JqnGB3iQpht0LgaaK3v9EU5lVbfETgVX
 +Y2dL2/GdvS8P7IETf1FNBlk6MLwz2sscTpFo587VQ==
X-Google-Smtp-Source: AK7set8TcHvETevKoMAxO4wDlYRogMZDsTv+CdQc+UfZrE89FKlkHuaQtdd6zV4fSOtmL3MOpmedEl0i8RwwPmYAnPU=
X-Received: by 2002:a54:4803:0:b0:367:13d9:525e with SMTP id
 j3-20020a544803000000b0036713d9525emr1104726oij.254.1675693337686; Mon, 06
 Feb 2023 06:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20221103190446.3574423-1-jesseevg@gmail.com>
In-Reply-To: <20221103190446.3574423-1-jesseevg@gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 6 Feb 2023 15:21:41 +0100
Message-ID: <CA+_SqVaLZYfThLHpw0anDPKRTdLmTA+j+h6wjAKGYg-OUoNjvw@mail.gmail.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n5jiGGhDaf0h1co8OqEZL3wxIxzvcyWPGJlW4RQzzQU=;
 b=r31hKK1hWVFRWxzklYmkJkAW908okGzZIKM9ZNIL3ziftN8qt5+ZNHuUDBpI69+sgi
 bGyovVdSh8EtO6E+ZdX1dA7kdLOPaD3QrWhnALRvhD4tOYWfFhi8nHoj8Fg5rRbvlM2c
 iy0VhnPyPmqFYY1kVfDg+/1u7GkDHQLW7VMR8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=r31hKK1h
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6: Add qmake functionality
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8363157123556955356=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8363157123556955356==
Content-Type: multipart/alternative; boundary="000000000000254cb005f408c249"

--000000000000254cb005f408c249
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 3, 2022 at 8:05 PM Jesse Van Gavere <jesseevg@gmail.com> wrote:

> The qmake functionality had been missing due to the new host/target
> build requirement, to get it working the main parts of the qt5 qmake
> has been kept, we're still making our own device spec which we use to
> run qmake with along with passing some additional device options for our
> flags/cross-compiler the biggest difference is that where previously
> qt.conf was used to fixup per-paths builds, this is now always
> created with changed contents so qmake looks at the correct target
> directories.
>
> A big thanks to Angelo Compagnucci for the encouragement and testing.
>
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>

> ---
>  package/qt6/qt6.mk                  | 12 ++++++++++
>  package/qt6/qt6base/qmake.conf.in   | 36 +++++++++++++++++++++++++++++
>  package/qt6/qt6base/qplatformdefs.h |  1 +
>  package/qt6/qt6base/qt.conf.in      |  7 ++++++
>  package/qt6/qt6base/qt6base.mk      | 18 +++++++++++++++
>  5 files changed, 74 insertions(+)
>  create mode 100644 package/qt6/qt6base/qmake.conf.in
>  create mode 100644 package/qt6/qt6base/qplatformdefs.h
>  create mode 100644 package/qt6/qt6base/qt.conf.in
>
> diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
> index 575b2f826c..bd8fb0ab51 100644
> --- a/package/qt6/qt6.mk
> +++ b/package/qt6/qt6.mk
> @@ -10,3 +10,15 @@ QT6_SOURCE_TARBALL_PREFIX = everywhere-src
>  QT6_SITE =
> https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
>
>  include $(sort $(wildcard package/qt6/*/*.mk))
> +
> +# The file "qt.conf" can be used to override the hard-coded paths that are
> +# compiled into the Qt library. We need it to make "qmake" relocatable due
> +# to the host/target build and tweak the per-package install pathes
> +define QT6_INSTALL_QT_CONF
> +       rm -f $(HOST_DIR)/bin/qt.conf
> +       sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|"
> \
> +               $(QT6BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
> +endef
> +
> +# Variable for other Qt applications to use
> +QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
> diff --git a/package/qt6/qt6base/qmake.conf.in b/package/qt6/qt6base/
> qmake.conf.in
> new file mode 100644
> index 0000000000..ebb8497d2d
> --- /dev/null
> +++ b/package/qt6/qt6base/qmake.conf.in
> @@ -0,0 +1,36 @@
> +# Qt6 has a mechanism to support "device" profiles, so that people can
> +# specify the compiler, compiler flags and so on for a specific device.
> +
> +# We leverage this mechanism in the Buildroot packaging of qt6 to
> +# simplify cross-compilation: we have our own "device" definition, which
> +# allows us to easily pass the cross-compiler paths and flags from our
> +# qt6.mk.
> +
> +include(../common/linux_device_pre.conf)
> +
> +# modifications to g++-unix.conf
> +QMAKE_CC                = $${CROSS_COMPILE}gcc
> +QMAKE_CXX               = $${CROSS_COMPILE}g++
> +QMAKE_LINK             = $${CROSS_COMPILE}g++
> +
> +# modifications to gcc-base.conf
> +QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
> +QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
> +# Remove all optimisation flags, we really only want our own.
> +QMAKE_CFLAGS_OPTIMIZE       =
> +QMAKE_CFLAGS_OPTIMIZE_DEBUG =
> +QMAKE_CFLAGS_OPTIMIZE_FULL  =
> +QMAKE_CFLAGS_OPTIMIZE_SIZE  =
> +QMAKE_CFLAGS_DEBUG =
> +QMAKE_CXXFLAGS_DEBUG =
> +QMAKE_CFLAGS_RELEASE =
> +QMAKE_CXXFLAGS_RELEASE =
> +CONFIG                 += nostrip
> +
> +QMAKE_LIBS             += -lrt -lpthread -ldl
> +QMAKE_CFLAGS_ISYSTEM   =
> +
> +@EGLFS_DEVICE@
> +
> +include(../common/linux_device_post.conf)
> +load(qt_config)
> diff --git a/package/qt6/qt6base/qplatformdefs.h
> b/package/qt6/qt6base/qplatformdefs.h
> new file mode 100644
> index 0000000000..99e9a27923
> --- /dev/null
> +++ b/package/qt6/qt6base/qplatformdefs.h
> @@ -0,0 +1 @@
> +#include "../../linux-g++/qplatformdefs.h"
> diff --git a/package/qt6/qt6base/qt.conf.in b/package/qt6/qt6base/
> qt.conf.in
> new file mode 100644
> index 0000000000..4842bcb462
> --- /dev/null
> +++ b/package/qt6/qt6base/qt.conf.in
> @@ -0,0 +1,7 @@
> +[Paths]
> +Prefix=/usr
> +HostPrefix=@@HOST_DIR@@
> +HostData=../target/usr
> +Sysroot=@@STAGING_DIR@@
> +SysrootifyPrefix=true
> +TargetSpec=devices/linux-buildroot-g++
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/
> qt6base.mk
> index b7ee6037f3..9e2f884e94 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -35,6 +35,9 @@ QT6BASE_CONF_OPTS = \
>         -DFEATURE_system_zlib=ON \
>         -DFEATURE_system_libb2=ON
>
> +QT6BASE_CFLAGS = $(TARGET_CFLAGS)
> +QT6BASE_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
>  # x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
>  # is not clear yet how it maps to all the avx512* options of Qt, so we
>  # for now keeps them disabled.
> @@ -215,5 +218,20 @@ else
>  QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
>  endif
>
> +define QT6BASE_MAKE_BR_SPEC
> +       mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
> +       sed 's/@EGLFS_DEVICE@/$(QT6BASE_EGLFS_DEVICE)/g' \
> +               $(QT6BASE_PKGDIR)/qmake.conf.in > \
> +               $(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> +       $(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatformdefs.h \
> +               $(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
> +endef
> +
> +QT6BASE_CONF_OPTS +=
> -DQT_QMAKE_DEVICE_OPTIONS=CROSS_COMPILE="$(TARGET_CROSS)";BR_COMPILER_CFLAGS="$(QT6BASE_CFLAGS)";BR_COMPILER_CXXFLAGS="$(QT6BASE_CXX_FLAGS)"
> +
> +QT6BASE_PRE_CONFIGURE_HOOKS += QT6BASE_MAKE_BR_SPEC
> +
> +QT6BASE_POST_INSTALL_STAGING_HOOKS += QT6_INSTALL_QT_CONF
> +
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
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

--000000000000254cb005f408c249
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 3, 2022 at 8:05 PM Jesse =
Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com">jesseevg@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
qmake functionality had been missing due to the new host/target<br>
build requirement, to get it working the main parts of the qt5 qmake<br>
has been kept, we&#39;re still making our own device spec which we use to<b=
r>
run qmake with along with passing some additional device options for our<br=
>
flags/cross-compiler the biggest difference is that where previously<br>
qt.conf was used to fixup per-paths builds, this is now always<br>
created with changed contents so qmake looks at the correct target<br>
directories.<br>
<br>
A big thanks to Angelo Compagnucci for the encouragement and testing.<br>
<br>
Signed-off-by: Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com" t=
arget=3D"_blank">jesseevg@gmail.com</a>&gt;<br></blockquote><div>Tested-by:=
 Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com">ange=
lo@amarulasolutions.com</a>&gt; <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
---<br>
=C2=A0package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 12 ++++++++++<br>
=C2=A0package/qt6/qt6base/<a href=3D"http://qmake.conf.in" rel=3D"noreferre=
r" target=3D"_blank">qmake.conf.in</a>=C2=A0 =C2=A0| 36 +++++++++++++++++++=
++++++++++<br>
=C2=A0package/qt6/qt6base/qplatformdefs.h |=C2=A0 1 +<br>
=C2=A0package/qt6/qt6base/<a href=3D"http://qt.conf.in" rel=3D"noreferrer" =
target=3D"_blank">qt.conf.in</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++++++<br>
=C2=A0package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a>=C2=A0 =C2=A0 =C2=A0 | 18 +++++++++++++++<b=
r>
=C2=A05 files changed, 74 insertions(+)<br>
=C2=A0create mode 100644 package/qt6/qt6base/<a href=3D"http://qmake.conf.i=
n" rel=3D"noreferrer" target=3D"_blank">qmake.conf.in</a><br>
=C2=A0create mode 100644 package/qt6/qt6base/qplatformdefs.h<br>
=C2=A0create mode 100644 package/qt6/qt6base/<a href=3D"http://qt.conf.in" =
rel=3D"noreferrer" target=3D"_blank">qt.conf.in</a><br>
<br>
diff --git a/package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" targe=
t=3D"_blank">qt6.mk</a> b/package/qt6/<a href=3D"http://qt6.mk" rel=3D"nore=
ferrer" target=3D"_blank">qt6.mk</a><br>
index 575b2f826c..bd8fb0ab51 100644<br>
--- a/package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a><br>
+++ b/package/qt6/<a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_b=
lank">qt6.mk</a><br>
@@ -10,3 +10,15 @@ QT6_SOURCE_TARBALL_PREFIX =3D everywhere-src<br>
=C2=A0QT6_SITE =3D <a href=3D"https://download.qt.io/archive/qt/$(QT6_VERSI=
ON_MAJOR)/$(QT6_VERSION)/submodules" rel=3D"noreferrer" target=3D"_blank">h=
ttps://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submod=
ules</a><br>
<br>
=C2=A0include $(sort $(wildcard package/qt6/*/*.mk))<br>
+<br>
+# The file &quot;qt.conf&quot; can be used to override the hard-coded path=
s that are<br>
+# compiled into the Qt library. We need it to make &quot;qmake&quot; reloc=
atable due<br>
+# to the host/target build and tweak the per-package install pathes<br>
+define QT6_INSTALL_QT_CONF<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $(HOST_DIR)/bin/qt.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &quot;s|@@HOST_DIR@@|$(HOST_DIR)|&quot; =
-e &quot;s|@@STAGING_DIR@@|$(STAGING_DIR)|&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(QT6BASE_PKGDIR)/<=
a href=3D"http://qt.conf.in" rel=3D"noreferrer" target=3D"_blank">qt.conf.i=
n</a> &gt; $(HOST_DIR)/bin/qt.conf<br>
+endef<br>
+<br>
+# Variable for other Qt applications to use<br>
+QT6_QMAKE =3D $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++<br>
diff --git a/package/qt6/qt6base/<a href=3D"http://qmake.conf.in" rel=3D"no=
referrer" target=3D"_blank">qmake.conf.in</a> b/package/qt6/qt6base/<a href=
=3D"http://qmake.conf.in" rel=3D"noreferrer" target=3D"_blank">qmake.conf.i=
n</a><br>
new file mode 100644<br>
index 0000000000..ebb8497d2d<br>
--- /dev/null<br>
+++ b/package/qt6/qt6base/<a href=3D"http://qmake.conf.in" rel=3D"noreferre=
r" target=3D"_blank">qmake.conf.in</a><br>
@@ -0,0 +1,36 @@<br>
+# Qt6 has a mechanism to support &quot;device&quot; profiles, so that peop=
le can<br>
+# specify the compiler, compiler flags and so on for a specific device.<br=
>
+<br>
+# We leverage this mechanism in the Buildroot packaging of qt6 to<br>
+# simplify cross-compilation: we have our own &quot;device&quot; definitio=
n, which<br>
+# allows us to easily pass the cross-compiler paths and flags from our<br>
+# <a href=3D"http://qt6.mk" rel=3D"noreferrer" target=3D"_blank">qt6.mk</a=
>.<br>
+<br>
+include(../common/linux_device_pre.conf)<br>
+<br>
+# modifications to g++-unix.conf<br>
+QMAKE_CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D $${CRO=
SS_COMPILE}gcc<br>
+QMAKE_CXX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $${CRO=
SS_COMPILE}g++<br>
+QMAKE_LINK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D $${CROSS_COM=
PILE}g++<br>
+<br>
+# modifications to gcc-base.conf<br>
+QMAKE_CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D $${BR_COMPILER_C=
FLAGS}<br>
+QMAKE_CXXFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D $${BR_COMPILER_CXXFLA=
GS}<br>
+# Remove all optimisation flags, we really only want our own.<br>
+QMAKE_CFLAGS_OPTIMIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
+QMAKE_CFLAGS_OPTIMIZE_DEBUG =3D<br>
+QMAKE_CFLAGS_OPTIMIZE_FULL=C2=A0 =3D<br>
+QMAKE_CFLAGS_OPTIMIZE_SIZE=C2=A0 =3D<br>
+QMAKE_CFLAGS_DEBUG =3D<br>
+QMAKE_CXXFLAGS_DEBUG =3D<br>
+QMAKE_CFLAGS_RELEASE =3D<br>
+QMAKE_CXXFLAGS_RELEASE =3D<br>
+CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D n=
ostrip<br>
+<br>
+QMAKE_LIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D -lrt -lpthr=
ead -ldl<br>
+QMAKE_CFLAGS_ISYSTEM=C2=A0 =C2=A0=3D<br>
+<br>
+@EGLFS_DEVICE@<br>
+<br>
+include(../common/linux_device_post.conf)<br>
+load(qt_config)<br>
diff --git a/package/qt6/qt6base/qplatformdefs.h b/package/qt6/qt6base/qpla=
tformdefs.h<br>
new file mode 100644<br>
index 0000000000..99e9a27923<br>
--- /dev/null<br>
+++ b/package/qt6/qt6base/qplatformdefs.h<br>
@@ -0,0 +1 @@<br>
+#include &quot;../../linux-g++/qplatformdefs.h&quot;<br>
diff --git a/package/qt6/qt6base/<a href=3D"http://qt.conf.in" rel=3D"noref=
errer" target=3D"_blank">qt.conf.in</a> b/package/qt6/qt6base/<a href=3D"ht=
tp://qt.conf.in" rel=3D"noreferrer" target=3D"_blank">qt.conf.in</a><br>
new file mode 100644<br>
index 0000000000..4842bcb462<br>
--- /dev/null<br>
+++ b/package/qt6/qt6base/<a href=3D"http://qt.conf.in" rel=3D"noreferrer" =
target=3D"_blank">qt.conf.in</a><br>
@@ -0,0 +1,7 @@<br>
+[Paths]<br>
+Prefix=3D/usr<br>
+HostPrefix=3D@@HOST_DIR@@<br>
+HostData=3D../target/usr<br>
+Sysroot=3D@@STAGING_DIR@@<br>
+SysrootifyPrefix=3Dtrue<br>
+TargetSpec=3Ddevices/linux-buildroot-g++<br>
diff --git a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noref=
errer" target=3D"_blank">qt6base.mk</a> b/package/qt6/qt6base/<a href=3D"ht=
tp://qt6base.mk" rel=3D"noreferrer" target=3D"_blank">qt6base.mk</a><br>
index b7ee6037f3..9e2f884e94 100644<br>
--- a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
+++ b/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
@@ -35,6 +35,9 @@ QT6BASE_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_system_zlib=3DON \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_system_libb2=3DON<br>
<br>
+QT6BASE_CFLAGS =3D $(TARGET_CFLAGS)<br>
+QT6BASE_CXXFLAGS =3D $(TARGET_CXXFLAGS)<br>
+<br>
=C2=A0# x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, i=
t<br>
=C2=A0# is not clear yet how it maps to all the avx512* options of Qt, so w=
e<br>
=C2=A0# for now keeps them disabled.<br>
@@ -215,5 +218,20 @@ else<br>
=C2=A0QT6BASE_CONF_OPTS +=3D -DFEATURE_zstd=3DOFF<br>
=C2=A0endif<br>
<br>
+define QT6BASE_MAKE_BR_SPEC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(@D)/mkspecs/devices/linux-buildroot-=
g++/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s/@EGLFS_DEVICE@/$(QT6BASE_EGLFS_DEVIC=
E)/g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(QT6BASE_PKGDIR)/<=
a href=3D"http://qmake.conf.in" rel=3D"noreferrer" target=3D"_blank">qmake.=
conf.in</a> &gt; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/mkspecs/devic=
es/linux-buildroot-g++/qmake.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0644 -D $(QT6BASE_PKGDIR)/qplatfo=
rmdefs.h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/mkspecs/devic=
es/linux-buildroot-g++/qplatformdefs.h<br>
+endef<br>
+<br>
+QT6BASE_CONF_OPTS +=3D -DQT_QMAKE_DEVICE_OPTIONS=3DCROSS_COMPILE=3D&quot;$=
(TARGET_CROSS)&quot;;BR_COMPILER_CFLAGS=3D&quot;$(QT6BASE_CFLAGS)&quot;;BR_=
COMPILER_CXXFLAGS=3D&quot;$(QT6BASE_CXX_FLAGS)&quot;<br>
+<br>
+QT6BASE_PRE_CONFIGURE_HOOKS +=3D QT6BASE_MAKE_BR_SPEC<br>
+<br>
+QT6BASE_POST_INSTALL_STAGING_HOOKS +=3D QT6_INSTALL_QT_CONF<br>
+<br>
=C2=A0$(eval $(cmake-package))<br>
=C2=A0$(eval $(host-cmake-package))<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
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

--000000000000254cb005f408c249--

--===============8363157123556955356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8363157123556955356==--
