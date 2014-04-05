From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 15:21:36 +0200
Subject: [Buildroot] [git commit] Revert "flex: Version bump 2.5.39"
Message-ID: <20140405132306.9310C9C5A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1be95896dde41c668e1c884db704b0da2ea360c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The flex bump breaks at least two packages:

 - host-thrift, see http://autobuild.buildroot.org/results/759/7590122fd85b644ae0886a127005188d1f882bef/
 - ipsec-tools, see http://autobuild.buildroot.org/results/238/238296556663d52015beb43df97106f6e164ce55/

No simple fix was found for now, so reverting is the easiest solution
until some time is found to look at doing a flex bump that doesn't
break those packages.

This reverts commit 931d9fbae78a6bb8006a2634e9322ac253cc86f4.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flex/flex-prog-ar.patch |   11 +++++++++++
 package/flex/flex.mk            |    2 +-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/flex/flex-prog-ar.patch b/package/flex/flex-prog-ar.patch
new file mode 100644
index 0000000..e0626ff
--- /dev/null
+++ b/package/flex/flex-prog-ar.patch
@@ -0,0 +1,11 @@
+diff -rup flex-2.5.33.orig/Makefile.in flex-2.5.33/Makefile.in
+--- flex-2.5.33.orig/Makefile.in	2007-01-18 17:29:25.000000000 +0100
++++ flex-2.5.33/Makefile.in	2007-01-18 18:28:22.000000000 +0100
+@@ -105,7 +105,6 @@ am__installdirs = "$(DESTDIR)$(libdir)"
+ 	"$(DESTDIR)$(includedir)"
+ libLIBRARIES_INSTALL = $(INSTALL_DATA)
+ LIBRARIES = $(lib_LIBRARIES)
+-AR = ar
+ ARFLAGS = cru
+ libfl_a_AR = $(AR) $(ARFLAGS)
+ libfl_a_LIBADD =
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 2373d04..17f651b 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLEX_VERSION = 2.5.39
+FLEX_VERSION = 2.5.37
 FLEX_SITE = http://download.sourceforge.net/project/flex
 FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
