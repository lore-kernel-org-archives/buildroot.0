From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 26 Nov 2019 00:57:46 -0600
Subject: [Buildroot] [next] support/testing: new opkg test case
Message-ID: <20191126065746.39951-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Validates an archive can be installed and removed
- Builds an archives that uses postinst and prerm scripts

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_opkg.py    | 63 +++++++++++++++++++
 .../tests/package/test_opkg/post-build.sh     | 47 ++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 support/testing/tests/package/test_opkg.py
 create mode 100755 support/testing/tests/package/test_opkg/post-build.sh

diff --git a/DEVELOPERS b/DEVELOPERS
index 544e3ac1c3..541029ab0e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1625,6 +1625,7 @@ F:	package/wireless_tools/
 F:	package/xen/
 F:	support/testing/tests/package/br2-external/openjdk/
 F:	support/testing/tests/package/test_openjdk.py
+F:	support/testing/tests/package/test_opkg.py
 
 N:	Mauro Condarelli <mc5686@mclink.it>
 F:	package/mc/
diff --git a/support/testing/tests/package/test_opkg.py b/support/testing/tests/package/test_opkg.py
new file mode 100644
index 0000000000..06dba0c682
--- /dev/null
+++ b/support/testing/tests/package/test_opkg.py
@@ -0,0 +1,63 @@
+import os
+
+import infra.basetest
+
+
+class TestOpkg(infra.basetest.BRTest):
+    # The snmpd service is used as an example for this test of a set of files
+    # that can be archived up and deployed/removed to test opkg
+    #
+    # The post build script uses an ipk-build template and assembles the test
+    # package.
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_NETSNMP=y
+        # BR2_PACKAGE_NETSNMP_CLIENTS is not set
+        # BR2_PACKAGE_NETSNMP_ENABLE_MIBS is not set
+        BR2_PACKAGE_OPKG=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_HOST_OPKG_UTILS=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        """.format(infra.filepath("tests/package/test_opkg/post-build.sh"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # This test sequence tests the install and removal of a running
+        # service and configuration files.  It also exercises the postinst
+        # and prerm scripting provided in the package archive.
+
+        cmd = "opkg install example-snmpd-package_1.0_arm.ipk"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "opkg list-installed | grep example-snmpd-package"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        # Check that postinst script ran to start the services
+        cmd = "ps aux | grep [s]nmpd"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        # If successful, the prerm script ran to stop the service prior to
+        # the removal of the service scripting and files
+        cmd = "opkg remove example-snmpd-package"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        # Verify after package removal that the services is not running
+        cmd = "ps aux | grep [s]nmpd"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 1)
+
+        # This folder for configs is provided by the package install and
+        # should no longer be present after package removal
+        cmd = "ls /etc/snmp"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 1)
diff --git a/support/testing/tests/package/test_opkg/post-build.sh b/support/testing/tests/package/test_opkg/post-build.sh
new file mode 100755
index 0000000000..1b85aa002a
--- /dev/null
+++ b/support/testing/tests/package/test_opkg/post-build.sh
@@ -0,0 +1,47 @@
+#!/usr/bin/env bash
+
+IPK_BUILD=${TARGET_DIR}/root/ipk-build
+
+# Pull the files for the snmpd service out of the target to create a install archive
+# and setup a basic configuration so that the startup script works.
+mkdir -p ${IPK_BUILD}/CONTROL \
+	${IPK_BUILD}/etc/init.d/ \
+	${IPK_BUILD}/usr/sbin \
+	${IPK_BUILD}/etc/snmp \
+	${IPK_BUILD}/etc/default
+mv -f ${TARGET_DIR}/etc/init.d/S59snmpd ${IPK_BUILD}/etc/init.d/
+mv -f ${TARGET_DIR}/usr/sbin/snmpd ${IPK_BUILD}/usr/sbin/
+echo "agentuser  nobody" > ${IPK_BUILD}/etc/snmp/snmpd.conf
+echo "SNMPDRUN=yes" > ${IPK_BUILD}/etc/default/snmpd
+
+# build the control file
+cat <<EOM >${IPK_BUILD}/CONTROL/control
+Package: example-snmpd-package
+Version: 1.0
+Architecture: arm
+Maintainer: user at domain.tld
+Section: extras
+Priority: optional
+Source: http://example.com
+Description: This is an example IPK package for installing snmpd
+EOM
+
+# preinst script is not created to run before the install for this test example
+
+# postinst script is ran after install completes to start the services
+cat <<EOM >${IPK_BUILD}/CONTROL/postinst
+#!/bin/sh
+/etc/init.d/S59snmpd start
+EOM
+chmod +x ${IPK_BUILD}/CONTROL/postinst
+
+# prerm script is ran before removal so that the services isn't in use
+cat <<EOM >${IPK_BUILD}/CONTROL/prerm
+#!/bin/sh
+/etc/init.d/S59snmpd stop
+EOM
+chmod +x ${IPK_BUILD}/CONTROL/prerm
+
+# build the archive from template and pkg files
+${HOST_DIR}/bin/opkg-build -Z gzip ${IPK_BUILD} ${TARGET_DIR}/root/
+rm -fr ${IPK_BUILD}
-- 
2.17.1
