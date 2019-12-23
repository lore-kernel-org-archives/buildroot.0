From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 10:05:32 +0100
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/python-subprocess32: add PYTHON_SUBPROCESS32_CONFIGURE_CMDS
Message-ID: <20191223085710.4D2B48DF6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54f30bf6368268a3fed87b01a2be0ed54aff2686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Since commit 1745fcde740057951dcc5429f3bfabd103b764a1,
python-subprocess32 fails to build because it runs configure with
incorrect arguments so add a PYTHON_SUBPROCESS32_CONFIGURE_CMDS

Fixes:
 - http://autobuild.buildroot.org/results/dcf944129392ee6cacc106e096d8d3adfa4447bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 55e9290603b21e3b88085cba2349eb8af6b7535b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-subprocess32/python-subprocess32.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/python-subprocess32/python-subprocess32.mk b/package/python-subprocess32/python-subprocess32.mk
index d6c57fb8bd..c635196e90 100644
--- a/package/python-subprocess32/python-subprocess32.mk
+++ b/package/python-subprocess32/python-subprocess32.mk
@@ -11,4 +11,21 @@ PYTHON_SUBPROCESS32_SETUP_TYPE = setuptools
 PYTHON_SUBPROCESS32_LICENSE = Python-2.0
 PYTHON_SUBPROCESS32_LICENSE_FILES = LICENSE
 
+# The configure step needs to be run outside of the setup.py since it isn't
+# run correctly for cross-compiling
+define PYTHON_SUBPROCESS32_CONFIGURE_CMDS
+	(cd $(@D) && \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--sysconfdir=/etc \
+		--program-prefix="" \
+	)
+endef
+
 $(eval $(python-package))
