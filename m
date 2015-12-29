From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 18:00:59 +0100
Subject: [Buildroot] [PATCH] package/tpm-tools: fix build with locale
 support
In-Reply-To: <1451322746-3828-1-git-send-email-s.martin49@gmail.com>
References: <1451322746-3828-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20151229180059.3c9c91ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Mon, 28 Dec 2015 18:12:26 +0100, Samuel Martin wrote:

> diff --git a/package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-LDFLAGS-are-added-.patch b/package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-LDFLAGS-are-added-.patch
> new file mode 100644
> index 0000000..544b338
> --- /dev/null
> +++ b/package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-LDFLAGS-are-added-.patch
> @@ -0,0 +1,33 @@
> +From 5a2fb77973b54aaefa192146561e06d5020d4fa0 Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Mon, 28 Dec 2015 11:04:11 +0100
> +Subject: [PATCH] lib/Makefile.am: make sure libintl LDFLAGS are added when
> + building the internal static library


Patch title is a bit too long.

> +The build-system internally builds a couple of static libraries used to build
> +the final programs.
> +
> +When linking these libraries and the final programs, we need to explicitly tell
> +the linker to link with libintl in order to resolve all the missing symbols.
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> +---
> + lib/Makefile.am | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/Makefile.am b/lib/Makefile.am
> +index cef6a2f..3c65e15 100644
> +--- a/lib/Makefile.am
> ++++ b/lib/Makefile.am
> +@@ -28,6 +28,8 @@ lib_LTLIBRARIES		= 	libtpm_unseal.la
> + noinst_LTLIBRARIES	=	libtpm_tspi.la	\
> + 				libtpm_utils.la
> + 
> ++LIBS	+= $(INTLLIBS)

This should be:

LDADD = @INTLLIBS@

LIBS is meant to allow the user to add some additional libraries, not
to be used in Makefile.am, as far as I remember.

And @INTLLIBS@ will get the variable replaced by the configure script.

Can you test with those changes and respin?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
