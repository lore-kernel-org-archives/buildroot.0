Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B125EC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B6BD605EC;
	Sun, 31 Jul 2022 19:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B6BD605EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4bxp64z4_754; Sun, 31 Jul 2022 19:37:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13E3C61095;
	Sun, 31 Jul 2022 19:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13E3C61095
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 505A01BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29D3840FBC
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29D3840FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sto3Av-X8PGP for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD619400CE
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD619400CE
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:06 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id v13so1783900vke.3
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VwYYlTxlv7XLM+cEd84KDWl0B6OeeGk5KLAluZnKoQQ=;
 b=kYVRJb/gVZljOM8tXiW5VNilGFdN9ZLZHbak9ccggmfxtt4RQfdN371d7GFqlsSYd/
 TP07xDpvOYuNUcCrWzEV4FY+pvbvpSsafx6tik+RZS+6nrb5Lk1CKAWwxxQxJbgjTI4X
 9ViLs76yO+TyrY4Nljm3J0DZsrVq7Mv3aj6gDD0jE2BZj3CvIzL3CBqtRZgi8iQ5Gefz
 7ubYT+yBf62HTMydoBiz7cRLbNTehidA985k+jIeS2l1EWEx+RNqDXAazyb6dws2EC81
 0ZGdl17Ra+fPM6D71P6x7gohDq4WiVohl5gDMG3/fEqmPa+yTAHRnWGr1O8r/YuPPCVd
 NJ5Q==
X-Gm-Message-State: AJIora8YxEaeOj9CR+ZStoqgRSuk4wIwvKYqt/LFMqckJRm3m1cOoWi/
 56uZGSDGkLDkfuFMmWtQr922rUDCFys=
X-Google-Smtp-Source: AGRyM1sLAsiMPbeLxMnT2l/DX8SU/xlWvaqfbu2zZWz30ofg4+QKd9zrOPQ9bjMkRKRszl7aKzmouA==
X-Received: by 2002:a1f:dac3:0:b0:377:8cb:4544 with SMTP id
 r186-20020a1fdac3000000b0037708cb4544mr4190124vkg.7.1659296165677; 
 Sun, 31 Jul 2022 12:36:05 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:36:04 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:14 -0300
Message-Id: <20220731193521.1217825-8-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VwYYlTxlv7XLM+cEd84KDWl0B6OeeGk5KLAluZnKoQQ=;
 b=SvoskgdJFpgYVsWnhZqKBwbKsG6NAzKODMnMJtfLVQWWn2Ngbpn9jDoeuxG/RMW8FH
 wZLZa+35/4VkuLaOn91oizdpDeIbcAz0/pWzD4bZGWGYf4w9mS5bmas6AO6u//L7mDND
 zcYpYzoUH3F7s4oFPbHS5aL5nJveetfxUimlllsq5Sqwms4W1N+JsxTbq+D4ZB9h+H/E
 yDu6m561/hwY2ZSufxZaCVM+FwiAQ3RtPq/RXlfPiyZT7QrJRlY8uCkmDhA+VzzwyYk3
 Rny2IfM3pZ6/qzS/JWKr3w4bzeWwq6CZP2Ai88q6y4VYK4+3HS8ddegCaDYZTF5w9mbP
 QImQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SvoskgdJ
Subject: [Buildroot] [PATCH v2 07/14] utils/check-package: check all shell
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently only SysV init scripts are checked using shellcheck and a few
other rules (e.g. variable naming, file naming).

Extend the check using shellcheck to all shell scripts in the tree.
This is actually limited to the list of directories that check-package
knows that can check, but that list can be expanded later.

In order to apply the check to all shell scripts, use python3-magic to
determine the file type.
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
---
Changes v1 -> v2:
  - do not mention docker image in the commit message

NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ utils/docker-run make .checkpackageignore
---
 .checkpackageignore                           | 20 +++++++++++++++++++
 .../utils/br2-external/utils/x-shellscript    |  2 ++
 .../testing/tests/utils/test_check_package.py | 17 ++++++++++++++++
 utils/check-package                           | 13 +++++++++++-
 utils/checkpackagelib/lib_shellscript.py      |  5 +++++
 5 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100755 support/testing/tests/utils/br2-external/utils/x-shellscript
 create mode 100644 utils/checkpackagelib/lib_shellscript.py

diff --git a/.checkpackageignore b/.checkpackageignore
index d8947e89fc..a527254464 100644
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
@@ -44,9 +47,11 @@ package/domoticz/S99domoticz Shellcheck
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
@@ -57,6 +62,7 @@ package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsaniti
 package/genromfs/0001-build-system.patch Sob
 package/gerbera/S99gerbera Indent
 package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch Sob
+package/google-breakpad/gen-syms.sh Shellcheck
 package/gpsd/S50gpsd Indent Shellcheck Variables
 package/haveged/S21haveged Shellcheck Variables
 package/htpdate/S43htpdate Shellcheck
