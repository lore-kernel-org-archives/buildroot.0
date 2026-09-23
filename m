Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D237C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B533C40F26;
	Thu, 24 Sep 2026 18:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiQ_9BggpJ6s; Thu, 24 Sep 2026 18:58:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7F8F140F12
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276291;
	b=k036kSsQ5pcywEAbcIvMX/f5iN/hYCvn8yIEA3yQCRn8HqVbk7CPzLS/mqEPBzBvgCzC
	 lP5fGrf6JNkokVQTGgrlua+bG46+NKk2Xh2Q/olBx32Y1itwCTI503e5V7TZrafu3tfNI
	 Fm0T9WR+D/G2FH/DEkTCu/cvCAVdiBpwfJbc5Kg6zOX/sZSDdR859tQJM5IHcB+g071FK
	 wtbSZQua5asIkXEBRg6EnA6wdVKNeaPqV/Jl7TlOU9/bh8S/N40a6t/zZDsCYmtNv7tg5
	 ZiZyGb+xqqk20dZ4LSCsKtxBNucF3VaXLtkhwOqP1PvBTKpvCt7elJQjTX0LMDNoGpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276291;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Fny+EzqI892BN1oZE9Z0KTYVZgOf3iym50pufNQEVTs=;
	b=IaZKb/QKuwqxvoJO7SKAB9wvPEVGtRFeeq5iAjN58PTpSgOAXyXr/4jiDvawcoYSkZqN
	 zsBvlI6YYkO4caUQwZEjsfJzCn4rSMGKHouVTakFOME4FQHVQCrB2QushrA9WI53YYwSr
	 k0fmSjFqxBqUiU8Tppp1hHIifYf9BBGVnK0icE7VAup7uzTCyFMIXXKTaBTHcOVcLvEr4
	 I1rYke0T1qw+ies004d0bukPGYE06+6aSDDLM1z9WyZkUlKMhxWQ74lqTynWsjNBqBUP5
	 yeqREcCaw7A7T1YOz5MXa37g0Y47tkiBajhntoqX1vNzPGnMxYEbsuBLXXtLnuwh1Qw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276291;
	bh=Fny+EzqI892BN1oZE9Z0KTYVZgOf3iym50pufNQEVTs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cR391ZZKSPq8C5gAntHq0IQF+zwcHVHRaO67qBHFeBQfw9ceKmWOm4jzUVEvD7ACY
	 mfLgQ0E6QJ5yoqKgtbR6DvXlX0BTjF2r6/4ppf+qb7OBK49gzvbG0/43IB4+Viftxn
	 6DXm54nRvp+krYWsoJFx3YF9wwRLPXqAqH+klC0RTiC7SQWj0nNrU46yJm5bqkWBHW
	 uNXC/b3R/mwrOJ5/xC9BpuOkl0H/pXL2gYvzgchuDfYLgRhLzSPaGnzrS9Vq4f8eaw
	 yMJ2TPqVR5KK3uXck9ImCbZrYYm1KH6UHChGNXMRgRNhVlWoYkJrdXB/Uc4t+R4fKF
	 ZXeWMAVCGOAfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F8F140F12;
	Thu, 24 Sep 2026 18:58:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1857A32
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7F0340AC6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeIX7MrbHGUn for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3B27240AAF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=a7YclBcB9ICF5ANlofHcxgBGR59O3oeRdNsavJgB0B6LJvi2T/Thbowws0TniJZf3SPS
 HsBvgjTJpC4QmvCrE7xHABJH6ATr1zTjOMYcE1tvjRiuPmXPPUd1S00rQ716A42ozKGJL
 V1p+nfcwCBTM72s4wmML7rWWq4GD+Wxq+dBaBXmavYkkWh9XOAhyF7yz6FZ/YpLcjy2wP
 kvRhGXe1yezW91yDfh6z2Q1XO8+eeWyGp6WwoolDh5Ldsv+esrBpG2fkIuK6ijEX0ao2M
 bdWDetQoyTvziTcW9qTF5e7fDO6XxJVKqFr7JHx4VbBOLNklmzHgX4I4VNjQenIuKDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=UvbsqbGU8wV4mlMzvOc6kzplxGi9CsxPf7Di3QgkEmo=;
 b=ep3vFBS9sLCN/t5zpKphcqOGXvXjvP/uCQ/KF7lJB0YFazhyphTWMGg4B2wYKAiRbFEp
 LTwGModS5qGPokQlD4IZgFS308HmtXCfcuqouyjjI3XYPNCfYrVl7oYJEWJbQN1OwEnzw
 xEyj9lNq0Tum7S2TXUmBA0HKA+AS5LNtjzj7NwIieunHWugYk/c+/FksAwQbnv2PufaQ4
 ZIWxzLXHOMcUCV+BCBN3lSuPugAYOIaB7/n/9q+RGkBWp2JAiUdVUVb86B4BDuVdkOiLh
 pcoQCRE/B+pMw8uY+VUmnVgekyB/CiKFwFlZAThOCTaKLdxXUxGZ7zSy1N64TN/zRYQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B27240AAF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3614976B0; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:34:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fd69ec2f626fb34dd3ffe8c62845ad47010eb513
