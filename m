From: Davide Viti <zinosat@tiscali.it>
Date: Tue,  5 Aug 2014 22:47:08 +0200
Subject: [Buildroot] [PATCH v2 2/2] mongoose: patch to avoid
	_LARGEFILE_SOURCE redefinition warning
In-Reply-To: <1407271628-5996-1-git-send-email-zinosat@tiscali.it>
References: <1407271628-5996-1-git-send-email-zinosat@tiscali.it>
Message-ID: <1407271628-5996-2-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
Changes v1 -> v2:
 - Rename patch following Buildroot convention (Thomas)
 - Add "Signed-off-by" line (Thomas)

 ...ongoose-0001-largefile-conditional-define.patch |   22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/mongoose/mongoose-0001-largefile-conditional-define.patch

diff --git a/package/mongoose/mongoose-0001-largefile-conditional-define.patch b/package/mongoose/mongoose-0001-largefile-conditional-define.patch
new file mode 100644
index 0000000..b1d759a
--- /dev/null
+++ b/package/mongoose/mongoose-0001-largefile-conditional-define.patch
@@ -0,0 +1,22 @@
+Avoid the following warning, due to duplicate definition of
+"_LARGEFILE_SOURCE"
+
+mongoose.c:52:0: warning: "_LARGEFILE_SOURCE" redefined [enabled by default]
+ #define _LARGEFILE_SOURCE       // Enable fseeko() and ftello() functions
+ ^
+<command-line>:0:0: note: this is the location of the previous definition
+
+Signed-off-by: Davide Viti <zinosat@tiscali.it>
+
+--- mongoose-5.4/mongoose.c~	2014-07-28 13:19:00.000000000 +0200
++++ mongoose-5.4/mongoose.c	2014-08-04 23:10:59.164092500 +0200
+@@ -49,7 +49,9 @@
+ #define _XOPEN_SOURCE 600       // For flockfile() on Linux
+ #define __STDC_FORMAT_MACROS    // <inttypes.h> wants this for C++
+ #define __STDC_LIMIT_MACROS     // C++ wants that for INT64_MAX
++#ifndef _LARGEFILE_SOURCE
+ #define _LARGEFILE_SOURCE       // Enable fseeko() and ftello() functions
++#endif
+ #define _FILE_OFFSET_BITS 64    // Enable 64-bit file offsets
+ 
+ #ifdef _MSC_VER
-- 
1.7.10.4
