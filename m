From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 22:12:45 +0100
Subject: [Buildroot] [git commit] manual: update Config.in dependency
	explainations
Message-ID: <20120318215010.486AD90D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6372f4e64600335b5ff7d07e3b78baf2fa6cce59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: adjusted according to Arnout's suggestions]
Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-directory.txt |   53 +++++++++++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 04be820..2670f2f 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -87,6 +87,59 @@ comment "acl requires a toolchain with LARGEFILE support"
 --------------------------
 
 
+Note that these two dependency types are only transitive with the
+dependencies of the same kind.
+
+This means, in the following example:
+
+--------------------------
+config BR2_PACKAGE_A
+        bool "Package A"
+
+config BR2_PACKAGE_B
+        bool "Package B"
+        depends on BR2_PACKAGE_A
+
+config BR2_PACKAGE_C
+        bool "Package C"
+        depends on BR2_PACKAGE_B
+
+config BR2_PACKAGE_D
+        bool "Package D"
+        select BR2_PACKAGE_B
+
+config BR2_PACKAGE_E
+        bool "Package E"
+        select BR2_PACKAGE_D
+--------------------------
+
+* Selecting +Package C+ will be visible if +Package B+ has been
+  selected, which in turn is only visible if +Package A+ has been
+  selected.
+
+* Selecting +Package E+ will select +Package D+, which will select
+  +Package B+, it will not check for the dependencies of +Package B+,
+  so it will not select +Package A+.
+
+* Since +Package B+ is selected but +Package A+ is not, this violates
+  the dependency of +Package B+ on +Package A+.  Therefore, in such a
+  situation, the transitive dependency has to be added explicitly:
+
+--------------------------
+config BR2_PACKAGE_D
+	bool "Package D"
+	select BR2_PACKAGE_B
+	depends on BR2_PACKAGE_A
+
+config BR2_PACKAGE_E
+	bool "Package E"
+	select BR2_PACKAGE_D
+	depends on BR2_PACKAGE_A
+--------------------------
+
+Overall, for package library dependencies, +select+ should be
+preferred.
+
 Note that such dependencies will make sure that the dependency option
 is also enabled, but not necessarily built before your package. To do
 so, the dependency also needs to be expressed in the +.mk+ file of the
