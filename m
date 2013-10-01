From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 23:26:12 +0200
Subject: [Buildroot] [git commit] trace-cmd: fix largefile build problem
Message-ID: <20131001220021.CEEE39B527@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c07f1ce0ec8a75aeed67c0991a10106e79f22323
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The source files of trace-cmd already define _LARGEFILE64_SOURCE, but
Buildroot passes it again on the build command line through CFLAGS,
which causes a build error. We fix this by filtering out our
definition of _LARGEFILE64_SOURCE from the CFLAGS before passing them
to the trace-cmd Makefile.

Fixes the warning visible at:

 http://autobuild.buildroot.net/results/1c4567a230940a5287d03e2a5c2c7afbdc64cd36/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trace-cmd/trace-cmd.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index ada0306..7a750f9 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -11,9 +11,13 @@ TRACE_CMD_INSTALL_STAGING = YES
 TRACE_CMD_LICENSE = GPLv2 LGPLv2.1
 TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
 
+# trace-cmd already defines _LARGEFILE64_SOURCE when necessary,
+# redefining it on the command line causes build problems.
+TRACE_CMD_CFLAGS=$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOURCE
+
 define TRACE_CMD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		CFLAGS="$(TRACE_CMD_CFLAGS)" \
 		-C $(@D) all
 endef
 
