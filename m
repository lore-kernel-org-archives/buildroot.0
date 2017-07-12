From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 12 Jul 2017 22:37:03 +0300
Subject: [Buildroot] [PATCH] git: fix build with NLS disabled
Message-ID: <77c98152cbd8130d71106a9d5789f7b2472c88a5.1499888223.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit bbfb02598bf75 (git: use the new gettext logic) host-gettext is no
longer an unconditional dependency of git. When NLS is disabled host-gettext
is not built. This breaks the build of git, because the git Makefile runs
msgfmt unless NO_GETTEXT is defined.

Define NO_GETTEXT when NLS is disabled to fix the build.

Fixes:
http://autobuild.buildroot.net/results/c87/c8717619a1307f21cb9fe61196511cea44f72015/
http://autobuild.buildroot.net/results/e7a/e7acff51f988c333c3fe0c4a18eed42a273932d3/
http://autobuild.buildroot.net/results/153/153b17959847ec2079883c087cee27afbdf9571e/

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/git/git.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/git/git.mk b/package/git/git.mk
index 23ace0fd4829..52907a27b738 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -57,6 +57,12 @@ else
 GIT_CONF_OPTS += --without-tcltk
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+GIT_MAKE_OPTS = NO_GETTEXT=1
+endif
+
+GIT_INSTALL_TARGET_OPTS = $(GIT_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+
 # assume yes for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling
 GIT_CONF_ENV += \
-- 
2.13.2
