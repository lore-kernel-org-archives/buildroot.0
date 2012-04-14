From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 14 Apr 2012 16:47:09 +0000 (UTC)
Subject: [Buildroot] [Bug 5102] qt package moc, uic,
	rcc read from wrong place
In-Reply-To: <bug-5102-163@https.bugs.busybox.net/>
References: <bug-5102-163@https.bugs.busybox.net/>
Message-ID: <20120414164709.CE69596ABD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5102

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-04-14 16:47:09 UTC ---
That seems strange, because there were only two commits relative to the Qt
package between 2011.11 and 2012.12 and none of them could have affected the
location of moc, uic, rcc, etc. Can you please post the Buildroot configuration
you're using, and the build errors you have (full build log would be nice) ?

The following two commits that took place are:

commit 1e39b8a6ff5ba330688bc1a60d1e509d716b6900
Author: Frederik Pasch <fpasch@googlemail.com>
Date:   Thu Feb 9 21:20:12 2012 +0100

    qt: needs host-pkg-config

    Closes #4760

    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 28a477a..34f05f9 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -15,7 +15,7 @@
 QT_VERSION = 4.7.4
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://get.qt.nokia.com/qt/source
-
+QT_DEPENDENCIES = host-pkg-config
 QT_INSTALL_STAGING = YES

 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)

commit d018125508c1d13f69b71702384c00c7095986a1
Author: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date:   Fri Jan 27 00:41:30 2012 +0100

    qt: qt-dbus: replace dependency on dbus by select

    Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

diff --git a/package/qt/Config.in b/package/qt/Config.in
index ab231d9..3a552d0 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -280,12 +280,9 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
          If unsure, say n.
 endif

-comment "Qt Dbus module not available (needs dbus)"
-       depends on !BR2_PACKAGE_DBUS
-
 config BR2_PACKAGE_QT_DBUS
        bool "DBus Module"
-       depends on BR2_PACKAGE_DBUS
+       select BR2_PACKAGE_DBUS
        help
          Build the Qt DBus module.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
