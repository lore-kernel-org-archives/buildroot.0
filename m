From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Aug 2014 22:23:22 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20140806202322.GE1587@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2014-07-18 14:33 +0200, Johan Oudinet spake thusly:
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
> Changes v2 -> v3:
>   - Add system V init script.
> Changes v1 -> v2:
>   - Run ejabberd as ejabberd user instead of root.

I tried building ejabberd in a minmal config, with:

    BR2_x86_i686=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    BR2_PACKAGE_EJABBERD=y
    # BR2_TARGET_ROOTFS_TAR is not set

And it fails at build time, with a lengthy error message, that I do not
completely grasp:

    /home/ymorin/dev/buildroot/O/host/usr/lib/erlang/bin/escript rebar
get-deps && :> deps/.got
    ==> rel (get-deps)
    Uncaught error in rebar_core: {'EXIT',
                                   {badarg,
                                    [{re,replace,
                                      [[40,41,32,123,32,32,108,111,99,97,108,32,
                                        82,69,84,61,34,36,123,63,125,34,59,10,32,
        [--SNIP a lot of numbers--]
                                        115,116,111,114,121,32,45,97,59,10,32,112,
                                        114,111,109,112,116,95,102,105,114,115,
                                        116,61,48,10,125],
                                       [92,36,40,"doPrompt",40,92,115,124,36,41,
                                        124,123,"doPrompt",125,41],
                                       [[],"\\2"],
                                       [global,{return,list}]],
                                      [{file,"re.erl"},{line,355}]},
                                     {rebar_port_compiler,merge_each_var,2,
                                      [{file,"src/rebar_port_compiler.erl"},
                                       {line,380}]},
                                     {rebar_port_compiler,setup_env,2,
                                      [{file,"src/rebar_port_compiler.erl"},
                                       {line,167}]},
                                     {rebar_core,'-setup_envs/2-fun-0-',2,
                                      [{file,"src/rebar_core.erl"},{line,436}]},
                                     {lists,foldl,3,
                                      [{file,"lists.erl"},{line,1261}]},
                                     {rebar_core,process_dir1,6,
                                      [{file,"src/rebar_core.erl"},{line,190}]},
                                     {rebar_core,process_commands,2,
                                      [{file,"src/rebar_core.erl"},{line,61}]},
                                     {rebar,main,1,
                                      [{file,"src/rebar.erl"},{line,58}]}]}}
    make[2]: *** [deps/.got] Error 1

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                 |  1 +
>  package/ejabberd/Config.in        | 13 ++++++
>  package/ejabberd/S50ejabberd      | 29 +++++++++++++
>  package/ejabberd/check-erlang-lib | 48 ++++++++++++++++++++++
>  package/ejabberd/ejabberd.mk      | 86 +++++++++++++++++++++++++++++++++++++++
>  5 files changed, 177 insertions(+)
>  create mode 100644 package/ejabberd/Config.in
>  create mode 100644 package/ejabberd/S50ejabberd
>  create mode 100755 package/ejabberd/check-erlang-lib
>  create mode 100644 package/ejabberd/ejabberd.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 22ddea8..eb0aaaa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -943,6 +943,7 @@ endif
>  	source "package/dnsmasq/Config.in"
>  	source "package/dropbear/Config.in"
>  	source "package/ebtables/Config.in"
> +	source "package/ejabberd/Config.in"
>  	source "package/ethtool/Config.in"
>  	source "package/faifa/Config.in"
>  	source "package/fmc/Config.in"
> diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
> new file mode 100644
> index 0000000..3a2336d
> --- /dev/null
> +++ b/package/ejabberd/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_EJABBERD
> +       bool "ejabberd"
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_ERLANG
> +       select BR2_PACKAGE_LIBYAML
> +       select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +       select BR2_PACKAGE_EXPAT
> +       help
> +	 Ejabberd is a Jabber/XMPP instant messaging server, written
> +	 in Erlang/OTP. Among other features, ejabberd is
> +	 cross-platform, fault-tolerant, clusterable and modular.
> +
> +	 http://www.ejabberd.im
> diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
> new file mode 100644
> index 0000000..a156bc2
> --- /dev/null
> +++ b/package/ejabberd/S50ejabberd
> @@ -0,0 +1,29 @@
> +#!/bin/sh
> +#
> +# Start/stop ejabberd
> +#
> +
> +case "$1" in
> +    start)
> +	echo "Starting ejabberd..."
> +	ejabberdctl start
> +	;;
> +    stop)
> +	echo -n "Stopping ejabberd... "
> +	ejabberdctl stop > /dev/null
> +	if [ $? -eq 3 ] || ejabberdctl stopped; then
> +	    echo "OK"
> +	else
> +	    echo "failed"
> +	fi
> +	;;
> +    restart|reload)
> +	"$0" stop
> +	"$0" start
> +	;;
> +    *)
> +	echo "Usage: $0 {start|stop|restart}"
> +	exit 1
> +esac
> +
> +exit $?
> diff --git a/package/ejabberd/check-erlang-lib b/package/ejabberd/check-erlang-lib
> new file mode 100755
> index 0000000..1a942bb
> --- /dev/null
> +++ b/package/ejabberd/check-erlang-lib
> @@ -0,0 +1,48 @@
> +#!/bin/sh -e
> +# Helper to bypass AC_ERLANG_CHECK_LIB
> +
> +usage() {
> +    cat <<EOF
> +Usage:
> +	$0 library
> +Look for Erlang's library in TARGET_DIR/usr/lib/erlang/lib.
> +
> +If the library is found, it returns the path to the latest version,
> +relative to TARGET_DIR. Otherwise, it returns "not found".
> +
> +If there are several versions, it returns an error because it does not
> +know which one Erlang uses.
> +
> +EOF
> +}
> +
> +die () {
> +    echo "$@" >&2
> +    exit 1
> +}
> +
> +if [ $# -ne 1 ]; then
> +    usage
> +    exit 0
> +else
> +    library="$1"
> +fi
> +
> +target_dir="${TARGET_DIR:-../../output/target}"
> +
> +[ -d "$target_dir" ] || die "TARGET_DIR is not a directory. Please \
> +specify the TARGET_DIR environment variable."
> +
> +case "$(ls -1d -- "$target_dir/usr/lib/erlang/lib/$library-"* | wc -l)" in
> +    0)
> +	echo "not found"
> +	;;
> +    1)
> +	echo "$target_dir/usr/lib/erlang/lib/$library-"* \
> +	    | sed -e "s,^$target_dir,,"
> +	;;
> +    *)
> +	die "Several versions of $library have been found. Please \
> +	remove the unused ones."
> +	;;
> +esac
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
> +
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +	EJABBERD_DEPENDENCIES += libiconv
> +endif
> +
> +EJABBERD_ERLANG_LIBS := sasl crypto public_key ssl mnesia inets compiler
> +
> +# Do AC_ERLANG_CHECK_LIB job without erlang.
> +define EJABBERD_SET_LIBS_DIR
> +	for lib in $(EJABBERD_ERLANG_LIBS); do					\
> +	  export								\
> +	    erlang_lib_dir_$$lib="`package/ejabberd/check-erlang-lib $$lib`";	\
> +	done
> +endef
> +
> +# Set cross-compilation options to the configure called by rebar.
> +define EJABBERD_FIX_REBAR_CONFIG_SCRIPT
> +	sed -e "s,./configure,./configure \\	\
> +	--target=$(GNU_TARGET_NAME) \\		\
> +	--host=$(GNU_TARGET_NAME) \\		\
> +	--build=$(GNU_HOST_NAME),"		\
> +	  -i "$(@D)"/rebar.config.script
> +endef
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
> +
> +define EJABBERD_USERS
> +ejabberd 119 ejabberd 128 * /var/run/ejabberd - - ejabberd daemon
> +endef
> +
> +define EJABBERD_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/ejabberd/S50ejabberd \
> +		$(TARGET_DIR)/etc/init.d/S50ejabberd
> +endef
> +
> +$(eval $(autotools-package))
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
