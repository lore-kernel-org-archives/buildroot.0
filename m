From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 22:58:49 +0200
Subject: [Buildroot] [git commit] package: add a <pkg>_EXTRA_DOWNLOADS
	variable
Message-ID: <20131008213236.CF37A9B700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c13d5bc60749717634fac60b8165a3e2567bcdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Converting the external toolchain logic into a package raises a very
special use case that wasn't handled by the package infrastructure:
the Blackfin toolchain is delivered as two tarballs instead of
one. Unfortunately <pkg>_SOURCE only allows to pass one tarball name.

However, we really want both tarballs to be known by the package
infrastructure, so that the normal 'source' and 'external-deps'
mechanism work fine.

In order to achieve this, we add a <pkg>_EXTRA_DOWNLOADS variable,
which allows a package to list other stuff it would like to see
downloaded, but that are otherwise not used by the package
infrastructure itself: it is up to the package to do it by itself.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt |    6 ++++++
 package/pkg-generic.mk                  |    1 +
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index cb067bd..59a2684 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -248,6 +248,12 @@ information is (assuming the package name is +libfoo+) :
     +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
     +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
 
+* +LIBFOO_EXTRA_DOWNLOADS+ lists a number of additional files that
+  Buildroot should download from +LIBFOO_SITE+ in addition to the main
+  +LIBFOO_SOURCE+ (which usually is a tarball). Buildroot will not do
+  anything with those additional files, except download files: it will
+  be up to the package recipe to use them from +$(DL_DIR)+.
+
 * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
   package source code. In many cases, Buildroot guesses the method
   from the contents of +LIBFOO_SITE+ and setting +LIBFOO_SITE_METHOD+
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index bfc4dc1..a46457c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -40,6 +40,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 	fi
 endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
+	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
 	$(foreach p,$($(PKG)_PATCH),\
 		$(if $(findstring ://,$(p)),\
 			$(call DOWNLOAD,$(p)),\
