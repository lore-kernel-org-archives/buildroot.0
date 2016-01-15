From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jan 2016 14:33:57 +0100
Subject: [Buildroot] [PATCH] trousers: disable pie option on ARC
In-Reply-To: <1452860508-27467-1-git-send-email-ltrimas@synopsys.com>
References: <1452860508-27467-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <20160115143357.422dab52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lada Trimasova,

On Fri, 15 Jan 2016 15:21:48 +0300, Lada Trimasova wrote:
> ARC gcc understands "-pie" option and attempts to generate PIE
> binaries as of today PIE is not really supported for user-space
> applications. So we provide option which can make relro and pie usage
> optional and disable PIE detection if building for ARC. Also AUTORECONF
> option should be added because of modified configure.in and Makefile.am
> files.
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Thanks for the new patch. See some comments below.

> ---
>  package/trousers/0002-add-pie-option.patch | 69 ++++++++++++++++++++++++++++++
>  package/trousers/trousers.mk               |  8 ++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 package/trousers/0002-add-pie-option.patch
> 
> diff --git a/package/trousers/0002-add-pie-option.patch b/package/trousers/0002-add-pie-option.patch
> new file mode 100644
> index 0000000..95a2f01
> --- /dev/null
> +++ b/package/trousers/0002-add-pie-option.patch
> @@ -0,0 +1,69 @@
> +Even though ARC gcc understands "-pie" option and attempts
> +to generate PIE binaries as of today PIE is not really supported
> +for user-space applications. Trousers configure scripts don't provide
> +any options which can disable "-pie" usage. This patch provides an 
> +option to make PIE usage optional.
> +
> +Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>

Could you use Git to create this patch? The existing patch on the
trousers package is a Git formatted patch, so it would be good if
additional patches were git formatted as well. The upstream project
uses Git, so it is easy to do.

> ++#"enable" options
> ++ AC_ARG_ENABLE(pie,
> ++	[AC_HELP_STRING([--enable-pie],
> ++			[Produce position independent executables @<:@default=yes@:>@])],
> ++	enable_pie=$enableval,
> ++	enable_pie="maybe")

This last line should probably be:

	enable_pie="yes"

Because we're actually enabling pie by default.

> ++
> ++AC_ARG_ENABLE(relro,
> ++	[AC_HELP_STRING([--enable-relro],
> ++			[Enable relocations read-only support @<:@default=yes@:>@])],
> ++	enable_relro=$enableval,
> ++	enable_relro="maybe")

Ditto.

> + #
> + # The default port that the TCS daemon listens on
> + #
> +@@ -383,6 +395,21 @@
> + 	localstatedir="/usr/local/var"
> + fi
> + 
> ++if test $enable_pie != "no"; then
> ++	PIE_CFLAGS="-fpie -pie"
> ++else
> ++	PIE_CFLAGS=""
> ++fi
> ++AC_SUBST([PIE_CFLAGS])
> ++
> ++if test $enable_relro != "no"; then
> ++	RELRO_CFLAGS="-Wl,-z,relro"
> ++else
> ++	RELRO_CFLAGS=""
> ++fi
> ++AC_SUBST([RELRO_CFLAGS])
> ++
> ++
> + AC_OUTPUT(dist/tcsd.conf \
> + 	  dist/fedora/trousers.spec \
> + 	  dist/trousers.spec \
> +
> +diff -Naur trousers.orig/src/tcsd/Makefile.am trousers/src/tcsd/Makefile.am
> +--- trousers.orig/src/tcsd/Makefile.am	2014-04-24 22:05:44.000000000 +0400
> ++++ trousers/src/tcsd/Makefile.am	2016-01-15 13:15:44.486371425 +0300
> +@@ -2,8 +2,7 @@
> + 
> + tcsd_CFLAGS=-DAPPID=\"TCSD\" -DVAR_PREFIX=\"@localstatedir@\" -DETC_PREFIX=\"@sysconfdir@\" -I${top_srcdir}/src/include -fPIE -DPIE

We probably want to remove -fPIE -DPIE when PIE support is disabled.

> + tcsd_LDADD=${top_builddir}/src/tcs/libtcs.a ${top_builddir}/src/tddl/libtddl.a -lpthread @CRYPTOLIB@
> +-tcsd_LDFLAGS=-pie -Wl,-z,relro -Wl,-z,now
> +-
> ++tcsd_LDFLAGS=$(PIE_CFLAGS) $(RELRO_CFLAGS)

This should be:

tcsd_LDFLAGS=@PIE_CFLAGS@ @RELRO_CFLAGS@

*But* as you can see, those are CFLAGS, but LDFLAGS, so the variables
should really be named PIE_LDFLAGS and RELRO_LDFLAGS. However, -fpie is
a CFLAGS, so it shouldn't be in PIE_LDFLAGS.

> +# uClibc toolchain for ARC doesn't support PIE at the moment
> +ifeq ($(BR2_arc),y)
> +TROUSERS_CONF_OPTS += --disable-pie
> +endif
> +
> +

One empty new line is enough.

Also, could you submit this patch upstream ?

Now that I think of it, what would be even better than adding a new
config option is to simply test if the compiler is capable of linking a
simple PIE binary. If the compiler is PIE capable, then trousers would
use PIE, otherwise not.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
