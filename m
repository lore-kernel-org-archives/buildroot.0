From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jan 2013 11:45:27 +0100
Subject: [Buildroot] [PATCH 2/3] boost: slightly reduce the verbosity of the
	build
In-Reply-To: <1358246728-5141-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358246728-5141-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358246728-5141-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/boost/boost.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.7.9.5
