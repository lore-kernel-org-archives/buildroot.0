From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 17 Apr 2019 23:37:13 +0200
Subject: [Buildroot] [git commit] qt5base: Fix inconsistencies when
 overriding qmake properties
Message-ID: <20190417221135.73C488ED1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=951d438ddd212eb8163a67670383f2c86a8abc1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When querying the qmake properties with our custom qt.conf present, I
noticed that they were different from the built-in ones (without
qt.conf). Most notably QT_INSTALL_PREFIX was a concatenated string of
two absolute paths (hostdir + sysroot).

This is due to Prefix being set to our HOST_DIR and HostPrefix not being
set at all. Supposedly this was also the root cause of the initial
problem with qt.conf.in, because once Prefix and HostPrefix are set to
their correct values, re-setting all the other paths to their defaults
is no longer necessary. (However, since our paths for Headers, Plugins
and Examples are non-default, they still have to be explicitely set.)

There is one exception to this: omitting 'Settings' leads to the
CONFIGURATION path being plain /usr, whereas the default without qt.conf
is /usr/etc/xdg. But even if storing configs directly under /usr seems a
bit strange we keep it that way, because our qt.conf did set it to /usr
before and we don't want to break existing users.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5base/qt.conf.in | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
index 9a0b9cd53b..2215cbd4e1 100644
--- a/package/qt5/qt5base/qt.conf.in
+++ b/package/qt5/qt5base/qt.conf.in
@@ -1,19 +1,7 @@
 [Paths]
-Prefix=@@HOST_DIR@@
+Prefix=/usr
+HostPrefix=@@HOST_DIR@@
 Sysroot=@@STAGING_DIR@@
 Headers=/usr/include/qt5
-Libraries=/usr/lib
-LibraryExecutables=/usr/libexec
-Binaries=/usr/bin
 Plugins=/usr/lib/qt/plugins
 Examples=/usr/lib/qt/examples
-Qml2Imports=/usr/qml
-Imports=/usr/imports
-Translations=/usr/translations
-Examples=/usr/lib/qt/examples
-Demos=/usr/lib/qt/examples
-Tests=/usr/tests
-Settings=/usr
-Documentation=/usr/doc
-ArchData=/usr
-Data=/usr
