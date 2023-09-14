Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32947EEAA53
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 15:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD124834F7;
	Thu, 14 Sep 2023 15:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD124834F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LF6Lk6iqgYbi; Thu, 14 Sep 2023 15:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E80837BC;
	Thu, 14 Sep 2023 15:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E80837BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9921BF584
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 15:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 198E9405B3
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 15:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 198E9405B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0tWZJrJljpi for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 15:25:49 +0000 (UTC)
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C07B401D5
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 15:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C07B401D5
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1d5dabec19cso534551fac.1
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694705148; x=1695309948;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VLUva8z15oJmJU389IenuiJu8cKHlsyPeKQ/eH7rDsM=;
 b=e+beQQ/KGD+aegeD0vgbhDxbdDnZq4hXRX42BGJ03DfgV3icXvynvMjcUxAjoNDnZZ
 a7rM54Bv/5z82KYulmsopmG2cjW8krC8lVtMoK1T/YBMqOgfyQJ4gj6eg+e6rdHLytpY
 zAhldV3NcV3jpx7XIb3eXs7iRN3pLCtSyP5KW9xVivSEon4kwDwhXCbucpJwOcYLBGWP
 nBZir1KNkqBkrIIi5dYeN7gqP6nL0UJBefeiHBAU2FVqgjoDV/hLI8udPI0kmmKvwGXn
 v4KXLMJDgsbo1PwZ9av4IDGXNkPa/bIGFOlyAJVFLptDqAw8BA8HEp0TC1IEaSTGWgS9
 ggEQ==
X-Gm-Message-State: AOJu0YxArfoGMfX6xClKsQ9+/3RX5L0MZwetCJfvvVTfU6RH35JN/qUU
 fULydvcujImvJUWX4KNvFDmSQ0Z0SUuUTFm22yg=
X-Google-Smtp-Source: AGHT+IFRWAaxWIAiE7XHnS6vv4icbRZaG19trE7OiJ25d4kLwa8M03p9uZwA6SAYBNvFd9tTztrOBRfsXAHWUSX5Pys=
X-Received: by 2002:a05:6870:d1d2:b0:1bf:5b4:4a51 with SMTP id
 b18-20020a056870d1d200b001bf05b44a51mr5335874oac.58.1694705148049; Thu, 14
 Sep 2023 08:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs78_vitxWDHo=zDMC9MJyaW7zcaQhuJn2n3AmzkvtZjA@mail.gmail.com>
 <20230914151436.4c5e8073@windsurf>
In-Reply-To: <20230914151436.4c5e8073@windsurf>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 14 Sep 2023 17:25:37 +0200
Message-ID: <CADYjeSuUpRDgDQt4PWKFF-gVxWBmb=xB4Aa_FrMsVyvbFzWnqg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694705148; x=1695309948; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VLUva8z15oJmJU389IenuiJu8cKHlsyPeKQ/eH7rDsM=;
 b=LFWj5dOWUWc5u0QkegCJZbmZCh9l0gtI1BDJ2zKhc+ekgIMO7dcLJiwp2uhsbtPeoU
 DdJKj1OFuqcz3jm+sxYZgGA11oBPtDJsXmgq6BvwQv6pqglj7APVIUuGzSbq94N/x5+b
 s5BJmFB7nOMBYzZXPEA4IsXUyU9IoHlIsPHOwnHOGWJSW/zj6kj3RUqWNKy3uNHAwtDX
 hpiPiXKi5pXHrDIohhpMG99IyPIY67gA5CaubOIRJBflm19C9EL1Nc5KO2zp15SrgZUd
 aq0IZlWfp+rXlVcuPrRzDjgqLTKfbC9OFN00eQPez7de/3ADecsbsPwtrIBYQTV+vunW
 LD0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LFWj5dOW
Subject: Re: [Buildroot] Error linking against target architecture while
 building new package
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
Content-Type: multipart/mixed; boundary="===============1053241749834081842=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1053241749834081842==
Content-Type: multipart/alternative; boundary="0000000000005941700605534aa5"

--0000000000005941700605534aa5
Content-Type: text/plain; charset="UTF-8"

Hello Thomas,

Thanks for the update.

After changing the makefile to

define IMX_NN_ACCELERATOR_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
        SDKTARGETSYSROOT=$(STAGING_DIR) \
        AQROOT= $(@D)
indeed

I am having below errors:

