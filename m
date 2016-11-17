From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu, 17 Nov 2016 15:47:12 -0200
Subject: [Buildroot] [PATCH] stella: fix bug when compiling with PPC altivec
	vectorization
Message-ID: <1479404832-11783-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PPC altivec vectorization triggers a bug when compiling with -std=c++11
because "bool" is redefined in altivec.h.

src/emucore/Event.hxx:112:23: error: cannot convert ?bool? to ?__vector(4) __bool int? in assignment
         myKeyTable[i] = false;
                       ^

Acording to a bug report in GCC [1], "You need to use -std=g++11 or
undefine bool after the include of altivec.h as context sensitive
keywords is not part of the C++11 standard".

So let's compile with -std=gnu++11 when PPC altivec is enabled.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58241#c3

Fixes:
http://autobuild.buildroot.net/results/0970d2c8e1787ceffc46b589522e53d52675e03c
http://autobuild.buildroot.net/results/ec1bc57675b6e53af0cd33d7b99cd2e3bf5d9d7e

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...XFLAGS-so-we-can-append-values-to-user-de.patch | 40 ++++++++++++++++++++++
 package/stella/stella.mk                           | 14 +++++++-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 package/stella/0004-Override-CXXFLAGS-so-we-can-append-values-to-user-de.patch

diff --git a/package/stella/0004-Override-CXXFLAGS-so-we-can-append-values-to-user-de.patch b/package/stella/0004-Override-CXXFLAGS-so-we-can-append-values-to-user-de.patch
new file mode 100644
index 000000000000..7e82c571e2c1
--- /dev/null
+++ b/package/stella/0004-Override-CXXFLAGS-so-we-can-append-values-to-user-de.patch
@@ -0,0 +1,40 @@
+From f81bec4d6e523df308158d6bd6f948be4d0183ba Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Thu, 17 Nov 2016 15:26:56 -0200
+Subject: [PATCH] Override CXXFLAGS so we can append values to user-defined
+ CXXFLAGS.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 6dd0129587b3..7133ca58ac49 100644
+--- a/Makefile
++++ b/Makefile
+@@ -49,17 +49,17 @@ ifdef CXXFLAGS
+ else
+   CXXFLAGS:= -O2
+ endif
+-CXXFLAGS+= -Wall -Wextra -Wno-unused-parameter -Wno-ignored-qualifiers
++override CXXFLAGS+= -Wall -Wextra -Wno-unused-parameter -Wno-ignored-qualifiers
+ ifdef HAVE_GCC
+-  CXXFLAGS+= -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual -Wnon-virtual-dtor -std=c++11
++  override CXXFLAGS+= -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual -Wnon-virtual-dtor
+ endif
+ 
+ ifdef PROFILE
+   PROF:= -g -pg -fprofile-arcs -ftest-coverage
+-  CXXFLAGS+= $(PROF)
++  override CXXFLAGS+= $(PROF)
+ else
+   ifdef HAVE_GCC
+-    CXXFLAGS+= -fomit-frame-pointer
++    override CXXFLAGS+= -fomit-frame-pointer
+   endif
+ endif
+ 
+-- 
+1.9.1
+
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index 2e9d57b8c1ea..11cdd6adcd97 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -12,11 +12,23 @@ STELLA_LICENSE_FILES = Copyright.txt License.txt
 
 STELLA_DEPENDENCIES = sdl2 libpng zlib
 
+STELLA_CXXFLAGS = $(TARGET_CFLAGS)
+
+# PPC altivec vectorization triggers a bug when compiling with -std=c++11
+# so let's compile it with -std=gnu++11
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+STELLA_CXXFLAGS += -std=gnu++11
+else
+STELLA_CXXFLAGS += -std=c++11
+endif
+
 STELLA_CONF_OPTS = \
 	--host=$(GNU_TARGET_NAME) \
 	--prefix=/usr \
 	--with-sdl-prefix=$(STAGING_DIR)/usr
 
+STELLA_MAKE_OPTS += CXXFLAGS="$(STELLA_CXXFLAGS)"
+
 # The configure script is not autoconf based, so we use the
 # generic-package infrastructure
 define STELLA_CONFIGURE_CMDS
@@ -28,7 +40,7 @@ define STELLA_CONFIGURE_CMDS
 endef
 
 define STELLA_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(STELLA_MAKE_OPTS) -C $(@D)
 endef
 
 define STELLA_INSTALL_TARGET_CMDS
-- 
1.9.1
