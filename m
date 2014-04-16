From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:49:32 +0200
Subject: [Buildroot] [PATCH v4 3/4] Makefile: let show-targets prints
 also the dependencies
In-Reply-To: <1396864610-8426-4-git-send-email-fabio.porcedda@gmail.com>
References: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
 <1396864610-8426-4-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140416194932.2b8f31c0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon,  7 Apr 2014 11:56:49 +0200, Fabio Porcedda wrote:
> Because the show-targets target print the targets that will be build,

"will be built"

> print also the dependencies.
> Also refactor source and legal-info targets in order to cleanup the code
> by creating a new variable TARGETS_ALL that contains all the targets the

the targets the -> the targets that

> will be built.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  Makefile | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e0831b6..f063bef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -409,9 +409,6 @@ endif
>  
>  include fs/common.mk
>  
> -TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
> -TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
> -
>  # host-* dependencies have to be handled specially, as those aren't
>  # visible in Kconfig and hence not added to a variable like TARGETS.
>  # instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
> @@ -429,10 +426,12 @@ TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
>  HOST_DEPS = $(sort $(foreach dep,\
>  		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS_HOST_DEPS))),\
>  		$($(dep))))
> -HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
>  
> -TARGETS_LEGAL_INFO := $(patsubst %,%-legal-info,\
> -		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
> +TARGETS_ALL := $(sort $(TARGETS) $(TARGETS_HOST_DEPS)) \
> +               $(HOST_DEPS) $(TARGETS_ROOTFS)
> +TARGETS_ALL_SOURCES := $(addsuffix -source,$(TARGETS_ALL))

Is this actually going to work? The targets in TARGETS_ROOTFS, do they
all support <name>-source ?

> +TARGETS_ALL_LEGAL_INFO := $(addsuffix -legal-info,$(TARGETS_ALL))

And do they all support <name>-legal-info ?

> +TARGETS_ALL_DIRCLEAN := $(addsuffix -dirclean,$(TARGETS_ALL))
>  
>  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>  	$(HOST_DIR) $(BINARIES_DIR)
> @@ -451,8 +450,8 @@ world: target-post-image
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>  	legal-info legal-info-prepare legal-info-clean printvars \
>  	target-finalize target-post-image \
> -	$(TARGETS) $(TARGETS_ROOTFS) \
> -	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
> +	$(TARGETS_ALL) $(TARGETS_ALL_SOURCE) \
> +	$(TARGETS_ALL_LEGAL_INFO) $(TARGETS_ALL_DIRCLEAN)  \

I actually find this handling of phony targets a bit weird. If package
"foo" is enabled, then "foo", "foo-dirclean", "foo-legal-info" and
"foo-source" are phony targets, but when the package is disabled they
are not phony targets. Also, what about "foo-patch", "foo-extract" and
so on? So my question is really whether it shouldn't be the role of the
package infrastructure itself to declare the targets of each package as
phony.

>  	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>  	$(HOST_DIR) $(BINARIES_DIR)
>  
> @@ -626,7 +625,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
>  toolchain-eclipse-register:
>  	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
>  
> -source: $(TARGETS_SOURCE) $(HOST_SOURCE)
> +source: $(TARGETS_ALL_SOURCE)
>  
>  external-deps:
>  	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
> @@ -644,7 +643,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
>  	@$(call legal-warning,the toolchain has not been saved)
>  	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
>  
> -legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
> +legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_ALL_LEGAL_INFO) \
>  		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
>  	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
>  	@if [ -r $(LEGAL_WARNINGS) ]; then \
> @@ -655,7 +654,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
>  	@rm -f $(LEGAL_WARNINGS)
>  
>  show-targets:
> -	@echo $(TARGETS) $(TARGETS_ROOTFS)
> +	@echo $(TARGETS_ALL)
>  
>  graph-build: $(O)/build/build-time.log
>  	@install -d $(O)/graphs

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
