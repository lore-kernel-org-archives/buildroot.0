From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:01:13 +0200
Subject: [Buildroot] [PATCH] package/libxslt: fix static build
In-Reply-To: <1459199363-28640-1-git-send-email-joerg.krause@embedded.rocks>
References: <1459199363-28640-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160329030113.55474130@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 23:09:23 +0200, J?rg Krause wrote:
> Set --with-libxml-libs-prefix so libtool finds the correct dependencies for
> libxml2.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3f8/3f8d876ed6cfe6e73a75fa8904ebdd3f6f0fe53c/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libxslt/libxslt.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index 2e5cc14..0cc4bb9 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -14,7 +14,8 @@ LIBXSLT_CONF_OPTS = \
>  	--with-gnu-ld \
>  	--without-debug \
>  	--without-python \
> -	--with-libxml-prefix=$(STAGING_DIR)/usr/
> +	--with-libxml-prefix=$(STAGING_DIR)/usr/ \
> +	--with-libxml-libs-prefix=$(STAGING_DIR)/usr/lib

I've applied because it indeed works, but to be honest, I don't
understand why: I don't quite understand how this can fix the build.
All what this option does is:

AC_ARG_WITH(libxml-libs-prefix,
        [  --with-libxml-libs-prefix=[PFX]      Specify location of libxml libs],
        LIBXML_LIBS="-L$withval"
)

I.e, it will add -L$(STAGING_DIR)/usr/lib to the gcc options. But that
is completely useless because $(STAGING_DIR)/usr/lib is already the
default search path for libraries. So why does it fix the build? I
don't know.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
