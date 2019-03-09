From: Andreas Naumann <anaumann@ultratronik.de>
Date: Sat,  9 Mar 2019 15:10:21 +0100
Subject: [Buildroot] [PATCH 1/2] qt5base: Fix inconsistencies when
 overriding qmake properties
In-Reply-To: <20190309141022.13140-1-anaumann@ultratronik.de>
References: <20190309141022.13140-1-anaumann@ultratronik.de>
Message-ID: <20190309141022.13140-2-anaumann@ultratronik.de>
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

There is one additional exception to this: Omitting 'Settings' leads to the
CONFIGURATION path being plain /usr, whereas the default without qt.conf is
/usr/etc/xdg. Thus 'Settings' is now also explicitely set, in order to keep
behaviour with/without qt.conf as similar as possible.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5base/qt.conf.in | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
index 9a0b9cd53b..46ebe61614 100644
--- a/package/qt5/qt5base/qt.conf.in
+++ b/package/qt5/qt5base/qt.conf.in
@@ -1,19 +1,8 @@
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
+Settings=/usr/etc/xdg
-- 
2.21.0
