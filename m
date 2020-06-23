From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Jun 2020 21:27:27 +0200
Subject: [Buildroot] [git commit] package/libnids: use libglib2 is available
Message-ID: <20200623193205.D5077844F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8045b467349f20454316a17a7f884348fadc4fbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnids can make use of libglib2 for multi-threading support, so use
that when available.

The configure.in script is flawed: passing either --enable-libglib or
--disabel-libglib will both disable support for libglib. Only when
neither is passed will the autodetection test be executed, at which
point (hopefully) libglib2 will be enabled if found.

So, unlike our usual practice, we can;t explcitly enable it; we can only
explicitly disable it, and rely on autodetection to enable it.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
[yann.morin.1998 at free.fr:
  - add missing dependency on libglib2
  - expand commit log to explain why we don't --enable-libglib
  - add a simmilar blurb in the .mk
  - fix condition, use positive logic since we have an else-clause
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnids/libnids.mk | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
index ee7c71ee88..f0330787c7 100644
--- a/package/libnids/libnids.mk
+++ b/package/libnids/libnids.mk
@@ -11,9 +11,18 @@ LIBNIDS_LICENSE_FILES = COPYING
 LIBNIDS_INSTALL_STAGING = YES
 LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
 LIBNIDS_AUTORECONF = YES
-LIBNIDS_CONF_OPTS = \
-	--disable-libglib \
-	--disable-libnet
+LIBNIDS_CONF_OPTS = --disable-libnet
+
+# disable libglib2 if not available
+# The test in configure.in is flawed: passing --enable-libglib would also
+# disable it. Only when neither is passed will the autodetection test be
+# executed.
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+LIBNIDS_DEPENDENCIES += libglib2
+else
+LIBNIDS_CONF_OPTS += --disable-libglib
+endif
+
 # hand-written Makefile.in, not using automake, needs a custom
 # variable for the installation path.
 LIBNIDS_INSTALL_STAGING_OPTS = install_prefix=$(STAGING_DIR) install
