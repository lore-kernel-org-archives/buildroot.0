From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 13 Sep 2017 10:37:24 -0700
Subject: [Buildroot] [PATCH] package/lzo: Set CMAKE_INSTALL_LIBDIR for host
	variant explicitly
Message-ID: <20170913173724.6157-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building host-lzo on 64-bit Fedora 26 ends up with library files
installed into $(HOST_DIR)/lib64 instead of $(HOST_DIR)/lib where
other packages (at least host-mtd) depending on it would look for it
(resulting in build failures). Fix that by specifying the directory to
be lib/ explicitly.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

I suspect this might not be the best solution for this problem, but it
is a good starting point to discuss what might be and that's why I
submitted this patch anyway.

Thanks,
Andrey Smirnov


 package/lzo/lzo.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 27ca459acf..4eccbdc93a 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -23,5 +23,11 @@ else
 LZO_CONF_OPTS += -DENABLE_STATIC=OFF
 endif
 
+#
+# Make sure that libraries are installed in lib/ and not lib64/ so
+# that other packages can discover it
+#
+HOST_LZO_CONF_OPTS += -DCMAKE_INSTALL_LIBDIR=lib
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.13.5
