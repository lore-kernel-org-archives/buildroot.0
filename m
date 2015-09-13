From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 12:50:25 +0200
Subject: [Buildroot] [PATCH v2] mtd: fix static build with uuid
In-Reply-To: <2ee5281619493115a4a6bd865596d3d328087cd7.1441944517.git.baruch@tkos.co.il>
References: <2ee5281619493115a4a6bd865596d3d328087cd7.1441944517.git.baruch@tkos.co.il>
Message-ID: <20150913125025.0bf84df1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 11 Sep 2015 07:08:37 +0300, Baruch Siach wrote:
> The uuid library might depend on gettext. Use pkg-config to discover uuid
> dependencies at build time, and edit Makefile accordingly to avoid missing
> symbols when linking statically.
> 
> Based on a patch from Vicente Olivert Riera.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2dd/2ddd714446d9eb75701bd48c117dc5bbbd291a76/
> http://autobuild.buildroot.net/results/3af/3af4ef252c8cb2b22134d91ce48e5930c60ec437/
> http://autobuild.buildroot.net/results/648/648341fce974e8f016eee57c95d7511a886eef49/
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>    * Use backticks instead of $(shell ...) make function (Arnout)
> ---
>  package/mtd/mtd.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 0fb9fc2c1acc..89cfac15756a 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -16,8 +16,14 @@ ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
>  MTD_DEPENDENCIES = zlib lzo
>  endif
>  
> +MTD_MKFSUBIFS_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs uuid`

Is there any reason for this definition to be outside of the
BR2_PACKAGE_MTD_MKFSUBIFS=y condition? It would be more logical, and
people wouldn't wonder why you're using PKG_CONFIG_HOST_BINARY outside
of the condition, while host-pkgconf is only added to the dependencies
inside the condition.

Also, ideally we should be patching the mtd Makefile to use pkg-config,
and submit that upstream (with maybe a fallback on a default value if
pkg-config is not available).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
