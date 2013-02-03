From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Feb 2013 21:53:21 +0100
Subject: [Buildroot] [PATCH 2/2] pptp-linux: fix parallel build
In-Reply-To: <1359924801-30806-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1359924801-30806-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1359924801-30806-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to fix a parallel build issue caused by a header file
being generated too late.

Fixes:

http://autobuild.buildroot.org/results/2324974d4818b2657a7df4beee33fc4713d6116f/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../pptp-linux-004-fix-parallel-build.patch        |   23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/pptp-linux/pptp-linux-004-fix-parallel-build.patch

diff --git a/package/pptp-linux/pptp-linux-004-fix-parallel-build.patch b/package/pptp-linux/pptp-linux-004-fix-parallel-build.patch
new file mode 100644
index 0000000..04a7977
--- /dev/null
+++ b/package/pptp-linux/pptp-linux-004-fix-parallel-build.patch
@@ -0,0 +1,23 @@
+Fix parallel build issue
+
+The config.h header file must be created before being used to build
+source files that include it, especially version.c. In order for this
+to happen even in highly-parallel builds, we add a dependency of all
+object files on config.h, in order to ensure it gets generated before
+make attempts to build the object files.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -37,6 +37,8 @@
+ 
+ all: config.h $(PPTP_BIN) pptpsetup.8
+ 
++$(PPTP_OBJS): config.h
++
+ $(PPTP_BIN): $(PPTP_OBJS) $(PPTP_DEPS)
+ 	$(CC) -o $(PPTP_BIN) $(PPTP_OBJS) $(LDFLAGS) $(LIBS)
+ 
-- 
1.7.9.5
