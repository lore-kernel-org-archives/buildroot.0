From: Valentine Barshak <gvaxon@gmail.com>
Date: Sun, 14 Oct 2012 03:35:08 +0400
Subject: [Buildroot] [PATCH v2] Add target to create a project directory
In-Reply-To: <20121013232039.19428.5883.stgit@localhost>
References: <20121013231443.17317.60675.stgit@localhost>
 <20121013232039.19428.5883.stgit@localhost>
Message-ID: <5079FAAC.3070803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/2012 03:21 AM, Arnout Vandecappelle (Essensium/Mind) wrote:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: Removed accidental changes to busybox.config and uClibc.config
> ---
>   Makefile              |   30 ++++++++++++++++++++++++++++++
>   Makefile.project.tmpl |   40 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 70 insertions(+)
>   create mode 100644 Makefile.project.tmpl
>
> diff --git a/Makefile b/Makefile
> index 0e5b28e..a3b88f7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -698,6 +698,33 @@ endif
>
>   cross: $(BASE_TARGETS)
>
> +ifneq ($(PROJECT_DIR),)
> +ifeq ($(findstring -git,$(BR2_VERSION)),)
> +BUILDROOT_VERSION = $(BR2_VERSION)
> +else
> +BUILDROOT_VERSION = snapshot
> +endif
> +
> +# Write a buildroot config in the project dir, then use that defconfig to
> +# re-generate the .config.  This replaces the config file paths with paths
> +# pointing into PROJECT_DIR (unless they have been changed from their
> +# default values).  The subsequent update-all-config writes all the config
> +# files into the PROJECT_DIR.  That last step doesn't need to set PROJECT_DIR
> +# or DEFCONFIG anymore, because they're already set in the new .config.
> +projectdir:
> +	mkdir -p $(PROJECT_DIR)
> +	sed s/@BUILDROOT_VERSION@/$(BUILDROOT_VERSION)/g \
> +		Makefile.project.tmpl > $(PROJECT_DIR)/Makefile
> +	$(MAKE1) $(EXTRAMAKEARGS) \
> +		DEFCONFIG=$(PROJECT_DIR)/buildroot.config \
> +		savedefconfig
> +	$(MAKE1) $(EXTRAMAKEARGS) \
> +		PROJECT_DIR=$(PROJECT_DIR) \
> +		DEFCONFIG=$(PROJECT_DIR)/buildroot.config \
> +		defconfig
> +	$(MAKE1) $(EXTRAMAKEARGS) update-all-config
> +endif
> +
>   help:
>   	@echo 'Cleaning:'
>   	@echo '  clean                  - delete all files created by build'
> @@ -756,6 +783,9 @@ endif
>   	@echo '  source-check           - check selected packages for valid download URLs'
>   	@echo '  external-deps          - list external packages used'
>   	@echo '  legal-info             - generate info about license compliance'
> +ifneq ($(PROJECT_DIR),)
> +	@echo '  projectdir             - Prepare project directory with a Makefile.'
> +endif
>   	@echo
>   	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>   	@echo '  make O=dir             - Locate all output files in "dir", including .config'
> diff --git a/Makefile.project.tmpl b/Makefile.project.tmpl
> new file mode 100644
> index 0000000..b41180a
> --- /dev/null
> +++ b/Makefile.project.tmpl
> @@ -0,0 +1,40 @@
> +# This Makefile creates a build environment using the directory containing
> +# this Makefile as the project directory.
> +# If called from a different directory using 'make -f ...', the current
> +# directory is used as the output directory.
> +
> +lastword = $(word $(words $(1)),$(1))
> +makedir  = $(dir $(call lastword,$(MAKEFILE_LIST)))
> +
> +BR2_PROJECT_DIR = $(realpath $(makedir))
> +BUILDROOT_DIR   = $(BR2_PROJECT_DIR)/buildroot
> +BUILDROOT_VERSION = @BUILDROOT_VERSION@
> +BUILDROOT_SITE    = http://buildroot.net/downloads
> +BUILDROOT_SOURCE  = buildroot-$(BUILDROOT_VERSION).tar.bz2
> +
> +ifeq ($(O),)
> +ifeq ($(makedir),./)
> +# Building in project dir => create output dir
> +O = $(CURDIR)/output
> +else
> +# Building from some other dir => use this dir as output dir
> +O = $(CURDIR)
> +endif
> +endif
> +
> +.PHONY: all $(MAKECMDGOALS)
> +
> +all: $(BUILDROOT_DIR)
> +	@$(MAKE) -C buildroot O=$(O) BR2_PROJECT_DIR=$(BR2_PROJECT_DIR) $(all)
> +
> +all     := $(filter-out all,$(MAKECMDGOALS))
> +$(all): all
> +        @:
> +
> +$(BUILDROOT_DIR):
> +	mkdir -p $@
> +	wget -O - $(BUILDROOT_SITE)/$(BUILDROOT_SOURCE) | \
> +		tar -xjf - -C $@ --strip-components=1
> +	for p in `ls $(makedir)/patches/buildroot/buildroot-* 2>/dev/null`; do \
> +		patch -d $@ -p1 -i $$p; \
> +	done

I probably miss something, but
do I have to download buldroot for every project?
Can I use my local BR git tree as a buildroot source for my projects 
instead of downloading?

Thanks,
Val.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
