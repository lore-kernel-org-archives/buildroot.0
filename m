From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 20 Mar 2020 18:29:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/libostree: disable introspection
Message-ID: <20200320172948.1971589-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build fails if gobject-introspection is built before libostree:

./.libs/libostree-1.so: error adding symbols: File in wrong format
collect2: error: ld returned 1 exit status
src/libostree/ostree-repo-deprecated.h:28: Warning: OSTree: symbol='G_GNUC_DEPRECATED_FOR': Skipping foreign symbol from namespace Gio
linking of temporary binary failed: Command '['/bin/bash', './libtool', '--mode=link', '--tag=CC', '--silent', 'gcc', '-o', '/home/buildroot/autobuild/instance-2/output-1/build/libostree-2019.6/tmp-introspectvtkql2xj/OSTree-1.0', '-export-dynamic', '-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64', '-D_LARGEFILE_SOURCE', '-D_LARGEFILE64_SOURCE', '-D_FILE_OFFSET_BITS=64', '-Os', '/home/buildroot/autobuild/instance-2/output-1/build/libostree-2019.6/tmp-introspectvtkql2xj/OSTree-1.0.o', '-L.', 'libostree-1.la', '-L/home/buildroot/autobuild/instance-2/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib', '-lgio-2.0', '-lgobject-2.0', '-Wl,--export-dynamic', '-lgmodule-2.0', '-pthread', '-lglib-2.0', '-lglib-2.0']' returned non-zero exit status 1.
/home/buildroot/autobuild/instance-2/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/../share/gobject-introspection-1.0/Makefile.introspection:155: recipe for target 'OSTree-1.0.gir' failed

Fixes:
 - http://autobuild.buildroot.org/results/f8a14307e6feff61acd963d6cd2aac289e6d1647

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libostree/libostree.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index bdbe6b5aba..ff763b20f9 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -21,6 +21,7 @@ LIBOSTREE_CONF_OPTS += \
 	--disable-gtk-doc \
 	--disable-gtk-doc-html \
 	--disable-gtk-doc-pdf \
+	--disable-introspection \
 	--disable-man
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.25.1
