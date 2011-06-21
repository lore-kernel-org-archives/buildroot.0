From: Robin Holt <holt@sgi.com>
Date: Tue, 21 Jun 2011 08:53:57 -0500
Subject: [Buildroot] [PATCH] Introduce argtable2 support.
In-Reply-To: <20110613121404.GC3525@sgi.com>
References: <20110613121404.GC3525@sgi.com>
Message-ID: <20110621135356.GG3587@sgi.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Did I submit patch the wrong way?  What is the norm for submitting
patches to this list?  Should I have sent it to a particular
person?

Thanks,
Robin Holt

On Mon, Jun 13, 2011 at 07:14:05AM -0500, Robin Holt wrote:
> 
> The argtable2 sourceforge project provides easy parsing of command line
> options and file contents.
> 
> Signed-off-by: Robin Holt <holt@sgi.com>
> ---
> 
> I added libargtable2 into the Packages->Libraries->Other.  Its purpose
> is to parse text.  It is really not of the clase of the other libraries
> in libraries->Text...  If you would rather have it there, please change
> it for me or let me know and I will change it.
> 
> 
>  package/Config.in                 |    1 +
>  package/argtable2/Config.in       |    7 +++++++
>  package/argtable2/libargtable2.mk |   31 +++++++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 package/argtable2/Config.in
>  create mode 100644 package/argtable2/libargtable2.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 10d435c..e52ee33 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -329,6 +329,7 @@ source "package/libupnp/Config.in"
>  endmenu
>  
>  menu "Other"
> +source "package/argtable2/Config.in"
>  source "package/argp-standalone/Config.in"
>  source "package/libatomic_ops/Config.in"
>  source "package/libcap/Config.in"
> diff --git a/package/argtable2/Config.in b/package/argtable2/Config.in
> new file mode 100644
> index 0000000..42d067b
> --- /dev/null
> +++ b/package/argtable2/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBARGTABLE2
> +	bool "libargtable2"
> +	help
> +	  A greatly simplified and yet quite robust argument parsing
> +	  set of library calls.
> +
> +	  http://argtable.sourceforge.net/
> diff --git a/package/argtable2/libargtable2.mk b/package/argtable2/libargtable2.mk
> new file mode 100644
> index 0000000..79cfce8
> --- /dev/null
> +++ b/package/argtable2/libargtable2.mk
> @@ -0,0 +1,31 @@
> +#############################################################
> +#
> +# argtable2 from sourceforge
> +#
> +#############################################################
> +
> +LIBARGTABLE2_VERSION = 13
> +LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
> +LIBARGTABLE2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/argtable/
> +
> +LIBARGTABLE2_INSTALL_STAGING = YES
> +LIBARGTABLE2_CONF_OPT= --program-prefix="" \
> +		--enable-shared \
> +		--enable-static \
> +		--disable-nls \
> +		--disable-example \
> +		--disable-kernel-module \
> +		--enable-lib \
> +		--enable-util
> +
> +define LIBARGTABLE2_INSTALL_TARGET_CMDS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libargtable2.so* $(TARGET_DIR)/usr/lib/
> +endef
> +
> +define LIBARGTABLE2_CLEAN_CMDS
> +	-$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) uninstall
> +	-$(MAKE) -C $(@D) clean
> +	rm -f $(TARGET_DIR)/usr/lib/libargtable2.so*
> +endef
> +
> +$(eval $(call AUTOTARGETS,package,libargtable2))
