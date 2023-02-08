Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D800FC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 12:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8451E6106E;
	Wed,  8 Feb 2023 12:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8451E6106E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VOlJECBheycv; Wed,  8 Feb 2023 12:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32498610C4;
	Wed,  8 Feb 2023 12:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32498610C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4FA81BF5E9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFEF240980
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 12:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFEF240980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gL9hkYb15tDr for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 12:31:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 687BE4098F
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 12:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 687BE4098F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54BB28465D; Wed,  8 Feb 2023 12:31:24 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 13:31:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30624cf777b84ead9c788cee911fb1c387d358fd
X-Git-Newrev: c5a3dfb9a4a6550b9097b22b1c96a99f90880a64
X-Patchwork-Hint: ignore
Message-Id: <20230208123124.54BB28465D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: check all shell
 scripts
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5a3dfb9a4a6550b9097b22b1c96a99f90880a64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently only SysV init scripts are checked using shellcheck and a few
other rules (e.g. variable naming, file naming).

Extend the check using shellcheck to all shell scripts in the tree.
This is actually limited to the list of directories that check-package
knows that can check, but that list can be expanded later.

In order to apply the check to all shell scripts, use python3-magic to
determine the file type. Unfortunately, there are two different python
modules called "magic". Support both by detecting which one is installed
and defining get_filetype accordingly.

Keep testing first for name pattern, and only in the case there is no
match, check the file type. This ensures, for instance, that SysV
init scripts follow specific rules.

Apply these checks for shell scripts:
 - shellcheck;
 - trailing space;
 - consecutive empty lines;
 - empty last line on file;
 - newline at end of file.

Update the list of ignored warnings.

Do not add unit tests since no function was added, they were just
reused.
But expand the runtime test for check-package using as fixture a file
that generates a shellcheck warning.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[Arnout: support both variants of the "magic" module]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                | 21 ++++++++++++++++
 .../tests/utils/br2-external/utils/x-shellscript   |  2 ++
 support/testing/tests/utils/test_check_package.py  | 17 +++++++++++++
 utils/check-package                                | 28 +++++++++++++++++++++-
 utils/checkpackagelib/lib_shellscript.py           |  5 ++++
 5 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c4d07c1d7d..405e1c5677 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -16,11 +16,13 @@ package/busybox/S02sysctl Variables
 package/busybox/S10mdev ConsecutiveEmptyLines Indent Shellcheck
 package/busybox/S15watchdog Indent Variables
 package/busybox/S50telnet Indent Shellcheck Variables
+package/busybox/udhcpc.script Shellcheck
 package/c-icap/S96cicap Indent Shellcheck Variables
 package/cfm/S65cfm Indent Variables
 package/cgroupfs-mount/S30cgroupfs Indent Shellcheck Variables
 package/chrony/S49chrony Indent Shellcheck Variables
 package/connman/S45connman Variables
+package/coremark-pro/coremark-pro.sh.in Shellcheck
 package/curlftpfs/0001-fix-CURLOPT_INFILESIZE.patch Sob
 package/curlftpfs/0002-free_ftpfs_file-memleak-fix.patch Sob
 package/curlftpfs/0003-nocache-memleak-fix.patch Sob
@@ -30,6 +32,7 @@ package/dbus/S30dbus Indent Shellcheck TrailingSpace Variables
 package/dcron/S90dcron Variables
 package/dhcp/S80dhcp-relay Shellcheck Variables
 package/dhcp/S80dhcp-server Shellcheck Variables
+package/dhcp/dhclient-script Shellcheck TrailingSpace
 package/dhcpcd/S41dhcpcd Indent Variables
 package/dhrystone/0001-cmdline-nruns.patch Sob
 package/dhrystone/0002-HZ.patch Sob
@@ -41,12 +44,15 @@ package/dmraid/S20dmraid Variables
 package/dnsmasq/S80dnsmasq Shellcheck Variables
 package/docker-engine/S60dockerd Indent Shellcheck Variables
 package/domoticz/S99domoticz Shellcheck
+package/dracut/merged-usr-module-setup.sh Shellcheck
 package/dropbear/S50dropbear Indent Shellcheck Variables
 package/earlyoom/S02earlyoom Indent Shellcheck
 package/ejabberd/S50ejabberd Indent Shellcheck Variables
+package/ejabberd/check-erlang-lib Shellcheck
 package/eudev/S10udev ConsecutiveEmptyLines Indent Shellcheck Variables
 package/exim/S86exim Indent Variables
 package/fail2ban/S60fail2ban Shellcheck Variables
+package/fakedate/fakedate Shellcheck
 package/fbv/0001-cross.patch Sob
 package/fbv/0002-fix-24bpp-support-on-big-endian.patch Sob
 package/fbv/0005-include.patch Sob
@@ -56,6 +62,7 @@ package/gamin/0002-no-const-return.patch Sob
 package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsanitizer.patch Sob
 package/genromfs/0001-build-system.patch Sob
 package/gerbera/S99gerbera Indent
