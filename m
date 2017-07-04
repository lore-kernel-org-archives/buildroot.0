From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:50 +0200
Subject: [Buildroot] [PATCH 010/100] package/Makefile.in: introduce
	TARGET_NLS_{DEPENDENCIES, LIBS}
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-11-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All packages that can use NLS support will have to depend on
host-gettext, as it provides the tools for generating .mo files from
.po files.

In addition, all packages may need to depend on gettext (and link with
-lintl) if the full-blown gettext implementation is provided by
libintl and not by the C library.

In order to avoid repeating such conditions everywhere, this commit
introduces two variables:

 - TARGET_NLS_DEPENDENCIES, which packages that may use NLS support
   should unconditionally add to their <pkg>_DEPENDENCIES variable.

 - TARGET_NLS_LIBS, which packages can use to pass through LIBS or
   LDFLAGS when the package build system needs help to realize that it
   should link against libintl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 462b7ca..d30da3f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -361,6 +361,11 @@ TARGET_CONFIGURE_ARGS = \
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 NLS_OPTS = --enable-nls
+TARGET_NLS_DEPENDENCIES = host-gettext
+ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
+TARGET_NLS_DEPENDENCIES += gettext
+TARGET_NLS_LIBS += -lintl
+endif
 else
 NLS_OPTS = --disable-nls
 endif
-- 
2.9.4
