Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101BFC47DDB
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 18:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F14A605A3;
	Sun, 28 Jan 2024 18:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F14A605A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPjttoQcJ8VS; Sun, 28 Jan 2024 18:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21D94605AC;
	Sun, 28 Jan 2024 18:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D94605AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 891061BF57B
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 18:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 598BF821A9
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 18:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598BF821A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6JPxAUHTlY7 for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 18:58:14 +0000 (UTC)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C5FF81E6F
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 18:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C5FF81E6F
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5ffe7e7b7b3so18614937b3.3
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 10:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706468293; x=1707073093;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YPa2zJdI63CwL9fH4HzpznV1xZTfMPUmoita4rk3FqE=;
 b=oTO64v27ryAI6Ca9AZ+EnfScth6QB8kMAfB7KxtjPfltiZ5ARtOog/LBHHOAWWM+9o
 aA+znCb0wNT+6Rvz96KHl1+j9hauk05ORdQKmmH5KCG9FHgOzBs7KUGHLTHmI/6SqTbB
 +3vvgDQFTpYIPSI9vBcBepKM2Olhm4GQvbiPeQaUyejA6Hxi0UaynS/AD1bahcbhLt5q
 Ow5lrnUrwckAYv2ab42HDst+/ZlaLYtko0UqspnpD6y/6LIkscJuHIL2erG+W9iWn2ix
 3Y71SyKSyeAd+T1AQIlzuSOFfikBVfA6LXpGVLS/gmLvb/jDPw3tsgQldpiZPNkpwr7z
 ju7g==
X-Gm-Message-State: AOJu0YxMiiknwCRAXhw7gLn/vajj0jR7oBPkqV20je8AdTF4Y63uqA+d
 VkkW4j93u4A8j3Z7F5GB4ya3BDjfd3TaYkvAgBJcyqYLcdPcst2vREDWoeJ/s2HbmqXILVsKRDP
 VjfGGhLamHTfFR81jgPuwwMS4gQUILjCK
X-Google-Smtp-Source: AGHT+IGsX4PX4b1BrdIsxVWyfjbSjOmEFIp3VL/vzD+tCZ4CUt8/XIXZTpWrWlkWFHo+IPce8VH/Y7dWzdFohCh5HK8=
X-Received: by 2002:a05:6902:2783:b0:dc2:36b5:8965 with SMTP id
 eb3-20020a056902278300b00dc236b58965mr1567762ybb.67.1706468293090; Sun, 28
 Jan 2024 10:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20240128183024.3322187-1-abiliojr@gmail.com>
In-Reply-To: <20240128183024.3322187-1-abiliojr@gmail.com>
From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 29 Jan 2024 07:58:00 +1300
Message-ID: <CAFOYHZAFjAyu38jik9KSX8CfVdjRHJE4yPdgSC6tNY=C3UAnqA@mail.gmail.com>
To: Abilio Marques <abiliojr@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706468293; x=1707073093; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YPa2zJdI63CwL9fH4HzpznV1xZTfMPUmoita4rk3FqE=;
 b=ObKsIKu4R1SlP92/ma+q0VQ1qeoDsm87LE5dZktoXDO9buL5DO26+O7zgSwirCAGKo
 Vwhynaor5KO9X/gKolBOZm/qYweVdvv1Ue5EZOZ0wf/TTakkR6ZR04cLuWR2AdqroKWc
 c42K1+dOO/Exf8w+Vsswo8dgNMx49TTdQvwBeGus5ErU2m1j4FQwWBe9LnZ9s6Jt/A5Z
 Vn0GlySHC/ddQSQljo5QzFUX6XT/+LpSRq/u/725682YTN7/BtIKkcXwqCcJ+2yiIe/2
 1LkPbsswu4koA8ad8UELnAZ0VorRLtPw+KgYN4gXlLvMq+DHxIpz+iWvlPnVqvTUzMwD
 iWJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ObKsIKu4
Subject: Re: [Buildroot] [PATCH] package/micropython: make use of recent
 micropython-lib
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0806854549046068173=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0806854549046068173==
Content-Type: multipart/alternative; boundary="0000000000006e21ff0610061c15"

--0000000000006e21ff0610061c15
Content-Type: text/plain; charset="UTF-8"

