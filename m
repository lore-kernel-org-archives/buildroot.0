From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:14:18 +0200
Subject: [Buildroot] [PATCH v3] package/zile: add Zile is Lossy Emacs
 editor
In-Reply-To: <1397737179-12262-2-git-send-email-alex.bennee@linaro.org>
References: <1397737179-12262-1-git-send-email-alex.bennee@linaro.org>
 <1397737179-12262-2-git-send-email-alex.bennee@linaro.org>
Message-ID: <20140417221418.5e3939fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Benn?e,

On Thu, 17 Apr 2014 13:19:39 +0100, Alex Benn?e wrote:
> This is a lightweight Emacs clone useful for embedded systems. I nabbed
> the help2man disable patch from OpenEmbedded.

There are unfortunately a few things still not good here.

> diff --git a/package/zile/Config.in b/package/zile/Config.in
> new file mode 100644
> index 0000000..163b44d
> --- /dev/null
> +++ b/package/zile/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_ZILE
> +	bool "zile"
> +	select BR2_PACKAGE_LIBGC
> +	depends on BR2_USE_MMU # fork()

You need to replicate the dependencies of BR2_PACKAGE_LIBGC here.

Also, when testing your package, it failed because ncurses was not
available, so I had to add ncurses as a dependency here.

This actually leads me to wonder if you actually tested this stuff. How
would it be possible to miss the ncurses dependency?

Also, some of the configure messages need some investigation:

configure: WARNING: libacl development library was not found or not
usable. configure: WARNING: Zile will be built without ACL support.

 => this probably means that an optional dependency on BR2_PACKAGE_ACL,
 with a --enable-acl / --disable-acl as appropriate

checking whether btowc is declared without a macro... yes
checking whether wctob is declared without a macro... yes
checking whether mbsinit is declared without a macro... yes

 => this smells like a dependency on wide-char support. Can you test
 your package with a toolchain that does not have wide char support,
 such as
 http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config.

checking for emacs... /usr/bin/emacs
checking Emacs version 24.3.50.1 >= 23.1... yes

 => is it normal that it references my host emacs? what is this used
 for?


> diff --git a/package/zile/zile-0001-remove-help2man.patch b/package/zile/zile-0001-remove-help2man.patch
> new file mode 100644
> index 0000000..d397543
> --- /dev/null
> +++ b/package/zile/zile-0001-remove-help2man.patch
> @@ -0,0 +1,30 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>

Since you're passing --without-help2man, why is this patch useful?

> diff --git a/package/zile/zile.mk b/package/zile/zile.mk
> new file mode 100644
> index 0000000..07226c6
> --- /dev/null
> +++ b/package/zile/zile.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# Zile
> +#
> +################################################################################
> +
> +ZILE_VERSION = 2.4.11
> +ZILE_SITE = $(BR2_GNU_MIRROR)/zile
> +ZILE_LICENSE = GPLv1+

Have you actually read the COPYING file?

> +ZILE_LICENSE_FILES = COPYING
> +ZILE_AUTORECONF = YES
> +ZILE_CONF_OPT = --without-help2man
> +ZILE_DEPENDENCIES = libgc

Missing ncurses library.

Also, when I build your package with the toolchain at
http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full.config,
it fails to build with:

/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgc.so:
undefined reference to symbol 'pthread_cancel'
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
note: 'pthread_cancel' is defined in DSO /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 so try adding it to the linker command line
/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0:
could not read symbols: Invalid operation

Could you work on these remaining issues, and resubmit an updated
version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
