From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 Apr 2018 16:51:39 +0200
Subject: [Buildroot] [PATCH] glibc: install the obsolete libnsl
In-Reply-To: <d9f3b3cf8413fcabd4468a6057ee399a3968d20d.1520956780.git.baruch@tkos.co.il>
References: <d9f3b3cf8413fcabd4468a6057ee399a3968d20d.1520956780.git.baruch@tkos.co.il>
Message-ID: <0418f92d-f988-da20-4561-dbf786afed94@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, All,

Le 13/03/2018 ? 16:59, Baruch Siach a ?crit?:
> glibc 2.27 stopped installing libnsl by default. Restore libnsl install
> to fix packages, like exim, that use that library.

Do you know if libnsl can be disabled from exim ?
Is exim is the only remaining program still using/supporting libnsl ?

libnsl from Glibc doesn't build with the upcoming gcc 8, it's not even build
tested by Glibc maintainers (build-many-glibcs.py test script) see [1].

Maybe we can provide libnsl from a package that provide an updated version of
this library [2]?

Can you have a look?

Best regards,
Romain

[1] http://patchwork.sourceware.org/patch/26437
[2] https://github.com/thkukuk/libnsl.git

> 
> Fixes (exim):
> http://autobuild.buildroot.net/results/a19/a19df43be7d27cf8815e1257122d25aa8285d75b/
> http://autobuild.buildroot.net/results/8ec/8ecfc42a81efec8485784f945e231eb40a087b5b/
> http://autobuild.buildroot.net/results/054/054eb702a9b8c66454970333ef45a0afccb7cc80/
> 
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/glibc/glibc.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 00e114566cbe..f724ced857fe 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -100,6 +100,7 @@ define GLIBC_CONFIGURE_CMDS
>  		--disable-profile \
>  		--without-gd \
>  		--enable-obsolete-rpc \
> +		--enable-obsolete-nsl \
>  		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
>  		--with-headers=$(STAGING_DIR)/usr/include)
>  	$(GLIBC_ADD_MISSING_STUB_H)
> 
