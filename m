From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 18:24:46 +0200
Subject: [Buildroot] [PATCH 1/2] downloads: add basic CVS support
In-Reply-To: <1378310023-6405-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378310023-6405-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130904182446.22d09a4a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

Great!

On Wed,  4 Sep 2013 12:53:42 -0300, Gustavo Zacarias wrote:
> The support is for pserver mode anonymous CVS.
> source-check is based on login since many servers don't support or have
> ls/rls disabled.
> 
> Usage is pretty straightforward.
> PKG_SITE defines the site hostname and remote directory.
> The module is defined by the bare package name.
> Version is date based.

Those details should probably go into an update of
docs/manual/adding-packages-generic.txt, which documents all the source
methods.

> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Config.in               |  4 ++++
>  package/pkg-download.mk | 37 ++++++++++++++++++++++++++++---------
>  package/pkg-generic.mk  |  2 ++
>  3 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index cb246a4..33b3070 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -42,6 +42,10 @@ config BR2_GIT
>  	string "Git command"
>  	default "git"
>  
> +config BR2_CVS
> +	string "Cvs command"
> +	default "cvs"
> +
>  config BR2_LOCALFILES
>  	string "Local files retrieval command"
>  	default "cp"
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 97c9226..07e7c54 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -10,6 +10,7 @@
>  # Download method commands
>  WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
>  SVN := $(call qstrip,$(BR2_SVN))
> +CVS := $(call qstrip,$(BR2_CVS))
>  BZR := $(call qstrip,$(BR2_BZR))
>  GIT := $(call qstrip,$(BR2_GIT))
>  HG := $(call qstrip,$(BR2_HG)) $(QUIET)
> @@ -55,21 +56,21 @@ notdomain=$(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$(c
>  domainseparator=$(if $(1),$(1),/)
>  
>  ################################################################################
> -# The DOWNLOAD_{GIT,SVN,BZR,HG,LOCALFILES} helpers are in charge of getting a
> -# working copy of the source repository for their corresponding SCM,
> +# The DOWNLOAD_{GIT,SVN,BZR,HG,CVS,LOCALFILES} helpers are in charge of getting
> +# a working copy of the source repository for their corresponding SCM,

Not related to your change, but interesting to see that LOCALFILES is a
SCM :)

>  # checking out the requested version / commit / tag, and create an
>  # archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
>  # ssh authentication. DOWNLOAD_WGET is the normal wget-based download
>  # mechanism.
>  #
> -# The SOURCE_CHECK_{GIT,SVN,BZR,HG,WGET,LOCALFILES,SCP} helpers are in charge of
> -# simply checking that the source is available for download. This can be used
> -# to make sure one will be able to get all the sources needed for
> -# one's build configuration.
> +# The SOURCE_CHECK_{GIT,SVN,BZR,HG,WGET,CVS,LOCALFILES,SCP} helpers are

Maybe we could replace this with SOURCE_CHECK_*

> +# in charge of simply checking that the source is available for download.
> +# This can be used to make sure one will be able to get all the sources needed
> +# for one's build configuration.
>  #
> -# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,HG,WGET,LOCALFILES,SCP} helpers simply
> -# output to the console the names of the files that will be downloaded, or path
> -# and revision of the source repositories, producing a list of all the
> +# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,HG,WGET,CVS,LOCALFILES,SCP} helpers

and similar here :-)

> +# simply output to the console the names of the files that will be downloaded,
> +# or path and revision of the source repositories, producing a list of all the
>  # "external dependencies" of a given build configuration.
>  ################################################################################
>  
> @@ -119,6 +120,23 @@ define SHOW_EXTERNAL_DEPS_BZR
>  	echo $($(PKG)_SOURCE)
>  endef
>  
> +define DOWNLOAD_CVS
> +	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> +	(pushd $(DL_DIR) > /dev/null && \
> +	$(CVS) -z3 -d:pserver:anonymous@$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) co -d $($(PKG)_BASE_NAME) -r :$($(PKG)_DL_VERSION) -P $($(PKG)_RAWNAME) && \

This line is quite long. Split it maybe?

> +	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
> +	rm -rf $($(PKG)_DL_DIR) && \
> +	popd > /dev/null)
> +endef
> +
> +# Not all CVS servers support ls/rls, use login to see if we can connect
> +define SOURCE_CHECK_CVS
> +	$(CVS) -d:pserver:anonymous:@$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) login
> +endef
> +
> +define SHOW_EXTERNAL_DEPS_CVS
> +	echo $($(PKG)_SOURCE)
> +endef
>  
>  define DOWNLOAD_SVN
>  	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> @@ -244,6 +262,7 @@ define DOWNLOAD_INNER
>  		case "$$scheme" in \
>  			git) $($(DL_MODE)_GIT) && exit ;; \
>  			svn) $($(DL_MODE)_SVN) && exit ;; \
> +			cvs) $($(DL_MODE)_CVS) && exit ;; \
>  			bzr) $($(DL_MODE)_BZR) && exit ;; \
>  			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
>  			scp) $($(DL_MODE)_SCP) && exit ;; \
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 2e2e66f..7ae166f 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -537,6 +537,8 @@ else ifeq ($$($(2)_SITE_METHOD),scp)
>  DL_TOOLS_DEPENDENCIES += scp ssh
>  else ifeq ($$($(2)_SITE_METHOD),hg)
>  DL_TOOLS_DEPENDENCIES += hg
> +else ifeq ($$($(2)_SITE_METHOD),cvs)
> +DL_TOOLS_DEPENDENCIES += cvs
>  endif # SITE_METHOD
>  
>  DL_TOOLS_DEPENDENCIES += $(firstword $(INFLATE$(suffix $($(2)_SOURCE))))

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
