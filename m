From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Sep 2015 23:13:20 +0200
Subject: [Buildroot] [git commit] dhrystone: pass HZ=100 to fix build issue
	on musl
Message-ID: <20150913211806.7B92181D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38c291cd955c8bc3d66f332de6bbdc23c94dded2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1b6cb1b40431bf484db2d99bfdc8237cbae6a9d7/
http://autobuild.buildroot.net/results/20e669d6e4bc3d872a355ef658ddad8f34676624/

musl doesn't provide sys/param.h to figure out the value of HZ, but as we
know we are building for Linux, and on Linux the clock_t values returned
from times(2) are defined in terms of USER_HZ which is always 100, we can
just as well tell dhrystone to use that directly.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhrystone/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhrystone/Makefile b/package/dhrystone/Makefile
index d628ddb..f7a212b 100644
--- a/package/dhrystone/Makefile
+++ b/package/dhrystone/Makefile
@@ -1,4 +1,4 @@
-CPPFLAGS += -DNO_PROTOTYPES=1
+CPPFLAGS += -DNO_PROTOTYPES=1 -DHZ=100
 LDLIBS += -lm
 
 all: dhrystone
