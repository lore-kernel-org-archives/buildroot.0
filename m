From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 09:29:24 +0100
Subject: [Buildroot] [git commit] package/axfsutils: fix Makefile
Message-ID: <20151117091038.A930281762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb8b5c27b2eaca31e83603417dd7a7269504cbac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mkfs.axfs uses zlib, but does not have an rpath to our host dir.

That's because:
  - we're not passing our host CFLAGS or LDFLAGS
  - it is forcibly setting CFLAGS in the Makefile, overriding anything
    specified by the user
  - it is not using LDFLAGS at all

Add two patches so that CFLAGS and LDFLAGS from the environment are
used if present.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/axfsutils/0001-fix-cflags.patch  |   19 +++++++++++++++++++
 package/axfsutils/0002-use-ldflags.patch |   20 ++++++++++++++++++++
 package/axfsutils/axfsutils.mk           |    2 +-
 3 files changed, 40 insertions(+), 1 deletions(-)

diff --git a/package/axfsutils/0001-fix-cflags.patch b/package/axfsutils/0001-fix-cflags.patch
new file mode 100644
index 0000000..0415d82
--- /dev/null
+++ b/package/axfsutils/0001-fix-cflags.patch
@@ -0,0 +1,19 @@
+Makefile: complement CFLAGS provided by the user
+
+In some circumstances, the user may want to pass its own CFLAGS,
+like for when the zlib headers are not located in the standard gcc
+search paths.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN a/mkfs.axfs-legacy/Makefile b/mkfs.axfs-legacy/Makefile
+--- a/mkfs.axfs-legacy/Makefile
++++ b/mkfs.axfs-legacy/Makefile
+@@ -1,5 +1,5 @@
+-INC = -I./
+-CFLAGS = -g $(INC) -O0
++INC += -I./
++CFLAGS += -g $(INC) -O0
+ 
+ MKFSOBJS = mkfs.axfs.o
+ 
diff --git a/package/axfsutils/0002-use-ldflags.patch b/package/axfsutils/0002-use-ldflags.patch
new file mode 100644
index 0000000..20e03a9
--- /dev/null
+++ b/package/axfsutils/0002-use-ldflags.patch
@@ -0,0 +1,20 @@
+Makefile: use LDFLAGS as provided by the user
+
+In some circumstances, the user may want to pass some LDFLAGS, like
+-L flags to point to the zlib location if it was not installed in a
+standard location.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN a/mkfs.axfs-legacy/Makefile b/mkfs.axfs-legacy/Makefile
+--- a/mkfs.axfs-legacy/Makefile
++++ b/mkfs.axfs-legacy/Makefile
+@@ -6,7 +6,7 @@
+ all:   mkfs.axfs
+ 
+ mkfs.axfs: $(MKFSOBJS)
+-	$(CC) $(CFLAGS) -o mkfs.axfs $(MKFSOBJS) -lz
++	$(CC) $(CFLAGS) $(LDFLAGS) -o mkfs.axfs $(MKFSOBJS) -lz
+ 
+ clean_mkfs.axfs:
+ 	rm -rf $(MKFSOBJS) mkfs.axfs
diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
index 3e6ea52..4dd60ef 100644
--- a/package/axfsutils/axfsutils.mk
+++ b/package/axfsutils/axfsutils.mk
@@ -13,7 +13,7 @@ AXFSUTILS_DEPENDENCIES = host-zlib
 # The 'new' mkfs.axfs version requires GNUstep which is not a buildroot
 # prerequisite. The 'legacy' one works just as well without that requirement.
 define HOST_AXFSUTILS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/mkfs.axfs-legacy
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/mkfs.axfs-legacy
 endef
 
 define HOST_AXFSUTILS_INSTALL_CMDS
