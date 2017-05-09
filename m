From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 May 2017 17:13:20 +0200
Subject: [Buildroot] [git commit] daemon: fix parallel build
Message-ID: <20170509151441.6AFDD825B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c23236d387a84a73940b490f363c3d3d364e3c96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'ready' target creates a symlink in the libslack/ subdirectory to make
up the path to header files.  Unfortunately, the target building sources
files that need that symlink, does not depend on the 'ready' target.  This
might break highly parallel builds.  As a workaround make the 'ready' target
before making 'all'.

Should fix:
http://autobuild.buildroot.net/results/ed2/ed21ac166f2151aa69a7790a17ff05f05afa512d/
http://autobuild.buildroot.net/results/333/3338539743c8b0399c6b0fcbbb7c28b58bf3f387/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/daemon/daemon.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
index dfa573f..79cf3f7 100644
--- a/package/daemon/daemon.mk
+++ b/package/daemon/daemon.mk
@@ -14,6 +14,7 @@ define DAEMON_CONFIGURE_CMDS
 endef
 
 define DAEMON_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) ready
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
