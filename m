From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 11:36:35 +0200
Subject: [Buildroot] [git commit] cmake: forward HOST_{C,
	LD}FLAGS as cmake flags
Message-ID: <20140509094128.A0F079CB4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3b1b92d321b4b21c35e6f8ac27f076edd268639
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During the CMake bootstrap phase, the {C,LD}FLAGS set in the bootstrap
environment are not forwarded/converted as CMake flags.

The CMake build contains a bootstrap phase building a minimal CMake
program using a standard Makfile, then reconfigures itself with this
minimal program.

On system with no ncurses installed, and because the prefix option
points to $(HOST_DIR)/usr, if host-cmake was built after host-ncurses,
then ncurses libraries and headers are correctly found (in the host
tree) during the second configuration (because of the prefix). However,
it fails at building ccmake (the curses interface) because the
CMAKE_C_FLAGS, CMAKE_CXX_FLAGS and CMAKE_EXE_LINKER_FLAGS do not
point to the host tree.

Because these flags are needed when running the bootstrap script,
this patch makes sure the same flags are set when running the second
configuration.

Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/cmake.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index d45c642..235988b 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -14,7 +14,11 @@ define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
 		LDFLAGS="$(HOST_LDFLAGS)" \
 		CFLAGS="$(HOST_CFLAGS)" \
-		./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(PARALLEL_JOBS) \
+		./bootstrap --prefix=$(HOST_DIR)/usr \
+			--parallel=$(PARALLEL_JOBS) -- \
+			-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
+			-DCMAKE_CXX_FLAGS="$(HOST_CXXFLAGS)" \
+			-DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)" \
 	)
 endef
 
