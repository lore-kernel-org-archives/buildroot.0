From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 05 Sep 2019 09:20:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/luv: use github helper
In-Reply-To: <20190904200903.5198-1-fontaine.fabrice@gmail.com>
References: <20190904200903.5198-1-fontaine.fabrice@gmail.com>
Message-ID: <8b80ae1f894eb4bf06109422b428e206ecb940f2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Wed, 2019-09-04 at 22:09 +0200, Fabrice Fontaine wrote:
> Use github helper to retrieve archive as the current one does not
> contain libluv.pc.in which will break the build
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/5ec6b5a3622c343f7e401b7da7d4a1da15be2733
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/luv/luv.hash | 2 +-
>  package/luv/luv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/luv/luv.hash b/package/luv/luv.hash
> index c3a3062e1c..40a80bb0d8 100644
> --- a/package/luv/luv.hash
> +++ b/package/luv/luv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 420fc299f3b25aff55b839e9fe590982f45045b3e53ebeab2449eca7e23a106a  luv-1.30.1-0.tar.gz
> +sha256 751b7d88b05f3d54a0be3ada37a1c7fda31b2ca2f00511bd1d2015db3cf93959  luv-1.30.1-0.tar.gz
>  sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
> diff --git a/package/luv/luv.mk b/package/luv/luv.mk
> index 31288ffca3..fa5832546c 100644
> --- a/package/luv/luv.mk
> +++ b/package/luv/luv.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LUV_VERSION = 1.30.1-0
> -LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
> +LUV_SITE = $(call github,luvit,luv,$(LUV_VERSION))
>  LUV_LICENSE = Apache-2.0
>  LUV_LICENSE_FILES = LICENSE.txt
>  LUV_DEPENDENCIES = libuv

luv uses lua-compat-5.3, which is provided as a submodule, otherwise
building luv with Lua 5.1 will fail, even when applying your follow-up
patch.

The submodules are included in the tarball release, when using the
github helper, they are not, unless using LIBFOO_GIT_SUBMODULES.

I would suggest, rather then fetching all submodules (libuv, lua, lua-
compat-5.3, and luajit), which is time consuming, just add the upstream
libluv.pc.in to the package and copy it into the build directory in a
hook:

```
define LUV_INSTALL_PC_IN
	cp package/luv/libluv.pc.in $(@D)/
endef
LUV_POST_EXTRACT_HOOKS += LUV_INSTALL_PC_IN
```

Best regards
J?rg Krause
