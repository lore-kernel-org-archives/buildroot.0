From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:48:02 +0200
Subject: [Buildroot] [git commit] flex: only prevent the flex binary to be
	built for target, not for host
Message-ID: <20170601202854.AF6C7807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41ee484bafe402cfadcf1d480b7c8b44bf206af1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do want to build the flex binary when building host-flex since it's
needed as a build dependency for other packages.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ntation.patch => 0001-flex-disable-documentation.patch} | 14 +-------------
 package/flex/flex.mk                                       |  5 +++++
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/package/flex/0001-flex-disable-flex-binary-and-documentation.patch b/package/flex/0001-flex-disable-documentation.patch
similarity index 55%
rename from package/flex/0001-flex-disable-flex-binary-and-documentation.patch
rename to package/flex/0001-flex-disable-documentation.patch
index d035ef4..68bec12 100644
--- a/package/flex/0001-flex-disable-flex-binary-and-documentation.patch
+++ b/package/flex/0001-flex-disable-documentation.patch
@@ -1,4 +1,4 @@
-flex: prevent flex binary to be built
+flex: disable documentation
 
 Since we prevent the flex binary to be built, we also need to prevent
 the documentation to be built, otherwise it will fail like this:
@@ -21,15 +21,3 @@ diff -rup a/Makefile.in b/Makefile.in
  	examples \
  	po \
  	tests \
-diff -rup a/src/Makefile.in b/src/Makefile.in
---- a/src/Makefile.in	2017-05-06 15:49:09.000000000 +0100
-+++ b/src/Makefile.in	2017-05-10 14:35:01.918464036 +0100
-@@ -90,7 +90,7 @@ PRE_UNINSTALL = :
- POST_UNINSTALL = :
- build_triplet = @build@
- host_triplet = @host@
--bin_PROGRAMS = flex$(EXEEXT)
-+bin_PROGRAMS =
- @ENABLE_BOOTSTRAP_TRUE at noinst_PROGRAMS = stage1flex$(EXEEXT)
- @CROSS_TRUE at am__append_1 = \
- @CROSS_TRUE@		      ../lib/malloc.c \
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 81cbdc1..aa6c026 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -15,6 +15,11 @@ FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES = host-m4
 
+define FLEX_DISABLE_PROGRAM
+	$(SED) 's/^bin_PROGRAMS.*//' $(@D)/src/Makefile.in
+endef
+FLEX_POST_PATCH_HOOKS += FLEX_DISABLE_PROGRAM
+
 # flex++ symlink is broken when flex binary is not installed
 define FLEX_REMOVE_BROKEN_SYMLINK
 	rm -f $(TARGET_DIR)/usr/bin/flex++
