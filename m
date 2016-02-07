From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:14:43 +0100
Subject: [Buildroot] [git commit] package/avahi: break circular dependencies
Message-ID: <20160207222644.4BCA980AC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92f704a8c120521458610d610fc6e54d032f1345
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently have two circular dependency chains:

    avahi -> libglade -> libgtk2 -> cups -> avahi
    avahi -> libgtk3 -> cups -> avahi

The cups -> avahi dependency makes sense, as cups would be able to use
Bonjour and mDNS to find printers, so we want to keep that dependency.

The libgtk2 -> cups and libgtk3 -> cups dependencies also make sense, to
be able to offer cups in the print dialogs.

However, the avahi -> libglade and avahi -> libgtk3 dependencies do not
really make sense. As Thomas puts it:

    The avahi GUI programs seem really useless to me. On Debian/Ubuntu
    distributions, they are not even packaged within the main avahi
    packages, but as separate packages, probably indicating that they
    are not very commonly used.

So, we drop the avahi -> libglade and avahi -> libgtk3 dependencies, to
break the circular dependency chain.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[Thomas: add comment in the .mk file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 9c6b609..5d6e6a8 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -68,9 +68,21 @@ AVAHI_CONF_ENV = \
 	avahi_cv_sys_cxx_works=yes \
 	DATADIRNAME=share
 
+# Note: even if we have Gtk2 and Gtk3 support in Buildroot, we
+# explicitly disable support for them, in order to avoid the following
+# circular dependencies:
+#
+#  avahi -> libglade -> libgtk2 -> cups -> avahi
+#  avahi -> libgtk3 -> cups -> avahi
+#
+# Since Gtk2 and Gtk3 in Avahi are only used for some example/demo
+# programs, we decided to disable their support to solve the circular
+# dependency.
 AVAHI_CONF_OPTS = \
 	--disable-qt3 \
 	--disable-qt4 \
+	--disable-gtk \
+	--disable-gtk3 \
 	--disable-gdbm \
 	--disable-pygtk \
 	--disable-mono \
@@ -126,19 +138,6 @@ else
 AVAHI_CONF_OPTS += --disable-glib --disable-gobject
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGLADE),y)
-AVAHI_DEPENDENCIES += libglade
-else
-AVAHI_CONF_OPTS += --disable-gtk
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
-AVAHI_DEPENDENCIES += libgtk3
-AVAHI_CONF_OPTS += --enable-gtk3
-else
-AVAHI_CONF_OPTS += --disable-gtk3
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 AVAHI_CONF_ENV += \
 	am_cv_pathless_PYTHON=python \
