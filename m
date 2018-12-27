From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 16:27:11 +0100
Subject: [Buildroot] [git commit] package/libglib2: explicitly specify gio
 module path
Message-ID: <20181227152247.0800B83976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f534562483c65c43a34820d9b0a6625014e1f35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the switch to pkgconf 1.5.3 in commit
4e423669399ad8389edd81761ea5c9cc26bf312d, the glib-networking package
has been failing to build with:

glib-networking: installs files in /home/naourr/work/instance-0/output/host/i686-buildroot-linux-uclibc/sysroot//home/naourr/work/instance-0/output

This error is due to glib-networking having installed its GIO GnuTLS
module into an invalid location. This invalid location is
$(DESTDIR)$(GIO_MODULE_DIR). GIO_MODULE_DIR is found by using:

  pkg-config --variable giomoduledir gio-2.0

Unfortunately, despite the pkgconf fix in commit
7125fc5c1a8a96ff8eee057789358702e1b55835 ("package/pkgconf: add patch
to restore pre-1.5.3 behavior for sysroot prefixing"), the value
returned by pkg-config for giomoduledir remains prefixed by the
sysroot.

This is due to the fact that giomoduledir is defined by default with
the value ${libdir}/gio/modules. When running pkg-config --variable
giomoduledir gio-2.0 with the new pkg-config version, what happens is
that libdir is resolved first, and libdir is one of the variable for
which we add the sysroot prefix. Then later, giomoduledir is
resolved. For this variable, we don't prefix with the
sysroot. However, when resolving the value of giomoduledir, it re-uses
the value of libdir that was already resolved, and this value includes
the sysroot prefix.

There is no simple way to solve this problem within pkg-config. So for
the time being, we take a simple route: make sure giomoduledir isn't
defined in terms of ${libdir}. This is easily done by passing
--with-gio-module-dir to libglib2 configure script.

Fixes:

  http://autobuild.buildroot.net/results/4167159c4a03f5a72dbd7e286aedb3845164cc22/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/libglib2.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 67db5ac359..b112b84f99 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -112,9 +112,14 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 	host-util-linux \
 	host-zlib
 
+# We explicitly specify a giomodule-dir to avoid having a value
+# containing ${libdir} in gio-2.0.pc. Indeed, a value depending on
+# ${libdir} would be prefixed by the sysroot by pkg-config, causing a
+# bogus installation path once combined with $(DESTDIR).
 LIBGLIB2_CONF_OPTS = \
 	--with-pcre=system \
-	--disable-compile-warnings
+	--disable-compile-warnings \
+	--with-gio-module-dir=/usr/lib/gio/modules
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
