From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Oct 2016 13:53:20 +0200
Subject: [Buildroot] [PATCH] fakeroot: bump version to 1.21-2
Message-ID: <20161004115320.647-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the glibc 2.24-3, and this commit:
https://sourceware.org/git/?p=glibc.git;a=commit;h=80f87443eed17838fe453f1f5406ccf5d3698c25
fakeroot will print spurious message about symbols not being found.

[...]
dlsym(acl_get_fd): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_get_fd
dlsym(acl_get_file): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_get_file
dlsym(acl_set_fd): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_set_fd
dlsym(acl_set_file): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_set_file
dlsym(acl_get_fd): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_get_fd
dlsym(acl_get_file): /usr/lib/libfakeroot/libfakeroot.so: undefined symbol: acl_get_file
[...]

It doesn't seem to impair the behavior of fakeroot, it's simply annoying
for the user.

Debian (which is the creator of fakeroot) has a patch which is a
workaround: simply don't display the message.

Since Debian has other patch that may be of interests to Buildroot and
we certainly don't want to maintain our own copies, we now download the
debian tarball to apply all of their patches.

In this version, the configure and Makefile are not provided so we need
to generate them using the 'bootstrap' script included in the source.

Finally, the added patch remove the 'doc' subdirectory from being built.
Without it, the build ends up in error because the install process is
unable to find the manpages files (it looks in the  wrong directory) but
we don't really care about manpages so it's easier to simply disable
building them, gaining a few seconds.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 .../0001-Makefile.am-remove-doc-subdir.patch       | 27 ++++++++++++++++++++++
 package/fakeroot/fakeroot.hash                     |  8 ++++---
 package/fakeroot/fakeroot.mk                       | 13 ++++++++---
 3 files changed, 42 insertions(+), 6 deletions(-)
 create mode 100644 package/fakeroot/0001-Makefile.am-remove-doc-subdir.patch

diff --git a/package/fakeroot/0001-Makefile.am-remove-doc-subdir.patch b/package/fakeroot/0001-Makefile.am-remove-doc-subdir.patch
new file mode 100644
index 0000000..9a12752
--- /dev/null
+++ b/package/fakeroot/0001-Makefile.am-remove-doc-subdir.patch
@@ -0,0 +1,27 @@
+From 9d842122bdd7b59c5166163b6400aa81763bf844 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Tue, 4 Oct 2016 11:10:51 +0200
+Subject: [PATCH] Makefile.am: remove doc subdir
+
+It's not interesting in Buildroot context to make the documentation.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6d6f07f..c9c7bb6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ AUTOMAKE_OPTIONS=foreign
+ ACLOCAL_AMFLAGS = -I build-aux
+-SUBDIRS=scripts doc test
++SUBDIRS=scripts test
+ 
+ noinst_LTLIBRARIES = libcommunicate.la libmacosx.la
+ libcommunicate_la_SOURCES = communicate.c
+-- 
+2.9.3
+
diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index f0d436e..f326947 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,4 +1,6 @@
-# From http://snapshot.debian.org/package/fakeroot/1.20.2-1/
-sha1	367040df07043edb630942b21939e493f3fad888	fakeroot_1.20.2.orig.tar.bz2
+# From http://snapshot.debian.org/package/fakeroot/1.21-2/
+sha1	9ce6155c0f3edf310818a09b6b1b8968a8cb0cd4	fakeroot_1.21.orig.tar.gz
+sha1	7f09b96b495f3502ff8d805376eb74cd98ee188f	fakeroot_1.21-2.debian.tar.xz
 # Calculated based on the hash above
-sha256	7c0a164d19db3efa9e802e0fc7cdfeff70ec6d26cdbdc4338c9c2823c5ea230c	fakeroot_1.20.2.orig.tar.bz2
+sha256	2d6ff6900ebc553b0b66d910b5a7ad4889dd738cd757629afe4bc4e80be484e3	fakeroot_1.21-2.debian.tar.xz
+sha256	5d293c1b3604b2a9265d1811a9890c749887ef08aec55f3237d32bf35836171a	fakeroot_1.21.orig.tar.gz
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 168cd13..3209792 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.20.2
-FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
-FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
+FAKEROOT_VERSION = 1.21
+FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
+FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20161003T101329Z/pool/main/f/fakeroot
+FAKEROOT_PATCH = \
+	http://snapshot.debian.org/archive/debian/20161003T101329Z/pool/main/f/fakeroot/fakeroot_$(FAKEROOT_VERSION)-2.debian.tar.xz
 # Force capabilities detection off
 # For now these are process capabilities (faked) rather than file
 # so they're of no real use
@@ -17,4 +19,9 @@ HOST_FAKEROOT_CONF_ENV = \
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
+define FAKEROOT_RUN_BOOTSTRAP
+	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
+endef
+HOST_FAKEROOT_PRE_CONFIGURE_HOOKS += FAKEROOT_RUN_BOOTSTRAP
+
 $(eval $(host-autotools-package))
-- 
2.9.3
