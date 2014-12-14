From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 21:56:14 +0100
Subject: [Buildroot] [git commit] blktrace: really fix parallel build issue
Message-ID: <20141214205926.B40ED7FDC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b706679b576502272b4d82a9e5b996630ea991c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/dd4/dd47b3ca17bdb597d6b12de6b381cf5f25abaf71/
http://autobuild.buildroot.net/results/a84/a842234fbdc8f65d48089b90ee23523540a7091f/
http://autobuild.buildroot.net/results/e63/e6351692ad6aef397e68ffdf107f3a85e4490015/

And many more.

Commit a21163aed (package/blktrace: do not build in parallel) tried to fix
the parallel build issue, but the package doesn't use the autotools package
infrastructure so BLKTRACE_MAKE isn't used.  Instead replace the explicit
$(MAKE) calls with $(MAKE1).

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/blktrace/blktrace.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
index 8f3dbab..c193375 100644
--- a/package/blktrace/blktrace.mk
+++ b/package/blktrace/blktrace.mk
@@ -10,14 +10,12 @@ BLKTRACE_DEPENDENCIES = libaio
 BLKTRACE_LICENSE = GPLv2+
 BLKTRACE_LICENSE_FILES = COPYING
 
-BLKTRACE_MAKE = $(MAKE1)
-
 define BLKTRACE_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS)
 endef
 
 define BLKTRACE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) install \
+	$(MAKE1) -C $(@D) $(TARGET_CONFIGURE_OPTS) install \
 		DESTDIR=$(TARGET_DIR) prefix=/usr
 endef
 
