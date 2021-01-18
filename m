From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jan 2021 19:16:12 +0100
Subject: [Buildroot] [PATCH] packages: carry site-method archive format
 version when overriding _SOURCE
Message-ID: <20210118181612.77863-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5b95a5dc2 (support/download: change format of archives generated
from git) changed the way the archives generated from git repositories
are named, adding a "format-version" identifier right between the
package version and the file extension.

Commit c043ecb20 (support/download: change format of archives generated
from svn) did so for archives generated from a subversion checkout.

However, for the a few packages, we manually force the _SOURCE variable,
because we want to share the archive with another package, to avoid
downloading and storing those archives twice. This is the case for:

  - linux-headers and linux
  - barebox-aux and barebox

When the generated tarballs were renamed with the aforementioned
commits, those packages were not updated accordingly.

Fix that by manually propagating the per-site-method format-version.

Reported-by: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: "Stephane Viau (OSS)" <stephane.viau@oss.nxp.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk                | 2 +-
 package/linux-headers/linux-headers.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 77550aaed6..8f02f9f9e1 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -28,7 +28,7 @@ $(1)_SITE_METHOD = git
 # Override the default value of _SOURCE to 'barebox-*' so that it is not
 # downloaded a second time for barebox-aux; also alows avoiding the hash
 # check:
-$(1)_SOURCE = barebox-$$($(1)_VERSION).tar.gz
+$(1)_SOURCE = barebox-$$($(1)_VERSION)$$(BR_FMT_VERSION_git).tar.gz
 else
 # Handle stable official Barebox versions
 $(1)_SOURCE = barebox-$$($(1)_VERSION).tar.bz2
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 4496295f2a..69ab16c443 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -34,7 +34,7 @@ ifeq ($(LINUX_HEADERS_CUSTOM_TARBALL),y)
 LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_CUSTOM_TARBALL_LOCATION)))
 else ifeq ($(LINUX_HEADERS_CUSTOM_GIT),y)
-LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
 LINUX_HEADERS_SITE_METHOD = git
 else ifeq ($(LINUX_HEADERS_CUSTOM_HG),y)
@@ -42,7 +42,7 @@ LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
 LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
 LINUX_HEADERS_SITE_METHOD = hg
 else ifeq ($(LINUX_HEADERS_CUSTOM_SVN),y)
-LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
+LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION)$(BR_FMT_VERSION_svn).tar.gz
 LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
 LINUX_HEADERS_SITE_METHOD = svn
 else ifeq ($(LINUX_HEADERS_CIP),y)
-- 
2.25.1