/usr/bin/make -j17
PATH="/.../per-package/imx-nn-accelerator/host/bin:/.../per-package/imx-nn-accelerator/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
AR="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-gcc-ar"
AS="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-as"
LD="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-ld"
NM="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-gcc-nm"
CC="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-gcc"
GCC="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-gcc"
CPP="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-cpp"
CXX="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-g++"
FC="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-gfortran"
F77="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-gfortran"
RANLIB="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-gcc-ranlib"
READELF="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-readelf"
STRIP="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-strip"
OBJCOPY="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-objcopy"
OBJDUMP="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/.../per-package/imx-nn-accelerator/host/bin/ccache
/usr/bin/gcc"
GCC_FOR_BUILD="/.../per-package/imx-nn-accelerator/host/bin/ccache
/usr/bin/gcc"
CXX_FOR_BUILD="/.../per-package/imx-nn-accelerator/host/bin/ccache
/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/.../per-package/imx-nn-accelerator/host/include"
CFLAGS_FOR_BUILD="-O2 -I/.../per-package/imx-nn-accelerator/host/include"
CXXFLAGS_FOR_BUILD="-O2 -I/.../per-package/imx-nn-accelerator/host/include"
LDFLAGS_FOR_BUILD="-L/.../per-package/imx-nn-accelerator/host/lib
-Wl,-rpath,/.../per-package/imx-nn-accelerator/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-as"
DEFAULT_LINKER="/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -O3 -g0 -D_FORTIFY_SOURCE=2" CXXFLAGS="-D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0 -D_FORTIFY_SOURCE=2"
LDFLAGS="" FCFLAGS=" -O3 -g0" FFLAGS=" -O3 -g0"
PKG_CONFIG="/.../per-package/imx-nn-accelerator/host/bin/pkg-config"
STAGING_DIR="/.../per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot"
INTLTOOL_PERL=/usr/bin/perl -C
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1
SDKTARGETSYSROOT=/.../per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot
AQROOT=/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_context.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_client_op.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_graph.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_node_attr_template.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_node.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_ops.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_daemon.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_tensor.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_version.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_rnn.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_rnn_helper.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_internal_node.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_log.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_graph_optimization.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_pre_post_process.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/utils/vsi_nn_code_generator.c
  COMPILE
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/utils/vsi_nn_binary_tree.c
vsi_nn_daemon.c:25:10: fatal error: vsi_nn_daemon.h: No such file or
directory
   25 | #include "vsi_nn_daemon.h"
      |          ^~~~~~~~~~~~~~~~~
compilation terminated.
make[4]: ***
[/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/common.target:101:
bin_r/vsi_nn_daemon.o] Error 1
make[4]: *** Waiting for unfinished jobs....
vsi_nn_ops.c:25:10: fatal error: vsi_nn_ops.h: No such file or directory
   25 | #include "vsi_nn_ops.h"
      |          ^~~~~~~~~~~~~~
compilation terminated.
make[4]: ***
[/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/common.target:101:
bin_r/vsi_nn_ops.o] Error 1
vsi_nn_node_attr_template.c:26:10: fatal error: vsi_nn_node.h: No such file
or directory
   26 | #include "vsi_nn_node.h"
      |          ^~~~~~~~~~~~~~~
compilation terminated.

However, "vsi_nn_daemon." header file is available in
/build/imx-nn-accelerator-lf-5.15.71-2.2.1/include/OVXLIB/vsi_nn_daemon.h
and
/build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/include/vsi_nn_daemon.h
Also as you can see in above log, LDFLAGS=""...

