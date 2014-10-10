From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Oct 2014 23:57:45 +0200
Subject: [Buildroot] [git commit] vlc: fix build when Qt4 development files
	are installed on the host
Message-ID: <20141010215904.391DEB1DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b0946ad07e9ad2e19e1c81bdc8f06a4ba6a461e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Qt4 development files are installed on the host, VLC uses
/usr/bin/moc, /usr/bin/uic and /usr/bin/rcc when Qt support is
enabled. However, those host installed versions are not necessarily
compatible with the Qt version used in Buildroot, causes some build
failures.

This commit therefore passes explicit ac_cv_path_MOC, ac_cv_path_RCC
and ac_cv_path_UIC variables to make sure the Qt host tools built by
Buildroot are used.

Note that the VLC configure.ac script uses 'pkg-config
--variable=exec_prefix QtCore' to find the location of such tools, but
this invocation returns /usr. One solution would have been to extend
the pkgconf-01-fix-variable.patch we have against pkgconf to also
cover exec_prefix, but this has more uncertain consequences than just
fixing VLC.

Fixes:

  http://autobuild.buildroot.org/results/061/06174eaeb7f2b8a591395e607912ad72623b79e3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 0b275f2..13c72ce 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -251,6 +251,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPTS += --enable-qt
+VLC_CONF_ENV += \
+       ac_cv_path_MOC=$(HOST_DIR)/usr/bin/moc \
+       ac_cv_path_RCC=$(HOST_DIR)/usr/bin/rcc \
+       ac_cv_path_UIC=$(HOST_DIR)/usr/bin/uic
 VLC_DEPENDENCIES += qt
 else
 VLC_CONF_OPTS += --disable-qt
