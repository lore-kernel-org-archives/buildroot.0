From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Feb 2018 16:01:47 +0100
Subject: [Buildroot] Building Kodi; dependencies
References: <CAPzckP6rcjcRLvdCfPYr5bFUv6JVg6PShaxzq0yirmR41_T3XQ@mail.gmail.com>
Message-ID: <rnvamexlhk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sjoerd,

Am Sun, 25 Feb 2018 11:59:05 +0100 schrieb Sjoerd Venema:

> Coming from:
> 
> comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain 
w/
> C++, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6"
> depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
> depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS\
> || !BR2_USE_WCHAR || BR2_STATIC_LIBS \
> || !BR2_HOST_GCC_AT_LEAST_4_6 \
> || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> || BR2_TOOLCHAIN_USES_MUSL \
> || !BR2_PACKAGE_PYTHON \
> || BR2_PACKAGE_PYTHON_PYC_ONLY
> 
> First off, I assume the ! means a Not, so, for example  !BR2_USE_WCHAR
> means that BR2_USE_WCHAR must be [=n]. Correct?

technically yes, but the dependencies you are looking at are only valid 
for the comment telling you why Kodi can not be selected atm. To build 
Kodi you need to enable all necessary options for the comment to 
disappear. For example: You need a wchar-enabled toolchain.

The positive list of Kodi dependencies can be found here:
https://git.buildroot.net/buildroot/tree/package/kodi/Config.in#n36

> Secondly, can I set all these dependencies via make menuconfig? Or do I
> have to configure things outside of that environment?

Yes. No. ;)

> Now, a "catch 22" seems to be for example: BR2_TOOLCHAIN_HAS_THREADS 
(must
> be false) is selected by BR2_TOOLCHAIN_USES_MUSL (must be true).

You need a toolchains with threads, and a musl-based toolchain can not be 
used for Kodi, only uClibc & glibc.

Here is the list of minimal menuconfig options needed to enable Kodi for 
x86_64 in an otherwise unaltered buildroot base directory:

Target options, "Target Architecture", "x86_64"

Toolchain, "Enable WCHAR support", "Enable C++ support"

Target packages
- Interpreter languages and scripting, "Python", "python module format to
  install", ".py sources only"
- Graphic libraries and applications (graphic/text), "X.org X Window
  System"
- Graphic libraries and applications (graphic/text), "mesa3d", "DRI
  swrast driver", "OpenGL EGL"
- Audio and video applications, "kodi"

Please adjust these options for your personal needs.

Regards, Bernd
