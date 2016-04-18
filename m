From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 13:33:25 +0200
Subject: [Buildroot] [PATCH v8 04/14] core: add HOST_SANITIZE_RPATH_HOOK
 to TARGET_FINALIZE_HOOKS
In-Reply-To: <1460929111-15615-5-git-send-email-s.martin49@gmail.com>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
 <1460929111-15615-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20160418133325.4892c80b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 23:38:21 +0200, Samuel Martin wrote:

> +# RPATH fixing
> +# - The host hook sets RPATH in host ELF binaries, using relative paths to the
> +#   library locations.
> +# - The target hook sanitizes RPATH in target ELF binaries, removing paths
> +#   pointing to package's build directories or the sysroot's libdirs.

There is nothing in this patch that adds a target hook.

> +PACKAGES += host-patchelf
> +
> +define HOST_SANITIZE_RPATH_HOOK
> +	PATCHELF=$(HOST_DIR)/usr/bin/patchelf \
> +	READELF=readelf \
> +		$(TOPDIR)/support/scripts/fix-rpath host $(HOST_DIR)
> +endef
> +
> +TARGET_FINALIZE_HOOKS += HOST_SANITIZE_RPATH_HOOK

I find it somewhat odd that this gets done as a "target finalize" hook
since it really has nothing to do with finalizing the target. It really
just needs to be done "at the end of the build".

We could add that as a new target, but it would complexify the
dependency chain, so maybe adding to TARGET_FINALIZE_HOOKS is the
easiest solution after all.

One tricky aspect though is that not all host packages are guaranteed
to be built by the time TARGET_FINALIZE_HOOKS is called. Indeed,
TARGET_FINALIZE_HOOKS is guaranteed to be called after all *target*
packages have been built. But if a host package is needed just to
build a filesystem image for example, it is not guaranteed that it will
be built before TARGET_FINALIZE_HOOKS is called.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