Hi Abilio,

On Mon, 29 Jan 2024, 7:30 am Abilio Marques, <abiliojr@gmail.com> wrote:

> Until now, micropython-lib was a package that installed v1.9.3,
> which is more than 6 years old. This was acceptable since micropython
> never made any other official release of the library until v1.20.
>
> Meanwhile, the libraries underwent a reorganization, and they are now
> available in a directory structure that cannot be copied directly into
> the target. This is my theory on why v1.9.3 is still present in the
> current day buildroot (which comes with micropython v1.22).
>
> This commit introduces an auxiliary script to collect those libraries
> and reorder them into a structure that can then be copied into
> /usr/lib/micropython. The script utilizes a module from the tools
> directory of the micropython repo.
>
> As part of the changes made by the micropython project, the libraries
> are now released together with the interpreter. They are cloned as a
> submodule into the lib/micropython-lib directory.
>
> These are the 2 main reasons why the old buildroot micropython-lib
> package is being removed.
>
> With this commit, micropython-lib is installed (optionally) as part
> of micropython. The original config variable name was retained for
> backwards compatibility.
>
> This commit also ensures that the libraries in micropython-lib will
> be updated together with newer versions of micropython.
>
> Signed-off-by: Abilio Marques <abiliojr@gmail.com>
>

Thanks for looking at this. Indeed I knew about the reorganization of
micropython-lib but hadn't had time to really look in to adapting buildroot
to it.

One thought I had was to build micropython as a host package and use that
to install the libs into the target rootfs.

I haven't had a chance to actually look at your patch in detail. I am a
little worried that we'll be dependent on some internal detail of how
things are currently laid out in micropython-lib. But this is certainly
better than anything I've been able to come up with to date.

