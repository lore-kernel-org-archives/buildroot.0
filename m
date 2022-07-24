Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E41C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A6DE60E9A;
	Sun, 24 Jul 2022 05:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A6DE60E9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZOQ0ut-kIze; Sun, 24 Jul 2022 05:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1BDF6107A;
	Sun, 24 Jul 2022 05:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1BDF6107A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8ADF41BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7195041716
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7195041716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6B_h3IN9xkf for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD7FE416ED
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD7FE416ED
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:47 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10d8880d055so11045969fac.8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=CdW2hahmeTFOc+5vZBYssjin34btnoj5T2dKDymdcl0=;
 b=cpZIzsHQ721+Xgly903skWZY0DdRn1SiWF3ObjXJMT/FOHDvjxxwnKATcV0/Tts5I/
 De4HmftA1nZbFgqzuBcNZEfrqftDTeS9DvTMuw4X2DGkTrUIM8Cu29ZrQ1VTIBcg+FS4
 XHIAT7DluPi/IyYdedkMypiENpji8tpA3a1dcKS2go2RDZth6uc2Jiyc+RxwpI5n8tIG
 jhJ+HJ6gsssttlKy9iYyHBH0KnL3LrNiCGlSRVmy0vTdzftnHntCWfh4h6oytYL42Su+
 q9i11JxYFMP41v2HNUFhV4DfmXa60g798qv+2TFf3siNthrI6vTD8pIoyRMF6dcLm9su
 /SQA==
X-Gm-Message-State: AJIora974NXYeDxZtfi7n+m414AS0DRU4QL5fYDQtJy4lZ7hibvAC9rB
 Pfd6Hi0+htkQM3KFH8OS62MTZdUOegk=
X-Google-Smtp-Source: AGRyM1sndxfcIQCTykMXZEB7BofuDpNhBpEq9QCw7CZsge8uZTlyplFXdQ1YwAgW8rl2uSmDwnp0mA==
X-Received: by 2002:a05:6870:c588:b0:10c:4b3a:68ec with SMTP id
 ba8-20020a056870c58800b0010c4b3a68ecmr10932427oab.223.1658641847437; 
 Sat, 23 Jul 2022 22:50:47 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:46 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:06 -0300
Message-Id: <20220724054912.2354219-11-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=CdW2hahmeTFOc+5vZBYssjin34btnoj5T2dKDymdcl0=;
 b=eIWrG3eciN+191tmCR2kxtgHoHGCpQaaSBWd4/REhJcehbUjTK3dnjC6Z6JxkVDmw9
 d+ASGS85rR3dPAfEo6/vdM1LefD3ucY3zPzFVrMnfLC9BZLWEwzjmbQ60OGnS+OmKEgB
 pBBnC/Jn7LlkIeZdfxZQRp3hUFHwPfJmDLGzDJUQvCTl/lZxjSUSvaC7SNAAavp4pfRf
 +KxVMWw0A7XVFYigUJVBeTlpLl2XiU2mZ7F+5BFzHSI9ZENzwlqL0+WRJdNnqIsYZIci
 b0rkb+yQRe9KyeiR/NydoR/yrk4vQU/X38qj1tieAFWQ0+pXdjkJtBJzNkoOBpd/OqE9
 HYpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eIWrG3ec
Subject: [Buildroot] [PATCH 10/16] utils/check-package: check all shell
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

Since 'make check-package' always run using the docker image, there is
no dependency added to the host machine.

Do not add unit tests since no function was added, they were just
reused.
But expand the runtime test for check-package using as fixture a file
that generates a shellcheck warning.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ ./utils/docker-run
br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore
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
index 98099508ba..541f234bfd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -52,6 +52,7 @@ package/busybox/S02sysctl Variables
 package/busybox/S10mdev ConsecutiveEmptyLines Indent Shellcheck
 package/busybox/S15watchdog Indent Variables
 package/busybox/S50telnet Indent Shellcheck Variables
+package/busybox/udhcpc.script Shellcheck
 package/bzip2/bzip2.hash HashSpaces
 package/c-icap/S96cicap Indent Shellcheck Variables
 package/cache-calibrator/cache-calibrator.hash HashSpaces
@@ -74,6 +75,7 @@ package/connman-gtk/connman-gtk.hash HashSpaces
 package/connman/S45connman Variables
 package/conntrack-tools/conntrack-tools.hash HashSpaces
 package/copas/copas.hash HashSpaces
