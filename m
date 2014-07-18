From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Sat, 19 Jul 2014 01:58:18 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <20140718213550.GG3630@free.fr>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20140718213550.GG3630@free.fr>
Message-ID: <CAJtjsKbkwub=5WV6Uq7D=byqTpjrR=HP5dQW5P82=rsNdf4p7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Yann for the comments.
I'm on holidays for the next 2 weeks, but I will take care of them as
soon as I'm back.

In the meantime, I'm interested in how to set file permissions without
knowing which uid/gid ejabberd user has?
Can I use user/group names instead of IDs in EJABBERD_PERMISSIONS syntax?

On Fri, Jul 18, 2014 at 11:35 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Johan, All,
>
> Thanks for this respin! :-)
>
> On 2014-07-18 14:33 +0200, Johan Oudinet spake thusly:
>> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> [--SNIP--]
>> diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
>> new file mode 100644
>> index 0000000..3a2336d
>> --- /dev/null
>> +++ b/package/ejabberd/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_EJABBERD
>> +       bool "ejabberd"
>> +       select BR2_PACKAGE_OPENSSL
>> +       select BR2_PACKAGE_ERLANG
>
> erlang depends on BR2_USE_MMU, so you need to duplicate the dependency
> here, too:
>
>     depends on BR2_USE_MMU  # erlang
>
>> +       select BR2_PACKAGE_LIBYAML
>> +       select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>> +       select BR2_PACKAGE_EXPAT
>> +       help
>
> All the above entries should be indented using a single TAB, not spaces.
>
>> +      Ejabberd is a Jabber/XMPP instant messaging server, written
>> +      in Erlang/OTP. Among other features, ejabberd is
>> +      cross-platform, fault-tolerant, clusterable and modular.
>> +
>> +      http://www.ejabberd.im
>
> Indentation of the help text is OK (one TAB + two spaces.)
>
>> diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
>> new file mode 100644
>> index 0000000..a156bc2
>> --- /dev/null
>> +++ b/package/ejabberd/S50ejabberd
>
> Indentatiopn in this script is inconsistent: sometimes, TABs are used,
> sometime spaces. Please be consistent. I prefer spaces, but I won't mind
> TABs, as long as it is consistent. ;-)
>
>> +#!/bin/sh
>> +#
>> +# Start/stop ejabberd
>> +#
>> +
>> +case "$1" in
>> +    start)
>> +     echo "Starting ejabberd..."
>> +     ejabberdctl start
>> +     ;;
>> +    stop)
>> +     echo -n "Stopping ejabberd... "
>> +     ejabberdctl stop > /dev/null
>> +     if [ $? -eq 3 ] || ejabberdctl stopped; then
>> +         echo "OK"
>> +     else
>> +         echo "failed"
>> +     fi
>> +     ;;
>> +    restart|reload)
>> +     "$0" stop
>> +     "$0" start
>> +     ;;
>> +    *)
>> +     echo "Usage: $0 {start|stop|restart}"
>> +     exit 1
>> +esac
>> +
>> +exit $?
>
> This last exit is not needed. That's anyway the default behaviour of a
> shell script, to exit with the exit-code of the last command executed.
>
>> diff --git a/package/ejabberd/check-erlang-lib b/package/ejabberd/check-erlang-lib
>> new file mode 100755
>> index 0000000..1a942bb
>> --- /dev/null
>> +++ b/package/ejabberd/check-erlang-lib
>> @@ -0,0 +1,48 @@
>> +#!/bin/sh -e
>> +# Helper to bypass AC_ERLANG_CHECK_LIB
>
> I guess you should provide some explanations for this script. I'm not an
> erlang guy, so it looks strange to me.
>
> Either you provide the explanations in the commit log, or directly as a
> comment in this script (I'd prefer the latter.)
>
> [--SNIP--]
>> diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
>> new file mode 100644
>> index 0000000..64f93aa
>> --- /dev/null
>> +++ b/package/ejabberd/ejabberd.mk
>> @@ -0,0 +1,86 @@
>> +################################################################################
>> +#
>> +# ejabberd
>> +#
>> +################################################################################
>> +
>> +EJABBERD_VERSION = 14.05
>> +EJABBERD_SITE = $(call github,processone,ejabberd,$(EJABBERD_VERSION))
>> +EJABBERD_LICENSE = GPLv2+
>> +EJABBERD_LICENSE_FILES = COPYING
>> +EJABBERD_DEPENDENCIES =      libyaml expat openssl erlang
>> +
>> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
>> +     EJABBERD_DEPENDENCIES += libiconv
>
> We normally do not indent the DEPENDENCIES line inside conditionals.
>
>> +endif
>
> Since it also optionally depends on PAM, you should add linux-pam as a
> conditional dependency, so we ensure linux-pam, if selected, is built
> before ejabberd:
>
>     ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>     EJABBERD_DEPENDENCIES += linux-pam
>     endif
>
>> +EJABBERD_ERLANG_LIBS := sasl crypto public_key ssl mnesia inets compiler
>> +
>> +# Do AC_ERLANG_CHECK_LIB job without erlang.
>> +define EJABBERD_SET_LIBS_DIR
>> +     for lib in $(EJABBERD_ERLANG_LIBS); do                                  \
>> +       export                                                                \
>> +         erlang_lib_dir_$$lib="`package/ejabberd/check-erlang-lib $$lib`";   \
>> +     done
>
> Unles I'm missing something (which tends to happen quite often these
> days, blame the high temperatures we are experiencing), these exports
> will get lost right after the for loop, due to how make calls the rules:
> it spawns a shell for each line to be executed, so the environment set
> on one line is lost on the subsequent lines, even in the same rule.
>
> However, due to our trickery with the hooks, I'd have to verify this
> asumption, when applied to hooks.
>
> You might get something with:
>
>     EJABBERD_CONF_ENV = $(foreach lib,$(EJABBERD_ERLANG_LIBS),erlang_lib_dir_$(lib)=$(shell package/ejabberd/check-erlang-lib $(lib)))
>
> Yes, this line is long, and I doubt we'd be able to split it properly
> into working conditions... :-/
>
> Might need some tweaking, mond you! ;-)
>
>> +endef
>> +
>> +# Set cross-compilation options to the configure called by rebar.
>> +define EJABBERD_FIX_REBAR_CONFIG_SCRIPT
>> +     sed -e "s,./configure,./configure \\    \
>> +     --target=$(GNU_TARGET_NAME) \\          \
>> +     --host=$(GNU_TARGET_NAME) \\            \
>> +     --build=$(GNU_HOST_NAME),"              \
>> +       -i "$(@D)"/rebar.config.script
>> +endef
>> +
>> +EJABBERD_PRE_CONFIGURE_HOOKS +=                      \
>> +     EJABBERD_SET_LIBS_DIR                   \
>> +     EJABBERD_FIX_REBAR_CONFIG_SCRIPT
>> +
>> +# Guess answers for these tests, configure will bail out otherwise
>> +# saying error: cannot run test program while cross compiling.
>> +EJABBERD_CONF_ENV =                                          \
>> +  ac_cv_erlang_root_dir='$(HOST_DIR)/usr/lib/erlang'         \
>> +  $(foreach lib, $(EJABBERD_ERLANG_LIBS),                    \
>> +    ac_cv_erlang_lib_dir_$(lib)="$$erlang_lib_dir_$(lib)")
>
> Uneeded, with the trick above.
>
>> +# Set environment variables so the rebar compile command does
>> +# cross-compile ejabberd dependencies.
>> +EJABBERD_MAKE_ENV =                                                          \
>> +  $(TARGET_CONFIGURE_OPTS)                                                   \
>> +  $(TARGET_CONFIGURE_ARGS)                                                   \
>> +  LDFLAGS="-L$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sysroot/usr/lib/erlang/usr/lib"
>> +
>> +# Delete HOST_DIR prefix from ERL path in ejabberctl script.
>> +define EJABBERD_FIX_EJABBERDCTL
>> +     sed -e "s,ERL=$(HOST_DIR),ERL=,"                \
>> +       -e "s,INSTALLUSER=,INSTALLUSER=ejabberd,"     \
>> +       -i "$(TARGET_DIR)"/usr/sbin/ejabberdctl
>
> Use $(SED) ;
>
>     $(SED) 's,ERL=$(HOST_DIR),ERL=,; s,INSTALLUSER=,INSTALLUSER=ejabberd,' \
>            $(TARGET_DIR)/usr/sbin/ejabberdctl
>
>> +endef
>> +
>> +EJABBERD_POST_INSTALL_TARGET_HOOKS += EJABBERD_FIX_EJABBERDCTL
>> +
>> +define EJABBERD_PERMISSIONS
>> +/etc/ejabberd d 750 0 128 - - - - -
>> +/etc/ejabberd/ejabberd.yml-new f 640 0 128 - - - - -
>> +/etc/ejabberd/ejabberd.yml f 640 0 128 - - - - -
>> +/etc/ejabberd/ejabberdctl.cfg-new f 640 0 128 - - - - -
>> +/etc/ejabberd/ejabberdctl.cfg f 640 0 128 - - - - -
>> +/etc/ejabberd/inetrc f 644 0 128 - - - - -
>> +/usr/sbin/ejabberdctl f 550 0 128 - - - - -
>> +/usr/lib/ejabberd/priv/bin/captcha.sh f 750 119 0 - - - - -
>> +/usr/var/lib/ejabberd d 750 119 0 - - - - -
>> +/usr/var/lock/ejabberdctl d 750 119 0 - - - - -
>> +/usr/var/log/ejabberd d 750 119 0 - - - - -
>> +endef
>> +
>> +define EJABBERD_USERS
>> +ejabberd 119 ejabberd 128 * /var/run/ejabberd - - ejabberd daemon
>
> Do you really need those exact uid and gid? I'd prefer we let the user
> infra find free uid/gid, to avoid collisions.
>
> Regards,
> Yann E. MORIN.
>
>> +endef
>> +
>> +define EJABBERD_INSTALL_INIT_SYSV
>> +     $(INSTALL) -D -m 0755 package/ejabberd/S50ejabberd \
>> +             $(TARGET_DIR)/etc/init.d/S50ejabberd
>> +endef
>> +
>> +$(eval $(autotools-package))
>> --
>> 1.9.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Johan
()  ascii ribbon campaign - against html e-mail
/\  www.asciiribbon.org   - against proprietary attachments