+package/google-breakpad/gen-syms.sh Shellcheck
 package/gpsd/S50gpsd Indent Shellcheck Variables
 package/haveged/S21haveged Shellcheck Variables
 package/htpdate/S43htpdate Shellcheck
@@ -63,8 +70,12 @@ package/i2pd/S99i2pd Indent Shellcheck Variables
 package/ifplugd/0001-cross.patch Sob
 package/ifplugd/0002-fix-headers.patch Sob
 package/ifupdown-scripts/S40network EmptyLastLine Indent Shellcheck Variables
+package/ifupdown-scripts/network/if-pre-up.d/wait_iface EmptyLastLine Shellcheck
+package/ifupdown-scripts/nfs_check Shellcheck
 package/igd2-for-linux/S99upnpd Indent Shellcheck Variables
 package/inadyn/S70inadyn Indent NotExecutable
+package/initscripts/init.d/rcK ConsecutiveEmptyLines EmptyLastLine Shellcheck
+package/initscripts/init.d/rcS ConsecutiveEmptyLines EmptyLastLine Shellcheck
 package/input-event-daemon/S99input-event-daemon ConsecutiveEmptyLines Indent Variables
 package/iptables/S35iptables Shellcheck
 package/irda-utils/0001-daemon.patch Sob
@@ -94,6 +105,7 @@ package/lldpd/S60lldpd Indent Shellcheck Variables
 package/lockfile-progs/0001-sus3v-legacy.patch Sob
 package/madplay/0001-switch-to-new-alsa-api.patch Sob
 package/mariadb/S97mysqld Indent Shellcheck Variables
+package/matchbox-keyboard/mb-applet-kbd-wrapper.sh Shellcheck TrailingSpace
 package/mender-connect/S43mender-connect Shellcheck
 package/mii-diag/0001-strchr.patch Sob
 package/minidlna/S60minidlnad Indent Shellcheck Variables
@@ -111,6 +123,7 @@ package/netcat/0001-signed-bit-counting.patch Sob
 package/netopeer2/S52netopeer2 Shellcheck Variables
 package/netplug/0001-makefile-flags.patch Sob
 package/netplug/S29netplug Indent Shellcheck Variables
+package/netplug/netplug-script ConsecutiveEmptyLines Shellcheck
 package/netsnmp/S59snmpd Indent Shellcheck Variables
 package/network-manager/S45network-manager ConsecutiveEmptyLines EmptyLastLine Shellcheck Variables
 package/nfs-utils/S60nfs ConsecutiveEmptyLines Shellcheck Variables
@@ -122,11 +135,13 @@ package/ofono/S46ofono Variables
 package/olsr/S50olsr Indent Shellcheck Variables
 package/openntpd/S49ntp Shellcheck Variables
 package/openssh/S50sshd EmptyLastLine Indent Variables
+package/openvmtools/shutdown Shellcheck
 package/openvpn/S60openvpn Indent Shellcheck Variables
 package/oracle-mysql/S97mysqld Shellcheck Variables
 package/owfs/S55owserver Shellcheck Variables
 package/owfs/S60owfs Shellcheck Variables
 package/pigpio/S50pigpio Shellcheck Variables
+package/pkgconf/pkg-config.in Shellcheck
 package/poco/0001-Fix-optional-JSON-support-for-MySQL-3753.patch Sob
 package/postgresql/S50postgresql Variables
 package/procps-ng/S02sysctl Variables
@@ -147,6 +162,7 @@ package/samba4/S91smb Indent Shellcheck Variables
 package/seatd/S70seatd NotExecutable Variables
 package/ser2net/S50ser2net Indent Shellcheck Variables
 package/shairport-sync/S99shairport-sync Indent Shellcheck Variables
+package/skeleton-init-systemd/fakeroot_tmpfiles.sh Shellcheck
 package/smcroute/S41smcroute Indent NotExecutable Variables
 package/smstools3/S50smsd Shellcheck Variables
 package/solarus/0002-Add-a-basic-FindOpenGLES2.cmake.patch Sob
@@ -156,11 +172,13 @@ package/sslh/S35sslh Indent Shellcheck Variables
 package/stunnel/S50stunnel Indent Shellcheck Variables
 package/supervisor/S99supervisord Variables
 package/suricata/S99suricata Shellcheck
+package/swupdate/swupdate.sh Shellcheck
 package/sysrepo/S51sysrepo-plugind Indent Shellcheck
 package/targetcli-fb/S50target Shellcheck Variables
 package/tcf-agent/S55tcf-agent Shellcheck Variables
 package/tftpd/S80tftpd-hpa Indent Shellcheck Variables
 package/ti-gfx/S80ti-gfx Shellcheck Variables
+package/ti-gfx/esrev.sh Shellcheck
 package/ti-sgx-um/S80ti-sgx Variables
 package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
 package/transmission/S92transmission ConsecutiveEmptyLines Indent Shellcheck Variables
