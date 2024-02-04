Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1F1C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 22:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A293D40377;
	Sun,  4 Feb 2024 22:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A293D40377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_jinBx2RjEW; Sun,  4 Feb 2024 22:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C77540279;
	Sun,  4 Feb 2024 22:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C77540279
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4A51BF3A8
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B71881EC9
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B71881EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8OX3VHMlthQ for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 22:19:25 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF36381EC8
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 22:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF36381EC8
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8E81E13F88D;
 Sun,  4 Feb 2024 23:19:21 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 23:19:15 +0100
Message-ID: <20240204221915.460639-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707085162;
 bh=jzigL36IGFGBOsXnLwKAt5ICcPFlkC6WiOvWhr5+UAg=;
 h=From:To:Cc:Subject:Date:From;
 b=vWljmcsXFIj7w840994GNAiEGeZ7q8Pzml0WVOqv4+/AqvboMN7+zGtIc0MOlRxYJ
 fBzmQIicPuVy6iv6enXAwmbgyBil7iSYeIZtnpBbpkYBMNgjWlV12M9ipoNcXcaaze
 7ZL1UsYfAaqZnOEmT64HffFxIs0qUIU8c7ny5Rqd+czGYkUByHDn6TFrTqbgfXdT2V
 8HoX2FzmVJbUxWReUjhhBb6nGt4wEux/Q8+gyw8XfiQEmohRnV5sRoRUXTrYZfecLq
 nWfv9YRzTDyZxyxuFLMpc8P0glV7+KwTFDj3mAI55Y98kTIyfg2GwMvLfaYD/5Nfju
 UpnCf+UkKdwoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vWljmcsX
Subject: [Buildroot] [PATCH 1/1] support/testing: new jq runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_jq.py      | 62 +++++++++++++++++++
 .../test_jq/rootfs-overlay/root/broken.json   |  1 +
 .../test_jq/rootfs-overlay/root/ex13-1.json   | 14 +++++
 .../test_jq/rootfs-overlay/root/ex13-2.json   | 22 +++++++
 .../test_jq/rootfs-overlay/root/ex13-3.json   |  1 +
 .../test_jq/rootfs-overlay/root/ex13-4.json   |  1 +
 .../test_jq/rootfs-overlay/root/ex13-5.json   |  1 +
 8 files changed, 104 insertions(+)
 create mode 100644 support/testing/tests/package/test_jq.py
 create mode 100644 support/testing/tests/package/test_jq/rootfs-overlay/root/broken.json
 create mode 100644 support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-1.json
 create mode 100644 support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-2.json
 create mode 100644 support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-3.json
 create mode 100644 support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-4.json
 create mode 100644 support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-5.json

diff --git a/DEVELOPERS b/DEVELOPERS
index 02b7516a92..91d2c6d869 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1778,6 +1778,8 @@ F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iperf3.py
+F:	support/testing/tests/package/test_jq.py
+F:	support/testing/tests/package/test_jq/
 F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_kmscube.py
diff --git a/support/testing/tests/package/test_jq.py b/support/testing/tests/package/test_jq.py
new file mode 100644
index 0000000000..67420abb6b
--- /dev/null
+++ b/support/testing/tests/package/test_jq.py
@@ -0,0 +1,62 @@
+import json
+import os
+
+import infra.basetest
+
+
+class TestJq(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_jq/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_JQ=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("jq --version")
+
+        # Run jq on examples extracted from JSON RFC:
+        # https://www.rfc-editor.org/rfc/rfc8259.txt
+        for i in range(1, 6):
+            fname = f"ex13-{i}.json"
+            cmd = f"jq -M '.' {fname}"
+            self.assertRunOk(cmd)
+
+        # Check the execution fails on a non JSON file.
+        cmd = "jq -M '.' broken.json"
+        _, ret = self.emulator.run(cmd)
+        self.assertNotEqual(ret, 0)
+
+        # Check an execution of a simple query. Note that output is a
+        # JSON (quoted) string.
+        cmd = "jq -M '.[1].City' ex13-2.json"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], '"SUNNYVALE"')
+
+        # Run the same query with the -r option, to output raw text
+        # (i.e. strings without quotes).
+        cmd = "jq -r -M '.[1].City' ex13-2.json"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "SUNNYVALE")
+
+        # Print the ex13-2.json file as compact JSON (with option -c).
+        cmd = "jq -c -M '.' ex13-2.json"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        # We reload this compact string using the Python json parser,
+        # to test interoperability. We check the same element as in
+        # previous queries in the Python object.
+        json_data = json.loads(out[0])
+        self.assertEqual(json_data[1]["City"], "SUNNYVALE")
diff --git a/support/testing/tests/package/test_jq/rootfs-overlay/root/broken.json b/support/testing/tests/package/test_jq/rootfs-overlay/root/broken.json
new file mode 100644
index 0000000000..fc2bf94565
--- /dev/null
+++ b/support/testing/tests/package/test_jq/rootfs-overlay/root/broken.json
@@ -0,0 +1 @@
+[ This is is NOT a JSON file! }
diff --git a/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-1.json b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-1.json
new file mode 100644
index 0000000000..52b7b6493f
--- /dev/null
+++ b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-1.json
@@ -0,0 +1,14 @@
+{
+  "Image": {
+      "Width":  800,
+      "Height": 600,
+      "Title":  "View from 15th Floor",
+      "Thumbnail": {
+          "Url":    "http://www.example.com/image/481989943",
+          "Height": 125,
+          "Width":  100
+      },
+      "Animated" : false,
+      "IDs": [116, 943, 234, 38793]
+    }
+}
diff --git a/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-2.json b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-2.json
new file mode 100644
index 0000000000..b4545b28c8
--- /dev/null
+++ b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-2.json
@@ -0,0 +1,22 @@
+[
+  {
+     "precision": "zip",
+     "Latitude":  37.7668,
+     "Longitude": -122.3959,
+     "Address":   "",
+     "City":      "SAN FRANCISCO",
+     "State":     "CA",
+     "Zip":       "94107",
+     "Country":   "US"
+  },
+  {
+     "precision": "zip",
+     "Latitude":  37.371991,
+     "Longitude": -122.026020,
+     "Address":   "",
+     "City":      "SUNNYVALE",
+     "State":     "CA",
+     "Zip":       "94085",
+     "Country":   "US"
+  }
+]
diff --git a/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-3.json b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-3.json
new file mode 100644
index 0000000000..6ccebb9abe
--- /dev/null
+++ b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-3.json
@@ -0,0 +1 @@
+"Hello world!"
diff --git a/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-4.json b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-4.json
new file mode 100644
index 0000000000..d81cc0710e
--- /dev/null
+++ b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-4.json
@@ -0,0 +1 @@
+42
diff --git a/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-5.json b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-5.json
new file mode 100644
index 0000000000..27ba77ddaf
--- /dev/null
+++ b/support/testing/tests/package/test_jq/rootfs-overlay/root/ex13-5.json
@@ -0,0 +1 @@
+true
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
