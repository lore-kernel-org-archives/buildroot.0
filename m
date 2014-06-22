From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 19:23:19 +0200
Subject: [Buildroot] [PATCH] openntpd: add SysV initscript and user
In-Reply-To: <1402486395-15125-1-git-send-email-gustavo@zacarias.com.ar>
References: <1402486395-15125-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140622172319.GA21768@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All

On 2014-06-11 08:33 -0300, Gustavo Zacarias spake thusly:
> Add the _ntp user that the daemon requires to work in any way.
> Add a SysV-style initscript as well, but not with '-s' (set time
> immediately after startup) because it can make the boot process stall
> for a few seconds if there's no proper network connectivity/dns setup.
> Make ntp and openntpd mutually exclusive since they overstep each other.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[--SNIP--]
> diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
> index f0e4f19..0fe6179 100644
> --- a/package/openntpd/openntpd.mk
> +++ b/package/openntpd/openntpd.mk
> @@ -10,4 +10,13 @@ OPENNTPD_CONF_OPT = --with-builtin-arc4random --disable-strip
>  OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
>  OPENNTPD_LICENSE_FILES = LICENCE
>  
> +define OPENNTPD_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/openntpd/S49ntp \
> +		$(TARGET_DIR)/etc/init.d/S49ntp
> +endef
> +
> +define OPENNTPD_USERS
> +_ntp -1 _ntp -1 * - - - Network Time Protocol daemon

Any reason why you name the user and group with a leading '_' ?

Regards,
Yann E. MORIN.

> +endef
> +
>  $(eval $(autotools-package))
> -- 
> 1.8.5.5
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