X-Git-Newrev: 539e6517886996c55b51a3229df3730e14835357
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.D3614976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_squid: new runtime test
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
Content-Type: multipart/mixed; boundary="===============7537871896666545601=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7537871896666545601==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/539e6517886996c55b51a3229df3730e14835357
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 45eccf764a83a3fc711d63153e9bb920aa53d0c8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_squid.py | 66 +++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9961893d2c..68fbd015a3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1972,6 +1972,7 @@ F:	support/testing/tests/package/test_sed.py
 F:	support/testing/tests/package/test_socat.py
 F:	support/testing/tests/package/test_sox.py
 F:	support/testing/tests/package/test_sqlite.py
+F:	support/testing/tests/package/test_squid.py
 F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_swipl.py
diff --git a/support/testing/tests/package/test_squid.py b/support/testing/tests/package/test_squid.py
new file mode 100644
index 0000000000..02593b13e9
--- /dev/null
+++ b/support/testing/tests/package/test_squid.py
@@ -0,0 +1,66 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestSquid(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_LIGHTTPD=y
+        BR2_PACKAGE_SQUID=y
+        BR2_PACKAGE_WGET=y
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
+        msg = "Hello Buildroot!"
+        fname = "file.txt"
+
+        # We check the program can run.
+        self.assertRunOk("squid --version")
+
+        # We create a file to serve over http.
+        self.assertRunOk(f"echo '{msg}' > /var/www/{fname}")
+
+        # We download the test file through the proxy.
+        proxy = "http://127.0.0.1:3128"
+        url = f"http://localhost/{fname}"
+        cmd = f"wget --progress=dot -e http_proxy={proxy} {url}"
+        # The squid server can take some time to start. Depending the
+        # load of the test controller, this can take a variable amount
+        # of time. We attempt several time before failing.
+        for attempt in range(15):
+            time.sleep(5)
+
+            _, ret = self.emulator.run(cmd)
+            if ret == 0:
+                break
+            # wget exit with status code 4 in case of a network error.
+            # Since we are waiting for the proxy server to be ready,
+            # we only expect this kind of error. We fail for other
+            # types of error.
+            self.assertEqual(ret, 4)
+        else:
+            self.fail("Timeout while waiting for squid to be ready.")
+
+        # We check the downloaded file has the expected content.
+        cmd = f"cat {fname}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We also check the squid proxy logged the access.
+        cmd = "cat /var/log/squid/access.log"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        log_str = f"GET {url}"
+        self.assertIn(log_str, "\n".join(out))

--===============7537871896666545601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7537871896666545601==--
