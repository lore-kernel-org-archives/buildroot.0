From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 08:02:22 +0100
Subject: [Buildroot] [git commit] pptp-linux: fix parallel build
Message-ID: <20130204213436.CE6F09A939@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5b8081b89ebd5f9ff224440376e811c43696866
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix a parallel build issue caused by a header file
being generated too late.

Fixes:

http://autobuild.buildroot.org/results/2324974d4818b2657a7df4beee33fc4713d6116f/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../pptp-linux-004-fix-parallel-build.patch        |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

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
