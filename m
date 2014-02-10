From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2014 18:06:31 +0100
Subject: [Buildroot] [PATCH] qemu: add host/target Linux version check
In-Reply-To: <1391896471-28299-1-git-send-email-fhunleth@troodon-software.com>
References: <1391896471-28299-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <52F90717.6010103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/08/14 22:54, Frank Hunleth wrote:
> Raise an error if the host is using an older kernel than the target.
> Since qemu-user passes emulated system calls to the host kernel,
> this prevents usage of qemu-user in situations where those system
> calls will fail.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

 Thanks Frank!

> ---
>  package/qemu/qemu.mk | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 093ae64..bd6f555 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -74,6 +74,24 @@ define HOST_QEMU_CONFIGURE_CMDS
>  	)
>  endef
>  
> +define HOST_QEMU_LINUX_VERSION_CHECK

 Just to be sure, I'd start with a

	test `uname -s` = Linux

(some people try to run buildroot on *BSDs, with varying degrees of success).

> +	host_version_parts=`uname -r | sed 's/\-.*//g' | sed 's/\./ /g'` ;\
> +	host_version_code=0 ;\
> +	multiplier=65536 ;\
> +	for host_version_part in $$host_version_parts; do \
> +		host_version_code=`echo "$$host_version_code + $$host_version_part * $$multiplier" | bc` ;\
> +		multiplier=`echo "$$multiplier / 256" | bc` ;\

 Even though we do put bc in our dependencies, I'd prefer to avoid
relying on it - not many people know it. Instead, I'd use either bash's
let builtin, or POSIX-compliant expr.

> +	done ;\
> +	target_version_code=`grep LINUX_VERSION_CODE $(STAGING_DIR)/usr/include/linux/version.h | awk '{print $$3}'` ;\

 You can do the grep inside the awk:

awk '/LINUX_VERSION_CODE/ {print $$3}' .../version.h



 Since it is possible to build host-qemu without building anything for
the target, you can't rely on version.h being present already. To make
sure it is there, add toolchain to the HOST_QEMU_DEPENDENCIES.

> +	if test $$host_version_code -lt $$target_version_code ; then \
> +		echo "Refusing to install qemu-user since the target Linux version is newer" ;\
> +		echo "than the host's. Missing system calls will fail." ;\
> +		exit 1 ;\
> +	fi
> +endef
> +
> +HOST_QEMU_POST_BUILD_HOOKS += HOST_QEMU_LINUX_VERSION_CHECK

 I think a pre-configure hook is more appropriate.


 Regards,
 Arnout

> +
>  $(eval $(host-autotools-package))
>  
>  # variable used by other packages
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
