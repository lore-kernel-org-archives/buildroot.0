From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 01:12:32 +0100
Subject: [Buildroot] [PATCH 02/18] busybox: don't force FEATURE_NFS_MOUNT
In-Reply-To: <ce9a6aa9dfc0c6dc3496b272670a8370b638aa21.1351964808.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 3 Nov 2012 18:47:47 +0100")
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <ce9a6aa9dfc0c6dc3496b272670a8370b638aa21.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874nl6w7in.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Instead of making the Busybox configuration more complicated by trying
 Thomas> to adjust it depending on whether RPC is available or not (which gets
 Thomas> complicated when RPC support can be provided by libtirpc), simplify
 Thomas> things by letting the user enable FEATURE_NFS_MOUNT or not depending
 Thomas> on whether RPC support is available or not.

 Thomas> Our default configuration do not enable FEATURE_NFS_MOUNT, so users
 Thomas> will not face any build problems by default. Only if they explicitly
 Thomas> enable FEATURE_NFS_MOUNT will they have to make sure that the
 Thomas> toolchain has RPC support, or that libtirpc is enabled (support for
 Thomas> this added in a followup patch).

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/busybox/busybox.mk |   11 -----------
 Thomas>  1 file changed, 11 deletions(-)

 Thomas> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
 Thomas> index 33f8633..306b46f 100644
 Thomas> --- a/package/busybox/busybox.mk
 Thomas> +++ b/package/busybox/busybox.mk
 Thomas> @@ -81,17 +81,6 @@ define BUSYBOX_SET_IPV6
 Thomas>  endef
 Thomas>  endif
 
 Thomas> -# If RPC is enabled then enable nfs mounts
 Thomas> -ifeq ($(BR2_INET_RPC),y)
 Thomas> -define BUSYBOX_SET_RPC
 Thomas> -	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MOUNT_NFS,$(BUSYBOX_BUILD_CONFIG))
 Thomas> -endef
 Thomas> -else
 Thomas> -define BUSYBOX_SET_RPC
 Thomas> -	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_MOUNT_NFS,$(BUSYBOX_BUILD_CONFIG))
 Thomas> -endef
 Thomas> -endif

You forgot to remove it from BUSYBOX_CONFIGURE_CMDS. I've fixed that and
committed, thanks.

-- 
Bye, Peter Korsgaard
