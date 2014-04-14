From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Apr 2014 11:39:44 +0200
Subject: [Buildroot] [PATCH 1/2] systemd: add option to enable
 compatibility libs
In-Reply-To: <1397467537-22766-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1397467537-22766-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1397467537-22766-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140414093944.GA3199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-04-14 11:25 +0200, Eric Le Bihan spake thusly:
> Since systemd 209, some libraries have been merged into libsystemd.so:
> 
>  - libsystemd-daemon.so
>  - libsystemd-id128.so
>  - libsystemd-journal.so
>  - libsystemd-login.so
> 
> A new configuration menu entry has been added to enable the installation
> of compatibility pkg-config files, so that programs that depend on them
> can still be built.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But see small comment below...

[--SNIP--]
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index ecedfce..4fa0e89 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -46,6 +46,10 @@ SYSTEMD_CONF_OPT += \
>  	--disable-dbus \
>  	--without-python
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
> +SYSTEMD_CONF_OPT += --enable-compat-libs
> +endif

I guess the default in systemd's ./configure is --disable-compat-libs.
But I'd prefer we enforce that with an else-block:

    ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
    SYSTEMD_CONF_OPT += --enable-compat-libs
    else
    SYSTEMD_CONF_OPT += --disable-compat-libs
    endif

I know Peter does not really mind in that case, so I won't complain much
if this goes in as is. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
