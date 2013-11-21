From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 21 Nov 2013 17:19:40 +0000
Subject: [Buildroot] [PATCH] libroxml: fix avr32 build failure
Message-ID: <1385054380-20684-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The -Wno-unused-result option is not understood by the version of gcc used by the
avr32 toolchain. Remove the option from the compilation flags.

Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/e22/e22d94fca3eabb4e54d82af04319f17ad8e10c20/

The single existing patch for libroxml has been renamed to include a numerical
component for application order sorting. The existing patch has also been updated
to apply without fuzz.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...oxml-werror.patch => libroxml-0001-werror.patch} |  2 +-
 .../libroxml/libroxml-0002-wno-unused-result.patch  | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 rename package/libroxml/{libroxml-werror.patch => libroxml-0001-werror.patch} (97%)
 create mode 100644 package/libroxml/libroxml-0002-wno-unused-result.patch

diff --git a/package/libroxml/libroxml-werror.patch b/package/libroxml/libroxml-0001-werror.patch
similarity index 97%
rename from package/libroxml/libroxml-werror.patch
rename to package/libroxml/libroxml-0001-werror.patch
index 6435b01..91f322c 100644
--- a/package/libroxml/libroxml-werror.patch
+++ b/package/libroxml/libroxml-0001-werror.patch
@@ -11,7 +11,7 @@ Index: a/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -41,7 +41,7 @@
+@@ -46,7 +46,7 @@
  
  # options
  override CPPFLAGS += -Iinc/
diff --git a/package/libroxml/libroxml-0002-wno-unused-result.patch b/package/libroxml/libroxml-0002-wno-unused-result.patch
new file mode 100644
index 0000000..406bf3c
--- /dev/null
+++ b/package/libroxml/libroxml-0002-wno-unused-result.patch
@@ -0,0 +1,21 @@
+The -Wno-unused-result option is not understood by the version of gcc used by the
+avr32 toolchain. Remove the option from the compilation flags.
+
+Fixes build failures such as the following.
+
+  http://autobuild.buildroot.net/results/e22/e22d94fca3eabb4e54d82af04319f17ad8e10c20/
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/Makefile b/Makefile
+--- a/Makefile	2013-11-21 17:13:17.679388374 +0000
++++ b/Makefile	2013-11-21 17:13:35.219299157 +0000
+@@ -46,7 +46,7 @@ DEFINES = -DIGNORE_EMPTY_TEXT_NODES
+ 
+ # options
+ override CPPFLAGS += -Iinc/
+-override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Wno-unused-result -Iinc/ $(DEFINES)
++override CFLAGS += $(OPTIM) -fPIC -Wall -Wextra -Wno-unused-parameter -Iinc/ $(DEFINES)
+ override LDFLAGS += 
+ 
+ ifeq ("$(OS)", "Darwin")
-- 
1.8.3.2
