From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 4 Aug 2016 18:36:25 +0200
Subject: [Buildroot] [PATCH] libdvdnav: fix nios2 cross-compile
In-Reply-To: <20160731101716.GA3788@waldemar-brodkorb.de>
References: <20160731101716.GA3788@waldemar-brodkorb.de>
Message-ID: <e11fb74d-88bb-7179-319d-54d6872ff291@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Le 31/07/2016 ? 12:17, Waldemar Brodkorb a ?crit :
> The host is misdetected as OS/2.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d5b30d6b5463928ded1a1c1f1f5345a726f6ffaf/
> http://autobuild.buildroot.net/results/917041c7165093f44a5d3b4a5ba56a3d1b59e456/
> http://autobuild.buildroot.net/results/dcfc53b6fc25210cf70a1abf0e24b85f0d971101/
> http://autobuild.buildroot.net/results/79109d06183efa17f6f68c1ea78cbd9927c5c46e/

[Build test only]
Tested-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> I am not sure where to report this upstream. Any hints?
> ---
>  package/libdvdnav/0001-do-not-match-nios2-as-os2.patch | 16 ++++++++++++++++
>  package/libdvdnav/libdvdnav.mk                         |  2 ++
>  2 files changed, 18 insertions(+)
>  create mode 100644 package/libdvdnav/0001-do-not-match-nios2-as-os2.patch
> 
> diff --git a/package/libdvdnav/0001-do-not-match-nios2-as-os2.patch b/package/libdvdnav/0001-do-not-match-nios2-as-os2.patch
> new file mode 100644
> index 0000000..27030bb
> --- /dev/null
> +++ b/package/libdvdnav/0001-do-not-match-nios2-as-os2.patch
> @@ -0,0 +1,16 @@
> +Fix misdetection while nios2 cross-compile
> +
> +Signed-off-bye: Waldemar Brodkorb <wbx@openadk.org>
> + 
> +diff -Nur libdvdnav-5.0.3.orig/configure.ac libdvdnav-5.0.3/configure.ac
> +--- libdvdnav-5.0.3.orig/configure.ac	2015-01-27 16:57:43.000000000 +0100
> ++++ libdvdnav-5.0.3/configure.ac	2016-07-31 11:48:09.312947473 +0200
> +@@ -73,7 +73,7 @@
> +   [*mingw32* | *cygwin*], [AC_CHECK_FUNCS(gettimeofday)])
> + 
> + AS_CASE([$host],
> +-  [*os2*], [LDFLAGS="$LDFLAGS -no-undefined"])
> ++  [*-os2*], [LDFLAGS="$LDFLAGS -no-undefined"])
> + 
> + dnl ---------------------------------------------
> + dnl threads
> diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
> index ff5ae09..b53f0c8 100644
> --- a/package/libdvdnav/libdvdnav.mk
> +++ b/package/libdvdnav/libdvdnav.mk
> @@ -11,5 +11,7 @@ LIBDVDNAV_INSTALL_STAGING = YES
>  LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
>  LIBDVDNAV_LICENSE = GPLv2+
>  LIBDVDNAV_LICENSE_FILES = COPYING
> +# 0001-do-not-match-nios2-as-os2.patch
> +LIBDVDNAV_AUTORECONF = YES
>  
>  $(eval $(autotools-package))
> 
