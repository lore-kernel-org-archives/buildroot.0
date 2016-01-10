From: Doug Kehn <rdkehn@yahoo.com>
Date: Sun, 10 Jan 2016 15:25:09 -0600
Subject: [Buildroot] [RFC PATCH v2 4/4] package/dhcp: remove hard coded ar
	reference
In-Reply-To: <1452461109-27498-1-git-send-email-rdkehn@yahoo.com>
References: <1452461109-27498-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1452461109-27498-5-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow AR to be substituted so toolchain ar can be referenced when cross
compiling.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v1 -> v2:
  - new for v2 (suggested by Arnout)
---
 package/dhcp/0003-toolchain-ar.patch | 58 ++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/dhcp/0003-toolchain-ar.patch

diff --git a/package/dhcp/0003-toolchain-ar.patch b/package/dhcp/0003-toolchain-ar.patch
new file mode 100644
index 0000000..0b53602
--- /dev/null
+++ b/package/dhcp/0003-toolchain-ar.patch
@@ -0,0 +1,58 @@
+remove hard coded ar reference
+
+Allow AR to be substituted so toolchain ar can be referenced when cross
+compiling.
+
+Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+
+Index: dhcp-4.3.3/common/Makefile.in
+===================================================================
+--- dhcp-4.3.3.orig/common/Makefile.in
++++ dhcp-4.3.3/common/Makefile.in
+@@ -90,7 +90,7 @@ CONFIG_HEADER = $(top_builddir)/includes
+ CONFIG_CLEAN_FILES =
+ CONFIG_CLEAN_VPATH_FILES =
+ LIBRARIES = $(noinst_LIBRARIES)
+-AR = ar
++AR = @AR@
+ ARFLAGS = cru
+ AM_V_AR = $(am__v_AR_ at AM_V@)
+ am__v_AR_ = $(am__v_AR_ at AM_DEFAULT_V@)
+Index: dhcp-4.3.3/configure
+===================================================================
+--- dhcp-4.3.3.orig/configure
++++ dhcp-4.3.3/configure
+@@ -658,6 +658,7 @@ CPPFLAGS
+ LDFLAGS
+ CFLAGS
+ CC
++AR
+ host_os
+ host_vendor
+ host_cpu
+Index: dhcp-4.3.3/dhcpctl/Makefile.in
+===================================================================
+--- dhcp-4.3.3.orig/dhcpctl/Makefile.in
++++ dhcp-4.3.3/dhcpctl/Makefile.in
+@@ -122,7 +122,7 @@ am__uninstall_files_from_dir = { \
+ am__installdirs = "$(DESTDIR)$(libdir)" "$(DESTDIR)$(bindir)" \
+ 	"$(DESTDIR)$(man1dir)" "$(DESTDIR)$(man3dir)"
+ LIBRARIES = $(lib_LIBRARIES)
+-AR = ar
++AR = @AR@
+ ARFLAGS = cru
+ AM_V_AR = $(am__v_AR_ at AM_V@)
+ am__v_AR_ = $(am__v_AR_ at AM_DEFAULT_V@)
+Index: dhcp-4.3.3/omapip/Makefile.in
+===================================================================
+--- dhcp-4.3.3.orig/omapip/Makefile.in
++++ dhcp-4.3.3/omapip/Makefile.in
+@@ -120,7 +120,7 @@ am__uninstall_files_from_dir = { \
+   }
+ am__installdirs = "$(DESTDIR)$(libdir)" "$(DESTDIR)$(man3dir)"
+ LIBRARIES = $(lib_LIBRARIES)
+-AR = ar
++AR = @AR@
+ ARFLAGS = cru
+ AM_V_AR = $(am__v_AR_ at AM_V@)
+ am__v_AR_ = $(am__v_AR_ at AM_DEFAULT_V@)
-- 
2.6.4
