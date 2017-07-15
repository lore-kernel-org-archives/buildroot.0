From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Jul 2017 17:49:28 +0200
Subject: [Buildroot] [git commit] git: fix build with NLS disabled
Message-ID: <20170715154700.8A44881DA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de660718500e6c15d6b3ae5d7faf6cdf9dd9ebc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/git/git.mk b/package/git/git.mk
index 23ace0f..52907a2 100644
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
