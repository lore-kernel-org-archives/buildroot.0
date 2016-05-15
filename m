From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 22:10:08 +0200
Subject: [Buildroot] [git commit] android-tools: add patch to fix static
	linking
Message-ID: <20160515201041.81ADF817A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9194be9f3acfda7eb32a1ede9918f913bb59b2c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/c3b95741a5f6622dc9542f9eaefe295a328e2e40/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../android-tools/0005-fix-static-link-zlib.patch  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/android-tools/0005-fix-static-link-zlib.patch b/package/android-tools/0005-fix-static-link-zlib.patch
new file mode 100644
index 0000000..dff4df6
--- /dev/null
+++ b/package/android-tools/0005-fix-static-link-zlib.patch
@@ -0,0 +1,36 @@
+Fix static linking of adb/adbd
+
+Both adb and adbd use OpenSSL, which indirectly uses zlib. Since
+adb/adbd also use zlib directly -lz is included in the linker flags,
+but not at the right position to ensure that static linking works: to
+make it possible for OpenSSL symbols to see zlib symbols, -lz must
+appear after -lcrypto.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/debian/makefiles/adb.mk
+===================================================================
+--- a/debian/makefiles/adb.mk
++++ b/debian/makefiles/adb.mk
+@@ -41,7 +41,7 @@
+ CPPFLAGS+= -I$(SRCDIR)/core/adb
+ CPPFLAGS+= -I$(SRCDIR)/core/include
+ 
+-LIBS+= -lc -lpthread -lz -lcrypto
++LIBS+= -lc -lpthread -lcrypto -lz
+ 
+ OBJS= $(SRCS:.c=.o)
+ 
+Index: b/debian/makefiles/adbd.mk
+===================================================================
+--- a/debian/makefiles/adbd.mk
++++ b/debian/makefiles/adbd.mk
+@@ -44,7 +44,7 @@
+ CPPFLAGS+= -I$(SRCDIR)/core/adbd
+ CPPFLAGS+= -I$(SRCDIR)/core/include
+ 
+-LIBS+= -lc -lpthread -lz -lcrypto -lcrypt
++LIBS+= -lc -lpthread -lcrypto -lz -lcrypt
+ 
+ OBJS= $(patsubst %, %.o, $(basename $(SRCS)))
+ 
