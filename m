From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Nov 2019 12:03:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/minicom: make default port and
 lock directory config options
In-Reply-To: <0102016e8e961113-8b7cfd63-a693-49fd-93a3-70b7bb311860-000000@eu-west-1.amazonses.com>
References: <0102016e8e961113-8b7cfd63-a693-49fd-93a3-70b7bb311860-000000@eu-west-1.amazonses.com>
Message-ID: <20191123110346.GT32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2019-11-21 15:30 +0000, James Byrne spake thusly:
> Minicom's configure script will set values for the default port and lock
> directory based on the configuration of the host machine, which is not
> useful for cross-compiling, so make them config options that can be set
> to suit the target system.

Thnks for this patch.

However I wonder if it makes sense to have those configurable at all.

The man page of minicom states, for the lock dir, that it default to
/var/lock on Linux ("GNU/Linux systems use /var/lock"), so we should
probably set that. The user can provide an override in a system-wide
config file (in /etc/minicom/).

Also, I think we should just set the default port (aka device in minicom
terminology) do /dev/ttyS1, as written in the man page ("/dev/tty1 or
/dev/ttyS1 for most people"). Ditto, users may override that with a
system-wide config file.

So...

> Signed-off-by: James Byrne <james.byrne@origamienergy.com>
> ---
>  package/minicom/Config.in  | 16 ++++++++++++++++
>  package/minicom/minicom.mk |  3 +++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/package/minicom/Config.in b/package/minicom/Config.in
> index efc4f1b709..cb25d5710e 100644
> --- a/package/minicom/Config.in
> +++ b/package/minicom/Config.in
> @@ -14,3 +14,19 @@ config BR2_PACKAGE_MINICOM
>  comment "minicom needs a toolchain w/ wchar"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_USE_WCHAR
> +
> +if BR2_PACKAGE_MINICOM
> +
> +config BR2_PACKAGE_MINICOM_DFL_PORT
> +	string "Default port"
> +	default "/dev/ttyS1"
> +	help
> +	  This option defines Minicom's default modem device.
> +
> +config BR2_PACKAGE_MINICOM_LOCK_DIR
> +	string "Lock directory"
> +	default "/var/lock"
> +	help
> +	  This option defines the com line lock directory.
> +
> +endif

... I would remove those options, and...

> diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
> index 11d69d4d0e..7892b1f669 100644
> --- a/package/minicom/minicom.mk
> +++ b/package/minicom/minicom.mk
> @@ -22,4 +22,7 @@ define MINICOM_MKDIR_M4
>  endef
>  MINICOM_POST_PATCH_HOOKS += MINICOM_MKDIR_M4
>  
> +MINICOM_CONF_OPTS = --enable-dfl-port=$(BR2_PACKAGE_MINICOM_DFL_PORT) \
> +	--enable-lock-dir=$(BR2_PACKAGE_MINICOM_LOCK_DIR)

... just use the sane values here:

    MINICOM_CONF_OPTS = \
        --enable-dfl-port=/dev/ttyS1 \
        --enable-lock-dir=/var/lock

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
