From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 22:34:17 +0100
Subject: [Buildroot] [git commit] dtv-scan-tables: rename file to have only
	ASCII characters
Message-ID: <20161114213421.EA1E18180C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f4dfd11888d1a092f3b92e8550b3958d87412f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of dtv-scan-tables to version
ceb11833b35f05813b1f0397a60e0f3b99430aab in commit
b1c8794d8ac0eb3895d13ae91d8e912ec469a105, one file contains non-ASCII
characters, which causes encoding issues tvheadend. Since no other
file in the dtv-scan-tables code base contains files with non-ASCII
characters (despite having files named after cities in various
countries that definitely do have non-ASCII characters), we rename
this file so that it is named with only ASCII characters.

This fixes the build of tvheadend, which was failing when the host
Python interpreter was python3, due to a file name encoding issue.

Fixes:

  http://autobuild.buildroot.net/results/1ae8bee297edb089535a2fb6ec724ebf7976888d/
  (tvheadend)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dtv-scan-tables/dtv-scan-tables.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 8ef42b9..8a782cb 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -17,6 +17,15 @@ DTV_SCAN_TABLES_SITE_METHOD = git
 DTV_SCAN_TABLES_LICENSE = GPLv2, LGPLv2.1
 DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LGPL
 
+# In order to avoid issues with file name encodings, we rename the
+# only dtv-scan-tables file that has non-ASCII characters to have a
+# name using only ASCII characters (pl-Krosno_Sucha_Gora)
+define DTV_SCAN_TABLES_FIX_NONASCII_FILENAMES
+	mv $(@D)/dvb-t/pl-Krosno_Sucha* $(@D)/dvb-t/pl-Krosno_Sucha_Gora
+endef
+
+DTV_SCAN_TABLES_POST_PATCH_HOOKS += DTV_SCAN_TABLES_FIX_NONASCII_FILENAMES
+
 define DTV_SCAN_TABLES_INSTALL_TARGET_CMDS
 	for f in atsc dvb-c dvb-s dvb-t; do \
 		$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/dvb/$$f; \
