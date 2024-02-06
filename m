Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DC2C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF08C81E11;
	Tue,  6 Feb 2024 17:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ldMRbJjDpLd; Tue,  6 Feb 2024 17:37:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D024E81EAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D024E81EAC;
	Tue,  6 Feb 2024 17:37:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59B441BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 320C240A39
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 320C240A39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jaBvZgzVeCxo for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:37:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8F46400E5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8F46400E5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A21F88732F; Tue,  6 Feb 2024 17:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 18:33:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecedc4ae8c0632cdd9ba0bf63a64a51e67a1525b
X-Git-Newrev: feab8290a492ae76d57132f61cd1716a43a0cf78
X-Patchwork-Hint: ignore
Message-Id: <20240206173734.A21F88732F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new jq runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=feab8290a492ae76d57132f61cd1716a43a0cf78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_jq.py           | 62 ++++++++++++++++++++++
 .../test_jq/rootfs-overlay/root/broken.json        |  1 +
 .../test_jq/rootfs-overlay/root/ex13-1.json        | 14 +++++
 .../test_jq/rootfs-overlay/root/ex13-2.json        | 22 ++++++++
 .../test_jq/rootfs-overlay/root/ex13-3.json        |  1 +
 .../test_jq/rootfs-overlay/root/ex13-4.json        |  1 +
 .../test_jq/rootfs-overlay/root/ex13-5.json        |  1 +
 8 files changed, 104 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c103bdadf8..4b8d195f9f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1790,6 +1790,8 @@ F:	support/testing/tests/package/test_gzip.py
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
