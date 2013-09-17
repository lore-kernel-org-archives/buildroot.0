From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Sep 2013 08:23:48 +0200
Subject: [Buildroot] [PATCH] Add support for eglibc-2.17 multiarch
 layout, from Linaro 2013.07+
In-Reply-To: <1379353155-26459-1-git-send-email-greg.beresford@zbdsolutions.com>
References: <1379353155-26459-1-git-send-email-greg.beresford@zbdsolutions.com>
Message-ID: <5237F574.9070700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/09/13 19:39, Greg Beresford wrote:
> From: Henry Luis <henry@echelon.com>
>
> Arch-specific libraries, including libc.so.6, are expected to be in a
> subdirectory of /lib (e.g. /lib/arm-linux-gnueabihf). This patch
> changes copy_toolchain_lib_root() in helper.mk to preserve the
> toolchain sysroot's lib directory structure, except for SUPPORT_LIB_DIR
> which are still copied directly under DESTDIR.
>
> Signed-off-by: Greg Beresford <greg.beresford@zbdsolutions.com>
> ---
> I've copied and reformatted Henry Luis' patch from the attachment to
> https://bugs.busybox.net/show_bug.cgi?id=6452. I've given it a test
> with Linaro ARM 2013.08 and CodeSourcery ARM 2013.05 toolchains and
> it seems to work ok. It does result in a non-hf ld-linux.so being
> copied in addition to the correct one on the linaro toolchain, but
> the target still works. (I think that this is because buildroot checks
> for both versions, and copies everything it successfully finds.)
>
> Also, this is my first submission to anything using git. I've tried to
> follow the instructions in the manual, so I hope everything is in order!

  The way you did it is perfect! I'm glad to see that documentation works :-)

>
> Regards
> Greg
>
>   toolchain/helpers.mk | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 0e270ee..b2b1b2f 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -50,11 +50,12 @@ copy_toolchain_lib_root = \
>   	LIB="$(strip $4)"; \
>   	DESTDIR="$(strip $5)" ; \
>    \
> +	pushd $${ARCH_SYSROOT_DIR} > /dev/null; \

  I don't see why this pushd change is needed, and I think it makes 
things even less clear.

  Regards,
  Arnout
>   	for dir in \
> -		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX) \
> -		$${ARCH_SYSROOT_DIR}/usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} \
> -		$${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} \
> -		$${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
> +		./$${ARCH_LIB_DIR}/$(TOOLCHAIN_EXTERNAL_PREFIX) \
> +		./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/$${ARCH_LIB_DIR} \
> +		./$${ARCH_LIB_DIR} \
> +		./usr/$${ARCH_LIB_DIR} \
>   		$${SUPPORT_LIB_DIR} ; do \
>   		LIBSPATH=`find $${dir} -maxdepth 1 -name "$${LIB}.*" 2>/dev/null` ; \
>   		if test -n "$${LIBSPATH}" ; then \
> @@ -66,18 +67,25 @@ copy_toolchain_lib_root = \
>   		LIBDIR=`dirname $${LIBPATH}` ; \
>   		while test \! -z "$${LIBNAME}" ; do \
>   			LIBPATH=$${LIBDIR}/$${LIBNAME} ; \
> -			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
> -			mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
> +			if [ "$${dir}" = "$${SUPPORT_LIB_DIR}" ]; then \
> +				DDIR=$${DESTDIR} ; \
> +			else \
> +				DDIR=$${LIBDIR} ; \
> +			fi; \
> +			rm -fr $(TARGET_DIR)/$${DDIR}/$${LIBNAME}; \
> +			mkdir -p $(TARGET_DIR)/$${DDIR}; \
>   			if test -h $${LIBPATH} ; then \
> -				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/; \
> +				cp -d $${LIBPATH} $(TARGET_DIR)/$${DDIR}/; \
>   			elif test -f $${LIBPATH}; then \
> -				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
> +				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DDIR}/$${LIBNAME}; \
>   			else \
> +				popd > /dev/null; \
>   				exit -1; \
>   			fi; \
>   			LIBNAME="`readlink $${LIBPATH}`"; \
>   		done; \
>   	done; \
> +	popd > /dev/null; \
>    \
>   	echo -n
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
