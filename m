From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:02:16 +0200
Subject: [Buildroot] [git commit branch/next] pkg-cmake.mk: set pkg-config
	env. vars. in the host configure environment
Message-ID: <20170809225752.606E17FE41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9f9b16a2f37caeeced47cb562b642ec0c166652
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This change is fixing the bug reported in [1].

Cmake may run pkg-config to find the dependencies when configuring a
package. Because of the value of PATH, and it will use the Buildroot's
pkg-config wrapper, which, by default, is configured (via some
environment variables) to find the target dependencies.

When configuring a host package using cmake, to prevent cmake from
wrongly solving dependencies from the target tree (when the
*-config.cmake files are using pkg-config) instead of looking for them
in the Buildroot's host tree or in the host system itself, we need to
set the environment variables altering the pkg-config behavior in the
cmake configure environment.

So, this change is fixing the cmake host-packages configuration step,
by properly setting the pkg-config environment variables to their values
for finding host dependencies.

Before this patch:

  make O=/opt/br/abo/cmake-host-find-root-path libxml2 host-mariadb{-dirclean,-configure} && echo $?
  [...]
  >>> host-mariadb 10.1.25 Configuring
  (mkdir -p /opt/br/abo/cmake-host-find-root-path/build/host-mariadb-10.1.25/ && cd /opt/br/abo/cmake-host-find-root-path/build/host-mariadb-10.1.25/ && rm -f CMakeCache.txt && PATH="/opt/br/abo/cmake-host-find-root-path/host/bin:/opt/br/abo/cmake-host-find-root-path/host/sbin:/home/sam/.local/bin:/sbin:/usr/sbin:/bin:/usr/bin"  /usr/bin/cmake /opt/br/abo/cmake-host-find-root-path/build/host-mariadb-10.1.25/ -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_FIND_ROOT_PATH="/opt/br/abo/cmake-host-find-root-path/host" -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" -DCMAKE_INSTALL_PREFIX="/opt/br/abo/cmake-host-find-root-path/host" -DCMAKE_C_FLAGS="-O2 -I/opt/br/abo/cmake-host-find-root-path/host/include" -DCMAKE_CXX_FLAGS="-O2 -I/opt/br/abo/cmake-host-find-root-path/host/include" -DCMAKE_EXE_LINKER_FLAGS="-L/opt/br/abo/cmake-host-find-root-path/host/lib -Wl,-rpath,/opt/br/abo/cmake-host-find-root-path/host/lib"
  -DCMAKE_ASM_COMPILER="/usr/bin/as" -DCMAKE_C_COMPILER="/usr/bin/gcc" -DCMAKE_CXX_COMPILER="/usr/bin/g++"  -DCMAKE_C_COMPILER_ARG1="" -DCMAKE_CXX_COMPILER_ARG1=""  -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF -DBUILD_TESTS=OFF -DBUILD_TESTING=OFF  -DWITH_SSL=bundled )
  -- Running cmake version 3.8.2
  [...]
  -- Found PkgConfig: /opt/br/abo/cmake-host-find-root-path/host/bin/pkg-config (found version "0.28")
  [...]
  -- Found LibXml2: /opt/br/abo/cmake-host-find-root-path/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libxml2.so (found version "2.9.4")
  [...]
  0

After this patch is applied:

  make O=/opt/br/abo/cmake-host-find-root-path libxml2 host-mariadb{-dirclean,-configure} && echo $?
  [...]
  >>> host-mariadb 10.1.25 Configuring
  (mkdir -p /opt/br/abo/cmake-host-find-root-path/build/host-mariadb-10.1.25/ && cd /opt/br/abo/cmake-host-find-root-path/build/host-mariadb-10.1.25/ && rm -f CMakeCache.txt && PATH="/opt/br/abo/cmake-host-find-root-path/host/bin:/opt/br/abo/cmake-host-find-root-path/host/sbin:/home/sam/.local/bin:/sbin:/usr/sbin:/bin:/usr/bin" PKG_CONFIG="/opt/br/abo/cmake-host-find-root-path/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_LIBDIR="/opt/br/abo/cmake-host-find-root-path/host/lib/pkgconfig:/opt/br/abo/cmake-host-find-root-path/host/share/pkgconfig" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1  /usr/bin/cmake /opt/br/abo/cmake-host-find-root-path/build/host-mariadb-10.1.25/ -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_FIND_ROOT_PATH="/opt/br/abo/cmake-host-find-root-path/host" -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM="BOTH" -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY="BOTH" -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE="BOTH" -DCMAKE_INSTALL_PREFIX="/opt/br/abo/cmake-host-find-roo
 t-path/host" -DCMAKE_C_FLAGS="-O2 -I/opt/br/abo/cmake-host-find-root-path/host/include" -DCMAKE_CXX_FLAGS="-O2 -I/opt/br/abo/cmake-host-find-root-path/host/include" -DCMAKE_EXE_LINKER_FLAGS="-L/opt/br/abo/cmake-host-find-root-path/host/lib -Wl,-rpath,/opt/br/abo/cmake-host-find-root-path/host/lib" -DCMAKE_ASM_COMPILER="/usr/bin/as" -DCMAKE_C_COMPILER="/usr/bin/gcc" -DCMAKE_CXX_COMPILER="/usr/bin/g++"  -DCMAKE_C_COMPILER_ARG1="" -DCMAKE_CXX_COMPILER_ARG1=""  -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF -DBUILD_TESTS=OFF -DBUILD_TESTING=OFF  -DWITH_SSL=bundled )
  -- Running cmake version 3.8.2
  [...]
  -- Found PkgConfig: /opt/br/abo/cmake-host-find-root-path/host/bin/pkg-config (found version "0.28")
  [...]
  -- Found LibXml2: /usr/lib/libxml2.so (found version "2.9.4")
  [...]
  0

[1] http://lists.busybox.net/pipermail/buildroot/2017-August/199776.html

Reported-by: "Sigalas, Antonios (Nokia - GR/Athens)" <antonios.sigalas@nokia.com>
Cc: "Sigalas, Antonios (Nokia - GR/Athens)" <antonios.sigalas@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-cmake.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 914bda7..db78d89 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -109,6 +109,11 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_BUILDDIR) && \
 	rm -f CMakeCache.txt && \
 	PATH=$$(BR_PATH) \
+	PKG_CONFIG="$$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG_SYSROOT_DIR="/" \
+	PKG_CONFIG_LIBDIR="$$(HOST_DIR)/lib/pkgconfig:$$(HOST_DIR)/share/pkgconfig" \
+	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
+	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 	$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
 		-DCMAKE_INSTALL_SO_NO_EXE=0 \
 		-DCMAKE_FIND_ROOT_PATH="$$(HOST_DIR)" \
