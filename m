From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 15:23:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/pseudo: fix build without xattr
In-Reply-To: <20190508144521.9783-1-fontaine.fabrice@gmail.com>
References: <20190508144521.9783-1-fontaine.fabrice@gmail.com>
Message-ID: <e265dce7-dc7b-61e2-35bb-e3fc1a8c9775@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/05/2019 16:45, Fabrice Fontaine wrote:
> Build of host-pseudo without xattr fails on:
> ports/linux/xattr/portdefs.h:1:10: fatal error: attr/xattr.h: No such file or directory
>  #include <attr/xattr.h>
> 
> xattr is enabled since
> http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/configure?id=6c6d0a3e4a4d382fd0b2e056a3ecffb015652767
> 
> So disable xattr through --enable-xattr=no as --disable-xattr is not
> supported
> 
> Fixes:
>  - No autobuilder failures

 There's no autobuilder failure because pseudo is not used. It was introduced to
replace fakeroot some time ago, but it brought too much pain.

 Instead of these fixes, the package should just be removed.

 Regards,
 Arnout

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pseudo/pseudo.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
> index 446427109f..54abd2a8d8 100644
> --- a/package/pseudo/pseudo.mk
> +++ b/package/pseudo/pseudo.mk
> @@ -24,6 +24,7 @@ HOST_PSEUDO_CONF_OPTS = \
>  	--with-rpath=$(HOST_DIR)/lib \
>  	--bits=$(if $(filter %64,$(HOSTARCH)),64,32) \
>  	--libdir=$(HOST_DIR)/lib \
> -	--with-sqlite=$(HOST_DIR)
> +	--with-sqlite=$(HOST_DIR) \
> +	--enable-xattr=no
>  
>  $(eval $(host-autotools-package))
> 
