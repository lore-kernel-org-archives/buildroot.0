From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 15 Apr 2019 22:56:21 +0200
Subject: [Buildroot] [PATCH v5 1/2] qt5base: Fix inconsistencies when
 overriding qmake properties
Message-ID: <20190415205622.25268-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When querying the qmake properties with our custom qt.conf present, I noticed
that they were different from the built-in ones (without qt.conf).
Most notably QT_INSTALL_PREFIX was a concatenated string of two absolute pathes
(hostdir + sysroot).

This is due to Prefix being set to our HOST_DIR and HostPrefix not being set at
all. I guess this was also the root cause of the initial problem with
qt.conf.in, because once Prefix and HostPrefix were set to their correct values,
re-setting all the other default pathes became obsolete. (However, since our
pathes for Headers, Plugins and Examples are non-default, they still have to be
explicitely set.)

There is one exception to this: Omitting 'Settings' leads to the CONFIGURATION
path being plain /usr, whereas the default without qt.conf is /usr/etc/xdg. But
even if storing configs directly under /usr seems a bit strange we keep it that
way, so the behaviour of "our" qmake doesnt change.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5base/qt.conf.in | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

v4->v5
- Split from qmake infra patches (because of limited time for full rework)
- Keep custom settings path /usr instead of resetting to default /usr/etc/xdg


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
-- 
2.21.0
