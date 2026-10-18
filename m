Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FF4CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 09:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 837FF606A7;
	Sun, 18 Oct 2026 09:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cno77YSSlcE5; Sun, 18 Oct 2026 09:51:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 82900606D5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792317068;
	b=bZMbKUwDoVzdwwL24h9UeGqmWp2e7ATvf6Ehu8ttifSlnf6LkVTUaZpBYAmANal35Zu8
	 mi1/oFkMhPRbEjnF/667u47f66/SUZKZSKMBbP+cxBHY0owQm+Jw0p6iFPwqe/DCuDfpk
	 WIKQbgqgeUN4nhQIepEvToYDhS2YUg5z5CKZyfuTiNU0nxkv9bYF/aU4rNa1AW2f0cpSI
	 Q5AAcVhS6LhFs6hEof/I8nuVHyOQQOy6QluiDuehjpFnIsGdytg9UiMvWJXIuNmOct41w
	 5TlozAZ4+0Vx6hKELBk+5O9nmUNSa8jiWl2VZy+8LqCIvBEId6R9e2DXyjz1PeipoHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792317068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rh8lebbsN51+tslPP5+TSgf18UgiQu1JYsBTLP/s6bA=;
	b=aFhcFJeR1eozysLbJtyYxpX+7uXb7EuCm6A0Nincc3mLgcbDpJ2KlSrn+3+j0O9v3iyf
	 2KINS6vc5kA5VJlgpwdvh75gC0X768uIK7JRN04E+xvkmdc3jmj2s+EHnRgpCfavMeas4
	 5bFsjTrtJxwJbH4d5MAuKMpr5uv5mHW0D7Zt8P4f1170Ey+TV2s+3O7Gpvbu4vJtaHxWu
	 xdBzJz1TEb5+0PmIyZrg/VksWNRrd4YH737I8l6Mk9dQhbJ26IM7m6IUytDcaUSLAnVf+
	 OrcAwH1anRaaMpzortejYpoQ8a5ilQ2q4jVg23DyP235feRk9gPTgamqOykxNIYrauw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792317068;
	bh=rh8lebbsN51+tslPP5+TSgf18UgiQu1JYsBTLP/s6bA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q9Tn0e8D1YwV+t3/3sgQ4bCAKeH029vmD91sHTvYW/jRLxYSybVo0frCoIEG6FRwo
	 1MgqvCrFrctVzT1i4CsCO3NxGbCiM8+e6b/iNmlem+LgXiFS+jDO/KYxjMfYs7HoDq
	 NbYJV3ZjhmtviECrNtrLWEfCLY8RqhAbdd5ip1aSsyOCEDC6FWfYtf2b2uSUomvFpP
	 3htpo116GeTGjMXo8cQM+tiWCeucFZy5/sOaJ/tdrmW38XMKEUOF5Dv9wXLJOP2on+
	 5//17Li0+VP2BfiYCv9qdCD730bAE8qcLLnyfbMKPPFq2NDbTbJ/DMoGqFb2/nv3A1
	 QBZiJdzBO5Pqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82900606D5;
	Sun, 18 Oct 2026 09:51:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E1F723F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8B1E40937
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sC6yigi5bi62 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 09:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 073A04094A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792317063;
 b=WSk//e4Lz8wpxC2Z0t1vjz0SR4sYxexY2nrSBleQNJjx7e+PK0OFNXMVNFJ/6KhqksCY
 3Fmx8QvqhYHSOb2muUcl/lnnwmqWFPXC6rzrtOj9BO2roRxSxURywQsAmGZ8YzekIpsjL
 phicLfD1eKl1+uHtN+CS0rFBJvbj/r5VgOc4xd4rAiK97dXr1CpiXfnfPur2fZsNc2Hj6
 ZCbVtPIB5tO/fE9H3RqZ+OK6SSfheQoarpVLVusem056ctayK0sFcYuCp+D0Rd0/lRD/W
 QVxp8BqCscL85D4stoIwY3/Y/BMiMkbrG7M/6bhIXF76PfG5Sbv79vpuC8ngkG4gGBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792317063;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=T8kgPd0pnX+pTmAywuwPLwfGOBh/37HCjdlM48MvplQ=;
 b=MNPUbqCjQVQZxdO4ifX33vHFnqXi3gowerHZrFxg1AuXqwHu+NdRkdRT923palgC/6vS
 UXDtA2ikfnfIDLeREeVbxvs+KA35x+OlzFXolyCKat1FeEE0IHMFFafhELLoYB5+RaujD
 WVLB7je8k/XBuzfIH44xMHcxZVLocucf4NdadqB1FiwX0AKrC5zLilAMaKkRNlTevrqLq
 nJNKBI9jFA/FvVMapyh9+/nlxhuVGcpV3V+oWhjgD2i3EX4HLG31koi5nKgXqjrKYeQqV
 R8OsClEKABXzJ7gX9oVSV/2aZQyahG+0suuCEQnActF9DELqW3xRdAGPJRzTIYBufAg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 073A04094A
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 014C596ADA; Sun, 18 Oct 2026 09:49:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 11:28:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1
X-Git-Newrev: 6bd698cdd6b9ea2fb4ead725780c963311100852
X-Patchwork-Hint: ignore
Message-Id: <20261018094941.014C596ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_uboot_tools.py: test FIT signature on
 target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6bd698cdd6b9ea2fb4ead725780c963311100852
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Adapt the code added to the host test with
928cc5dc5cb82e6f2cb43f853488309eb806ef89 ("package/uboot-tools: fix
host FIT signature support") to run on the target.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_uboot_tools.py | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
index 13f77c3379..7caff3e66c 100644
--- a/support/testing/tests/package/test_uboot_tools.py
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -38,7 +38,10 @@ class TestUbootTools(infra.basetest.BRTest):
         BR2_PACKAGE_UBOOT_TOOLS=y
         BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE=y
         BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT=y
+        BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y
+        BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN=y
         BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
+        BR2_PACKAGE_LIBOPENSSL_BIN=y
         BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
@@ -68,6 +71,65 @@ class TestUbootTools(infra.basetest.BRTest):
         # Python does not have built-in CRC16 support, just check it is present
         self.assertIn("crc16-ccitt", reported)
 
+        keydir = "/tmp/keys"
+        self.assertRunOk(f"mkdir {keydir}")
+        # We generate a public/private key pair to sign the image.
+        self.assertRunOk(
+            "openssl req -batch -new -x509 -nodes "
+            f"-newkey rsa:2048 -keyout {keydir}/dev.key "
+            f"-out {keydir}/dev.crt -subj '/CN=Buildroot FIT test'",
+            timeout=30)
+
+        # We compile the empty dtb that will be used to store the
+        # public key.
+        self.assertRunOk(
+            f"dtc -I dts -O dtb -p 0x1000 -o test-key.dtb /{KEY_DTS.name}")
+
+        # We sign the image and write the public key in our key
+        # storage dtb.
+        self.assertRunOk(
+            f"mkimage -f /{SIGNED_ITS.name} -k {keydir} -K test-key.dtb "
+            "-r signed.fit")
+
+        # We check there is a signature present in the FIT image.
+        out, exit_code = self.emulator.run(
+            "fdtget -t bx signed.fit "
+            "/configurations/config-1/signature-1 value",
+            -1)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+        self.assertEqual(len(out[0].split()), 256)
+
+        # We check the key is marked as required for the configuration.
+        out, exit_code = self.emulator.run(
+            "fdtget -t s test-key.dtb /signature/key-dev required", -1)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+        self.assertEqual(out[0], "conf")
+
+        # We actually check the signature is valid.
+        self.assertRunOk("fit_check_sign -f signed.fit -k test-key.dtb")
+
+        # We "corrupt" the signature, by setting it to zero.
+        self.assertRunOk(
+            "fdtput -t bx signed.fit "
+            "/configurations/config-1/signature-1 value 00")
+
+        # We check again the signature, and expect a failure.
+        out, exit_code = self.emulator.run(
+            "fit_check_sign -f signed.fit -k test-key.dtb", -1)
+        self.assertNotEqual(
+            exit_code,
+            0,
+            "\nfit_check_sign did not fail as expected: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
+
 
 class TestHostUbootTools(infra.basetest.BRHostPkgTest):
     hostpkgs = ["host-uboot-tools"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