---
>  DEVELOPERS                                    |  1 -
>  package/Config.in                             |  1 -
>  package/micropython-lib/Config.in             |  8 --
>  package/micropython-lib/micropython-lib.hash  |  3 -
>  package/micropython-lib/micropython-lib.mk    | 18 ----
>  package/micropython/Config.in                 | 10 +++
>  .../micropython/collect_micropython_lib.py    | 90 +++++++++++++++++++
>  package/micropython/micropython.mk            | 12 +++
>  8 files changed, 112 insertions(+), 31 deletions(-)
>  delete mode 100644 package/micropython-lib/Config.in
>  delete mode 100644 package/micropython-lib/micropython-lib.hash
>  delete mode 100644 package/micropython-lib/micropython-lib.mk
>  create mode 100755 package/micropython/collect_micropython_lib.py
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9528837dd0..cc9bc5b5cc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -572,7 +572,6 @@ F:  package/coremark/
>  F:     package/coremark-pro/
>  F:     package/gstreamer1/gst1-shark/
>  F:     package/micropython/
> -F:     package/micropython-lib/
>  F:     package/syslog-ng/
>
>  N:     Christian Kellermann <christian.kellermann@solectrix.de>
> diff --git a/package/Config.in b/package/Config.in
> index 5b8b15fa54..426bd7d090 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -798,7 +798,6 @@ menu "Lua libraries/modules"
>  endmenu
>  endif
>         source "package/micropython/Config.in"
> -       source "package/micropython-lib/Config.in"
>         source "package/moarvm/Config.in"
>         source "package/mono/Config.in"
>  if BR2_PACKAGE_MONO
> diff --git a/package/micropython-lib/Config.in
> b/package/micropython-lib/Config.in
> deleted file mode 100644
> index 76557b220b..0000000000
> --- a/package/micropython-lib/Config.in
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -config BR2_PACKAGE_MICROPYTHON_LIB
> -       bool "micropython-lib"
> -       depends on BR2_PACKAGE_MICROPYTHON
> -       select BR2_PACKAGE_PCRE # runtime
> -       help
> -         Core Python libraries ported to MicroPython.
> -
> -         http://micropython.org
> diff --git a/package/micropython-lib/micropython-lib.hash
> b/package/micropython-lib/micropython-lib.hash
> deleted file mode 100644
> index cbdda23844..0000000000
> --- a/package/micropython-lib/micropython-lib.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally computed
> -sha256  66e15380eb109613263beb6825b8eecb9191088270c1a59e8c7d922dd57183c7
> micropython-lib-1.9.3.tar.gz
> -sha256  baed4196a4310c576c2010f0a49f987a49e63856df7cd45af11cb3571df4bf74
> LICENSE
> diff --git a/package/micropython-lib/micropython-lib.mk
> b/package/micropython-lib/micropython-lib.mk
> deleted file mode 100644
> index 78ac0d3b35..0000000000
> --- a/package/micropython-lib/micropython-lib.mk
> +++ /dev/null
> @@ -1,18 +0,0 @@
>
> -################################################################################
> -#
> -# micropython-lib
> -#
>
> -################################################################################
> -
> -MICROPYTHON_LIB_VERSION = 1.9.3
> -MICROPYTHON_LIB_SITE = $(call
> github,micropython,micropython-lib,v$(MICROPYTHON_LIB_VERSION))
> -MICROPYTHON_LIB_LICENSE = Python-2.0 (some modules), MIT (everything else)
> -MICROPYTHON_LIB_LICENSE_FILES = LICENSE
> -
> -define MICROPYTHON_LIB_INSTALL_TARGET_CMDS
> -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -               PREFIX=$(TARGET_DIR)/usr/lib/micropython \
> -               install
> -endef
> -
> -$(eval $(generic-package))
> diff --git a/package/micropython/Config.in b/package/micropython/Config.in
> index 30161c8b70..2c2ae7a4df 100644
> --- a/package/micropython/Config.in
> +++ b/package/micropython/Config.in
> @@ -9,5 +9,15 @@ config BR2_PACKAGE_MICROPYTHON
>
>           http://micropython.org
>
> +config BR2_PACKAGE_MICROPYTHON_LIB
> +       bool "micropython-lib"
> +       default y
> +       depends on BR2_PACKAGE_MICROPYTHON
> +       select BR2_PACKAGE_PCRE # runtime
> +       help
> +         Core Python libraries ported to MicroPython.
> +
> +         http://micropython.org
> +
>  comment "micropython needs a toolchain w/ threads, dynamic library"
>         depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/micropython/collect_micropython_lib.py
> b/package/micropython/collect_micropython_lib.py
> new file mode 100755
> index 0000000000..778a1c4c7d
> --- /dev/null
> +++ b/package/micropython/collect_micropython_lib.py
> @@ -0,0 +1,90 @@
> +#!/usr/bin/env python3
> +
> +"""
> +Sometime after v1.9.3, micropython-lib's directory structure was cleaned
> up and
> +enhanced with manifest files.
> +
> +Though cleaner, it means it cannot be directly copied into the target.
> +This script is during build process to perform that conversion.
> +
> +It makes use of manifestfile.py, which is normally located in
> micropython's
> +tool directory.
> +
> +It also depends on the micropython-lib that is cloned in
> lib/micropython-lib
> +during build.
> +"""
> +
> +import argparse
> +import importlib
> +import os
> +import shutil
> +import sys
> +
> +
> +def get_library_name_type(manifest_path: str) -> tuple[str, bool]:
> +    split = manifest_path.split("/")
> +    return (split[-2], "unix-ffi" in split)  # -1: "manifest.py", -2:
> library name
> +
> +
> +def get_all_libraries(mpy_lib_dir: str):
> +    # reuse manifestfile module capabilities to scan the micropython-lib
> directory
> +
> +    collected_list = manifestfile.ManifestFile(
> +        manifestfile.MODE_FREEZE, {"MPY_LIB_DIR": mpy_lib_dir}
> +    )
> +    collected_list.freeze(mpy_lib_dir)
> +
> +    for file in collected_list.files():
> +        if file.target_path.endswith("manifest.py"):
> +            yield get_library_name_type(file.full_path)
> +
> +
> +def copy_file(src: str, target: str, destination: str):
> +    s = target.split("/")
> +    s.pop()
> +    d = f"{destination}/{'/'.join(s)}"
> +    if not os.path.exists(d):
> +        os.makedirs(d)
> +    shutil.copy(src, f"{destination}/{target}")
> +
> +
> +def copy_libraries(manifest, destination: str):
> +    for f in manifest.files():
> +        copy_file(f.full_path, f.target_path, destination)
> +
> +
> +def process_cmdline_args():
> +    parser = argparse.ArgumentParser(
> +        description="Prepare micropython-lib to be installed"
> +    )
> +    parser.add_argument("micropython", help="Path to micropython source
> directory")
> +    parser.add_argument("destination", help="Destination directory")
> +
> +    args = parser.parse_args()
> +    return os.path.abspath(args.micropython),
> os.path.abspath(args.destination)
> +
> +
> +def load_manifestfile_module(micropython_dir: str):
> +    global manifestfile
> +    sys.path.append(f"{micropython_dir}/tools")
> +    manifestfile = importlib.import_module("manifestfile")
> +
> +
> +def main():
> +    micropython_dir, destination_dir = process_cmdline_args()
> +    mpy_lib_dir = f"{micropython_dir}/lib/micropython-lib"
> +
> +    # load manifest file after knowing where it is
> +    load_manifestfile_module(micropython_dir)
> +
> +    manifest = manifestfile.ManifestFile(
> +        manifestfile.MODE_FREEZE, {"MPY_LIB_DIR": mpy_lib_dir}
> +    )
> +
> +    for library, is_ffi in get_all_libraries(mpy_lib_dir):
> +        manifest.require(library, unix_ffi=is_ffi)
> +
> +    copy_libraries(manifest, destination_dir)
> +
> +
> +main()
> diff --git a/package/micropython/micropython.mk b/package/micropython/
> micropython.mk
> index 37c148da94..a9757e266c 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -47,6 +47,8 @@ define MICROPYTHON_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
>                 $(MICROPYTHON_MAKE_OPTS)
> +       $(EXTRA_ENV) package/micropython/collect_micropython_lib.py \
> +               $(@D) $(@D)/.built_pylib
>  endef
>
>  define MICROPYTHON_INSTALL_TARGET_CMDS
> @@ -57,4 +59,14 @@ define MICROPYTHON_INSTALL_TARGET_CMDS
>                 install
>  endef
>
> +define MICROPYTHON_INSTALL_LIBS
> +       $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/micropython
> +       cp -a $(@D)/.built_pylib/* $(TARGET_DIR)/usr/lib/micropython
> +endef
> +
> +ifeq ($(BR2_PACKAGE_MICROPYTHON_LIB),y)
> +MICROPYTHON_POST_INSTALL_TARGET_HOOKS += MICROPYTHON_INSTALL_LIBS
> +endif
> +
> +
>  $(eval $(generic-package))
> --
> 2.43.0
>
>

--0000000000006e21ff0610061c15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Abilio,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, 29 Jan 2024, 7:30 am Abilio Marques,=
 &lt;<a href=3D"mailto:abiliojr@gmail.com">abiliojr@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Until now, micropython-lib was a =
package that installed v1.9.3,<br>
which is more than 6 years old. This was acceptable since micropython<br>
never made any other official release of the library until v1.20.<br>
<br>
Meanwhile, the libraries underwent a reorganization, and they are now<br>
available in a directory structure that cannot be copied directly into<br>
the target. This is my theory on why v1.9.3 is still present in the<br>
current day buildroot (which comes with micropython v1.22).<br>
<br>
This commit introduces an auxiliary script to collect those libraries<br>
and reorder them into a structure that can then be copied into<br>
/usr/lib/micropython. The script utilizes a module from the tools<br>
directory of the micropython repo.<br>
<br>
As part of the changes made by the micropython project, the libraries<br>
are now released together with the interpreter. They are cloned as a<br>
submodule into the lib/micropython-lib directory.<br>
<br>
These are the 2 main reasons why the old buildroot micropython-lib<br>
package is being removed.<br>
<br>
With this commit, micropython-lib is installed (optionally) as part<br>
of micropython. The original config variable name was retained for<br>
backwards compatibility.<br>
<br>
This commit also ensures that the libraries in micropython-lib will<br>
be updated together with newer versions of micropython.<br>
<br>
Signed-off-by: Abilio Marques &lt;<a href=3D"mailto:abiliojr@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">abiliojr@gmail.com</a>&gt;<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for look=
ing at this. Indeed I knew about the reorganization of micropython-lib but =
hadn&#39;t had time to really look in to adapting buildroot to it.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">One thought I had was to build m=
icropython as a host package and use that to install the libs into the targ=
et rootfs.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I haven&#39;t=
 had a chance to actually look at your patch in detail. I am a little worri=
ed that we&#39;ll be dependent on some internal detail of how things are cu=
rrently laid out in micropython-lib. But this is certainly better than anyt=
hing I&#39;ve been able to come up with to date.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 -<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A0package/micropython-lib/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 --<br>
=C2=A0package/micropython-lib/micropython-lib.hash=C2=A0 |=C2=A0 3 -<br>
=C2=A0package/micropython-lib/<a href=3D"http://micropython-lib.mk" rel=3D"=
noreferrer noreferrer" target=3D"_blank">micropython-lib.mk</a>=C2=A0 =C2=
=A0 | 18 ----<br>
=C2=A0package/micropython/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++<br>
=C2=A0.../micropython/collect_micropython_lib.py=C2=A0 =C2=A0 | 90 ++++++++=
+++++++++++<br>
=C2=A0package/micropython/<a href=3D"http://micropython.mk" rel=3D"noreferr=
er noreferrer" target=3D"_blank">micropython.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 12 +++<br>
=C2=A08 files changed, 112 insertions(+), 31 deletions(-)<br>
=C2=A0delete mode 100644 package/micropython-lib/Config.in<br>
=C2=A0delete mode 100644 package/micropython-lib/micropython-lib.hash<br>
=C2=A0delete mode 100644 package/micropython-lib/<a href=3D"http://micropyt=
hon-lib.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">micropython-lib=
.mk</a><br>
=C2=A0create mode 100755 package/micropython/collect_micropython_lib.py<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 9528837dd0..cc9bc5b5cc 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -572,7 +572,6 @@ F:=C2=A0 package/coremark/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/coremark-pro/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/gstreamer1/gst1-shark/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/micropython/<br>
-F:=C2=A0 =C2=A0 =C2=A0package/micropython-lib/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/syslog-ng/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Christian Kellermann &lt;<a href=3D"mailto:chri=
stian.kellermann@solectrix.de" target=3D"_blank" rel=3D"noreferrer">christi=
an.kellermann@solectrix.de</a>&gt;<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 5b8b15fa54..426bd7d090 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -798,7 +798,6 @@ menu &quot;Lua libraries/modules&quot;<br>
=C2=A0endmenu<br>
=C2=A0endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/micropython/Config.in&quot=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/micropython-lib/Config.in&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/moarvm/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/mono/Config.in&quot;<br>
=C2=A0if BR2_PACKAGE_MONO<br>
diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Co=
nfig.in<br>
deleted file mode 100644<br>
index 76557b220b..0000000000<br>
--- a/package/micropython-lib/Config.in<br>
+++ /dev/null<br>
@@ -1,8 +0,0 @@<br>
-config BR2_PACKAGE_MICROPYTHON_LIB<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;micropython-lib&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_MICROPYTHON<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PCRE # runtime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Core Python libraries ported to MicroPyt=
hon.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://micropython.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://micropython.org</a><br>
diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropy=
thon-lib/micropython-lib.hash<br>
deleted file mode 100644<br>
index cbdda23844..0000000000<br>
--- a/package/micropython-lib/micropython-lib.hash<br>
+++ /dev/null<br>
@@ -1,3 +0,0 @@<br>
-# Locally computed<br>
-sha256=C2=A0 66e15380eb109613263beb6825b8eecb9191088270c1a59e8c7d922dd5718=
3c7=C2=A0 micropython-lib-1.9.3.tar.gz<br>
-sha256=C2=A0 baed4196a4310c576c2010f0a49f987a49e63856df7cd45af11cb3571df4b=
f74=C2=A0 LICENSE<br>
diff --git a/package/micropython-lib/<a href=3D"http://micropython-lib.mk" =
rel=3D"noreferrer noreferrer" target=3D"_blank">micropython-lib.mk</a> b/pa=
ckage/micropython-lib/<a href=3D"http://micropython-lib.mk" rel=3D"noreferr=
er noreferrer" target=3D"_blank">micropython-lib.mk</a><br>
deleted file mode 100644<br>
index 78ac0d3b35..0000000000<br>
--- a/package/micropython-lib/<a href=3D"http://micropython-lib.mk" rel=3D"=
noreferrer noreferrer" target=3D"_blank">micropython-lib.mk</a><br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-##########################################################################=
######<br>
-#<br>
-# micropython-lib<br>
-#<br>
-##########################################################################=
######<br>
-<br>
-MICROPYTHON_LIB_VERSION =3D 1.9.3<br>
-MICROPYTHON_LIB_SITE =3D $(call github,micropython,micropython-lib,v$(MICR=
OPYTHON_LIB_VERSION))<br>
-MICROPYTHON_LIB_LICENSE =3D Python-2.0 (some modules), MIT (everything els=
e)<br>
-MICROPYTHON_LIB_LICENSE_FILES =3D LICENSE<br>
-<br>
-define MICROPYTHON_LIB_INSTALL_TARGET_CMDS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PREFIX=3D$(TARGET_D=
IR)/usr/lib/micropython \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<br>
-endef<br>
-<br>
-$(eval $(generic-package))<br>
diff --git a/package/micropython/Config.in b/package/micropython/Config.in<=
br>
index 30161c8b70..2c2ae7a4df 100644<br>
--- a/package/micropython/Config.in<br>
+++ b/package/micropython/Config.in<br>
@@ -9,5 +9,15 @@ config BR2_PACKAGE_MICROPYTHON<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://micropython.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://micropython.org</a><br>
<br>
+config BR2_PACKAGE_MICROPYTHON_LIB<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;micropython-lib&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_MICROPYTHON<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PCRE # runtime<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Core Python libraries ported to MicroPyt=
hon.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://micropython.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">http://micropython.org</a><br>
+<br>
=C2=A0comment &quot;micropython needs a toolchain w/ threads, dynamic libra=
ry&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_ST=
ATIC_LIBS<br>
diff --git a/package/micropython/collect_micropython_lib.py b/package/micro=
python/collect_micropython_lib.py<br>
new file mode 100755<br>
index 0000000000..778a1c4c7d<br>
--- /dev/null<br>
+++ b/package/micropython/collect_micropython_lib.py<br>
@@ -0,0 +1,90 @@<br>
+#!/usr/bin/env python3<br>
+<br>
+&quot;&quot;&quot;<br>
+Sometime after v1.9.3, micropython-lib&#39;s directory structure was clean=
ed up and<br>
+enhanced with manifest files.<br>
+<br>
+Though cleaner, it means it cannot be directly copied into the target.<br>
+This script is during build process to perform that conversion.<br>
+<br>
+It makes use of manifestfile.py, which is normally located in micropython&=
#39;s<br>
+tool directory.<br>
+<br>
+It also depends on the micropython-lib that is cloned in lib/micropython-l=
ib<br>
+during build.<br>
+&quot;&quot;&quot;<br>
+<br>
+import argparse<br>
+import importlib<br>
+import os<br>
+import shutil<br>
+import sys<br>
+<br>
+<br>
+def get_library_name_type(manifest_path: str) -&gt; tuple[str, bool]:<br>
+=C2=A0 =C2=A0 split =3D manifest_path.split(&quot;/&quot;)<br>
+=C2=A0 =C2=A0 return (split[-2], &quot;unix-ffi&quot; in split)=C2=A0 # -1=
: &quot;manifest.py&quot;, -2: library name<br>
+<br>
+<br>
+def get_all_libraries(mpy_lib_dir: str):<br>
+=C2=A0 =C2=A0 # reuse manifestfile module capabilities to scan the micropy=
thon-lib directory<br>
+<br>
+=C2=A0 =C2=A0 collected_list =3D manifestfile.ManifestFile(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifestfile.MODE_FREEZE, {&quot;MPY_LIB_DIR&q=
uot;: mpy_lib_dir}<br>
+=C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 collected_list.freeze(mpy_lib_dir)<br>
+<br>
+=C2=A0 =C2=A0 for file in collected_list.files():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if file.target_path.endswith(&quot;manifest.py=
&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yield get_library_name_type(file=
.full_path)<br>
+<br>
+<br>
+def copy_file(src: str, target: str, destination: str):<br>
+=C2=A0 =C2=A0 s =3D target.split(&quot;/&quot;)<br>
+=C2=A0 =C2=A0 s.pop()<br>
+=C2=A0 =C2=A0 d =3D f&quot;{destination}/{&#39;/&#39;.join(s)}&quot;<br>
+=C2=A0 =C2=A0 if not os.path.exists(d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.makedirs(d)<br>
+=C2=A0 =C2=A0 shutil.copy(src, f&quot;{destination}/{target}&quot;)<br>
+<br>
+<br>
+def copy_libraries(manifest, destination: str):<br>
+=C2=A0 =C2=A0 for f in manifest.files():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 copy_file(f.full_path, f.target_path, destinat=
ion)<br>
+<br>
+<br>
+def process_cmdline_args():<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 description=3D&quot;Prepare micropython-lib to=
 be installed&quot;<br>
+=C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;micropython&quot;, help=3D&quot;Pa=
th to micropython source directory&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;destination&quot;, help=3D&quot;De=
stination directory&quot;)<br>
+<br>
+=C2=A0 =C2=A0 args =3D parser.parse_args()<br>
+=C2=A0 =C2=A0 return os.path.abspath(args.micropython), os.path.abspath(ar=
gs.destination)<br>
+<br>
+<br>
+def load_manifestfile_module(micropython_dir: str):<br>
+=C2=A0 =C2=A0 global manifestfile<br>
+=C2=A0 =C2=A0 sys.path.append(f&quot;{micropython_dir}/tools&quot;)<br>
+=C2=A0 =C2=A0 manifestfile =3D importlib.import_module(&quot;manifestfile&=
quot;)<br>
+<br>
+<br>
+def main():<br>
+=C2=A0 =C2=A0 micropython_dir, destination_dir =3D process_cmdline_args()<=
br>
+=C2=A0 =C2=A0 mpy_lib_dir =3D f&quot;{micropython_dir}/lib/micropython-lib=
&quot;<br>
+<br>
+=C2=A0 =C2=A0 # load manifest file after knowing where it is<br>
+=C2=A0 =C2=A0 load_manifestfile_module(micropython_dir)<br>
+<br>
+=C2=A0 =C2=A0 manifest =3D manifestfile.ManifestFile(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifestfile.MODE_FREEZE, {&quot;MPY_LIB_DIR&q=
uot;: mpy_lib_dir}<br>
+=C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 for library, is_ffi in get_all_libraries(mpy_lib_dir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 manifest.require(library, unix_ffi=3Dis_ffi)<b=
r>
+<br>
+=C2=A0 =C2=A0 copy_libraries(manifest, destination_dir)<br>
+<br>
+<br>
+main()<br>
diff --git a/package/micropython/<a href=3D"http://micropython.mk" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">micropython.mk</a> b/package/microp=
ython/<a href=3D"http://micropython.mk" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">micropython.mk</a><br>
index 37c148da94..a9757e266c 100644<br>
--- a/package/micropython/<a href=3D"http://micropython.mk" rel=3D"noreferr=
er noreferrer" target=3D"_blank">micropython.mk</a><br>
+++ b/package/micropython/<a href=3D"http://micropython.mk" rel=3D"noreferr=
er noreferrer" target=3D"_blank">micropython.mk</a><br>
@@ -47,6 +47,8 @@ define MICROPYTHON_BUILD_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MICROPYTHON_MAKE_=
OPTS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(EXTRA_ENV) package/micropython/collect_microp=
ython_lib.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D) $(@D)/.built_=
pylib<br>
=C2=A0endef<br>
<br>
=C2=A0define MICROPYTHON_INSTALL_TARGET_CMDS<br>
@@ -57,4 +59,14 @@ define MICROPYTHON_INSTALL_TARGET_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install<br>
=C2=A0endef<br>
<br>
+define MICROPYTHON_INSTALL_LIBS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/mic=
ropython<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a $(@D)/.built_pylib/* $(TARGET_DIR)/usr/li=
b/micropython<br>
+endef<br>
+<br>
+ifeq ($(BR2_PACKAGE_MICROPYTHON_LIB),y)<br>
+MICROPYTHON_POST_INSTALL_TARGET_HOOKS +=3D MICROPYTHON_INSTALL_LIBS<br>
+endif<br>
+<br>
+<br>
=C2=A0$(eval $(generic-package))<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div></div>

--0000000000006e21ff0610061c15--

--===============0806854549046068173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0806854549046068173==--
