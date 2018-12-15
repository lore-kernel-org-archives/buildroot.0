From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Dec 2018 14:12:03 +0100
Subject: [Buildroot] [PATCH 1/1] fwts: fix build with pkgconf 1.5.3
Message-ID: <20181215131203.29102-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

fwts uses the completionsdir variable from bash-completions.pc to decide
where to install things. Since DESTDIR is prepended to the install
destination, this will end up in the wrong location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on bash-completions.pc.

Fixes:
 - http://autobuild.buildroot.org/results/ce1f72a08ef77edd1dc8b8d6394bae0f83f5de56

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fwts/fwts.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index aa006f3b8b..9b3a79564f 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -13,6 +13,10 @@ FWTS_AUTORECONF = YES
 FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 libbsd \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+FWTS_CONF_OPTS += --with-bashcompletiondir=/usr/share/bash-completion/completions
+endif
+
 ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
 FWTS_MODULE_SUBDIRS = efi_runtime
 $(eval $(kernel-module))
-- 
2.14.1
