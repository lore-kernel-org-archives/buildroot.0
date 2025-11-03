Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DB8CCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F86760A82;
	Mon,  3 Nov 2025 21:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-v5rty8mTCa; Mon,  3 Nov 2025 21:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB7660A86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DB7660A86;
	Mon,  3 Nov 2025 21:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E67D3462
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D838260A86
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0kLasbtVkry for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01E4460A82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01E4460A82
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:31:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F09BD83B4D; Mon,  3 Nov 2025 21:31:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Nov 2025 22:14:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b7e87f4e174553832052cbbb3c01e17f9f605b3
X-Git-Newrev: ec1b8007181b9c4f66e5e24c32a52ac6b034f4e8
X-Patchwork-Hint: ignore
Message-Id: <20251103213137.F09BD83B4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_xen: more robust
 network
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6369608721976746895=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6369608721976746895==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ec1b8007181b9c4f66e5e24c32a52ac6b034f4e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test tests.package.test_xen.TestXenArmv7 has become unstable after
commit 24ff258905df ("support/testing: test_xen: add networking"),
leading to a ~50% chance of failure on gitlab CI.

This seems to happen only with 32b (not with the 64b TestXenAarch64),
only with Qemu < 9.1, and when this happens the test will hang during a
step involving the simulated network and the dom1 (DHCP or ping).

The root cause is suspected to be a bug in the virtio-net hardware
emulation of the qemu version 7.2.15 included in the Buildroot docker
image.

As a workaround, remove all network interactions between dom1 and the
simulated network:
- Instead of the gateway, ping dom0 from dom1.
- Instead of using DHCP, configure the network with fixed IP addresses,
  so that we know the IP address of the dom0.

A possible solution could have been to compile a host-qemu within the
test, by adding BR2_PACKAGE_HOST_QEMU=y and
BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y in the test configuration.
This would have used the current Buildroot version (10.1.0) not affected
by this issue, but this would also have significantly increased the test
compilation time.

Since the DHCP is not really needed here to test the Xen networking
capability, this is why the network configuration simplification was
preferred here.

After those changes both Xen tests are stable on CI and locally.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/11871454648
Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_xen.py | 34 ++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/support/testing/tests/package/test_xen.py b/support/testing/tests/package/test_xen.py
index 511363be40..6f2da05d3a 100644
--- a/support/testing/tests/package/test_xen.py
+++ b/support/testing/tests/package/test_xen.py
@@ -51,17 +51,21 @@ class TestXenBase(infra.basetest.BRTest):
 
         Here is the network setup we use in the test:
 
-                    :         dom0        :   dom1   :
-                    :                     :          :
-                    :        br0          :          :
-                    :      10.0.2.x       :          :
-             gw     :         |           :          :
-          10.0.2.2 -:- eth0 --+-- vif1.0 -:-- eth0   :
-                    :                     : 10.0.2.y :
-
-        The VMs get their IP addresses with DHCP.
-        We create a bridge in dom0, which allows dom1 to reach the gateway.
+                    :       dom0          :   dom1    :
+                    :                     :           :
+                    :        br0          :           :
+                    :     10.0.2.42       :           :
+             gw     :         |           :           :
+          10.0.2.2 -:- eth0 --+-- vif1.0 -:-- eth0    :
+                    :                     : 10.0.2.43 :
+
+        The VMs use static IP addresses.
+        We create a bridge in dom0, which allows dom0 to reach the gateway.
         vif1.0 is added to the bridge automatically when dom1 is created.
+
+        There is a stability issue for Armv7 with Qemu < 9.1, which makes the
+        dom1 -> gw connection unreliable. As a workaround, we interact only with
+        dom0 from dom1 (hence the fixed IP addresses).
         """
 
         # Boot the emulator.
@@ -87,8 +91,7 @@ class TestXenBase(infra.basetest.BRTest):
 
         # Bring up the network in the dom0.
         self.assertRunOk("ifconfig eth0 up")
-        self.assertRunOk("ifconfig br0 up")
-        self.assertRunOk("udhcpc -i br0")
+        self.assertRunOk("ifconfig br0 10.0.2.42")
         self.assertRunOk("ifconfig -a")
 
         # Verify that we can ping the gateway.
@@ -103,12 +106,11 @@ class TestXenBase(infra.basetest.BRTest):
         self.assertNotEqual(uuid, dom0_uuid, "Unexpected dom0 UUID")
 
         # Bring up the network in the dom1.
-        self.assertRunOk("ifconfig eth0 up")
-        self.assertRunOk("udhcpc -i eth0")
+        self.assertRunOk("ifconfig eth0 10.0.2.43")
         self.assertRunOk("ifconfig -a")
 
-        # Verify that we can ping the gateway.
-        self.assertRunOk("ping -c 3 -A 10.0.2.2")
+        # Verify that we can ping the dom0.
+        self.assertRunOk("ping -c 3 -A 10.0.2.42")
 
         # Detach from dom1's console with CTRL-].
         # dom1 is still running in the background after that.

--===============6369608721976746895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6369608721976746895==--