+package/coremark-pro/coremark-pro.sh.in Shellcheck
 package/coxpcall/coxpcall.hash HashSpaces
 package/cpio/cpio.hash HashSpaces
 package/cppdb/cppdb.hash HashSpaces
@@ -104,6 +106,7 @@ package/dcron/S90dcron Variables
 package/debianutils/debianutils.hash HashSpaces
 package/dhcp/S80dhcp-relay Shellcheck Variables
 package/dhcp/S80dhcp-server Shellcheck Variables
+package/dhcp/dhclient-script Shellcheck TrailingSpace
 package/dhcpcd/S41dhcpcd Indent Variables
 package/dhcpdump/dhcpdump.hash HashSpaces
 package/dhrystone/0001-cmdline-nruns.patch Sob
@@ -131,6 +134,7 @@ package/earlyoom/S02earlyoom Indent Shellcheck
 package/ecryptfs-utils/ecryptfs-utils.hash HashSpaces
 package/efivar/efivar.hash HashSpaces
 package/ejabberd/S50ejabberd Indent Shellcheck Variables
+package/ejabberd/check-erlang-lib Shellcheck
 package/elftosb/elftosb.hash HashSpaces
 package/elixir/elixir.hash HashSpaces
 package/emlog/emlog.hash HashSpaces
@@ -144,6 +148,7 @@ package/exfat/exfat.hash HashSpaces
 package/exim/S86exim Indent Variables
 package/f2fs-tools/f2fs-tools.hash HashSpaces
 package/fail2ban/S60fail2ban Shellcheck Variables
+package/fakedate/fakedate Shellcheck
 package/fan-ctrl/fan-ctrl.hash HashSpaces
 package/fbdump/fbdump.hash HashSpaces
 package/fbterm/fbterm.hash HashSpaces
@@ -186,6 +191,7 @@ package/glorytun/glorytun.hash HashSpaces
 package/gnuradio/gnuradio.hash HashSpaces
 package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch Sob
 package/gob2/gob2.hash HashSpaces
+package/google-breakpad/gen-syms.sh Shellcheck
 package/googlefontdirectory/googlefontdirectory.hash HashSpaces
 package/gperf/gperf.hash HashSpaces
 package/gpsd/S50gpsd Indent Shellcheck Variables
@@ -205,11 +211,15 @@ package/ifmetric/ifmetric.hash HashSpaces
 package/ifplugd/0001-cross.patch Sob
 package/ifplugd/0002-fix-headers.patch Sob
 package/ifupdown-scripts/S40network EmptyLastLine Indent Shellcheck Variables
+package/ifupdown-scripts/network/if-pre-up.d/wait_iface EmptyLastLine Shellcheck
+package/ifupdown-scripts/nfs_check Shellcheck
 package/igd2-for-linux/S99upnpd Indent Shellcheck Variables
 package/igh-ethercat/igh-ethercat.hash HashSpaces
 package/ijs/ijs.hash HashSpaces
 package/ima-evm-utils/ima-evm-utils.hash HashSpaces
 package/inadyn/S70inadyn Indent NotExecutable
+package/initscripts/init.d/rcK ConsecutiveEmptyLines EmptyLastLine Shellcheck
+package/initscripts/init.d/rcS ConsecutiveEmptyLines EmptyLastLine Shellcheck
 package/input-event-daemon/S99input-event-daemon ConsecutiveEmptyLines Indent Variables
 package/intltool/intltool.hash HashSpaces
 package/iodine/iodine.hash HashSpaces
@@ -400,6 +410,7 @@ package/mariadb/S97mysqld Indent Shellcheck Variables
 package/matchbox-common/matchbox-common.hash HashSpaces
 package/matchbox-desktop/matchbox-desktop.hash HashSpaces
 package/matchbox-keyboard/matchbox-keyboard.hash HashSpaces
+package/matchbox-keyboard/mb-applet-kbd-wrapper.sh Shellcheck TrailingSpace
 package/matchbox-panel/matchbox-panel.hash HashSpaces
 package/matchbox-startup-monitor/matchbox-startup-monitor.hash HashSpaces
 package/memstat/memstat.hash HashSpaces
@@ -441,6 +452,7 @@ package/netifrc/netifrc.hash HashSpaces
 package/netopeer2/S52netopeer2 Shellcheck Variables
 package/netplug/0001-makefile-flags.patch Sob
 package/netplug/S29netplug Indent Shellcheck Variables
