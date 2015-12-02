From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 21:57:06 +0100
Subject: [Buildroot] [PATCH 1/9] wireshark: forcibly disable lua
In-Reply-To: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151202205706.GA5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-12-02 17:48 -0300, Gustavo Zacarias spake thusly:
> If host arch = target arch and liblua is in the host the buildsystem
> will pick it up and try to use it since it passes basic build tests.
> Forcibly disable it, since it causes no build failure, rather runtime
> failures because said liblua is not present on the target.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wireshark/wireshark.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 366134d..867b945 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -26,6 +26,7 @@ WIRESHARK_CONF_OPTS = \
>  	--enable-static=no \
>  	--with-gnutls=no \
>  	--with-libsmi=no \
> +	--with-lua=no \

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, why not conditionally add it, like o:

ifeq ($(BR2_PACKAGE_LUA),y)
WIRESHARK_DEPENDENCIES += lua
else
WIRESHARK_CONF_OPTS += --with-lua=no
endif

Regards,
Yann E. MORIN.

>  	--includedir=$(STAGING_DIR)/usr/include
>  
>  $(eval $(autotools-package))
> -- 
> 2.4.10
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
