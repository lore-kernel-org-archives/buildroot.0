From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Aug 2018 16:11:21 +0200
Subject: [Buildroot] [PATCH] package/pkg-download: quiet the dl-wrapper
 call
In-Reply-To: <20180820140812.8153-1-thomas.petazzoni@bootlin.com>
References: <20180820140812.8153-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180820141121.GG15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-20 16:08 +0200, Thomas Petazzoni spake thusly:
> The download wrapper call is currently always being displayed, even
> without V=1, which is a bit annoying. It shows something like this:
> 
> thomas at windsurf:~/projets/buildroot (master)$ make tslib-source
> >>> tslib 1.16 Downloading
> PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin" BR2_DL_DIR=/home/thomas/dl BUILD_DIR=/home/thomas/projets/buildroot/output/build O=/home/thomas/projets/buildroot/output flock /home/thomas/dl/tslib/ support/download/dl-wrapper -c '1.16' -d '/home/thomas/dl/tslib' -D '/home/thomas/dl' -f 'tslib-1.16.tar.xz' -H 'package/tslib//tslib.hash' -n 'tslib-1.16' -N 'tslib' -o '/home/thomas/dl/tslib/tslib-1.16.tar.xz'  -u https+https://github.com/kergoth/tslib/releases/download/1.16 -u http\|urlencode+http://sources.buildroot.net/tslib -u http\|urlencode+http://sources.buildroot.net  --
> 
> Let's silence this dl-wrapper call by prepending with $(Q).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 2ca6ccf44d..bf93b9a08e 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -92,7 +92,7 @@ endif
>  
>  define DOWNLOAD
>  	$(Q)mkdir -p $($(PKG)_DL_DIR)
> -	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
> +	$(Q)$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
>  		-c '$($(PKG)_DL_VERSION)' \
>  		-d '$($(PKG)_DL_DIR)' \
>  		-D '$(DL_DIR)' \
> -- 
> 2.14.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
