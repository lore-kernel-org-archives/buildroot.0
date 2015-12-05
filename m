From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Dec 2015 15:38:05 +0100
Subject: [Buildroot] [git commit] boost: add target build step
Message-ID: <20151205144026.7F8CE80AD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fbeea741aa511595d762a5567f9b6d27093ab61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build step for the target was missing, causing the compilation to happen
during the staging install step.  Add a dedicated build step like we do for
the host build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index b96969d..6a2e925 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -128,6 +128,14 @@ define BOOST_CONFIGURE_CMDS
 	echo "" >> $(@D)/user-config.jam
 endef
 
+define BOOST_BUILD_CMDS
+	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q \
+	--user-config=$(@D)/user-config.jam \
+	$(BOOST_OPTS) \
+	--ignore-site-config \
+	--layout=$(BOOST_LAYOUT))
+endef
+
 define BOOST_INSTALL_TARGET_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
 	--user-config=$(@D)/user-config.jam \
