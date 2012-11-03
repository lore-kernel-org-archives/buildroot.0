From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 00:35:36 +0100
Subject: [Buildroot] [PATCH 02/18] busybox: don't force FEATURE_NFS_MOUNT
In-Reply-To: <ce9a6aa9dfc0c6dc3496b272670a8370b638aa21.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <ce9a6aa9dfc0c6dc3496b272670a8370b638aa21.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5095AA48.4010805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/12 18:47, Thomas Petazzoni wrote:
> Instead of making the Busybox configuration more complicated by trying
> to adjust it depending on whether RPC is available or not (which gets
> complicated when RPC support can be provided by libtirpc), simplify
> things by letting the user enable FEATURE_NFS_MOUNT or not depending
> on whether RPC support is available or not.
>
> Our default configuration do not enable FEATURE_NFS_MOUNT, so users
> will not face any build problems by default. Only if they explicitly
> enable FEATURE_NFS_MOUNT will they have to make sure that the
> toolchain has RPC support, or that libtirpc is enabled (support for
> this added in a followup patch).
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

  Except for one comment below:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> ---
>   package/busybox/busybox.mk |   11 -----------
>   1 file changed, 11 deletions(-)
>
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 33f8633..306b46f 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -81,17 +81,6 @@ define BUSYBOX_SET_IPV6
>   endef
>   endif
>
> -# If RPC is enabled then enable nfs mounts
> -ifeq ($(BR2_INET_RPC),y)
> -define BUSYBOX_SET_RPC
> -	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MOUNT_NFS,$(BUSYBOX_BUILD_CONFIG))
> -endef
> -else
> -define BUSYBOX_SET_RPC
> -	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_MOUNT_NFS,$(BUSYBOX_BUILD_CONFIG))
> -endef
> -endif
> -

  You forgot to remove the use of $(BUSYBOX_SET_RPC)


  Regards,
  Arnout

>   # If we're using static libs do the same for busybox
>   ifeq ($(BR2_PREFER_STATIC_LIB),y)
>   define BUSYBOX_PREFER_STATIC

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