@@ -170,10 +188,13 @@ package/unbound/S70unbound Shellcheck
 package/unscd/S46unscd Indent Shellcheck Variables
 package/upmpdcli/S99upmpdcli Indent Shellcheck Variables
 package/usbguard/S20usbguard Indent Shellcheck Variables
+package/vala/vala-wrapper Shellcheck
 package/vsftpd/S70vsftpd Indent Shellcheck Variables
 package/watchdogd/S01watchdogd Indent NotExecutable
+package/wpa_supplicant/ifupdown.sh Shellcheck
 package/x11r7/xapp_xdm/S99xdm Indent Variables
 package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch Sob
 package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch Sob
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch Sob
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
+package/xl2tp/xl2tpd TrailingSpace
diff --git a/support/testing/tests/utils/br2-external/utils/x-shellscript b/support/testing/tests/utils/br2-external/utils/x-shellscript
new file mode 100755
index 0000000000..a7de4124bd
--- /dev/null
+++ b/support/testing/tests/utils/br2-external/utils/x-shellscript
@@ -0,0 +1,2 @@
+#!/bin/bash
+unused="text"
diff --git a/support/testing/tests/utils/test_check_package.py b/support/testing/tests/utils/test_check_package.py
index 580ad56d42..d2c1556845 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -233,3 +233,20 @@ class TestCheckPackage(unittest.TestCase):
         self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fixed the file and forgot to update "
                       ".checkpackageignore_outdated?"
                       .format(subdir_file), w)
+
+        # shell scripts are tested using shellcheck
+        rel_file = "utils/x-shellscript"
+        abs_path = infra.filepath("tests/utils/br2-external")
+        abs_file = os.path.join(abs_path, rel_file)
+
+        w, m = call_script(["check-package", "-b", rel_file],
+                           self.WITH_UTILS_IN_PATH, abs_path)
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:0: run 'shellcheck' and fix the warnings".format(rel_file), w)
+
+        w, m = call_script(["check-package", "-b", abs_file],
+                           self.WITH_UTILS_IN_PATH, infra.basepath())
+        self.assert_file_was_processed(m)
+        self.assert_warnings_generated_for_file(m)
+        self.assertIn("{}:0: run 'shellcheck' and fix the warnings".format(abs_file), w)
diff --git a/utils/check-package b/utils/check-package
index 848311bac8..12009b2476 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -3,6 +3,7 @@
 
 import argparse
 import inspect
+import magic
 import os
 import re
 import six
@@ -13,11 +14,27 @@ import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
 import checkpackagelib.lib_mk
 import checkpackagelib.lib_patch
+import checkpackagelib.lib_shellscript
 import checkpackagelib.lib_sysv
 
 VERBOSE_LEVEL_TO_SHOW_IGNORED_FILES = 3
 flags = None  # Command line arguments.
 
+# There are two Python packages called 'magic':
+#   https://pypi.org/project/file-magic/
+#   https://pypi.org/project/python-magic/
+# Both allow to return a MIME file type, but with a slightly different
+# interface. Detect which one of the two we have based on one of the
+# attributes.
+if hasattr(magic, 'FileMagic'):
+    # https://pypi.org/project/file-magic/
+    def get_filetype(fname):
+        return magic.detect_from_filename(fname).mime_type
+else:
+    # https://pypi.org/project/python-magic/
+    def get_filetype(fname):
+        return magic.from_file(fname, mime=True)
+
 
 def get_ignored_parsers_per_file(intree_only, ignore_filename):
     ignored = dict()
@@ -77,6 +94,15 @@ def parse_args():
     return flags
 
 
+def get_lib_from_filetype(fname):
+    if not os.path.isfile(fname):
+        return None
+    filetype = get_filetype(fname)
+    if filetype == "text/x-shellscript":
+        return checkpackagelib.lib_shellscript
+    return None
+
+
 CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
 DO_CHECK_INTREE = re.compile(r"|".join([
     r"Config.in",
@@ -120,7 +146,7 @@ def get_lib_from_filename(fname):
         return checkpackagelib.lib_patch
     if SYSV_INIT_SCRIPT_FILENAME.search(fname):
         return checkpackagelib.lib_sysv
-    return None
+    return get_lib_from_filetype(fname)
 
 
 def common_inspect_rules(m):
diff --git a/utils/checkpackagelib/lib_shellscript.py b/utils/checkpackagelib/lib_shellscript.py
new file mode 100644
index 0000000000..9b4f4aed58
--- /dev/null
+++ b/utils/checkpackagelib/lib_shellscript.py
@@ -0,0 +1,5 @@
+from checkpackagelib.lib import ConsecutiveEmptyLines  # noqa: F401
+from checkpackagelib.lib import EmptyLastLine          # noqa: F401
+from checkpackagelib.lib import NewlineAtEof           # noqa: F401
+from checkpackagelib.lib import TrailingSpace          # noqa: F401
+from checkpackagelib.tool import Shellcheck            # noqa: F401
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
