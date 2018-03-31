From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Mar 2018 16:24:06 +0200
Subject: [Buildroot] [v3 12/13] download: add flock call before dl-wrapper
In-Reply-To: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180331142407.9522-12-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to introduce the cache mechanisms, we need to have a lock on
the $(LIBFOO_DL_DIR), otherwise it would be impossible to do parallel
download (a shared DL_DIR for two buildroot instances).

To make sure the directory exists, the mkdir call has been removed from
the dl-wrapper and put in the infrastructure.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk     | 4 +++-
 support/download/dl-wrapper | 1 -
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 23f3403098..dff52007e6 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -19,6 +19,7 @@ SSH := $(call qstrip,$(BR2_SSH))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 DL_WRAPPER = support/download/dl-wrapper
+FLOCK = flock $($(PKG)_DL_DIR)/
 
 # DL_DIR may have been set already from the environment
 ifeq ($(origin DL_DIR),undefined)
@@ -91,7 +92,8 @@ endif
 
 define DOWNLOAD
 	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \
-	$(EXTRA_ENV) $(DL_WRAPPER) \
+	$(Q)mkdir -p $($(PKG)_DL_DIR)/
+	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
 		-c $($(PKG)_DL_VERSION) \
 		-f $(notdir $(1)) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 49caf3717b..67e9742767 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -50,7 +50,6 @@ main() {
     if [ -z "${output}" ]; then
         error "no output specified, use -o\n"
     fi
-    mkdir -p "$(dirname "${output}")"
 
     # If the output file already exists and:
     # - there's no .hash file: do not download it again and exit promptly
-- 
2.16.2
