From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 18:28:40 +0100
Subject: [Buildroot] [git commit] package/dtv-scan-tables: new package
Message-ID: <20140329173147.400E49C2A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e18242fd814b5e0ce5a43a7f465fed6d0634a504
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The dvb-apps package used to carry pre-scanned transponders data. These
transponders data have now been moved out of dvb-apps, and into their
own repository.

So, until we bump the dvb-apps package (to come in a follow-up patch),
dtv-scan-tables is exclusive to dvb-apps.

To be noted: the licensing information for those data is dubious. The
package carries the COPYING and COPYING.LIB files, hinting that the data
is covered by the GPLv2 *and* the LGPLv2.1. This is incoherent, and
dubious:

  - since GPLv2 is a superset of LGPLv2.1, the actual license would be
    just plan GPLv2;

  - the transponders data is just a collection of 'facts': the
    frequencies of each transponder; as such, it is usally not considered
    to be a 'work' as per traditional copyright, and thus should be in
    the public domain [cue the zoneinfo DB not so long ago].

But since this is a difficult question, we'll leave to the user to sort
these things out.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/dtv-scan-tables/Config.in          |    8 ++++++++
 package/dtv-scan-tables/dtv-scan-tables.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a4efa75..1932353 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -280,6 +280,7 @@ source "package/dmidecode/Config.in"
 source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
 source "package/dvbsnoop/Config.in"
+source "package/dtv-scan-tables/Config.in"
 source "package/eeprog/Config.in"
 source "package/eudev/Config.in"
 source "package/evemu/Config.in"
diff --git a/package/dtv-scan-tables/Config.in b/package/dtv-scan-tables/Config.in
new file mode 100644
index 0000000..05a3b1c
--- /dev/null
+++ b/package/dtv-scan-tables/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DTV_SCAN_TABLES
+	bool "dtv-scan-tables"
+	# dvb-apps installs its own set of transponder data
+	depends on !BR2_PACKAGE_DVB_APPS
+	help
+	  The Digital TV scan tables.
+
+	  http://git.linuxtv.org/dtv-scan-tables.git
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
new file mode 100644
index 0000000..2797321
--- /dev/null
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# dtv-scan-tables
+#
+################################################################################
+
+DTV_SCAN_TABLES_VERSION = cfc29758d1357b724f3bf27c3b1b277e242841fa
+DTV_SCAN_TABLES_SITE = http://linuxtv.org/git/dtv-scan-tables.git
+DTV_SCAN_TABLES_SITE_METHOD = git
+
+# This package only contains the transponders data. This is not a 'work'
+# as per traditional copyright, but just a collection of 'facts', so there's
+# probably no license to apply to these data files.
+# However, the package prominently contains the COPYING and COPYING.LIB
+# license files (respectively for the GPLv2 and the LGPLv2.1), so we use
+# that as the licensing information.
+DTV_SCAN_TABLES_LICENSE = GPLv2 LGPLv2.1
+DTV_SCAN_TABLES_LICENSE_FILES = COPYING COPYING.LIB
+
+define DTV_SCAN_TABLES_INSTALL_TARGET_CMDS
+	for f in atsc dvb-c dvb-s dvb-t; do \
+		$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/dvb/$$f; \
+		$(INSTALL) $(@D)/$$f/* $(TARGET_DIR)/usr/share/dvb/$$f; \
+	done
+endef
+
+$(eval $(generic-package))
