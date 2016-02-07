From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Feb 2016 22:34:24 +0100
Subject: [Buildroot] [PATCH 1/6 v3] package/avahi: break circular
	dependencies
In-Reply-To: <cover.1454880734.git.yann.morin.1998@free.fr>
References: <cover.1454880734.git.yann.morin.1998@free.fr>
Message-ID: <9851ff7c9ebb4f8cac4886d696e9ce7d589e2961.1454880734.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
Changes v2 -> v3:
  - break the loop at the avahi -> libgtk{2,3} deps  (Thomas)
---
 package/avahi/avahi.mk | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 9c6b609..7229673 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -71,6 +71,8 @@ AVAHI_CONF_ENV = \
 AVAHI_CONF_OPTS = \
 	--disable-qt3 \
 	--disable-qt4 \
+	--disable-gtk \
+	--disable-gtk3 \
 	--disable-gdbm \
 	--disable-pygtk \
 	--disable-mono \
@@ -126,19 +128,6 @@ else
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
-- 
1.9.1
