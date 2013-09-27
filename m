From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 27 Sep 2013 17:11:44 +0200
Subject: [Buildroot] [RFC] package: Redownload HEAD packages every build
In-Reply-To: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <422c5b3f-36c2-46c5-b033-7644523dfad0@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton Shotwell <clshotwe@rockwellcollins.com> wrote:
>Adding a check to remove a downloaded package if the version is HEAD. This causes the package to be re-downloaded with updated software. This feature is very useful during package development.
>
>Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
>---
> package/pkg-generic.mk |    7 +++++++
> 1 files changed, 7 insertions(+), 0 deletions(-)
>
>diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>index bfc4dc1..859c4a9 100644
>--- a/package/pkg-generic.mk
>+++ b/package/pkg-generic.mk
>@@ -27,6 +27,13 @@
> # Retrieve the archive
> $(BUILD_DIR)/%/.stamp_downloaded:
> ifeq ($(DL_MODE),DOWNLOAD)
>+# Remove the pre-downloaded tar file if the package is a HEAD version
>+	$(Q)( \
>+	if test $($(PKG)_VERSION) == HEAD -a -e $(DL_DIR)/$($(PKG)_SOURCE); then \
>+		rm $(DL_DIR)/$($(PKG)_SOURCE); \
>+		$(call MESSAGE,"Removing $(PKG) HEAD source file"); \
>+	fi; \
>+	)
> # Only show the download message if it isn't already downloaded
> 	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
> 		$(call MESSAGE,"Downloading") ; \


Not sure if this patch would be accepted, but in case it is I think you should also check for 'tip' which is the mercurial name for HEAD. Note that it may be safer to also check the FOO_SITE_METHOD variable for hg or git, to avoid that tip would match with a git tag or branch, and similarly that HEAD would match a mercurial tag or branch.

Best regards,
Thomas
