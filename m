From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:33:34 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20140720113334.717cb707@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

Thanks for your contribution!

I'll only make comments than Yann hasn't made yet.

On Fri, 18 Jul 2014 14:33:57 +0200, Johan Oudinet wrote:

> diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
> new file mode 100644
> index 0000000..64f93aa
> --- /dev/null
> +++ b/package/ejabberd/ejabberd.mk
> @@ -0,0 +1,86 @@
> +################################################################################
> +#
> +# ejabberd
> +#
> +################################################################################
> +
> +EJABBERD_VERSION = 14.05
> +EJABBERD_SITE = $(call github,processone,ejabberd,$(EJABBERD_VERSION))
> +EJABBERD_LICENSE = GPLv2+
> +EJABBERD_LICENSE_FILES = COPYING
> +EJABBERD_DEPENDENCIES =	libyaml expat openssl erlang

Unneeded tab after the = sign, just put one space.

> +
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +	EJABBERD_DEPENDENCIES += libiconv
> +endif
> +
> +EJABBERD_ERLANG_LIBS := sasl crypto public_key ssl mnesia inets compiler

Replace := by =.

> +
> +# Do AC_ERLANG_CHECK_LIB job without erlang.
> +define EJABBERD_SET_LIBS_DIR
> +	for lib in $(EJABBERD_ERLANG_LIBS); do					\
> +	  export								\
> +	    erlang_lib_dir_$$lib="`package/ejabberd/check-erlang-lib $$lib`";	\
> +	done
> +endef

Do we really need this script? What does it do exactly? Since we
control the erlang installation in Buildroot, can't we simply hardcode
the values here?

> +
> +# Set cross-compilation options to the configure called by rebar.
> +define EJABBERD_FIX_REBAR_CONFIG_SCRIPT
> +	sed -e "s,./configure,./configure \\	\
> +	--target=$(GNU_TARGET_NAME) \\		\
> +	--host=$(GNU_TARGET_NAME) \\		\
> +	--build=$(GNU_HOST_NAME),"		\
> +	  -i "$(@D)"/rebar.config.script
> +endef

I don't really follow what's happening here. Since we're using the
autotools-package infrastructure, aren't we already calling
the ./configure script with the appropriate options?

> +
> +EJABBERD_PRE_CONFIGURE_HOOKS +=			\
> +	EJABBERD_SET_LIBS_DIR			\
> +	EJABBERD_FIX_REBAR_CONFIG_SCRIPT
> +
> +# Guess answers for these tests, configure will bail out otherwise
> +# saying error: cannot run test program while cross compiling.
> +EJABBERD_CONF_ENV =						\
> +  ac_cv_erlang_root_dir='$(HOST_DIR)/usr/lib/erlang'		\
> +  $(foreach lib, $(EJABBERD_ERLANG_LIBS),			\
> +    ac_cv_erlang_lib_dir_$(lib)="$$erlang_lib_dir_$(lib)")
> +
> +# Set environment variables so the rebar compile command does
> +# cross-compile ejabberd dependencies.
> +EJABBERD_MAKE_ENV =								\
> +  $(TARGET_CONFIGURE_OPTS)							\
> +  $(TARGET_CONFIGURE_ARGS)							\
> +  LDFLAGS="-L$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sysroot/usr/lib/erlang/usr/lib"
> +
> +# Delete HOST_DIR prefix from ERL path in ejabberctl script.
> +define EJABBERD_FIX_EJABBERDCTL
> +	sed -e "s,ERL=$(HOST_DIR),ERL=,"		\
> +	  -e "s,INSTALLUSER=,INSTALLUSER=ejabberd,"	\
> +	  -i "$(TARGET_DIR)"/usr/sbin/ejabberdctl
> +endef
> +
> +EJABBERD_POST_INSTALL_TARGET_HOOKS += EJABBERD_FIX_EJABBERDCTL
> +
> +define EJABBERD_PERMISSIONS
> +/etc/ejabberd d 750 0 128 - - - - -
> +/etc/ejabberd/ejabberd.yml-new f 640 0 128 - - - - -
> +/etc/ejabberd/ejabberd.yml f 640 0 128 - - - - -
> +/etc/ejabberd/ejabberdctl.cfg-new f 640 0 128 - - - - -
> +/etc/ejabberd/ejabberdctl.cfg f 640 0 128 - - - - -
> +/etc/ejabberd/inetrc f 644 0 128 - - - - -
> +/usr/sbin/ejabberdctl f 550 0 128 - - - - -
> +/usr/lib/ejabberd/priv/bin/captcha.sh f 750 119 0 - - - - -
> +/usr/var/lib/ejabberd d 750 119 0 - - - - -
> +/usr/var/lock/ejabberdctl d 750 119 0 - - - - -
> +/usr/var/log/ejabberd d 750 119 0 - - - - -
> +endef

<pkg>_PERMISSIONS should only be used for files that need special
permissions, the other files should be left with their default
permissions, owned by root (which is done automatically by Buildroot).

Also, /usr/var/lib, /usr/val/lock and /usr/var/log look incorrect.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
