From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:53:50 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/openjdk-bin:
 install to host/usr/lib/jvm
Message-ID: <20200715195249.D032680170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b6ec56c24fd8b341a53dcb5ec73f2788a694cb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Buildroot currently installs openjdk-bin to $(HOST_DIR)/ instead of the more
traditional (for java installations) $(HOST_DIR)/usr/lib/jvm.

As described in https://bugs.busybox.net/show_bug.cgi?id=13001

"Openjdk-bin provides it's own libfreetype.so and places it into
$(HOST_DIR)/lib/. This library causes build failures with the
host-xapp_mkfontscale package due to the overwritten libfreetype.so.

mkfontscale.o: In function `doDirectory':
mkfontscale.c:(.text+0x1a80): undefined reference to `FT_Get_BDF_Property'
collect2: error: ld returned 1 exit status

Reproducing the error is done by repeating the following steps.
make host-freetype
make host-openjdk-bin
make host-xapp_mkfontscale"

There are two options for fixing this problem:

 1) add host-freetype and host-lksctp-tools as dependencies to host-openjdk-bin
    and then remove the provided libfreetype.so and libsctp.so libraries
    in a post_extract_hook.

 2) change the installation directory from $(HOST_DIR)/ to
    $(HOST_DIR)/usr/lib/jvm just like the target OpenJDK package and
    copy the entire source directories contents to the above location.

The second option provides the following advantages:
  - the directory structure is consistent with how we handle the target OpenJDK.

  - the HOST_OPENJDK_BIN_INSTALL_CMDS step is simplified.

  - packages such as Maven require directories of which we are currently not
    copying. These missing directories cause programs such as Maven to crash
    when running with an error such as
    "Can't read cryptographic policy directory: unlimited."

  - does not miss any other libraries that solution 1 would not cope with
    (e.g. libzip.so from host-libzip, or libnet.so from not-yet existing
    host-libnet, or libsctp.so from not-yet existing host-lksctp-tools)

Because the second option is both simple, easier to implement, is low-impact,
and fixes the problems described above wholly, it is the best to implement.

To implement the above changes, we must also modify the following files in the
same patch to match the host's new directory paths:

 - openjdk.mk
 - openjdk-jni-test.mk
 - openjdk-hello-world.mk

To avoid having to change all those packages in the future, expose two
new variables, HOST_OPENJDK_BIN_ROOT_DIR which contains the path where
the openjdk-bin was installed in, and JAVAC, which contains the path to
the javac compiler (modeled after the way the autoconf et al. variables
are set and exposed).

Tested with:
./support/testing/run-tests -o out -d dl tests.package.test_openjdk.TestOpenJdk

Fixes: https://bugs.busybox.net/show_bug.cgi?id=13001

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - introduce HOST_OPENJDK_BIN_ROOT_DIR and JAVAC
  - expand and tweak the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e9a02417f3f4475cf9a789f480743e3702d32e59)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk-bin/openjdk-bin.mk                          | 13 ++++++++-----
 package/openjdk/openjdk.mk                                  |  2 +-
 .../package/openjdk-hello-world/openjdk-hello-world.mk      |  2 +-
 .../openjdk/package/openjdk-jni-test/openjdk-jni-test.mk    |  2 +-
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index f4a8979e0b..b8110ab968 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -20,17 +20,20 @@ endif
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 
+HOST_OPENJDK_BIN_ROOT_DIR = $(HOST_DIR)/usr/lib/jvm
+
 # unpack200 has an invalid RPATH and relies on libzlib. When
 # host-libzlib is installed on the system, the error "ERROR: package
 # host-libzlib installs executables without proper RPATH: will occur.
 # Because unpack200 is a deprecated tool, removing it to fix this
 # issue is safe.
 define HOST_OPENJDK_BIN_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/bin
-	cp -dpfr $(@D)/bin/* $(HOST_DIR)/bin/
-	mkdir -p $(HOST_DIR)/lib
-	cp -dpfr $(@D)/lib/* $(HOST_DIR)/lib/
-	$(RM) -f $(HOST_DIR)/bin/unpack200
+	mkdir -p $(HOST_OPENJDK_BIN_ROOT_DIR)
+	cp -dpfr $(@D)/* $(HOST_OPENJDK_BIN_ROOT_DIR)
+	$(RM) -f $(HOST_OPENJDK_BIN_ROOT_DIR)/bin/unpack200
 endef
 
 $(eval $(host-generic-package))
+
+# variables used by other packages
+JAVAC = $(HOST_OPENJDK_BIN_ROOT_DIR)/bin/javac
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index f3a4a616eb..ff82abed56 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -93,7 +93,7 @@ OPENJDK_CONF_OPTS = \
 	--enable-openjdk-only \
 	--enable-unlimited-crypto \
 	--openjdk-target=$(GNU_TARGET_NAME) \
-	--with-boot-jdk=$(HOST_DIR) \
+	--with-boot-jdk=$(HOST_OPENJDK_BIN_ROOT_DIR) \
 	--with-stdc++lib=dynamic \
 	--with-debug-level=release \
 	--with-devkit=$(HOST_DIR) \
diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
index 998117b8e2..ddd5e38884 100644
--- a/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-hello-world/openjdk-hello-world.mk
@@ -8,7 +8,7 @@ OPENJDK_HELLO_WORLD_DEPENDENCIES = openjdk
 
 define OPENJDK_HELLO_WORLD_BUILD_CMDS
 	$(INSTALL) -D $(OPENJDK_HELLO_WORLD_PKGDIR)/HelloWorld.java $(@D)/HelloWorld.java
-	$(HOST_DIR)/bin/javac $(@D)/HelloWorld.java
+	$(JAVAC) $(@D)/HelloWorld.java
 endef
 
 define OPENJDK_HELLO_WORLD_INSTALL_TARGET_CMDS
diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk
index f279e5cd70..2028ad40c7 100644
--- a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/openjdk-jni-test.mk
@@ -10,7 +10,7 @@ JNI_INCLUDE_PATH = $(BUILD_DIR)/openjdk-$(OPENJDK_VERSION)/build/linux-aarch64-s
 
 define OPENJDK_JNI_TEST_BUILD_CMDS
 	# Compile Java classes and generate native headers
-	$(HOST_DIR)/bin/javac -d $(@D) -h $(@D) \
+	$(JAVAC) -d $(@D) -h $(@D) \
 		$(OPENJDK_JNI_TEST_PKGDIR)/JniTest.java \
 		$(OPENJDK_JNI_TEST_PKGDIR)/JniWrapper.java \
 		$(OPENJDK_JNI_TEST_PKGDIR)/JniHelper.java
