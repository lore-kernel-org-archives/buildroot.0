From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 1 Mar 2014 00:39:10 +0100
Subject: [Buildroot] [PATCH] legal-info: extract even no-redistribute
	packages
In-Reply-To: <1393605956-18133-1-git-send-email-yann.morin.1998@free.fr>
References: <1393605956-18133-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAHkwnC_J=bVgXyK5X-MPA5csths8M1OkxnxU=d6Zk9=7gYc3Bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 28, 2014 at 5:45 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> If a package is marked _REDISTRIBUTE = NO, then legal-info will not
> try to extract it first.
>
> If that package also declares some _LICENSE_FILES, legal-info fails
> if it is the only action we're trying to run:
>
>     $ cat defconfig
>     BR2_INIT_NONE=y
>     BR2_PACKAGE_LIBFSLCODEC=y
>     $ make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
>     $ make libfslcodec-legal-info
>     /bin/sh: /home/ymorin/dev/buildroot/O/legal-info/licenses.txt: No such file or directory
>     make[1]: *** [libfslcodec-legal-info] Error 1
>
> Fix this by always having legal-info extract the archives if one or
> more _LICENSE_FILES are specified.
>
> Fixes:
>     http://autobuild.buildroot.net/results/884/884ba13bb024fd9a4818f3184495b2cccc3f595e/
>     http://autobuild.buildroot.net/results/b6e/b6e152ce117764337c243a9f356b32064106f5c3/
>     http://autobuild.buildroot.net/results/a58/a588b3b535a1259f7bc110a6323e5f33830bcd94/
>     http://autobuild.buildroot.net/results/6d5/6d5da7fe5aee871d98fd5503875453556ccbf854/
>     [...]
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  package/pkg-generic.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 339c3eb..7b4d04e 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -555,7 +555,8 @@ $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
>  endif
>  $(2)_MANIFEST_LICENSE_FILES ?= not saved
>
> -ifeq ($$($(2)_REDISTRIBUTE),YES)
> +# If the package declares _LICENSE_FILES, we need to extract it
> +ifneq ($$($(2)_LICENSE_FILES),)
>  ifneq ($$($(2)_SITE_METHOD),local)
>  ifneq ($$($(2)_SITE_METHOD),override)

If  the package declares _LICENSE_FILES we need to extract it even if
SITE_METHOD is local or override?

Regards
-- 
Fabio Porcedda
