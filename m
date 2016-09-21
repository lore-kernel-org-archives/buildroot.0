From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 21 Sep 2016 22:21:07 +0200
Subject: [Buildroot] [PATCH] package/libxslt: fix bfin compile
Message-ID: <20160921202107.32301-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A GCC bug is triggered when the compiler is run with an optimization level
'-Os/-O2/-O3' for the Blackfin architecture:

```
error: unable to find a register to spill in class 'CCREGS'
```

Workaround this bug by forcing an optimization level of '-O1' when building
libxslt for the Blackfin architecture.

See GCC bug report:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77311

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libxslt/libxslt.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 868ba6a..4253a60 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -19,6 +19,12 @@ LIBXSLT_CONF_OPTS = \
 LIBXSLT_CONFIG_SCRIPTS = xslt-config
 LIBXSLT_DEPENDENCIES = libxml2
 
+# GCC bug with Os/O2/O3, PR77311
+# error: unable to find a register to spill in class 'CCREGS'
+ifeq ($(BR2_bfin),y)
+LIBXSLT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
+endif
+
 # If we have enabled libgcrypt then use it, else disable crypto support.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBXSLT_DEPENDENCIES += libgcrypt
-- 
2.10.0
