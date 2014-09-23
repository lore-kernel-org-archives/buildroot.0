From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 22:14:15 +0200
Subject: [Buildroot] [git commit] gcc: add new fix for the ARC 2014.08 gcc
	version
Message-ID: <20140923201527.B35519D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c24f559435f7c47da9e46a559026a604cfb3307b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new patch to the ARC 2014.08 gcc specific version,
that redefines PTRDIFF_TYPE from "long int" to "int".

The change of SIZE_TYPE from "long unsigned int" to "unsigned int"
http://git.buildroot.net/buildroot/commit/?id=0f236c1fef669192c8f5cc8ef26e93da91438dc2
introduced a regression due to the existing PTRDIFF_TYPE.

Now to fix regression the patch converts PTRDIFF_TYPE to simple "int".

The fix is taken from current development branch of GCC for ARC and
will be a part of the next release of ARC tools, so at that point
patch should be dropped.

https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/846e92167aa4f486259c9ff44bb4e6cce6097fa4

[Thomas: tweak commit log.]

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/arc-2014.08/300-ptrdiff_type_int.patch |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/gcc/arc-2014.08/300-ptrdiff_type_int.patch b/package/gcc/arc-2014.08/300-ptrdiff_type_int.patch
new file mode 100644
index 0000000..6ee765b
--- /dev/null
+++ b/package/gcc/arc-2014.08/300-ptrdiff_type_int.patch
@@ -0,0 +1,26 @@
+Redefine PTRDIFF_TYPE
+
+Change of SIZE_TYPE from "long unsigned int" to "unsigned int" introduced
+regression due to existing PTRDIFF_TYPE.
+
+Now to fix regression convert PTRDIFF_TYPE to simple "int".
+
+Fix is taken from current development branch of GCC for ARC and will be a
+part of the next release of ARC tools, so at that point patch should be dropped.
+
+https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/846e92167aa4f486259c9ff44bb4e6cce6097fa4
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+---
+
+--- a/gcc/config/arc/arc.h
++++ b/gcc/config/arc/arc.h
+@@ -488,7 +488,7 @@ if (GET_MODE_CLASS (MODE) == MODE_INT		\
+ #define DEFAULT_SIGNED_CHAR 0
+ 
+ #define SIZE_TYPE "unsigned int"
+-#define PTRDIFF_TYPE "long int"
++#define PTRDIFF_TYPE "int"
+ #define WCHAR_TYPE "int"
+ #define WCHAR_TYPE_SIZE 32
+ 
