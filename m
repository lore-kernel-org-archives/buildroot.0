From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2015 22:38:30 +0200
Subject: [Buildroot] [PATCHv2 09/21] pkg-download: remove support for
 the SHOW_EXTERNAL_DEPS DL_MODE
In-Reply-To: <1428856685-4403-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150413203829.GH29025@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-12 18:37 +0200, Thomas Petazzoni spake thusly:
> Now that the external-deps implementation relies on the per-package
> <pkg>-all-external-deps and <pkg>-external-deps targets and no longer
> on the 'source' target with a custom DL_MODE, we can get rid of the
> support for the SHOW_EXTERNAL_DEPS DL_MODE value in the pkg-download
> logic.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Of course, since my previous comments are not related to this patch,
this one gets my:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 45 ++-------------------------------------------
>  package/pkg-generic.mk  |  5 +----
>  2 files changed, 3 insertions(+), 47 deletions(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index e274712..be3babb 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -20,9 +20,8 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
>  
>  DL_WRAPPER = support/download/dl-wrapper
>  
> -# Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
> -# used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
> -# external-deps target.
> +# Default spider mode is 'DOWNLOAD'. Other possible value is
> +# 'SOURCE_CHECK' used by the _source-check target.
>  DL_MODE = DOWNLOAD
>  
>  # DL_DIR may have been set already from the environment
> @@ -71,11 +70,6 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
>  # The SOURCE_CHECK_* helpers are in charge of simply checking that the source
>  # is available for download. This can be used to make sure one will be able
>  # to get all the sources needed for one's build configuration.
> -#
> -# The SHOW_EXTERNAL_DEPS_* helpers simply output to the console the names
> -# of the files that will be downloaded, or path and revision of the
> -# source repositories, producing a list of all the "external dependencies"
> -# of a given build configuration.
>  ################################################################################
>  
>  # Try a shallow clone - but that only works if the version is a ref (tag or
> @@ -100,11 +94,6 @@ define SOURCE_CHECK_GIT
>    $(GIT) ls-remote --heads $($(PKG)_SITE) > /dev/null
>  endef
>  
> -define SHOW_EXTERNAL_DEPS_GIT
> -	echo $($(PKG)_SOURCE)
> -endef
> -
> -
>  define DOWNLOAD_BZR
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
> @@ -119,10 +108,6 @@ define SOURCE_CHECK_BZR
>  	$(BZR) ls --quiet $($(PKG)_SITE) > /dev/null
>  endef
>  
> -define SHOW_EXTERNAL_DEPS_BZR
> -	echo $($(PKG)_SOURCE)
> -endef
> -
>  define DOWNLOAD_CVS
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
> @@ -139,10 +124,6 @@ define SOURCE_CHECK_CVS
>  	$(CVS) -d:pserver:anonymous:@$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) login
>  endef
>  
> -define SHOW_EXTERNAL_DEPS_CVS
> -	echo $($(PKG)_SOURCE)
> -endef
> -
>  define DOWNLOAD_SVN
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
> @@ -157,10 +138,6 @@ define SOURCE_CHECK_SVN
>    $(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
>  endef
>  
> -define SHOW_EXTERNAL_DEPS_SVN
> -  echo $($(PKG)_SOURCE)
> -endef
> -
>  # SCP URIs should be of the form scp://[user@]host:filepath
>  # Note that filepath is relative to the user's home directory, so you may want
>  # to prepend the path with a slash: scp://[user@]host:/absolutepath
> @@ -177,11 +154,6 @@ define SOURCE_CHECK_SCP
>  	$(SSH) $(call domain,$(1),:) ls '$(call notdomain,$(1),:)' > /dev/null
>  endef
>  
> -define SHOW_EXTERNAL_DEPS_SCP
> -	echo $(2)
> -endef
> -
> -
>  define DOWNLOAD_HG
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
>  		-o $(DL_DIR)/$($(PKG)_SOURCE) \
> @@ -198,11 +170,6 @@ define SOURCE_CHECK_HG
>    $(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
>  endef
>  
> -define SHOW_EXTERNAL_DEPS_HG
> -  echo $($(PKG)_SOURCE)
> -endef
> -
> -
>  define DOWNLOAD_WGET
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
>  		-o $(DL_DIR)/$(2) \
> @@ -216,10 +183,6 @@ define SOURCE_CHECK_WGET
>    $(WGET) --spider '$(call qstrip,$(1))'
>  endef
>  
> -define SHOW_EXTERNAL_DEPS_WGET
> -  echo $(2)
> -endef
> -
>  define DOWNLOAD_LOCALFILES
>  	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
>  		-o $(DL_DIR)/$(2) \
> @@ -233,10 +196,6 @@ define SOURCE_CHECK_LOCALFILES
>    test -e $(call stripurischeme,$(call qstrip,$(1)))
>  endef
>  
> -define SHOW_EXTERNAL_DEPS_LOCALFILES
> -  echo $(2)
> -endef
> -
>  ################################################################################
>  # DOWNLOAD -- Download helper. Will try to download source from:
>  # 1) BR2_PRIMARY_SITE if enabled
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index d1a1811..11edb34 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -122,13 +122,10 @@ $(BUILD_DIR)/%/.stamp_rsynced:
>  	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
>  	$(Q)touch $@
>  
> -# Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for rsynced
> -# packages
> +# Handle the SOURCE_CHECK case for rsynced packages
>  $(BUILD_DIR)/%/.stamp_rsync_sourced:
>  ifeq ($(DL_MODE),SOURCE_CHECK)
>  	test -d $(SRCDIR)
> -else ifeq ($(DL_MODE),SHOW_EXTERNAL_DEPS)
> -	echo "file://$(SRCDIR)"
>  else
>  	@true # Nothing to do to source a local package
>  endif
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
