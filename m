From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 11:51:05 +0100
Subject: [Buildroot] [git commit] boost: slightly reduce the verbosity of
	the build
Message-ID: <20130115105136.09E2E9A19C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea9ed43045851fda2f12e21d89800ffa643564a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the moment, the boost build is very verbose, it gives both the
Jam-level command being executed, and the underlying system command
being executed, with lots of newlines. Makes it hard to see where the
failure is when there is one.

So, we reduce the verbosity level to -d+1, which only gives the
Jam-level command. So now, it looks like:

common.copy /home/test/outputs/e/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/boost/geometry/multi/multi.hpp
common.mkdir /home/test/outputs/e/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/include/boost/geometry/strategies
gcc.compile.c++ bin.v2/libs/regex/build/gcc-4.7.3/release/threading-multi/icu.o
gcc.compile.c++ bin.v2/libs/regex/build/gcc-4.7.3/release/threading-multi/regex_debug.o
gcc.compile.c++ bin.v2/libs/regex/build/gcc-4.7.3/release/threading-multi/regex_raw_buffer.o

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/boost.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 62226ba..5e1bb4e 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -70,7 +70,7 @@ define BOOST_CONFIGURE_CMDS
 endef
 
 define BOOST_INSTALL_TARGET_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+2 \
+	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPT) \
 	--prefix=$(TARGET_DIR)/usr \
@@ -78,7 +78,7 @@ define BOOST_INSTALL_TARGET_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+2 \
+	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPT) \
 	--prefix=$(STAGING_DIR)/usr \
