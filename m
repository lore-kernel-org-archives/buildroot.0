From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri, 12 Apr 2013 14:08:23 +0300
Subject: [Buildroot]
	=?buildroot@busybox.net?q?=5BPATCH=20v2=5D=20zeromq=3A=20remove=20libuuid=20dependency?=
In-Reply-To: <1365663459-3684-1-git-send-email-spdawson@gmail.com>
References: <1365663459-3684-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAAHaz6E5UfrGKXU8rn9_AF7p5BF-S9tHSS_jhwdmMo9QudFZLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Simon!

2013/4/11 <spdawson@gmail.com>

> From: Simon Dawson <spdawson@gmail.com>
>
> Since version 3.1.0, zeromq no longer depends on libuuid.
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> diff --git a/package/czmq/Config.in b/package/czmq/Config.in
> index 7e4205e..f23f492 100644
> --- a/package/czmq/Config.in
> +++ b/package/czmq/Config.in
> @@ -1,16 +1,14 @@
>  config BR2_PACKAGE_CZMQ
>         bool "czmq"
> -       select BR2_PACKAGE_ZEROMQ
>         depends on BR2_INSTALL_LIBSTDCPP # zeromq
>         depends on BR2_INET_IPV6 # zeromq
> -       depends on BR2_LARGEFILE # util-linux
> -       depends on BR2_USE_WCHAR # util-linux
>         depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> +       select BR2_PACKAGE_ZEROMQ
>         help
>           High-level C Binding for 0MQ
>
>           http://czmq.zeromq.org/
>
> -comment "czmq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR
> support"
> -       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 &&
> BR2_LARGEFILE \
> -               && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
> +comment "czmq requires a toolchain with C++, IPV6 and thread support"
> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 \
> +               && BR2_TOOLCHAIN_HAS_THREADS)
>

  Tested using a Buildroot-generated toolchain of gcc 4.8 with uClibc
0.9.33 without WCHAR
(i.e., cc reports wchar_t as an unknown type). The build fails because a
configure test for C99
(as well as GNU99) uses wchar_t in a compile-test program: obviously, it is
not able to find
a compiler switch to turn on C99 support, and generates Makefile(s) that
call CC in default
mode. It just happened that the Buildroot-generated gcc is using ISO C90 as
default mode
(and that is well justified because wchar_t is in C99 standard).

  In CZMQ source C++-style comments are used. That makes a C90 compiler mad.

  Do I need to supply my Buildroot config, czmq config.log and compile
output?

  cppzmq, zmqpp and zeromq appear to have been built OK with this patch.

--
Best regards,
  Alexander Lukichev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130412/e9f89191/attachment-0001.html>
