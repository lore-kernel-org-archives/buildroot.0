From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Aug 2011 11:11:01 +0200
Subject: [Buildroot] [PATCH 5 of 5] toolchain-external: use host-tar
 instead of tar to unpack toolchains
In-Reply-To: <fe06b4e821ed5f799078.1312309999@localhost6.localdomain6>
References: <patchbomb.1312309994@localhost6.localdomain6>
 <fe06b4e821ed5f799078.1312309999@localhost6.localdomain6>
Message-ID: <CAAXf6LWo0xX46cwpgB1LVTDV0+AYQsSD9hdT_9vUr_=_c-6u=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 2, 2011 at 8:33 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Using the system tar with --strip-components causes problems when its version is too old (<1.17). Even recent releases of RedHat/CentOS still ship with tar 1.15. To avoid such problems, always use host-tar instead of tar to unpack toolchains.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> To be honest, I'm not sure what the best way is to handle this. The same problems with tar could occur in other places than just external toolchains. So maybe we should use host-tar in more places.
> On the other hand, most users have a recent, working, tar version on there system. It may thus make more sense to detect the system tar version and only use host-tar if it's too old.
>
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -155,7 +155,7 @@
> ?endif
>
> ?ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
> -TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
> +TOOLCHAIN_EXTERNAL_DEPENDENCIES = host-tar $(TOOLCHAIN_EXTERNAL_DIR)/.extracted

It turns out that this has the annoying side-effect of re-running the
'ext-toolchain-installed' step each time, because host-tar is not an
existing file. One can workaround this as follows:

include package/tar/tar.mk
$(STAMP_DIR)/tar-installed:
$(BUILD_DIR)/host-tar-$(TAR_VERSION)/.stamp_host_installed
	$(Q)touch $@

TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(STAMP_DIR)tar-installed
$(TOOLCHAIN_EXTERNAL_DIR)/.extracted

This is not very beautiful because you need to include
package/tar/tar.mk to get to $(TAR_VERSION). Is there a better way?

Thanks,
Thomas


> ?else
> ?TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(STAMP_DIR)/ext-toolchain-checked
> ?endif
> @@ -227,9 +227,9 @@
> ?$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
> ? ? ? ?mkdir -p $(@D)
> ? ? ? ?$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_1))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
> - ? ? ? ? ? ? ? $(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
> + ? ? ? ? ? ? ? $(HOST_TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
> ? ? ? ?$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_2))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2) | \
> - ? ? ? ? ? ? ? $(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
> + ? ? ? ? ? ? ? $(HOST_TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
> ?ifeq ($(TOOLCHAIN_EXTERNAL_PREFIX),bfin-uclinux)
> ? ? ? ?rm -rf $(TOOLCHAIN_EXTERNAL_DIR)/bfin-linux-uclibc
> ? ? ? ?mv $(TOOLCHAIN_EXTERNAL_DIR)/bfin-uclinux $(TOOLCHAIN_EXTERNAL_DIR)/tmp
> @@ -249,7 +249,7 @@
>
> ?$(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
> ? ? ? ?mkdir -p $(@D)
> - ? ? ? $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
> + ? ? ? $(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | $(HOST_TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
> ? ? ? ?$(Q)touch $@
> ?endif
>
>
