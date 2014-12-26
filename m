From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Dec 2014 22:08:00 +0100
Subject: [Buildroot] [PATCH 1/3 v2] package/kismet: fix ncurses static build
In-Reply-To: <cover.1419627979.git.yann.morin.1998@free.fr>
References: <cover.1419627979.git.yann.morin.1998@free.fr>
Message-ID: <c35053143dde54633ed05aeb48be6b180ff02b2e.1419627979.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Says Vicente:
    [T]he order is very important when doing static builds.
    Otherwise we will see errors like this one:

    [...]/sysroot/usr/lib/libpanel.a(p_delete.o):
    In function `del_panel':
    p_delete.c:(.text+0x68): undefined reference to `_nc_panelhook'

Fix the order configure adds libraries: new libraries should be added
at the *front* of the list, not at the end.

Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - split /usr/include/ncurses removal to its own patch
---
 package/kismet/0003-fix-curses-libs-ordering.patch | 42 ++++++++++++++++++++++
 package/kismet/kismet.mk                           |  3 ++
 2 files changed, 45 insertions(+)
 create mode 100644 package/kismet/0003-fix-curses-libs-ordering.patch

diff --git a/package/kismet/0003-fix-curses-libs-ordering.patch b/package/kismet/0003-fix-curses-libs-ordering.patch
new file mode 100644
index 0000000..b579c96
--- /dev/null
+++ b/package/kismet/0003-fix-curses-libs-ordering.patch
@@ -0,0 +1,42 @@
+configure: fix ordering of ncurses libraries
+
+Says Vicente:
+    [T]he order is very important when doing static builds.
+    Otherwise we will see errors like this one:
+
+    [...]/sysroot/usr/lib/libpanel.a(p_delete.o):
+    In function `del_panel':
+    p_delete.c:(.text+0x68): undefined reference to `_nc_panelhook'
+
+Fix the order configure adds libraries: new libraries should be added
+at the *front* of the list, not at the end.
+
+Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/configure.in
+--- kismet-Kismet-2014-02-R1.orig/configure.in	2014-02-19 05:37:43.000000000 +0100
++++ kismet-Kismet-2014-02-R1/configure.in	2014-12-26 16:46:55.770692349 +0100
+@@ -437,10 +434,10 @@
+ 		AC_MSG_ERROR(Failed to find curses.h or ncurses.h.  You probably need to install the curses-devel package from your distribution)
+ 	fi
+ 
+-	LIBS="$LIBS $curseaux"
++	LIBS="$curseaux $LIBS"
+ 	AC_CHECK_LIB([panel], [new_panel],
+ 				 AC_DEFINE(HAVE_LIBPANEL, 1, Panel terminal lib) 
+-				 curseaux="$curseaux -lpanel",
++				 curseaux="-lpanel $curseaux",
+ 				 AC_MSG_ERROR(Failed to find libpanel extension to curses/ncurses.  Install it, or disable building the Kismet client with --disable-client.  Disabling the client is probably not something you want to do normally.))
+ 
+ 	AC_CHECK_HEADER([panel.h], [foundhpanel=yes])
+@@ -450,7 +447,7 @@
+ 
+ 	LIBS="$OLIBS"
+ 
+-	CLIENTCLIBS="$CLIENTCLIBS $curseaux"
++	CLIENTCLIBS="$curseaux $CLIENTCLIBS"
+ fi
+ 
+ AC_SUBST(CLIBS)
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index f177fea..a71414e 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -12,6 +12,9 @@ KISMET_CONF_OPTS += --with-netlink-version=3
 KISMET_LICENSE = GPLv2+
 KISMET_LICENSE_FILES = debian/copyright
 
+# We touch configure.in:
+KISMET_AUTORECONF = YES
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 	KISMET_DEPENDENCIES += pcre
 endif
-- 
1.9.1
