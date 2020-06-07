From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 13:40:42 +0200
Subject: [Buildroot] [PATCH 02/10] package/systemd: add libnss-systemd
 to name resolution
In-Reply-To: <20200206093633.251413-3-nolange79@gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-3-nolange79@gmail.com>
Message-ID: <20200607114042.GP13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nrobert, All,

On 2020-02-06 10:36 +0100, Norbert Lange spake thusly:
> The feature DynamicUser creates users/groups without
> touching the /etc/{passwd,group} files on disk.
> Adding the dynamic resolver to /etc/nsswitch.conf
> ensures the Names are resolved consistently.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/systemd.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 05b07cfd1b..a390cdd1a9 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -409,7 +409,15 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
>  	touch $(TARGET_DIR)/etc/machine-id
>  endef
>  
> +define SYSTEMD_ADD_NSSCONFIG_HOOK
> +	grep >/dev/null '^passwd:.*systemd' $(TARGET_DIR)/etc/nsswitch.conf || \

While this is valid sytx, we customarily put the redirection at the end
of the command.

However, in this case, you would want to use 'grep -q', as that does not
output anything.

> +		sed '/^passwd:/ s/$$/ systemd/' $(TARGET_DIR)/etc/nsswitch.conf

How can that even work? By default, sed will out put to stdout, not
replace in-place.

This clearly has not been tested (or git-commit --amend was forgotten).

In this case, you want to use $(SED) that includes the -i option to do
in-place modifications.

> +	grep >/dev/null '^group:.*systemd' $(TARGET_DIR)/etc/nsswitch.conf || \

Ditto grep -q.

> +		sed '/^group:/ s/$$/ systemd/' $(TARGET_DIR)/etc/nsswitch.conf

Ditto $(SED).

Regards,
Yann E. MORIN.

> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
> +	SYSTEMD_ADD_NSSCONFIG_HOOK \
>  	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
>  	SYSTEMD_INSTALL_RESOLVCONF_HOOK
> -- 
> 2.24.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