On Thu, 14 Sept 2023 at 15:14, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Thu, 14 Sep 2023 12:15:27 +0200
> Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
> > /usr/bin/make -j17 LDFLAGS="" -C
> > /.../build/imx-nn-accelerator-lf-5.15.71-2.2.1
> >
> SDKTARGETSYSROOT=/.../per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot
> > AQROOT=/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1
> >   LINK    libovxlib.so.1.1.0
> > /usr/bin/ld: skipping incompatible
> >
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVX.so
> > when searching for -lOpenVX
> > /usr/bin/ld: skipping incompatible
> >
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVX.so
> > when searching for -lOpenVX
> > /usr/bin/ld: cannot find -lOpenVX
> > /usr/bin/ld: skipping incompatible
> >
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVXU.so
> > when searching for -lOpenVXU
> > /usr/bin/ld: skipping incompatible
> >
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libOpenVXU.so
> > when searching for -lOpenVXU
> > /usr/bin/ld: cannot find -lOpenVXU
> > /usr/bin/ld: skipping incompatible
> >
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libCLC.so
> > when searching for -lCLC
> > /usr/bin/ld: skipping incompatible
> >
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libCLC.so
> > when searching for -lCLC
> > /usr/bin/ld: cannot find -lCLC
> > /usr/bin/ld: skipping incompatible
> >
> /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libVSC.so
> > when searching for -lVSC
>
> You're using the host linker here (/usr/bin/ld), which of course will
> not work to link binaries for the target. Replace:
>
> define IMX_NN_ACCELERATOR_BUILD_CMDS
>     $(MAKE) LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) \
>         SDKTARGETSYSROOT=$(STAGING_DIR) \
>         AQROOT=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
> endef
>
> By:
>
> define IMX_NN_ACCELERATOR_BUILD_CMDS
>     $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
>         SDKTARGETSYSROOT=$(STAGING_DIR) \
>         AQROOT=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
> endef
>
> TARGET_CONFIGURE_OPTS contains the definitions of CC, LD, CFLAGS,
> LDFLAGS, and a whole bunch of other variables.
>
> Also, AQROOT can use $(IMX_NN_ACCELERATOR_BUILD_DIR) directly.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000005941700605534aa5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<div><br></div><div>Thanks for the update.</d=
iv><div><br></div><div>After changing the makefile to=C2=A0</div><div><br><=
/div><div>define IMX_NN_ACCELERATOR_BUILD_CMDS<br>=C2=A0 =C2=A0 $(MAKE) $(T=
ARGET_CONFIGURE_OPTS) -C $(@D) \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 SDKTARGETSY=
SROOT=3D$(STAGING_DIR) \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 AQROOT=3D

$(@D)<br>indeed<br></div><div><br></div><div>I am having below errors:</div=
><div><br></div><div>/usr/bin/make -j17 PATH=3D&quot;/.../per-package/imx-n=
n-accelerator/host/bin:/.../per-package/imx-nn-accelerator/host/sbin:/usr/l=
ocal/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin&quot; AR=3D&quot;/..=
./per-package/imx-nn-accelerator/host/bin/aarch64-linux-gcc-ar&quot; AS=3D&=
quot;/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-as&quot; LD=
=3D&quot;/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-ld&quot=
; NM=3D&quot;/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-gcc=
-nm&quot; CC=3D&quot;/.../per-package/imx-nn-accelerator/host/bin/aarch64-l=
inux-gcc&quot; GCC=3D&quot;/.../per-package/imx-nn-accelerator/host/bin/aar=
ch64-linux-gcc&quot; CPP=3D&quot;/.../per-package/imx-nn-accelerator/host/b=
in/aarch64-linux-cpp&quot; CXX=3D&quot;/.../per-package/imx-nn-accelerator/=
host/bin/aarch64-linux-g++&quot; FC=3D&quot;/.../per-package/imx-nn-acceler=
ator/host/bin/aarch64-linux-gfortran&quot; F77=3D&quot;/.../per-package/imx=
-nn-accelerator/host/bin/aarch64-linux-gfortran&quot; RANLIB=3D&quot;/.../p=
er-package/imx-nn-accelerator/host/bin/aarch64-linux-gcc-ranlib&quot; READE=
LF=3D&quot;/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-reade=
lf&quot; STRIP=3D&quot;/.../per-package/imx-nn-accelerator/host/bin/aarch64=
-linux-strip&quot; OBJCOPY=3D&quot;/.../per-package/imx-nn-accelerator/host=
/bin/aarch64-linux-objcopy&quot; OBJDUMP=3D&quot;/.../per-package/imx-nn-ac=
celerator/host/bin/aarch64-linux-objdump&quot; AR_FOR_BUILD=3D&quot;/usr/bi=
n/ar&quot; AS_FOR_BUILD=3D&quot;/usr/bin/as&quot; CC_FOR_BUILD=3D&quot;/...=
/per-package/imx-nn-accelerator/host/bin/ccache /usr/bin/gcc&quot; GCC_FOR_=
BUILD=3D&quot;/.../per-package/imx-nn-accelerator/host/bin/ccache /usr/bin/=
gcc&quot; CXX_FOR_BUILD=3D&quot;/.../per-package/imx-nn-accelerator/host/bi=
n/ccache /usr/bin/g++&quot; LD_FOR_BUILD=3D&quot;/usr/bin/ld&quot; CPPFLAGS=
_FOR_BUILD=3D&quot;-I/.../per-package/imx-nn-accelerator/host/include&quot;=
 CFLAGS_FOR_BUILD=3D&quot;-O2 -I/.../per-package/imx-nn-accelerator/host/in=
