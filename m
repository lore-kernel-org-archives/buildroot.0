From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 14:12:37 +0100
Subject: [Buildroot] [PATCH] jimtcl: fix compile problem for sparc64
In-Reply-To: <20151121092330.GA14832@waldemar-brodkorb.de>
References: <20151121092330.GA14832@waldemar-brodkorb.de>
Message-ID: <20151122141237.56376bc9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Sat, 21 Nov 2015 10:23:31 +0100, Waldemar Brodkorb wrote:
> It is general safe to use -fPIC for all architectures.
> -fpic breaks sparc64 compile.
> 
> Runtime tested on Qemu ARM, MIPS and SPARC64.
> 
> Fixes:
> http://autobuild.buildroot.net/results/98f391ad13f22828c022f185c0166daabdb4c1ad/
> 
> It also addresses a problem with the wrong symlink for the shared library
> recognized while runtime testing.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> ---
>  package/jimtcl/jimtcl.mk |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
> index e79e0f6..79fa742 100644
> --- a/package/jimtcl/jimtcl.mk
> +++ b/package/jimtcl/jimtcl.mk
> @@ -33,8 +33,8 @@ else
>  JIMTCL_SHARED = --shared
>  define JIMTCL_INSTALL_LIB
>  	$(INSTALL) -m 0755 -D $(@D)/libjim.so.$(JIMTCL_VERSION) \
> -		$(1)/usr/lib/libjim.$(JIMTCL_VERSION)
> -	ln -s libjim.$(JIMTCL_VERSION) $(1)/usr/lib/libjim.so
> +		$(1)/usr/lib/libjim.so.$(JIMTCL_VERSION)
> +	ln -sf libjim.so.$(JIMTCL_VERSION) $(1)/usr/lib/libjim.so

This is unrelated to sparc64 fix, so it should be a separate patch
(though it is obviously a good fix).

> @@ -47,6 +47,8 @@ define JIMTCL_CONFIGURE_CMDS
>  endef
>  
>  define JIMTCL_BUILD_CMDS
> +	SH_CFLAGS="-fPIC" \
> +	SHOBJ_CFLAGS="-fPIC" \

In other packages (such as elfutils), you made passing -fPIC
conditional on sparc64. Why don't we do the same here? I believe on
many platforms -fpic and -fPIC are the same, but I think we should be
consistent in the way we handle this before the different packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
