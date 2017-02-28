From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Tue, 28 Feb 2017 12:13:17 +0100
Subject: [Buildroot] [PATCH] classpath: only allow on supported
 architectures
In-Reply-To: <1488233771-5322-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488233771-5322-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <65126b15-56dc-b768-0e4b-cbec92708e0d@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 27.02.2017 23:16, Thomas Petazzoni wrote:
> In commit a75ab1fc1dcc7eee8668b1c3c19b703f1390b2cd ("package/classpath:
> Don't depend on jamvm"), we removed the dependency of classpath on
> jamvm. Since jamvm is only available for a reduced set of architectures,
> classpath could until this commit until be built on those architectures.
> 
> However, now that this dependency has been removed, classpath can
> potentially be built for all architectures supported by Buildroot, even
> though it doesn't support all of them.
> 
> Since adding support for additional architectures in classpath doesn't
> make much sense, because classpath is in Buildroot only usable with
> JamVM anyway, and JamVM is only available for a small set of
> architectures, this commit simply makes classpath available on the
> architectures that it supports.
> 
> By doing so, it also removes the or1k support patch which was added by
> commit f12a146f817c8ef07a7d41a31a5336b5ef6a96e8, since anyway or1k is
> not supported by JamVM.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/55eb89f89e96b94a821778bc18ed844af08b7460/
>   (classpath on microblaze)
> 
>   http://autobuild.buildroot.net/results/279dd731bd9ecf5f9d54bda3715caeaa7cbcdbb3/
>   (classpath on nios2)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/classpath/0003-add-or1k-endian.patch | 18 ------------------
>  package/classpath/Config.in                  |  8 ++++++++
>  package/jamvm/Config.in                      |  2 ++
>  3 files changed, 10 insertions(+), 18 deletions(-)
>  delete mode 100644 package/classpath/0003-add-or1k-endian.patch
> 
> diff --git a/package/classpath/0003-add-or1k-endian.patch b/package/classpath/0003-add-or1k-endian.patch
> deleted file mode 100644
> index 8bc8784..0000000
> --- a/package/classpath/0003-add-or1k-endian.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Set endianess for or1k
> -
> -Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> -
> -diff -Nur classpath-0.98.orig/native/fdlibm/ieeefp.h classpath-0.98/native/fdlibm/ieeefp.h
> ---- classpath-0.98.orig/native/fdlibm/ieeefp.h	2008-01-13 18:33:50.000000000 +0100
> -+++ classpath-0.98/native/fdlibm/ieeefp.h	2017-02-26 12:39:12.316327363 +0100
> -@@ -123,6 +123,10 @@
> - #define __IEEE_BIG_ENDIAN
> - #endif
> - 
> -+#ifdef __or1k__
> -+#define __IEEE_BIG_ENDIAN
> -+#endif
> -+
> - #ifdef __v800
> - #define __IEEE_LITTLE_ENDIAN
> - #endif
> diff --git a/package/classpath/Config.in b/package/classpath/Config.in
> index caab619..c49ff7a 100644
> --- a/package/classpath/Config.in
> +++ b/package/classpath/Config.in
> @@ -1,7 +1,15 @@
> +config BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k \
> +		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el \
> +		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le \
> +		|| BR2_sh || BR2_x86_64

I just tested with the test-pkg script and I also get successful sparc
and sparc64 builds. Any particular reason to not enable it there?

I'll also test again if there is any change for the bumped 0.99 version.

> +
>  config BR2_PACKAGE_CLASSPATH
>  	bool "classpath"
>  	select BR2_NEEDS_HOST_JAR
>  	select BR2_NEEDS_HOST_JAVAC
> +	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
>  	help
>  	  GNU Classpath, Essential Libraries for Java, is a GNU
>  	  project to create free core class libraries for use with
> diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
> index 2cc97a1..57e1a8e 100644
> --- a/package/jamvm/Config.in
> +++ b/package/jamvm/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_JAMVM
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
>  		|| BR2_mips || BR2_mipsel || BR2_powerpc
> +	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_CLASSPATH
>  	help
> @@ -15,4 +16,5 @@ config BR2_PACKAGE_JAMVM
>  comment "jamvm needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
>  		|| BR2_mips || BR2_mipsel || BR2_powerpc
> +	depends on BR2_PACKAGE_CLASSPATH_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> 


Best wishes,
Marcus
