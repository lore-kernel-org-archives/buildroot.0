From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 23:23:59 +0100
Subject: [Buildroot] [PATCH 01/10] python: use default configure commands to
	get shared build
In-Reply-To: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353191025.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7020eae0800f390bf69f92dfe2e060dc09821abf.1353191025.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3c90f754961c6d99059c0b6d0a66bc797a3c017b made Python use a
special ./configure command in order to avoid --enable-shared
--disable-static being passed, because it was causing issues when
building certain modules for a 64 bits system.

However, not having a shared libpython2.7 library for the host
prevents the libxml2 Python binding to get built.

So instead, we use the default configure command, but we add
--enable-static which is needed for Python to build correctly.

Note that we tested the build of Python on a 64 bits host as well as
the build of Python for a 64 bits target, and both went fine, with all
modules built properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk |   14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 87237bb..e0ec9bb 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -17,6 +17,7 @@ PYTHON_LICENSE_FILES = LICENSE
 # third-party Python modules.
 
 HOST_PYTHON_CONF_OPT += 	\
+	--enable-static		\
 	--without-cxx-main 	\
 	--disable-sqlite3	\
 	--disable-tk		\
@@ -38,19 +39,6 @@ HOST_PYTHON_MAKE_ENV = \
 
 HOST_PYTHON_AUTORECONF = YES
 
-define HOST_PYTHON_CONFIGURE_CMDS
-	(cd $(@D) && rm -rf config.cache; \
-	        $(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS)" \
-		LDFLAGS="$(HOST_LDFLAGS)" \
-                $(HOST_PYTHON_CONF_ENV) \
-		./configure \
-		--prefix="$(HOST_DIR)/usr" \
-		--sysconfdir="$(HOST_DIR)/etc" \
-		$(HOST_PYTHON_CONF_OPT) \
-	)
-endef
-
 PYTHON_DEPENDENCIES  = host-python libffi
 
 HOST_PYTHON_DEPENDENCIES = host-expat host-zlib
-- 
1.7.9.5
