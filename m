From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Jan 2012 23:29:10 +0100
Subject: [Buildroot] [PATCH 1/2] ocf: new package
In-Reply-To: <1327667762-10831-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327667762-10831-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201201302329.10543.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 27 January 2012 13:36:01 Gustavo Zacarias wrote:
> Add the OCF package and linux kernel extension.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  linux/Config.ext.in    |    7 +++++++
>  linux/linux-ext-ocf.mk |   21 +++++++++++++++++++++
>  package/Config.in      |    1 +
>  package/ocf/Config.in  |   12 ++++++++++++
>  package/ocf/ocf.mk     |   30 ++++++++++++++++++++++++++++++
>  5 files changed, 71 insertions(+), 0 deletions(-)
>  create mode 100644 linux/linux-ext-ocf.mk
>  create mode 100644 package/ocf/Config.in
>  create mode 100644 package/ocf/ocf.mk
> 
> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
> index 172fa76..64c1476 100644
> --- a/linux/Config.ext.in
> +++ b/linux/Config.ext.in
> @@ -23,6 +23,13 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
>  	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
>  	  and verify that your kernel version in buildroot matches.
>  
> +# OCF
> +config BR2_LINUX_KERNEL_EXT_OCF
> +	bool "Open Cryptographic Framework (OCF)"
> +	select BR2_PACKAGE_OCF
> +	help
> +	  OCF Kernel part.
> +
 I guess this is an attempt to keep the options alphabetical...  but 
they're not :-)  I'd put OCF at the top or at the bottom.  The top
is closest to alphabetical.

>  # RTAI
>  config BR2_LINUX_KERNEL_EXT_RTAI
>         bool "RTAI Real-time patch"
> diff --git a/linux/linux-ext-ocf.mk b/linux/linux-ext-ocf.mk
> new file mode 100644
> index 0000000..af8b809
> --- /dev/null
> +++ b/linux/linux-ext-ocf.mk
> @@ -0,0 +1,21 @@
> +##################################################
> +# Linux OCF extension
> +#
> +# Patch the linux kernel with OCF
> +##################################################
> +
> +ifeq ($(BR2_LINUX_KERNEL_EXT_OCF),y)
> +LINUX_DEPENDENCIES += ocf
> +
> +# Prepare kernel patch
> +# The linux-3.2.1.patch is just the main inclusion, most of the code
> +# resides in the ocf/ subdir.
> +define OCF_PREPARE_KERNEL
> +	support/scripts/apply-patches.sh $(LINUX_DIR) \
> +		$(OCF_DIR)/patches/ linux-3.2.1-ocf.patch ; \
> +	cp -rf $(OCF_DIR)/ocf $(LINUX_DIR)/crypto/ocf ;
 I'm not sure if 'cp -rf' is the best option here...  First of all, '-a'
seems better in order to keep symlinks.  Second, the '-f' removes the 
files before they're overwritten, which is kind of pointless I think --
if they need to be removed, do an 'rm -rf' first.  Instead of cpio I'd
use the tar-path (cfr. Peter's correction to the linux-firmware 
package) (actually, I'd have used cpio rather than tar because it's a 
bit simpler internally, but that's just personal preference).

> +endef
> +
> +LINUX_PRE_PATCH_HOOKS += OCF_PREPARE_KERNEL
> +
> +endif #BR2_LINUX_EXT_OCF
[snip]
> diff --git a/package/ocf/ocf.mk b/package/ocf/ocf.mk
> new file mode 100644
> index 0000000..c409464
> --- /dev/null
> +++ b/package/ocf/ocf.mk
> @@ -0,0 +1,30 @@
> +#############################################################
> +#
> +# ocf
> +#
> +#############################################################
> +
> +OCF_VERSION = 20120127
> +OCF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ocf-linux
> +OCF_SOURCE = ocf-linux-$(OCF_VERSION).tar.gz
 The official name is "OCF-Linux", so why not call the package ocf-linux 
(and remove the OCF_SOURCE assignment)?

> +OCF_INSTALL_STAGING = YES
> +
> +define OCF_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
> +		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
> +endef
> +
> +define OCF_UNINSTALL_STAGING_CMDS
> +	rm -f $(STAGING_DIR)/usr/include/crypto/cryptodev.h
> +endef
> +
> +define OCF_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 644 $(@D)/ocf/cryptodev.h \
> +		$(TARGET_DIR)/usr/include/crypto/cryptodev.h
> +endef
 /usr/include gets removed unless BR2_HAVE_DEVFILES, of course, so
doesn't it make sense to do this conditionally?

> +
> +define OCF_UNINSTALL_TARGET_CMDS
> +	rm -f $(TARGET_DIR)/usr/include/crypto/cryptodev.h
> +endef
> +
> +$(eval $(call GENTARGETS))
> 

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
