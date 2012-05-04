From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 4 May 2012 21:17:42 +0200
Subject: [Buildroot] [PATCH v4] linux: install dtc (device tree
 compiler) as host tool if selected
In-Reply-To: <6099ad9232bcbe718d3a.1333743030@beantl019720>
References: <6099ad9232bcbe718d3a.1333743030@beantl019720>
Message-ID: <CAAXf6LW3+aPgB9u7ZgLefTG26CcsSVYLOiWYnaoQxRDchxeSbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 6, 2012 at 10:10 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Having dtc as a host tool can be useful for users that have a custom
> boot scenario where the device tree is not embedded in the kernel.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> v2: remove old parameters to GENTARGETS call, sorry.
> v3: rename Config.in.host and depend on Linux (comments Arnout)
> v4: no need for a separate package, just put the logic in linux.mk
> ? ?(suggestion of Alexandre Pereira da Silva, thanks!)
>
> ?linux/linux.mk | ?10 ++++++++++
> ?1 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -183,6 +183,15 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TAR
> ?endef
> ?endif
>
> +
> +define LINUX_INSTALL_HOST_TOOLS
> + ? ? ? # Installing dtc (device tree compiler) as host tool, if selected
> + ? ? ? if grep -q "CONFIG_DTC=y" $(@D)/.config; then ? \
> + ? ? ? ? ? ? ? $(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ; ? \
> + ? ? ? fi
> +endef
> +
> +
> ?define LINUX_INSTALL_IMAGES_CMDS
> ? ? ? ?cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> ?endef
> @@ -197,6 +206,7 @@ define LINUX_INSTALL_TARGET_CMDS
> ? ? ? ? ? ? ? ?rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ; ? ? ? ? \
> ? ? ? ? ? ? ? ?rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ; ? ? ? ?\
> ? ? ? ?fi
> + ? ? ? $(LINUX_INSTALL_HOST_TOOLS)
> ?endef
>
> ?include linux/linux-ext-*.mk

bump
