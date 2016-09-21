From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 22:29:07 +0200
Subject: [Buildroot] [git commit] package/libxslt: fix bfin compile
Message-ID: <20160921203234.A4F6481730@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d0ade55428a47a52656eec965dd7b8a81894073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/df4/df4bf247c92847024dff88ce58a5f47343f06258/
http://autobuild.buildroot.org/results/b33/b33f34dc23f7429928d7d0b1478e71d8e7fffed2/
http://autobuild.buildroot.org/results/cad/cad02570ec039511b9495e82d98439e9f0724b37/

And many more.

A GCC bug is triggered when the compiler is run with an optimization level
'-Os/-O2/-O3' for the Blackfin architecture:

```
error: unable to find a register to spill in class 'CCREGS'
```

Workaround this bug by forcing an optimization level of '-O1' when building
libxslt for the Blackfin architecture.

See GCC bug report:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77311

[Peter: add reference to autobuilders failures]
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxslt/libxslt.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 868ba6a..d89dde8 100644
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
