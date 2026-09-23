Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03209C98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0A2641255;
	Thu, 24 Sep 2026 19:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Hjt0-ouJ7EE; Thu, 24 Sep 2026 19:00:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EDEC640F07
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276403;
	b=BM3q2AQe08QHYw0gmJ9DQBRoEVmMg+d1ue3srfuldRfJle85M5Y/vJPjClRK9jbw7eYn
	 JEZIEcJ/zs6+BEWCKQMAS+SVL1/wImojpSM5uiTmlFG8e89sQmGoQIbarFpy7bhrksy9l
	 0Ohm54oNffq2wqm/89pTxq49oF1JVwATHjovA1yKbGduaYcSsGkcO5EvdWxpPFLLd9pk8
	 VJ9dQLgfTdh2FRWEu9nWqItHjM/HVIWIFk+NR4P8r1WBn6j8/gXO9J0+CP+C+Z+nGpOCy
	 EqhyDdK1jf2W/5Q8SaRP/qFlJLyzlDaq4XBBeupdhnrRZWU65spaUzimLzz3ciD3EqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276403;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=O1sWbZ1s6tU30VURKP/90YRFvdXFmABi3urtnVq+IEg=;
	b=IamTAGeaOGWZ6z7gHSNi4fCqkJZuESI7KztbDlQdBVYc9CzzLlv0fmCb80Em4EAVsgvK
	 Xk7MFR5f0r6FqjW9f//Ehbk0TSM437n7Sufgv2/qeDWW5zdOYI6Nt6lGYYlzjN4N6CRZp
	 GvejclSQaR+uHpZ8dWASBmkAX89jbc23JKksQos3wT/lSsfN3Yk+IpGSbfY4r+WwqSfoF
	 HOytDALUMzE8MjAYwV9uQfubU73TMzL76GAzoKRxHskagANqUbMmQvbNYyf67PZQRln3l
	 tWoLPhzhNJDk4L58dv+lG3CsH2c06i+sicIj+Te6HfRWZPSMawRnh8nSugugFgbfP8g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276403;
	bh=O1sWbZ1s6tU30VURKP/90YRFvdXFmABi3urtnVq+IEg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g1iS/BOKOcb2rxDNWBNf/Oye7aU10q2LHShbrILWVbt5Xbx5p/g+LwTIHrNa/MGMN
	 acpnB8LQQG1tSTPEaYN4H82bxeEjyaxquUAYHWII2GSCoNGx32AgJbHdZ5csCdpeMQ
	 rcpe6MeS9fv3jn8jTpQWNxk/OT6U6DXPPVR+THzQT5mtlyOxSWcCLMrklpC/UW76TC
	 nlA+GgDIvY661IjP6RxZkFuM3Dre0hBMb3GLEr20A1hzQeZxpAfecIf8fKRp+2Oyow
	 TKBhUTTdF418r7oS6yng7a3ZxjzjBE89NPMkCV6LBpvHoJw3UolLeSNwEPdVYNNDs/
	 sK4kY+/wd0z8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDEC640F07;
	Thu, 24 Sep 2026 19:00:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34CE9431
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26311404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huzjTXyEOR5r for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 31405404C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=fWMT/mm43vUzP8ggbuuukZx+vJ9b7GEFHHwNeLaXAT1wZjuraAmomlOG505EW/LkRHW6
 IG4RXvrxLHP1TI7G30CdJ7wD1/QsNLc/MBp+DMeuLS1NEfyzmQoufDoQZuQUQziOScSZL
 /qB15nKONahorSXfzfEr30jgkfnq6hVc9Gqg5QnUzU4p9oYnPtbTkrJrk+XDpbpiMGHd3
 fvpagVUGFJlON5C8NGhjHSxAskBQDhCzdL43/t9S4D1JLPpaFrmxky67S307G01pXAvs6
 dnsiFi8niptvA/zUmdzidRTK57iu9p2d+H+5lgnkee2BkOOEBSySY41sJpQVcmT7dPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=juCIMMnbWvs7kBkeSLbOXVvRDmb/eD6yu7Hp/EfVuME=;
 b=KXw+4emBC9O+0c/cfQaNTkXnIRIJH70iO+EnQYZUHjjdWcXBtXUj/V8MU6MLkYQP1h8f
 g0HLALDzXo6Xbswhr0K4nF/rPlkvPtNkbmnjLNt4JxYxfVetIpyOF+6ZEZyLGirm7VAbA
 yLpBERbz1984p7wXOmpWXbxknLLaiV4BL2Z8i6FLu0pqYJq+JNLt+z/wmRJEINtSFLwZv
 0HgLe14JLyodWzWTxKBfclGrSZcSDKXj2of5xWDvV5pjZ4K2EJSpP1MHZouTvzqvfqBYw
 VA7zK64xqrEXoGi3713S3WwS2mQlmIrqU9USHsAWZsYIGD5HNjoEruGVRz89Kaozw9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31405404C3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C89679828F; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:34:18 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 303a5a2004180ed2de4f0bd78d48a29226f1f3c2
X-Git-Newrev: 039194046b2a0d28fe5a0d1f7602ef0c9187789d
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.C89679828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/testing:
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
Content-Type: multipart/mixed; boundary="===============1621859987900710637=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1621859987900710637==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/039194046b2a0d28fe5a0d1f7602ef0c9187789d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 45eccf764a83a3fc711d63153e9bb920aa53d0c8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_squid.py | 66 +++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7dc09bdbb3..932cf47da7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2048,6 +2048,7 @@ F:	support/testing/tests/package/test_sed.py
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

--===============1621859987900710637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1621859987900710637==--
