From: Samuel MARTIN <s.martin49@gmail.com>
Date: Sun, 18 Mar 2012 09:54:03 +0100
Subject: [Buildroot] [PATCH 5/5] manual: update Config.in dependency
	explainations
In-Reply-To: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
References: <1332060843-2786-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1332060843-2786-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 docs/manual/adding-packages-directory.txt |   39 +++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 04be820..75ef763 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -87,6 +87,45 @@ comment "acl requires a toolchain with LARGEFILE support"
 --------------------------
 
 
+Note that these two dependency types are only transitive with the
+dependencies of the same kind.
+
+This means, in the following example:
+
+--------------------------
+config PACKAGE_A
+        bool "Package A"
+
+config PACKAGE_B
+        bool "Package B"
+        depends on PACKAGE_A
+
+config PACKAGE_C
+        bool "Package C"
+        depends on PACKAGE_B
+
+config PACKAGE_D
+        bool "Package D"
+        select PACKAGE_B
+
+config PACKAGE_E
+        bool "Package E"
+        select PACKAGE_D
+--------------------------
+
+* Selecting +Package C+ will be visible if +Package B+ has been
+  selected, so if +Package A+ has been selected too.
+
+* Selecting +Package E+ will select +Package D+, which will select
+  +Package B+, it will not check for the dependencies of +Package B+,
+  so it will not select +Package A+.
+
+Overall, for package library dependencies, +select+ should be
+prefered.
+
+One should avoid to mix up these two dependency types, though it
+should be adapted to each case.
+
 Note that such dependencies will make sure that the dependency option
 is also enabled, but not necessarily built before your package. To do
 so, the dependency also needs to be expressed in the +.mk+ file of the
-- 
1.7.9.4