+package/netplug/netplug-script ConsecutiveEmptyLines Shellcheck
 package/netsnmp/S59snmpd Indent Shellcheck Variables
 package/network-manager/S45network-manager ConsecutiveEmptyLines EmptyLastLine Shellcheck Variables
 package/newt/newt.hash HashSpaces
@@ -470,6 +482,7 @@ package/openobex/openobex.hash HashSpaces
 package/openpowerlink/openpowerlink.hash HashSpaces
 package/openssh/S50sshd EmptyLastLine Indent Variables
 package/opentyrian-data/opentyrian-data.hash HashSpaces
+package/openvmtools/shutdown Shellcheck
 package/openvpn/S60openvpn Indent Shellcheck Variables
 package/optee-client/S30optee Indent Shellcheck Variables
 package/opus-tools/opus-tools.hash HashSpaces
@@ -561,6 +574,7 @@ package/picocom/picocom.hash HashSpaces
 package/pigpio/S50pigpio Shellcheck Variables
 package/pimd/pimd.hash HashSpaces
 package/pixiewps/pixiewps.hash HashSpaces
+package/pkgconf/pkg-config.in Shellcheck
 package/policycoreutils/policycoreutils.hash HashSpaces
 package/polkit/S50polkit NotExecutable Shellcheck Variables
 package/popperjs/popperjs.hash HashSpaces
@@ -748,9 +762,11 @@ package/supertuxkart/supertuxkart.hash HashSpaces
 package/supervisor/S99supervisord Variables
 package/suricata/S99suricata Shellcheck
 package/swig/swig.hash HashSpaces
+package/swupdate/swupdate.sh Shellcheck
 package/sylpheed/sylpheed.hash HashSpaces
 package/synergy/synergy.hash HashSpaces
 package/sysrepo/S51sysrepo-plugind Indent Shellcheck
+package/systemd/fakeroot_tmpfiles.sh Shellcheck
 package/sysvinit/sysvinit.hash HashSpaces
 package/szip/szip.hash HashSpaces
 package/targetcli-fb/S50target Shellcheck Variables
@@ -761,6 +777,7 @@ package/tftpd/S80tftpd-hpa Indent Shellcheck Variables
 package/thttpd/thttpd.hash HashSpaces
 package/ti-cgt-pru/ti-cgt-pru.hash HashSpaces
 package/ti-gfx/S80ti-gfx Shellcheck Variables
+package/ti-gfx/esrev.sh Shellcheck
 package/ti-sgx-um/S80ti-sgx Variables
 package/time/time.hash HashSpaces
 package/tinc/tinc.hash HashSpaces
@@ -789,6 +806,7 @@ package/usb_modeswitch_data/usb_modeswitch_data.hash HashSpaces
 package/usbguard/S20usbguard Indent Shellcheck Variables
 package/ussp-push/ussp-push.hash HashSpaces
 package/utp_com/utp_com.hash HashSpaces
+package/vala/vala-wrapper Shellcheck
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash HashSpaces
 package/vmtouch/vmtouch.hash HashSpaces
 package/vsftpd/S70vsftpd Indent Shellcheck Variables
@@ -799,6 +817,7 @@ package/webrtc-audio-processing/webrtc-audio-processing.hash HashSpaces
 package/wf111/wf111.hash HashSpaces
 package/whetstone/whetstone.hash HashSpaces
 package/wireless_tools/wireless_tools.hash HashSpaces
+package/wpa_supplicant/ifupdown.sh Shellcheck
 package/wpan-tools/wpan-tools.hash HashSpaces
 package/wsapi-fcgi/wsapi-fcgi.hash HashSpaces
 package/wsapi-xavante/wsapi-xavante.hash HashSpaces
@@ -903,6 +922,7 @@ package/x11r7/xlib_xtrans/xlib_xtrans.hash HashSpaces
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
 package/x11r7/xutil_makedepend/xutil_makedepend.hash HashSpaces
 package/xavante/xavante.hash HashSpaces
+package/xl2tp/xl2tpd TrailingSpace
 package/xmlstarlet/xmlstarlet.hash HashSpaces
 package/xutil_util-macros/xutil_util-macros.hash HashSpaces
 package/yad/yad.hash HashSpaces
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
index 1508e39c37..6612cee24e 100755
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
