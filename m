From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 May 2012 14:06:00 +0200
Subject: [Buildroot] [PATCH 1/2] ocf-linux: new package
In-Reply-To: <1336159393-17052-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 4 May 2012 16:23:12 -0300")
References: <1336159393-17052-1-git-send-email-gustavo@zacarias.com.ar>
 <1336159393-17052-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wr4qde8n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

A few comments:

 Gustavo> Add the ocf-linux package and linux kernel extension.
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  linux/Config.ext.in            |   12 ++++++++++++
 Gustavo>  linux/linux-ext-ocf-linux.mk   |   21 +++++++++++++++++++++
 Gustavo>  package/Config.in              |    1 +
 Gustavo>  package/ocf-linux/Config.in    |   12 ++++++++++++
 Gustavo>  package/ocf-linux/ocf-linux.mk |   21 +++++++++++++++++++++
 Gustavo>  5 files changed, 67 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 linux/linux-ext-ocf-linux.mk
 Gustavo>  create mode 100644 package/ocf-linux/Config.in
 Gustavo>  create mode 100644 package/ocf-linux/ocf-linux.mk

 Gustavo> diff --git a/linux/Config.ext.in b/linux/Config.ext.in
 Gustavo> index 172fa76..943c380 100644
 Gustavo> --- a/linux/Config.ext.in
 Gustavo> +++ b/linux/Config.ext.in
 Gustavo> @@ -23,6 +23,18 @@ config BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH
 Gustavo>  	  Download it at http://download.gna.org/adeos/patches/v2.6/$(ARCH)/
 Gustavo>  	  and verify that your kernel version in buildroot matches.
 
 Gustavo> +# ocf-linux
 Gustavo> +config BR2_LINUX_KERNEL_EXT_OCF_LINUX
 Gustavo> +	bool "Open Cryptographic Framework (OCF)"
 Gustavo> +	select BR2_PACKAGE_OCF_LINUX
 Gustavo> +	help
 Gustavo> +	  OCF-Linux Kernel part.
 Gustavo> +
 Gustavo> +	  Select this option to patch your kernel with OCF for
 Gustavo> +	  hardware-accelerated crypto support for available drivers.
 Gustavo> +	  Some libraries need to have OCF also enabled for them,

I would move the 'also' - E.G. 'Some libraries need to also have OCF enabled'



 Gustavo> +ifeq ($(BR2_LINUX_KERNEL_EXT_OCF_LINUX),y)
 Gustavo> +LINUX_DEPENDENCIES += ocf-linux
 Gustavo> +
 Gustavo> +# Prepare kernel patch
 Gustavo> +# The linux-3.2.1.patch is just the main inclusion, most of the code
 Gustavo> +# resides in the ocf/ subdir.
 Gustavo> +define OCF_LINUX_PREPARE_KERNEL
 Gustavo> +	support/scripts/apply-patches.sh $(LINUX_DIR) \
 Gustavo> +		$(OCF_LINUX_DIR)/patches/ linux-3.2.1-ocf.patch ; \
 Gustavo> +	cp -rf $(OCF_LINUX_DIR)/ocf $(LINUX_DIR)/crypto/ocf ;
 Gustavo> +endef

How likely is it that this patch will work for a random kernel version?
From the tarball I see a bunch of patches for different versions, so we
probably need something smarter than just hardcoding 3.2.1 - Perhaps
just an option where the user can type the version number of the patch
they want to use?


 Gustavo> +
 Gustavo> +LINUX_PRE_PATCH_HOOKS += OCF_LINUX_PREPARE_KERNEL
 Gustavo> +
 Gustavo> +endif #BR2_LINUX_EXT_OCF_LINUX
 Gustavo> diff --git a/package/Config.in b/package/Config.in
 Gustavo> index 1cd9789..968cacc 100644
 Gustavo> --- a/package/Config.in
 Gustavo> +++ b/package/Config.in
 Gustavo> @@ -279,6 +279,7 @@ source "package/gnutls/Config.in"
 Gustavo>  source "package/libgcrypt/Config.in"
 Gustavo>  source "package/libgpg-error/Config.in"
 Gustavo>  source "package/libnss/Config.in"
 Gustavo> +source "package/ocf-linux/Config.in"
 Gustavo>  source "package/openssl/Config.in"
 Gustavo>  source "package/polarssl/Config.in"
 Gustavo>  endmenu
 Gustavo> diff --git a/package/ocf-linux/Config.in b/package/ocf-linux/Config.in
 Gustavo> new file mode 100644
 Gustavo> index 0000000..3c3a08e
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/ocf-linux/Config.in
 Gustavo> @@ -0,0 +1,12 @@
 Gustavo> +config BR2_PACKAGE_OCF_LINUX
 Gustavo> +	bool "ocf-linux"
 Gustavo> +	help
 Gustavo> +	  OCF-Linux is a Linux port of the OpenBSD/FreeBSD Cryptographic
 Gustavo> +	  Framework (OCF). This port aims to bring full asynchronous HW/SW
 Gustavo> +	  crypto acceleration to the Linux kernel and applications
 Gustavo> +	  running under Linux.
 Gustavo> +
 Gustavo> +	  You need to enable the OCF linux kernel extension or provide
 Gustavo> +	  a prepatched kernel to make this option useful.
 Gustavo> +	  

Trailing spaces (the last empty line).

-- 
Bye, Peter Korsgaard
