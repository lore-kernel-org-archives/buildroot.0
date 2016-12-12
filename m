From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 22:26:05 +0100
Subject: [Buildroot] [PATCH] netsnmp: fix libnl include path in
 configure script
In-Reply-To: <1481544668-900-1-git-send-email-julien.floret@6wind.com>
References: <1481544668-900-1-git-send-email-julien.floret@6wind.com>
Message-ID: <20161212222605.7906c427@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 13:11:08 +0100, Julien Floret wrote:
> Search for libnl headers in staging directory, not in the host machine
> /usr/include/libnl3 folder.
> 
> Signed-off-by: Julien Floret <julien.floret@6wind.com>

Thanks for the patch. However, it's not the right way of fixing the
issue, I'm afraid.

> +define NETSNMP_FIX_LIBNL_INCLUDE_PATH
> +	$(SED) "s,-I/usr/include/libnl3,-I$(STAGING_DIR)/usr/include/libnl3,g" \
> +		$(@D)/configure
> +endef
> +
> +NETSNMP_PRE_CONFIGURE_HOOKS += NETSNMP_FIX_LIBNL_INCLUDE_PATH

The right fix is to modify configure.d/config_os_libs2 to avoid passing
-I/usr/include/libnl3, and then autoreconf the package. To do this, you
have a few options:

 - Remove -I/usr/include/libnl3 entirely, and assume the user will pass
   the appropriate options in CPPFLAGS.

 - Use -I=/usr/include/libnl3, gcc will automatically replace = by the
   compiler sysroot. However, I have no idea whether this also works
   with non-gcc compilers.

 - Change the --with-nl option so that it takes a path to the nl
   library.

Also, if netsnmp optionally uses libnl, then it should optionally
depend on it. Something like:

ifeq ($(BR2_PACKAGE_LIBNL),y)
NETSNMP_DEPENDENCIES += libnl
NETSNMP_CONF_OPTS += --with-nl
else
NETSNMP_CONF_OPTS += --without-nl
endif

Or, if you don't care about libnl support in netsnmp and don't want to
spend time fixing the problem, just add --without-nl to netsnmp
configuration options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
