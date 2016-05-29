From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 May 2016 19:14:12 +0200
Subject: [Buildroot] [PATCH] [PATCH v2] p7zip: New package
In-Reply-To: <1464539299-3853-1-git-send-email-nerv@dawncrow.de>
References: <1464539299-3853-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20160529171412.GA3367@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr?, All,

On 2016-05-29 18:28 +0200, Andr? Hentschel spake thusly:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
[--SNIP--]
> diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
> new file mode 100644
> index 0000000..1a6a4df
> --- /dev/null
> +++ b/package/p7zip/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_P7ZIP
> +	bool "p7zip"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_i386 || BR2_x86_64 || \
> +		BR2_aarch64 || BR2_arm || BR2_armeb

Please explain why this is limited to those architectures.

You can put it in the commit log, or you may add a terse comment just
above the depends-on line. If the explanations is not straightforward,
prefer the commit log.

(Yes, I read the previous reply that it was broken on NIOSII. Limiting
to a small set of architectures wihtout an explanation is not enough.)

Thanks! :-)

Regards,
Yann E. MORIN.

> +	help
> +	  p7zip is a quick port of the command line version of 7-zip for Unix.
> +	  (see http://www.7-zip.org)
> +
> +	  7-Zip is a file archiver with highest compression ratio.
> +
> +	  http://sourceforge.net/projects/p7zip
> +
> +comment "p7zip needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
> new file mode 100644
> index 0000000..ead6d87
> --- /dev/null
> +++ b/package/p7zip/p7zip.hash
> @@ -0,0 +1,3 @@
> +# From https://sourceforge.net/projects/p7zip/files/p7zip/
> +md5	92cca093312b5a71a7be7dc7d1d32509	p7zip_15.14.1_src_all.tar.bz2
> +sha1	9b15a79f94230fab9b9d4f9f532c723117145c7a	p7zip_15.14.1_src_all.tar.bz2
> diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
> new file mode 100644
> index 0000000..95d47d2
> --- /dev/null
> +++ b/package/p7zip/p7zip.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# p7zip
> +#
> +################################################################################
> +
> +P7ZIP_VERSION = 15.14.1
> +P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
> +P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
> +P7ZIP_LICENSE = LGPLv2.1+
> +P7ZIP_LICENSE_FILES = DOC/License.txt
> +
> +# Note that the build system of p7zip is a mess, so we can't use TARGET_CONFIGURE_OPTS
> +define P7ZIP_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
> +		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \

Well, I at least see three variables in there (CC, CXX and LDFLAGS) that
are in TARGET_CONFIGURE_OPTS. Can you do:

    $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
        ALLFLAGS_C="$(TARGET_CFLAGS)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
        7zr

... instead?

Regards,
Yann E. MORIN.

> +		-C $(@D) 7zr
> +endef
> +
> +define P7ZIP_INSTALL_TARGET_CMDS
> +	cp -dpf $(@D)/bin/7zr $(TARGET_DIR)/usr/bin/
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
