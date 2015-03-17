From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 17 Mar 2015 18:17:57 +0100
Subject: [Buildroot] [PATCH 1/1] dvdrw-tools: new package
In-Reply-To: <1426604853-29678-1-git-send-email-skenton@ou.edu>
References: <1426604853-29678-1-git-send-email-skenton@ou.edu>
Message-ID: <20150317171757.GA32554@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2015-03-17 10:07 -0500, Steve Kenton spake thusly:
> The dvd+rw-tools are used to master Blu-ray Disc
> and DVD Disc media, both +RW/+R and -RW/-R. Note:
> The +RW in the name is a historical artifact. This
> package contains the widely used growisofs program.

Getting good! :-)

> Signed-off-by: Steve Kenton <skenton@ou.edu>
[--SNIP--]
> diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
> new file mode 100644
> index 0000000..cdcdaa3
> --- /dev/null
> +++ b/package/dvdrw-tools/Config.in
> @@ -0,0 +1,56 @@
> +config BR2_PACKAGE_DVDRW_TOOLS
> +	bool "dvdrw-tools"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_LARGEFILE
> +	help
> +	  The dvd+rw-tools are used to master Blu-ray Disc
> +	  and DVD Disc media, both +RW/+R and -RW/-R. The
> +	  +RW in the name is a historical artifact. This
> +	  package contains the widely used growisofs program.
> +
> +	  Buildroot does not support packages with a '+' sign
> +	  in their name, which explains why it is named
> +	  dvdrw-tools and not dvd+rw-tools.
> +
> +	  Because dvd+rw-tools does not directly interact with
> +	  disc media it uses a separate media backend program.
> +	  The usual backend is mkisofs from the cdrtools package.
> +	  However, cdrtools is not currently part of buildroot.
> +
> +	  The Linux From Scratch project uses uses xorriso for the
> +	  media backend and Ubuntu uses cdrkit for the backend.
> +	  Choose the one which seems most appropriate for your use.
> +	  NOTE: xorriso does not currently support UDF.
> +	  
> +	  http://fy.chalmers.se/~appro/linux/DVD+RW/tools
> +
> +comment "dvdrw-tools needs a toolchain w/threads, C++, wchar, largefile"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
> +		|| !BR2_LARGEFILE
> +
> +if BR2_PACKAGE_DVDRW_TOOLS
> +choice
> +	prompt "Media Backend"
> +	default BR2_PACKAGE_DVDRW_CDRKIT_BACKEND
> +	help
> +	  Choose which media backend program to use.
> +
> +config BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND
> +	bool "cdrkit"
> +	select BR2_PACKAGE_CDRKIT

cdrkit depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 so you need to
propagate this here:

    config BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND
        bool "cdrkit"
        depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # cdrkit
        select BR2_PACKAGE_CDRKIT
        help
            Blabla symlink blabla...

    comment "cdrkit needs a toolchain with headers >= 3.0"
        depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0


You can put the comment in the choice, yes.

[--SNIP--]
> diff --git a/package/dvdrw-tools/dvdrw-tools.mk b/package/dvdrw-tools/dvdrw-tools.mk
> new file mode 100644
> index 0000000..af6105d
> --- /dev/null
> +++ b/package/dvdrw-tools/dvdrw-tools.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# dvdrw-tools
> +#
> +################################################################################
> +
> +DVDRW_TOOLS_VERSION = 7.1
> +DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
> +DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
> +DVDRW_TOOLS_LICENSE = GPLv2
> +DVDRW_TOOLS_LICENSE_FILES = LICENSE
> +
> +define DVDRW_TOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND),y)
> +DVDRW_TOOLS_BACKEND = genisoimage
> +else ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND),y)
> +DVDRW_TOOLS_BACKEND = xorrisofs
> +endif
> +
> +define DVDRW_TOOLS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/dvd-ram-control $(TARGET_DIR)/usr/bin/dvd-ram-control
> +	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-booktype $(TARGET_DIR)/usr/bin/dvd+rw-booktype
> +	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-format $(TARGET_DIR)/usr/bin/dvd+rw-format
> +	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-mediainfo $(TARGET_DIR)/usr/bin/dvd+rw-mediainfo
> +	$(INSTALL) -m 0755 -D $(@D)/growisofs $(TARGET_DIR)/usr/bin/growisofs
> +	ln -s -f /usr/bin/$(DVDRW_TOOLS_BACKEND) $(TARGET_DIR)/usr/bin/mkisofs

Because you need the backend to create the symlink, you should depend on
the proper backend:

    ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND),y)
    DVDRW_TOOLS_BACKEND = genisoimage
    DVDRW_TOOLS_DEPENDENCIES = cdrkit
    else ifeq ($(BR2_PACKAGE_DVDRW_TOOLS_XORRISO_BACKEND),y)
    DVDRW_TOOLS_BACKEND = xorrisofs
    DVDRW_TOOLS_DEPENDENCIES = xorriso
    endif

Otherwise, lokks good.

Regards,
Yann E. MORIN.

> +endef
> 
> +$(eval $(generic-package))
> -- 
> 2.1.0
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
