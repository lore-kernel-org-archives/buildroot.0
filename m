From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Feb 2020 01:11:44 +0100
Subject: [Buildroot] [git commit] package/gutenprint: add back the hook for
 creating the m4local directory
Message-ID: <20200218000007.079F48E3DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f5a2c5466a6ee37b62b48fc6175e30448f4e7fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 64c42c5e2c26261e26c3548c86b02f55d12f341b removed the hook for
creating the m4local directory with the assumption that it would be
created because the first include is treated in a special way if it
doesn't exists

However, this assumption was wrong as m4local is the second include, the
first one is m4 (which already exists in the archive). So put back the
hook. The other solutions would be to patch:
 - Makefile.{am,in} to remove m4local
 - configure.ac and Makefile.{am,in} to add m4local before m4
However, both solutions don't seem to be upstreamable

Fixes:
 - http://autobuild.buildroot.org/results/e40313c6ec193d6156e26eff62303545fba09413

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gutenprint/gutenprint.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index e99d62ca79..9cb80c3e95 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -14,6 +14,13 @@ GUTENPRINT_LICENSE_FILES = COPYING
 # Needed, as we touch Makefile.am
 GUTENPRINT_AUTORECONF = YES
 
+# Needed by autoreconf
+define GUTENPRINT_CREATE_M4_DIR
+	mkdir -p $(@D)/m4local
+endef
+GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
+HOST_GUTENPRINT_POST_PATCH_HOOKS += GUTENPRINT_CREATE_M4_DIR
+
 GUTENPRINT_DEPENDENCIES = \
 	cups host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
