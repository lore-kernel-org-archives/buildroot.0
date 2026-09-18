Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2DC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 155CE60BD3;
	Fri, 18 Sep 2026 21:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLETlclEBzSA; Fri, 18 Sep 2026 21:51:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 24F1760BE5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789768319;
	b=I+0Akm1DkFg+9KPv+827lFPNp9SJH4xDHWepsLr3WLULGl/C5fKvJzdNM5WTYAK+ukdB
	 SNEbnJlNc1PwlnY24wB0PIWEXPrIjYDyhEd/Cjg0eyrYoD0jA5is0NKNt+Y2frzSzI8jm
	 IukuJUgWVuwekSCZJYBrNcYcjszmXYFhMn85l55FNd6TN5T2j/21Tsi12FOviryOP/Fg9
	 Kckk1yMWnBeGCBZzL9Xn7xhzmy/Hj5KwnhMZo+n6JvtHY5aGatyptXhMcev4AvMCZNrDO
	 XZP1cKRg0XYns6363/FUWNWNfUl3Ar9FZsuC/cy7kVgiH4EutDfxz5+c92nypV/ho7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789768319;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D0VJDxrW4M+WyDKof9kclT1J7rHwbvXlNwLMQouu3vY=;
	b=jTwo3zihYH2/tqAbGRWC8TcDPYTotqCk0ZqeEhx1+TnD9SCEmAWYr52Y57F/jgTpotSM
	 YreREdP8S+TBaUZ1olWRakEEhCTXzMyapryTw0BJbNAIJMDct9ExK8Ca6RYmzPIIPymOY
	 AH7n6Rz8pm6sO2hRCHIOWN0rR179761LdNyI568wnYACdjT8bAgKcXOJ5Ht7qvwGFtJeN
	 twacTN1nbXIx7vvEibLMO+CG7NLRo2T5Mlc1oC4fs1oOmij3Tg7ZFpgOraUkU43KoNEWQ
	 /g/vYQAKbqkwVhJKP2vOX4TEFIsxSGTMhPoPaKxk5Zmj9M+P1eqLHtpDiNKWx4JzG7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789768319;
	bh=D0VJDxrW4M+WyDKof9kclT1J7rHwbvXlNwLMQouu3vY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f09bUpP2qsac13/h0EWkWi9AU2vOoYzoyACXDrl/vyu8iarOGYzkcawC25GUcw/Vr
	 qKcAmG211Yp7GT6HAjkXO9a/F0oH0vmW9C2SByDRh3REIcPeb9d+2r1yCt1CJGc6a5
	 5LMRAzdytzLZ+2x1qpK+7NyybaOPt2F3Oo+vlVtKr/QVRSlvEv6G7QJXeSoS9ajRBM
	 dzYL9yFNMt+C2H7wYLSUvTFcNcmtkQV97KwLgVynh3sZkkT+fOS8kg+FTLZKUUzwwM
	 IRBoSKIo18QUSYOjgq5F/mdUlzrqcQrZwR9rz0dkmsFFah5tembJ3k8ec9eaxmV9RG
	 c8HAMd86mxL6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F1760BE5;
	Fri, 18 Sep 2026 21:51:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EADC51E9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0B5760C07
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m5s9jvnlVFBH for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:51:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 20C9360BD3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789768317;
 b=HRcGoWMPh/W2+iXiKXfUz3qXn9bqom2qgGc0YFqatSGczwa3deuIaM/dO/cSDFkV92FM
 uxF4qitWAdokBxm+oaieJEJ2MX8YJbfnlSBsKvjt8yvb+NLchenGJr7LfQFz/8dN+mKM/
 e0KlH8uQLq+h3dj8kTdIPmnpOI4ldi/NiAn5HuedrvDqdVRfThU2ZfF0xZj87mvLW+xGX
 ByoCdW5c+e+oqT7uDROBX4KOfOEzL9wm9Bzl3LYq/mMwRa9M02yI9F024QvL41ZPJwqgC
 GplQL3UvQOFtbtFTkesDXgGkgTCJW0fFbeGZFuyoSQWMdcePya/Xcxkg58BdUPUfWug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789768317;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YqkzJW+MuPS411znvU0uZx5738VvEYyKeYzs3T1j9jI=;
 b=Cu69kpxEfs2Fwdv7hrAqISIkvOcHFvdaRqASuMJEv9gCTL5OftvqNvXU2rpbTw6UGuFZ
 5Tv/W4/TZRqUpnd3fS+1N+DVqsTJw47C7fMQ7lnzHvInC+kgWxuuoRa94yBEcU21Zm3Yh
 hHSJvbEOve+Sc58mVoPejyL7i6DgTElEE1R+GYyvSxfcUdiIuN/ZLJp7R9Xfu21nMUx8A
 LJaTxBSodBVTMUGtxpCDzUBj0YpH/jZFAX28EGZmQPei0XTFgHRAvKm0GT8W0p4kHxPwR
 U338eqjF4cKcKaf58T80wLGYby9g/zgWzlA2oF52yw7tv0uxmVDNJ97oOPB6HqZAUpg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20C9360BD3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:51:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 916AD976B0; Fri, 18 Sep 2026 21:50:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 23:51:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a304c7bf12c85a4d8b760850da4017fce694cada
X-Git-Newrev: 45eccf764a83a3fc711d63153e9bb920aa53d0c8
X-Patchwork-Hint: ignore
Message-Id: <20260918215049.916AD976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_squid: new runtime
 test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45eccf764a83a3fc711d63153e9bb920aa53d0c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_squid.py | 66 +++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cbca07f9fa..51b939542d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2049,6 +2049,7 @@ F:	support/testing/tests/package/test_sed.py
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
