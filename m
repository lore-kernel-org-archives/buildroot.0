Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E63CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B02B608DD;
	Sat, 10 Oct 2026 09:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiNDtVBI76u0; Sat, 10 Oct 2026 09:21:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3D78960656
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624093;
	b=XyybzQcEO5kx1MI7HWJh/o7fY0gx/k4JG1ZUwc+dT4csCxfrbF9M++JvheszaF8/5S9U
	 19XOQAQCk3q7pMTNgwYaB34IecLd7oV9CYj9kyLtLPsbWhXzkUISfTCHSE/uzLK+KKX9a
	 Kn5esqLcP9jh/YomXqE629RK/9pwcyFsad+dDI3RBJ6lBWBGmbAKX+lREThsS7WHMDRUe
	 f6EkLku+5AGVcz8uRAPBrUkJc+Xiu2cPjIbDzQC+9NFvY6okCfSso1PaiHG6EwSOhjqEs
	 BfaHhy0U7ubELbIt6oOPb4VWRxPXQy/LpSS+M5Al8uWgCBB+1iZLcOg1QDXzMPBSfhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624093;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=YMzMXZDb93g3kt1wZzCINC754Xa2MGEq3XoYEW3JPiw=;
	b=RR01dU7Wn6cTJeNaQxh2r0ajPWbaC79y6IJ34OspSAi1I0S9ZWKj/ttUC7p6HcJcd7ds
	 zKys6aX4qBUfeESkTUmQH+XlN1qT1HwLPE7hDzG9TR6hFUqWoG1iUlPYV5r6hdg/IfGpK
	 jZy8Jo1kR5Yt85UqM7+RuOZaTl/ZV69/aHk+5nRoYbwUAkHL+mQl0Np65d3O8s5wv4XDU
	 +H5YBlNwGbjKoozUvJgBWIJfmBCx/5HCwAjsV5FxCPuQjSSsGKx0zqWJgep22QGJ8PcDY
	 cYhRf7idANw/RqCkqJ8aHq2DF55ZxmXjQWUGet9JhxTdfYGDzCnpnD3LmlR+E2QboQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624093;
	bh=YMzMXZDb93g3kt1wZzCINC754Xa2MGEq3XoYEW3JPiw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DG35N4rseYugxodhqyidSaJJAcFJqUTA9aj6Te0wruDEc4NRax4ELNaPuPMz1h/Hw
	 7l7vbE/zAQRKJYkhwI0rsBwDW43bibyLcVaVkG+H44wBS+Ajon0N03gWFI3erPBMLi
	 rMewyo/WKCdcUzMNK48avKcGl2R+9pFSPShCjaIaE5HLa026WoKj9DRKlKnApYoEGa
	 CqCqnALmp9gJtWX9lv8x80dOcvEGxKmLj1FFwFa+fDqpq6FMMeMdQyN0xlFzMvf1H9
	 dJaq+1q+YMn1GV361Kv652GnpauDhdYj5xATw56PEVxnVuV4geduCALjn8ABWmdxlO
	 ZVw6t/Y6SdI/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D78960656;
	Sat, 10 Oct 2026 09:21:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A840DE0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63BFB608B4
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jrGyF7-wSmQ for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 971C76066D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=IsemvPtK0t1GeA5SIMVZGfcCHIUQKqImRfmtZLJhxL4gyfu5KnU3ZfgAWyfCI5Ewli3+
 xECYcyttE1sAZzCh57qkYuRyJperXl4ocfZlc0GZvkiC0SGxd/Upl9zOQItjscRYVrxb4
 wGExVsOXk67osfR+EUkdCSWkaPAaUT3Y17cqkkBEaIxZNtoS70IckVY2g1tkbZ/DdDdgs
 8p8OHV6zHm+vlr52r9AB/B6Gdu4is6ourcGececNWJ1DhjXZ+FHhICKtyqUQ/bn8VkOH6
 OPIsoMmPsmSgGBlmQpUxcMWGQrPy9cqo6e8STvvUAEJgsKU5AlIXvXFUI7dVxhXhfjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=u+gRt6esmhhw4dmA1RQbFxWbdsEVYGGpCJzVZ6eq8sA=;
 b=R98x3crFUKWsS1wpCy9RExaCU+QCQXuPlzBCJ9ty3NyaWgFJgJuCxCSrdNf5yTOC90+3
 x23UTtiO6PvBZvuc0ZHrOqT1TiuhZl/cjg5gAgpsjzWMgri7fI+G1e3fx0QaTVG6vOhNa
 3snlIiSn2iAlh/32YycF0UAsu/vv9OiHFTSJWrk2GRNnuw7WbbxYjKZhmB+9+jBUvVKO0
 UwahQv0C/OQcovEXo3n8Kl+OzK8CmbA//8z0WpXeRvHAAaMwfKSLyL/Pblxsn0SQ+VxtV
 RI2vGsFjr8mwPgUm9cYv5fay66tttOk6lO8E+gHDGEImxhrYEnV1cNTmThhsUHRQrPg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 971C76066D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8105F8F065; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:01:17 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b73bf11d5f58232c74f04f3a6c0c946382e52ad0
X-Git-Newrev: d27b7b94324c283d3eb3affb5c8598a28e599214
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.8105F8F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/testing:
 harfbuzz: new runtime test
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9003901278869336304=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9003901278869336304==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d27b7b94324c283d3eb3affb5c8598a28e599214
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7fccf3a91eee92f084f1d453647c0bc7b4fc5c2f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_harfbuzz.py | 33 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ae4e81a9e7..377e7f9ea5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2855,6 +2855,7 @@ F:	support/testing/tests/package/sample_python_s3transfer.py
 F:	support/testing/tests/package/sample_python_sdbus.py
 F:	support/testing/tests/package/sample_python_sdbus_networkmanager.py
 F:	support/testing/tests/package/sample_python_urllib3.py
+F:	support/testing/tests/package/test_harfbuzz.py
 F:	support/testing/tests/package/test_nginx_modsecurity/
 F:	support/testing/tests/package/test_nginx_modsecurity.py
 F:	support/testing/tests/package/test_python_jmespath.py
diff --git a/support/testing/tests/package/test_harfbuzz.py b/support/testing/tests/package/test_harfbuzz.py
new file mode 100644
index 0000000000..4259a87514
--- /dev/null
+++ b/support/testing/tests/package/test_harfbuzz.py
@@ -0,0 +1,33 @@
+import os
+
+import infra.basetest
+
+
+class TestHarfbuzz(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_HARFBUZZ=y
+        BR2_PACKAGE_LIBGLIB2=y
+        BR2_PACKAGE_DEJAVU=y
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
+        # The hb-shape utility needs a fond.
+        font = "/usr/share/fonts/dejavu/DejaVuSans.ttf"
+
+        # The library loads and the utility runs.
+        self.assertRunOk("hb-shape --version")
+
+        # Basic invocation with a font.
+        cmd = f"hb-shape --no-positions {font} A"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "[A=0]")

--===============9003901278869336304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9003901278869336304==--
