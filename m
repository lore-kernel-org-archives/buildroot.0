From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 May 2016 23:01:47 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/external: fix arch-subdir
In-Reply-To: <4a3ee1a4c558263f5d64209bc6f74f8994b80921.1464534979.git.yann.morin.1998@free.fr>
References: <cover.1464534979.git.yann.morin.1998@free.fr>
 <4a3ee1a4c558263f5d64209bc6f74f8994b80921.1464534979.git.yann.morin.1998@free.fr>
Message-ID: <9d9af24c-2064-3ba2-21ba-5042b0a76b7c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/29/16 17:17, Yann E. MORIN wrote:
> When there is no architecture-specific sub-directory in the sysroot, we
> expect ARCGH_SUBDIR to be empty.
> 
> However, with the current code, it is not (with an intrumented
> copy_toolchain_sysroot, when copying a ct-ng toolchain):
> 
>     >>> toolchain-external undefined Copying external toolchain sysroot to
>     >>> staging...
>     main sysroot: /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
>     arch sysroot: /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
>     arch subdir:  /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
>     lib dir:      lib
>     support dir:
> 
> ... when we would have expected 'arch subdir' to be empty.

 So, I checked, and it doesn't hurt that it's not empty, because ARCH_SUBDIR is
only used within this condition:

if [ $${SYSROOT_DIR_CANON} != $${ARCH_SYSROOT_DIR_CANON} ]

i.e. if SYSROOT == ARCH_SYSROOT, ARCH_SUBDIR will not be used. Makes sense too,
of course: if there is no arch-specific sysroot directory, then there's no need
to create the relative symlinks.

 That said, for consistency it's of course nicer to make ARCH_SUBDIR empty. But
that's not needed for 2016.05.

> 
> Fix the matching pattern to correctly return an empty string if there is
> no arch subdir.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 47b951d..3af56b8 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -662,7 +662,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
>  			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
>  		fi ; \
>  	fi ; \
> -	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
> +	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}((.*[^/])/?)?$$:\2:"` ; \

 Simpler alternative (just tested in the shell, not in an actual build):

ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -n -r -e
"\:^$${SYSROOT_DIR}(.*)/$$:s::\1:p"`

Well, at least I find this regex easier to parse. Also, your version still gives
a newline (which admittedly will be stripped inside the funciton) while mine is
really an empty string.


 Regards,
 Arnout


>  	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
>  	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
>  endef
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
