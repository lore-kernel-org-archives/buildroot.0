From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Aug 2017 23:51:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/strongswan: Install libraries
 to /usr/lib
In-Reply-To: <1504042220-54681-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1504042220-54681-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <20170829215144.GA3684@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

On 2017-08-29 16:30 -0500, Sam Voss spake thusly:
> Install strongswan ipsec libraries into /usr/lib instead of
> /usr/lib/ipsec in an effort to not need a custom RPATH for this package.
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> ---
>  package/strongswan/strongswan.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 1070eea..febb33f 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -36,7 +36,8 @@ STRONGSWAN_CONF_OPTS += \
>  	--enable-scepclient=$(if $(BR2_PACKAGE_STRONGSWAN_SCEP),yes,no) \
>  	--enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no) \
>  	--enable-vici=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
> -	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no)
> +	--enable-swanctl=$(if $(BR2_PACKAGE_STRONGSWAN_VICI),yes,no) \
> +	--with-ipseclibdir=/usr/lib

The issue behind that, is that this directory is also used to derive the
location where to store plugins and the "IMC and IMV dynamic librariers"
(typo not mine for once!).

So, the plugins would end up in /usr/lib/plugins and the libs in
/usr/lib/imcvs.

This is not satifactory (at least the plugins stuff), so I'd suggest we
also force those locations (to their original values):

    --with-plugindir=/usr/lib/ipsec/plugins
    --with-imcvdir=/usr/lib/ipsec/imcvs

Could you check that, please? ;-)

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  STRONGSWAN_CONF_ENV += LIBS='-latomic'
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
