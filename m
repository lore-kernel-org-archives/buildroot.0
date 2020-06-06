From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 21:26:20 +0200
Subject: [Buildroot] [git commit] package/libnetconf2: add patch to fix
 incompatiblity with libssh
Message-ID: <20200606193053.F36578266F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31e1ea377ca3ca0a3346c34f8379c66c30b1f1d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libnetconf2 upstream project rejects building with ssh support for
libssh 0.9.3 and 0.9.4 due to an existing regression.

This libssh regression bug is already fixed upstream. The libssh buildroot
package has the patch (39099153d9404cd6f107f0fd92ce8686bbd1beb2).

Thus we can remove the libnetconf2 cmake check.

Fixes:
http://autobuild.buildroot.net/results/f72fcccafe70ecb6b2ba21e8d19c5827a09ffec7/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...xt-remove-version-check-for-faulty-libssh.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/libnetconf2/0001-CMakeList.txt-remove-version-check-for-faulty-libssh.patch b/package/libnetconf2/0001-CMakeList.txt-remove-version-check-for-faulty-libssh.patch
new file mode 100644
index 0000000000..d1df807626
--- /dev/null
+++ b/package/libnetconf2/0001-CMakeList.txt-remove-version-check-for-faulty-libssh.patch
@@ -0,0 +1,32 @@
+From ad89283f9ed36f0f1234c7f005edfc34e8b9fd58 Mon Sep 17 00:00:00 2001
+From: Heiko Thiery <heiko.thiery@kontron.com>
+Date: Thu, 4 Jun 2020 15:31:56 +0200
+Subject: [PATCH] CMakeList.txt: remove version check for faulty libssh version
+
+libssh is fixed by a patch in buildroot so we can drop the libssh
+version check for 0.9.3 and 0.9.4.
+
+See: 39099153d9404cd6f107f0fd92ce8686bbd1beb2
+
+Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
+---
+ CMakeLists.txt | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f21fec9..29ef202 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -148,9 +148,6 @@ endif()
+ # dependencies - libssh
+ if(ENABLE_SSH)
+     find_package(LibSSH 0.7.0 REQUIRED)
+-    if(LIBSSH_VERSION VERSION_EQUAL 0.9.3 OR LIBSSH_VERSION VERSION_EQUAL 0.9.4)
+-        message(FATAL_ERROR "LibSSH ${LIBSSH_VERSION} includes regression bugs and libnetconf2 will NOT work properly, try to use another version")
+-    endif()
+ 
+     target_link_libraries(netconf2 ${LIBSSH_LIBRARIES})
+     list(APPEND CMAKE_REQUIRED_LIBRARIES ${LIBSSH_LIBRARIES})
+-- 
+2.20.1
+
