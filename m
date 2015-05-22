From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 May 2015 00:01:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: new package
In-Reply-To: <1432329673-6145-1-git-send-email-rdkehn@yahoo.com>
References: <1432329673-6145-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150522220148.GC5153@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, All,

On 2015-05-22 16:21 -0500, Doug Kehn spake thusly:
> Name Service Switch (NSS) module that allows your LDAP server to provide
> user account, group, host name, alias, netgroup, and basically any other
> information that you would normally get from /etc flat files or NIS. It
> also provides a Pluggable Authentication Module (PAM) to do
> authentication to an LDAP server.

He! Great! :-)

> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
[--SNIP--]
> diff --git a/package/nss-pam-ldapd/Config.in b/package/nss-pam-ldapd/Config.in
> new file mode 100644
> index 0000000..9dda7a7
> --- /dev/null
> +++ b/package/nss-pam-ldapd/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_NSS_PAM_LDAPD
> +	bool "nss-pam-ldapd"
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  nss-pam-ldapd which provides a Name Service Switch (NSS)

s/which//

> +	  module that allows your LDAP server to provide user account,
> +	  group, host name, alias, netgroup, and basically any other
> +	  information that you would normally get from /etc flat files
> +	  or NIS. It also provides a Pluggable Authentication Module
> +	  (PAM) to do authentication to an LDAP server.

Should the PAM module be alwaus installed, even if we do not have
linux-pam installed? I.e. use --enable-pam / --disable-pam
accordingly...

> +	  http://arthurdejong.org/nss-pam-ldapd/

Since the package has a dependency on glibc, there's no need to depend
on MMU (because glibc already itself is only available on systems with
an MMU).

Beside, you need to add a comment stating that nss-pam-ldapd needs a
(e)glibc toolchain, like explained in the manual, chapter "17.2.2.
Dependencies on target and toolchain options" :

    http://buildroot.net/downloads/manual/manual.html#dependencies-target-toolchain-options

like so:

    comment "nss-pam-ldapd needs an (e)glibc toolchain"
        depends on !BR2_TOOLCHAIN_USES_GLIBC

> diff --git a/package/nss-pam-ldapd/S45nslcd b/package/nss-pam-ldapd/S45nslcd
> new file mode 100644
> index 0000000..e9c00f3
> --- /dev/null
> +++ b/package/nss-pam-ldapd/S45nslcd
> @@ -0,0 +1,31 @@
> +#!/bin/sh
> +
> +NAME="nslcd"
> +DAEMON="/usr/sbin/${NAME}"
> +DAEMON_CONF="/etc/${NAME}.conf"
> +
> +[ -x ${DAEMON} ] || exit 0

Since this script is only installed when nss-pam-ldapd itself is
installed, you are guaranteed the daemon will be installed, no need to
check for that.

> +[ -f ${DAEMON_CONF} ] || exit 0

This variable is used nowhere in this startup script, so get rid of it.
If you really need to test that the configuration file exists, just use:

    if [ ! -f /etc/nslcd.conf ]; then
        printf "No configuration file\n" >&2
        exit 0  # Or '1' to explicitly return an error code
    fi

However, I think it is best to just install the sample config file
packaged with nss-pam-ldapd which ensures there *is* a config file on
the target, so you don;t even have to check its existence in the startup
script.

> +case "$1" in
> +start)
> +        echo -n "Starting ${NAME}: "
> +        start-stop-daemon -S -x ${DAEMON}
> +        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
> +        ;;
> +stop)
> +        echo -n "Stopping ${NAME}: "
> +        start-stop-daemon -K -x ${DAEMON}
> +        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
> +        ;;
> +restart|reload)
> +        $0 stop
> +        $0 start
> +        ;;
> +*)
> +        echo "Usage: $0 {start|stop|restart|reload}"
> +        exit 1
> +esac
> +
> +exit 0

"exit 0" not needed.

> diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
> new file mode 100644
> index 0000000..21e61f6
> --- /dev/null
> +++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
> @@ -0,0 +1,2 @@
> +# From http://arthurdejong.org/nss-pam-ldapd/
> +md5	1f0517d2c46ca1d8ecdbe23a671edc83	nss-pam-ldapd-0.9.5.tar.gz

When upstream only provides an md5 (or no hash at all), we add a
locally-computed stronger hash, and we like to use sha256. So add it as
thus:

    # From http://arthurdejong.org/nss-pam-ldapd/
    md5  1f0517d2c46ca1d8ecdbe23a671edc83  nss-pam-ldapd-0.9.5.tar.gz
    # Locally computed:
    sha256  abcdef1234567890abcdef1234567890  nss-pam-ldapd-0.9.5.tar.gz

If you can check the signature (http://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.5.tar.gz.sig)
(i.e. you have a path of trust to the signer), you can change the
comment as thus;

    # Locally computed after checking http://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.5.tar.gz.sig:

> diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
> new file mode 100644
> index 0000000..a650803
> --- /dev/null
> +++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# nss-pam-ldapd
> +#
> +################################################################################
> +
> +NSS_PAM_LDAPD_VERSION = 0.9.5
> +NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
> +NSS_PAM_LDAPD_LICENSE = LGPLv2.1+
> +NSS_PAM_LDAPD_LICENSE_FILES = LICENSE
> +NSS_PAM_LDAPD_INSTALL_STAGING = YES

It has a build-dependency on linux-pam:

    checking security/pam_modutil.h usability... no
    checking security/pam_modutil.h presence... no
    checking for security/pam_modutil.h... no
    configure: error: PAM header files are missing

So you need to select it in Config.in (and inherit the dependencies of
linux-pam), or depend on it in Config.in, and then add:

    NSS_PAM_LDAPD_DEPENDENCIES = linux-pam

Also, taking into account that linux-pam can be made optional:

    ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
    NSS_PAM_LDAPD_CONF_OPTS = --enable-pam
    NSS_PAM_LDAPD_DEPENDENCIES = linux-pam
    else
    NSS_PAM_LDAPD_CONF_OPTS = --enable-pam
    endif

It then breaks because it can't find ldap.h:

    checking for ldap.h... no
    configure: error: could not locate <ldap.h>

So it probably also needs to depend on openldap:

    NSS_PAM_LDAPD_DEPENDENCIES += openldap

I haven't build further for now, so there might be other dependencies. A
simple way to find them is to do a build with just nss-pam-ldapd enabled
and see what breaks.

> +define NSS_PAM_LDAPD_USERS
> +	nslcd -1 nslcd -1 * - - - nslcd user
> +endef
> +
> +define NSS_PAM_LDAPD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 755 -D package/nss-pam-ldapd/S45nslcd \
> +		$(TARGET_DIR)/etc/init.d/S45nslcd
> +endef

Do you think you could provide a systemd unit file as well? That would
be great if you could. ;-)

Care to address those issues, then resubmit (and Cc: me please, so I
notice).

Thanks! :-)

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> -- 
> 2.4.1
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
