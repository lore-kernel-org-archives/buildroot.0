From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 10:31:51 +0100
Subject: [Buildroot] [PATCH v2 06/15] reproducibility/linux: inhibit
 build-id
In-Reply-To: <1479460224-6119-7-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-7-git-send-email-jezz@sysmic.org>
Message-ID: <0274904d-a7d0-4ac1-dd28-73f920a77fa0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 10:10, J?r?me Pouiller wrote:
> By default, Linux kernel enable 'build-id'. 'build-id' tends to add random
> bytes in section .notes of kernel image[1]:

 Err, no, these are not random bytes, these are a sha1 of the content of the
file. If the build ID changes, it means the content has changed.

 One common way that the build ID can differ while the output files don't differ
is because of the source path that is recorded in the debug sections (which are
stripped in the end). But I think that reproducible builds when the source path
differs are very far away at this point...

> 
>   $ readelf -Wn .../vmlinux
>   Displaying notes found at file offset 0x00008000 with length 0x00000024:
>     Owner                 Data size       Description
>     GNU                  0x00000014       NT_GNU_BUILD_ID (unique build ID bitstring)
>       Build ID: ca689e2ed3944f49474715908e2ac1bb04907fb2
> 
> Therefore, we patch kernel Makefile to disable 'build-id'.
> 
> [1] https://kernelnewbies.org/BuildId
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  linux/linux.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7e826cc..a63d1f3 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -209,6 +209,13 @@ define LINUX_TRY_PATCH_TIMECONST
>  endef
>  LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
>  
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +define LINUX_REMOVE_BUILD_ID
> +	sed -i -e s/--build-id/--build-id=none/ $(@D)/Makefile

 build-id is also used in the VDSO, and there it is really mandatory to have it.

 Did you encounter a concrete problem with the build ID? And it didn't occur for
the VDSO, only for the vmlinux image? Could you trace it back to the individual
object file that has a different build ID?

 Regards,
 Arnout

> +endef
> +LINUX_POST_PATCH_HOOKS += LINUX_REMOVE_BUILD_ID
> +endif
> +
>  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>  LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
>  else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
