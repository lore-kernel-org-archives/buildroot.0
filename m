From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Jun 2017 21:20:14 +0200
Subject: [Buildroot] [PATCH 2/2] package/nut: specify --with-user/group
 when building NUT
In-Reply-To: <20170608153557.30726-1-mail@jens-maus.de>
References: <20170608153557.30726-1-mail@jens-maus.de>
Message-ID: <20170608192014.GB3058@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jens, All,

On 2017-06-08 17:35 +0200, Jens Maus spake thusly:
> This commit fixes a problem where the NUT package couldn't be
> used as a NUT server due to the fact that the default group for
> nobody is "nogroup" and not "nobody" like the internal default
> of NUT. Thus, when starting a NUT server daemon the daemon starts
> with incorrect group permissions and generated some error messages.
> This commit fixes this shortcoming by specifying --with-user/group
> when running configure.
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> ---
>  package/nut/nut.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nut/nut.mk b/package/nut/nut.mk
> index 332ccf907..ab8a17868 100644
> --- a/package/nut/nut.mk
> +++ b/package/nut/nut.mk
> @@ -18,7 +18,9 @@ NUT_AUTORECONF = YES
>  # since the default location (/var/state/ups) maybe readonly.
>  NUT_CONF_OPTS = \
>  	--with-altpidpath=/var/run/upsd \
> -	--without-hal
> +	--without-hal \
> +	--with-user=nobody \

'nobody' is the default for the user, so it does not seem to be needed
to specify it, as we do have nobody. Being explicit is probably better.

> +	--with-group=nogroup

Yup.

Note however that nut does not recommend running as nobody/nogroup.

Instead, I would suggest we do add a user definition for nut, and
use that for configure.

    define NUT_USER
        nut -1 nut -1 * - - - Nut user
    endef

Regards,
Yann E. MORIN.

>  # For uClibc-based toolchains, nut forgets to link with -lm
>  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
