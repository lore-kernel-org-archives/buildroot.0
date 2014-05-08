From: Samuel Martin <s.martin49@gmail.com>
Date: Thu,  8 May 2014 23:58:55 +0200
Subject: [Buildroot] [PATCH] cmake: forward HOST_{C, LD}FLAGS as cmake flags
Message-ID: <1399586335-22928-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the CMake bootstrap phase, the {C,LD}FLAGS set in the bootstrap
environment are not forwarded/converted as CMake flags.

The CMake build contains a bootstrap phase building a minimal CMake
program using a standard Makfile, then reconfigures itself with this
minimal program.

On system with no ncurses installed, and because the prefix option
points to $(HOST_DIR)/usr, if host-cmake was built after host-ncurses,
then ncurses libraries and headers are correctly find (in the host tree)
during the second configuration (because of the prefix). However, it
fails at building ccmake (the curses interface) because the
CMAKE_C_FLAGS, CMAKE_CXX_FLAGS and CMAKE_EXE_LINKER_FLAGS do not
point to the host tree.

Because these flags are needed when running the bootstrap script,
this patch makes sure the same flags are set when running the second
configuration.

Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/cmake/cmake.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d45c642..1240895 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -14,7 +14,9 @@ define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
 		LDFLAGS="$(HOST_LDFLAGS)" \
 		CFLAGS="$(HOST_CFLAGS)" \
-		./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(PARALLEL_JOBS) \
+		./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(PARALLEL_JOBS) -- \
+		-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" -DCMAKE_CXX_FLAGS="$(HOST_CFLAGS)" \
+		-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
 	)
 endef
 
-- 
1.9.2