clude&quot; CXXFLAGS_FOR_BUILD=3D&quot;-O2 -I/.../per-package/imx-nn-accele=
rator/host/include&quot; LDFLAGS_FOR_BUILD=3D&quot;-L/.../per-package/imx-n=
n-accelerator/host/lib -Wl,-rpath,/.../per-package/imx-nn-accelerator/host/=
lib&quot; FCFLAGS_FOR_BUILD=3D&quot;&quot; DEFAULT_ASSEMBLER=3D&quot;/.../p=
er-package/imx-nn-accelerator/host/bin/aarch64-linux-as&quot; DEFAULT_LINKE=
R=3D&quot;/.../per-package/imx-nn-accelerator/host/bin/aarch64-linux-ld&quo=
t; CPPFLAGS=3D&quot;-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSE=
T_BITS=3D64&quot; CFLAGS=3D&quot;-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE =
-D_FILE_OFFSET_BITS=3D64 =C2=A0-O3 -g0 -D_FORTIFY_SOURCE=3D2&quot; CXXFLAGS=
=3D&quot;-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=
 =C2=A0-O3 -g0 -D_FORTIFY_SOURCE=3D2&quot; LDFLAGS=3D&quot;&quot; FCFLAGS=
=3D&quot; -O3 -g0&quot; FFLAGS=3D&quot; -O3 -g0&quot; PKG_CONFIG=3D&quot;/.=
../per-package/imx-nn-accelerator/host/bin/pkg-config&quot; STAGING_DIR=3D&=
quot;/.../per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu/s=
ysroot&quot; INTLTOOL_PERL=3D/usr/bin/perl -C /.../build/imx-nn-accelerator=
-lf-5.15.71-2.2.1 SDKTARGETSYSROOT=3D/.../per-package/imx-nn-accelerator/ho=
st/aarch64-buildroot-linux-gnu/sysroot AQROOT=3D/.../build/imx-nn-accelerat=
or-lf-5.15.71-2.2.1<br>=C2=A0 COMPILE /.../build/imx-nn-accelerator-lf-5.15=
.71-2.2.1/ovxlib/src/vsi_nn_context.c<br>=C2=A0 COMPILE /.../build/imx-nn-a=
ccelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_client_op.c<br>=C2=A0 COMPILE=
 /.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_graph.c<b=
r>=C2=A0 COMPILE /.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/=
vsi_nn_node_attr_template.c<br>=C2=A0 COMPILE /.../build/imx-nn-accelerator=
-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_node.c<br>=C2=A0 COMPILE /.../build/imx=
-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_ops.c<br>=C2=A0 COMPILE =
/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_daemon.c<b=
r>=C2=A0 COMPILE /.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/=
vsi_nn_tensor.c<br>=C2=A0 COMPILE /.../build/imx-nn-accelerator-lf-5.15.71-=
2.2.1/ovxlib/src/vsi_nn_version.c<br>=C2=A0 COMPILE /.../build/imx-nn-accel=
erator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_rnn.c<br>=C2=A0 COMPILE /.../buil=
d/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_rnn_helper.c<br>=C2=
=A0 COMPILE /.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_n=
n_internal_node.c<br>=C2=A0 COMPILE /.../build/imx-nn-accelerator-lf-5.15.7=
1-2.2.1/ovxlib/src/vsi_nn_log.c<br>=C2=A0 COMPILE /.../build/imx-nn-acceler=
ator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_graph_optimization.c<br>=C2=A0 COMP=
ILE /.../build/imx-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/vsi_nn_pre_po=
st_process.c<br>=C2=A0 COMPILE /.../build/imx-nn-accelerator-lf-5.15.71-2.2=
.1/ovxlib/src/utils/vsi_nn_code_generator.c<br>=C2=A0 COMPILE /.../build/im=
x-nn-accelerator-lf-5.15.71-2.2.1/ovxlib/src/utils/vsi_nn_binary_tree.c<br>=
vsi_nn_daemon.c:25:10: fatal error: vsi_nn_daemon.h: No such file or direct=
ory<br>=C2=A0 =C2=A025 | #include &quot;vsi_nn_daemon.h&quot;<br>=C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~<br>compila=
tion terminated.<br>make[4]: *** [/.../build/imx-nn-accelerator-lf-5.15.71-=
2.2.1/common.target:101: bin_r/vsi_nn_daemon.o] Error 1<br>make[4]: *** Wai=
ting for unfinished jobs....<br>vsi_nn_ops.c:25:10: fatal error: vsi_nn_ops=
.h: No such file or directory<br>=C2=A0 =C2=A025 | #include &quot;vsi_nn_op=
s.h&quot;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~=
~~~~~~~~~<br>compilation terminated.<br>make[4]: *** [/.../build/imx-nn-acc=
elerator-lf-5.15.71-2.2.1/common.target:101: bin_r/vsi_nn_ops.o] Error 1<br=
>vsi_nn_node_attr_template.c:26:10: fatal error: vsi_nn_node.h: No such fil=
e or directory<br>=C2=A0 =C2=A026 | #include &quot;vsi_nn_node.h&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~<br=
>compilation terminated.<br></div><div><br></div><div>However, &quot;vsi_nn=
_daemon.&quot; header file is available in /build/imx-nn-accelerator-lf-5.1=
5.71-2.2.1/include/OVXLIB/vsi_nn_daemon.h and /build/imx-nn-accelerator-lf-=
5.15.71-2.2.1/ovxlib/include/vsi_nn_daemon.h</div><div>Also as you can see =
in above log, LDFLAGS=3D&quot;&quot;...</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 14 Sept 2023 at 15:14,=
 Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thoma=
