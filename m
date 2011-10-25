From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 25 Oct 2011 11:00:21 +0200
Subject: [Buildroot] [PATCH 2 of 2 v2] Add support for packages stored
 in Mercurial (hg) repositories
In-Reply-To: <56545e9539a0397927d6.1318602762@devws108>
References: <patchbomb.1318602760@devws108>
 <56545e9539a0397927d6.1318602762@devws108>
Message-ID: <CAAXf6LUMaA01_SDRxnhNjRX1bnB7EGai5mqZ4PYu13SUXkLAMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 19, 2011 at 5:06 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Add support for packages stored in Mercurial (hg) repositories.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> ?Config.in ? ? ? ? ? ? ? ? ? | ? 4 ++++
> ?package/Makefile.package.in | ?33 +++++++++++++++++++++++++++++----
> ?2 files changed, 33 insertions(+), 4 deletions(-)
>
> diff --git a/Config.in b/Config.in
> --- a/Config.in
> +++ b/Config.in
> @@ -44,6 +44,10 @@ config BR2_SSH
> ? ? ? ?string "Secure shell (ssh) command"
> ? ? ? ?default "ssh"
>
> +config BR2_HG
> + ? ? ? string "Mercurial (hg) command"
> + ? ? ? default "hg"
> +
> ?config BR2_ZCAT
> ? ? ? ?string "zcat command"
> ? ? ? ?default "gzip -d -c"
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -92,6 +92,7 @@ WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET
> ?SVN:=$(call qstrip,$(BR2_SVN))
> ?BZR:=$(call qstrip,$(BR2_BZR))
> ?GIT:=$(call qstrip,$(BR2_GIT))
> +HG:=$(call qstrip,$(BR2_HG)) $(QUIET)
> ?SCP:=$(call qstrip,$(BR2_SCP)) $(QUIET)
> ?SSH:=$(call qstrip,$(BR2_SSH)) $(QUIET)
> ?LOCALFILES:=$(call qstrip,$(BR2_LOCALFILES))
> @@ -125,20 +126,20 @@ notdomain=$(patsubst $(call domain,$(1),
> ?domainseparator=$(if $(1),$(1),/)
>
> ?################################################################################
> -# The DOWNLOAD_{GIT,SVN,BZR,LOCALFILES} helpers are in charge of getting a
> +# The DOWNLOAD_{GIT,SVN,BZR,HG,LOCALFILES} helpers are in charge of getting a
> ?# working copy of the source repository for their corresponding SCM,
> ?# checking out the requested version / commit / tag, and create an
> ?# archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
> ?# ssh authentication. DOWNLOAD_WGET is the normal wget-based download
> ?# mechanism.
> ?#
> -# The SOURCE_CHECK_{GIT,SVN,BZR,WGET,LOCALFILES,SCP} helpers are in charge of
> +# The SOURCE_CHECK_{GIT,SVN,BZR,HG,WGET,LOCALFILES,SCP} helpers are in charge of
> ?# simply checking that the source is available for download. This can be used
> ?# to make sure one will be able to get all the sources needed for
> ?# one's build configuration.
> ?#
> -# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,WGET,LOCALFILES,SCP} helpers simply output
> -# to the console the names of the files that will be downloaded, or path
> +# The SHOW_EXTERNAL_DEPS_{GIT,SVN,BZR,HG,WGET,LOCALFILES,SCP} helpers simply
> +# output to the console the names of the files that will be downloaded, or path
> ?# and revision of the source repositories, producing a list of all the
> ?# "external dependencies" of a given build configuration.
> ?################################################################################
> @@ -214,6 +215,27 @@ define SHOW_EXTERNAL_DEPS_SCP
> ?endef
>
>
> +define DOWNLOAD_HG
> + ? ? ? test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> + ? ? ? (pushd $(DL_DIR) > /dev/null && \
> + ? ? ? $(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
> + ? ? ? $(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz --prefix $($(PKG)_BASE_NAME)/ \
> + ? ? ? ? ? ? ? ? ? ? --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE) && \
> + ? ? ? rm -rf $($(PKG)_DL_DIR) && \
> + ? ? ? popd > /dev/null)
> +endef
> +
> +# TODO: improve to check that the given PKG_DL_VERSION exists on the remote
> +# repository
> +define SOURCE_CHECK_HG
> + ?$(HG) incoming --force -l1 $($(PKG)_SITE) > /dev/null
> +endef
> +
> +define SHOW_EXTERNAL_DEPS_HG
> + ?echo $($(PKG)_SOURCE)
> +endef
> +
> +
> ?define DOWNLOAD_WGET
> ? ? ? ?test -e $(DL_DIR)/$(2) || \
> ? ? ? ?$(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
> @@ -267,6 +289,7 @@ define DOWNLOAD
> ? ? ? ? ? ? ? ? ? ? ? ?bzr) $($(DL_MODE)_BZR) && exit ;; \
> ? ? ? ? ? ? ? ? ? ? ? ?file) $($(DL_MODE)_LOCALFILES) && exit ;; \
> ? ? ? ? ? ? ? ? ? ? ? ?scp) $($(DL_MODE)_SCP) && exit ;; \
> + ? ? ? ? ? ? ? ? ? ? ? hg) $($(DL_MODE)_HG) && exit ;; \
> ? ? ? ? ? ? ? ? ? ? ? ?*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
> ? ? ? ? ? ? ? ?esac ; \
> ? ? ? ?fi ; \
> @@ -698,6 +721,8 @@ else ifeq ($$($(2)_SITE_METHOD),bzr)
> ?DL_TOOLS_DEPENDENCIES += bzr
> ?else ifeq ($$($(2)_SITE_METHOD),scp)
> ?DL_TOOLS_DEPENDENCIES += scp ssh
> +else ifeq ($$($(2)_SITE_METHOD),hg)
> +DL_TOOLS_DEPENDENCIES += hg
> ?endif # SITE_METHOD
>
> ?endif # $(2)_KCONFIG_VAR
>
>
>

bump
