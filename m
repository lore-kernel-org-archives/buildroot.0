From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Oct 2013 18:08:23 +0200
Subject: [Buildroot] [RFC] package: Redownload HEAD packages every build
In-Reply-To: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <524AF377.50909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/13 16:43, Clayton Shotwell wrote:
> Adding a check to remove a downloaded package if the version is HEAD. This causes the package to be re-downloaded with updated software. This feature is very useful during package development.
>
> Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
> ---
>   package/pkg-generic.mk |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index bfc4dc1..859c4a9 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -27,6 +27,13 @@
>   # Retrieve the archive
>   $(BUILD_DIR)/%/.stamp_downloaded:
>   ifeq ($(DL_MODE),DOWNLOAD)
> +# Remove the pre-downloaded tar file if the package is a HEAD version
> +	$(Q)( \
> +	if test $($(PKG)_VERSION) == HEAD -a -e $(DL_DIR)/$($(PKG)_SOURCE); then \
> +		rm $(DL_DIR)/$($(PKG)_SOURCE); \

  Use $(RM) instead of rm, then you don't need to check for existence.

> +		$(call MESSAGE,"Removing $(PKG) HEAD source file"); \

  I don't think this extra message is needed.

> +	fi; \
> +	)
>   # Only show the download message if it isn't already downloaded
>   	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
>   		$(call MESSAGE,"Downloading") ; \
>

  You'll also need to avoid touching the stamp file after the download, 
otherwise the rule is not even evaluated.

  Also I think I would prefer instead to have an explicit variable to 
indicate that it should be re-downloaded, e.g.

ifneq ($($(PKG)_FORCE_DOWNLOAD),)
	$(Q)$(RM) $(DL_DIR)/$($(PKG)_SOURCE)
endif

  This variable can be set either from the package's .mk file or from the 
local override file.


  And finally, the documentation should be updated as well.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