s.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Thu, 14 Sep 2023 12:15:27 +0200<br>
Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blan=
k">hrsourabh011@gmail.com</a>&gt; wrote:<br>
<br>
&gt; /usr/bin/make -j17 LDFLAGS=3D&quot;&quot; -C<br>
&gt; /.../build/imx-nn-accelerator-lf-5.15.71-2.2.1<br>
&gt; SDKTARGETSYSROOT=3D/.../per-package/imx-nn-accelerator/host/aarch64-bu=
ildroot-linux-gnu/sysroot<br>
&gt; AQROOT=3D/.../build/imx-nn-accelerator-lf-5.15.71-2.2.1<br>
&gt;=C2=A0 =C2=A0LINK=C2=A0 =C2=A0 libovxlib.so.1.1.0<br>
&gt; /usr/bin/ld: skipping incompatible<br>
&gt; /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu=
/sysroot/usr/lib/libOpenVX.so<br>
&gt; when searching for -lOpenVX<br>
&gt; /usr/bin/ld: skipping incompatible<br>
&gt; /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu=
/sysroot/usr/lib/libOpenVX.so<br>
&gt; when searching for -lOpenVX<br>
&gt; /usr/bin/ld: cannot find -lOpenVX<br>
&gt; /usr/bin/ld: skipping incompatible<br>
&gt; /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu=
/sysroot/usr/lib/libOpenVXU.so<br>
&gt; when searching for -lOpenVXU<br>
&gt; /usr/bin/ld: skipping incompatible<br>
&gt; /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu=
/sysroot/usr/lib/libOpenVXU.so<br>
&gt; when searching for -lOpenVXU<br>
&gt; /usr/bin/ld: cannot find -lOpenVXU<br>
&gt; /usr/bin/ld: skipping incompatible<br>
&gt; /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu=
/sysroot/usr/lib/libCLC.so<br>
&gt; when searching for -lCLC<br>
&gt; /usr/bin/ld: skipping incompatible<br>
&gt; /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu=
/sysroot/usr/lib/libCLC.so<br>
&gt; when searching for -lCLC<br>
&gt; /usr/bin/ld: cannot find -lCLC<br>
&gt; /usr/bin/ld: skipping incompatible<br>
&gt; /build/per-package/imx-nn-accelerator/host/aarch64-buildroot-linux-gnu=
/sysroot/usr/lib/libVSC.so<br>
&gt; when searching for -lVSC<br>
<br>
You&#39;re using the host linker here (/usr/bin/ld), which of course will<b=
r>
not work to link binaries for the target. Replace:<br>
<br>
define IMX_NN_ACCELERATOR_BUILD_CMDS<br>
=C2=A0 =C2=A0 $(MAKE) LDFLAGS=3D&quot;$(TARGET_LDFLAGS)&quot; -C $(@D) \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SDKTARGETSYSROOT=3D$(STAGING_DIR) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AQROOT=3D$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION=
)<br>
endef<br>
<br>
By:<br>
<br>
define IMX_NN_ACCELERATOR_BUILD_CMDS<br>
=C2=A0 =C2=A0 $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SDKTARGETSYSROOT=3D$(STAGING_DIR) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AQROOT=3D$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION=
)<br>
endef<br>
<br>
TARGET_CONFIGURE_OPTS contains the definitions of CC, LD, CFLAGS,<br>
LDFLAGS, and a whole bunch of other variables.<br>
<br>
Also, AQROOT can use $(IMX_NN_ACCELERATOR_BUILD_DIR) directly.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000005941700605534aa5--

--===============1053241749834081842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1053241749834081842==--
