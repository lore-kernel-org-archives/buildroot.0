From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2018 14:45:02 +0100
Subject: [Buildroot] [PATCH v2] package/openssh: Add sysusers.d snippet
In-Reply-To: <20180216181016.8747-1-chris.lesiak@licor.com>
References: <20180123232221.6106-1-chris.lesiak@licor.com>
 <20180216181016.8747-1-chris.lesiak@licor.com>
Message-ID: <20181216134502.GB2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, All,

Sorry for thr huge delay in replying to this patch of your...

On 2018-02-16 12:10 -0600, Chris Lesiak spake thusly:
> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 6b7ac22c19..5d099ceb13 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -60,12 +60,20 @@ else
>  OPENSSH_CONF_OPTS += --without-selinux
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
> +define OPENSSH_INSTALL_SYSTEMD_SYSUSERS
> +	$(INSTALL) -m 0644 -D package/openssh/sshd_sysusers.conf \
> +		$(TARGET_DIR)/usr/lib/sysusers.d/sshd.conf
> +endef
> +endif
> +
>  define OPENSSH_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/openssh/sshd.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/sshd.service
>  	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>  	ln -fs ../../../../usr/lib/systemd/system/sshd.service \
>  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/sshd.service
> +	$(OPENSSH_INSTALL_SYSTEMD_SYSUSERS)
>  endef
>  
>  define OPENSSH_INSTALL_INIT_SYSV
> diff --git a/package/openssh/sshd_sysusers.conf b/package/openssh/sshd_sysusers.conf
> new file mode 100644
> index 0000000000..3ea46f65c6
> --- /dev/null
> +++ b/package/openssh/sshd_sysusers.conf
> @@ -0,0 +1,5 @@
> +# sysusers.d snippet for creating the sshd system user automatically
> +# at boot on systemd-based systems that ship with an unpopulated
> +# /etc. See sysusers.d(5) for details.

No need for this boilerplate (which ends up being much bigger than the
actual content...)

> +u sshd - "Privilege-separated SSH"

We've discussed this a bit with Thomas, and there is one thing that we
did not like much, is that it is not integrated nicely in the existing
users support in Buildroot.

Shouldn't we have a generic mechanism, that takes all the FOO_USERS, and
turns them into sysusers.d(%) entries? Maybe something like:

    define SYSTEMD_SYSUSERS
        mkdir -p $(TARGET_DIR)/usr/lib/sysusers.d/
        echo "$(PACKAGES_USERS)" \
        |while read user uid group gid passwd home shell groups comment; do
            printf "u %s %s %s\n" "${user}" "${uid}" "${comment}"
        done >$(TARGET_DIR)/usr/lib/sysusers.d/buildroot.conf
        # And similarly for groups...
    endef
    SYSTEMD_POST_TARGET_FINALIZE_HOOKS = SYSTEMD_SYSUSERS

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