@@ -64,8 +70,12 @@ package/i2pd/S99i2pd Indent Shellcheck Variables
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
@@ -95,6 +105,7 @@ package/lldpd/S60lldpd Indent Shellcheck Variables
 package/lockfile-progs/0001-sus3v-legacy.patch Sob
 package/madplay/0001-switch-to-new-alsa-api.patch Sob
 package/mariadb/S97mysqld Indent Shellcheck Variables
+package/matchbox-keyboard/mb-applet-kbd-wrapper.sh Shellcheck TrailingSpace
 package/mender-connect/S43mender-connect Shellcheck
 package/mii-diag/0001-strchr.patch Sob
 package/minidlna/S60minidlnad Indent Shellcheck Variables
@@ -112,6 +123,7 @@ package/netcat/0001-signed-bit-counting.patch Sob
 package/netopeer2/S52netopeer2 Shellcheck Variables
 package/netplug/0001-makefile-flags.patch Sob
 package/netplug/S29netplug Indent Shellcheck Variables
+package/netplug/netplug-script ConsecutiveEmptyLines Shellcheck
 package/netsnmp/S59snmpd Indent Shellcheck Variables
 package/network-manager/S45network-manager ConsecutiveEmptyLines EmptyLastLine Shellcheck Variables
 package/nfs-utils/S60nfs ConsecutiveEmptyLines Shellcheck Variables
@@ -123,12 +135,14 @@ package/ofono/S46ofono Variables
 package/olsr/S50olsr Indent Shellcheck Variables
 package/openntpd/S49ntp Shellcheck Variables
 package/openssh/S50sshd EmptyLastLine Indent Variables
+package/openvmtools/shutdown Shellcheck
 package/openvpn/S60openvpn Indent Shellcheck Variables
 package/optee-client/S30optee Indent Shellcheck Variables
 package/oracle-mysql/S97mysqld Shellcheck Variables
 package/owfs/S55owserver Shellcheck Variables
 package/owfs/S60owfs Shellcheck Variables
 package/pigpio/S50pigpio Shellcheck Variables
+package/pkgconf/pkg-config.in Shellcheck
 package/polkit/S50polkit NotExecutable Shellcheck Variables
 package/postgresql/S50postgresql Variables
 package/procps-ng/S02sysctl Variables
@@ -161,11 +175,14 @@ package/sslh/S35sslh Indent Shellcheck Variables
 package/stunnel/S50stunnel Indent Shellcheck Variables
 package/supervisor/S99supervisord Variables
 package/suricata/S99suricata Shellcheck
+package/swupdate/swupdate.sh Shellcheck
 package/sysrepo/S51sysrepo-plugind Indent Shellcheck
+package/systemd/fakeroot_tmpfiles.sh Shellcheck
 package/targetcli-fb/S50target Shellcheck Variables
 package/tcf-agent/S55tcf-agent Shellcheck Variables
 package/tftpd/S80tftpd-hpa Indent Shellcheck Variables
 package/ti-gfx/S80ti-gfx Shellcheck Variables
+package/ti-gfx/esrev.sh Shellcheck
 package/ti-sgx-um/S80ti-sgx Variables
 package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
 package/transmission/S92transmission ConsecutiveEmptyLines Indent Shellcheck Variables
@@ -176,10 +193,13 @@ package/unscd/S46unscd Indent Shellcheck Variables
 package/upmpdcli/S99upmpdcli Indent Shellcheck Variables
 package/urandom-scripts/S20urandom Variables
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
index f21b9e939f..aeda0857e3 100644
--- a/support/testing/tests/utils/test_check_package.py
+++ b/support/testing/tests/utils/test_check_package.py
@@ -232,3 +232,20 @@ class TestCheckPackage(unittest.TestCase):
                       .format(subdir_file), w)
         self.assertIn("{}:0: NewlineAtEof was expected to fail, did you fixed the file and forgot to update .checkpackageignore?"
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
index d896e8b117..732f1cf112 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -3,6 +3,7 @@
 
 import argparse
 import inspect
+import magic
 import os
 import re
 import six
@@ -13,6 +14,7 @@ import checkpackagelib.lib_config
 import checkpackagelib.lib_hash
 import checkpackagelib.lib_mk
 import checkpackagelib.lib_patch
+import checkpackagelib.lib_shellscript
 import checkpackagelib.lib_sysv
 
 IGNORE_FILENAME = ".checkpackageignore"
@@ -86,6 +88,15 @@ def parse_args():
     return flags
 
 
+def get_lib_from_filetype(fname):
+    if not os.path.isfile(fname):
+        return None
+    filetype = magic.from_file(fname, mime=True)
+    if filetype == "text/x-shellscript":
+        return checkpackagelib.lib_shellscript
+    return None
+
+
 CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
 DO_CHECK_INTREE = re.compile(r"|".join([
     r"Config.in",
@@ -129,7 +140,7 @@ def get_lib_from_filename(fname):
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
