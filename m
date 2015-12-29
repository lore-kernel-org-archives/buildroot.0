From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 23:36:18 +0100
Subject: [Buildroot] [PATCH v2] package/tpm-tools: fix build with locale
 support
In-Reply-To: <1451423672-24575-1-git-send-email-s.martin49@gmail.com>
References: <1451423672-24575-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20151229233618.0d9f9c4e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 29 Dec 2015 22:14:32 +0100, Samuel Martin wrote:

> diff --git a/package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when.patch b/package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when.patch
> new file mode 100644
> index 0000000..eee92c1
> --- /dev/null
> +++ b/package/tpm-tools/0002-lib-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when.patch
> @@ -0,0 +1,40 @@
> +From bbea0774bda411784294b01131bca60428124844 Mon Sep 17 00:00:00 2001
> +From: Samuel Martin <s.martin49@gmail.com>
> +Date: Mon, 28 Dec 2015 11:04:11 +0100
> +Subject: [PATCH] lib/Makefile.am: make sure libintl is in LDFLAGS when needed
> +
> +The build-system internally builds a couple of static libraries used to
> +build the final programs.
> +
> +When linking these libraries and the final programs, we need to
> +explicitly tell the linker to link with libintl in order to resolve all
> +the missing symbols.
> +
> +Use LIBS instead of LDADD/LIBADD to make sure the libintl is added to
> +all linker commands (both libraries and programs).
> +
> +Note that LDADD/LIBADD are the defaults for foo_LDADD/foo_LIBADD, so
> +adding the libintl flags to the LDADD/LIBADD variables is not enough
> +when the per-target foo_LDADD/foo_LIBADD are set in Makefile.am.
> +
> +Signed-off-by: Samuel Martin <s.martin49@gmail.com>

I am still not happy with this, since LIBS shouldn't been overridden in
a Makefile.am.

Could you please do the following change instead:

libtpm_utils_la_SOURCES =       tpm_utils.c \
                                tpm_log.c
+libtpm_utils_la_LIBADD  =       @LIBINTL@

Indeed, libtpm_utils is then linked into all other libraries/programs.

And please submit the patch upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
