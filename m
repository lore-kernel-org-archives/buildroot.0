From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Apr 2019 16:49:59 +0200
Subject: [Buildroot] [PATCH v8 1/9] cpe-info: new make target
In-Reply-To: <1552082667-46877-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1552082667-46877-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <9ae94ccf-f646-2a8f-c10a-0eb6a8120703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I mentioned most of my feedback already in the response to patch 9, but I'll
repeat here for simplicity.

On 08/03/2019 23:04, Matt Weber wrote:
[snip]
> +	savedefconfig update-defconfig printvars cpe-info %-cpe-info

 So, I'd like at least the per-package cpe-info to be replaced by show-info. A
top-level cpe-info might still be useful, but even that I prefer as a script in
utils that calls make and pipes in jq to get the cpe-info.

 I also question the usefulness of creating a CSV. JSON is probably easier.

 If you do keep the cpe-info target, then I think the patch should be split up
into a first patch that just introduces CPE_ID (and adds it to show-info), then
a patch that documents it, and only then the patch that introduces the cpe-info
target.

[snip]
> +$(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)_project

 You can just use $(3) instead of $$($(2)_NAME). Note that we really want $(3)
here, not $(1) (i.e. not $(2)_NAME)) because for host packages (which admittedly
are not supported yet) we'd want the name without host-.

> +$(2)_CPE_ID_NAME ?= $$($(2)_NAME)
> +$(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
> +$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)

 I think there should be only CPE_ID, which has to be fully specified by the
caller. It should also contain the prefix and suffix already. IOW, I think this
should simply be:

$(2)_CPE_ID ?= cpe:2.3:a:*:$(3):$$($(2)_VERSION):*:*:*:*:*:*:*


 Regards,
 Arnout

> +
> +$(1)-cpe-info: PKG=$(2)
> +$(1)-cpe-info:
> +ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> +	@$$(call MESSAGE,"Collecting cpe info")
> +	$(Q)$$(call cpe-manifest,$$($(2)_CPE_ID),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
> +endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
> +
>  # legal-info: declare dependencies and set values used later for the manifest
>  ifneq ($$($(2)_LICENSE_FILES),)
>  $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
> @@ -1052,6 +1064,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
>  	$(1)-clean-for-reconfigure \
>  	$(1)-clean-for-reinstall \
>  	$(1)-configure \
> +	$(1)-cpe-info \
>  	$(1)-depends \
>  	$(1)-dirclean \
>  	$(1)-external-deps \
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index bffd79d..0201632 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -102,3 +102,11 @@ legal-deps = \
>          $(filter-out $(if $(1:host-%=),host-%),\
>              $(call non-virtual-deps,\
>                  $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
> +
> +#
> +# cpe-info helper functions
> +#
> +
> +define cpe-manifest # cpe, pkg name, version, url
> +	echo '"$(1)","$(2)","$(3)","$(4)"' >>$(CPE_MANIFEST_CSV)
> +endef
> 
