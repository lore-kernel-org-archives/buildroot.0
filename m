From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 11 Jul 2015 09:47:54 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: fix gdbserver
 copying for external arc-2014.12 tools
In-Reply-To: <1427271071-9541-1-git-send-email-abrodkin@synopsys.com>
References: <1427271071-9541-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <55A0CA2A.1010308@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

Le 25/03/2015 09:11, Alexey Brodkin a ?crit :
> Historically in pre-built ARC GNU tools gdbserver is located in
> top-level "target-bin" folder.
> 
> Because of that fact if BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is
> selected Buildroot won't find gdbserver (it looks within
> SYSROOT/ARCH_SYSROOT folder).
> 
> Simplest solution is to use TOOLCHAIN_EXTERNAL_FIXUP_CMDS where copy
> gdbserver from "target-bin" folder into SYSROOT/usr/bin.

Since this patch, the arc 2014.12 prebuild toolchain as been marked as broken
[1]. This patch is still needed ?

[1]
http://git.buildroot.net/buildroot/commit/?id=cd3c00fbc01e99496f28276c62182963cada0979

Best regards,
Romain Naour

> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes in v2:
>  [1] "install" command is used instead of "cp"
>  [2] copy only "gdbserver" instead of everything from "target_bin" to sysroot
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index c0429bb..fe709db 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -396,6 +396,10 @@ else
>  TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = be
>  endif
>  TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
> +define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
> +	$(Q)SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; \
> +	install -m 0755 -D $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/target-bin/gdbserver $${SYSROOT_DIR}/usr/bin/gdbserver
> +endef
>  else
>  # Custom toolchain
>  TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
> 
