Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F32C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 16:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1AD4407FB;
	Thu, 27 Aug 2026 16:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBg8v6nPlNEw; Thu, 27 Aug 2026 16:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787849744;
	bh=snHmk+0dnc+8orszGMFwMS2sMdaPKSp2slW8XoUx9oQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzpfBV5NgZEGKPas3It6hr9RwlnVf9g2HlhlC18mXqSdJroORWdCjFoblDuhRRiPq
	 vC4Uw8IMnSjtn2D/REG+Wok/Iylu6itelP1Vu68iuECVSxZNpit/Qa9cFxMcCS9ttg
	 c7VN/EWfgkXNmlvvog7C6wyrndIK9oB2aKg//mZp7wb8Waej3u/uxH7Uc8xYNB/rOq
	 WPlXrk9ZJM5LEeJ3okSJ139z91L9bs22I03QUaeXCVw5+KE1I71d2x/amhfF4Dx/Zi
	 a2RP+FexpMVWmfj0Z0aJ8v2HFG36QUMfZiyfmqz6I2bHe+bsjY1jnHDOSvUbPtHOrW
	 UGf5Jgb6fu0Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E225407D6;
	Thu, 27 Aug 2026 16:55:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA884E09
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 16:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0969407D6
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 16:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7yc5PwBXuNB for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 16:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=PDx4/f+k
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7096D407C6
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 16:55:40 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=PDx4/f+kV1l7PEG5j4Jd8wrVRR+1KwOv+RD84H7UZcpoj3+JJz5jONLn6npVnR7ha9qizLIIYR4WMrlgM2fVqCAW/ws28in+NeCD4oMToonRBe2MXryQGIN2TvpYJl6r7QOcAuU2Ry31iIAu9HJuGNdSzUXuD79mCdzV94tYyZpY5gn2Lin0Teit2kJ1e6tx5DpfMz1OnahiVGZK12yoyrdugOBBaGBr1iHmp5c7OX3pFXKMO4BhUKTATLwzxM1uszgwZ1kUdqYnM/BWTKN9Zw2CfSiJjiEJCZialy3e5VJk761quRt1Xr+noBByxbxqLhOMSDxJXJimj31UT0SBrg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=ep2Jf+8xfp7+Ym33qA4C2zd40mvQ6sZAQHubw09gGiE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 200452261; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 16:55:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wzdO5-0000000FhFC-1cgj;
 Thu, 27 Aug 2026 18:55:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 18:55:32 +0200
Message-ID: <20260827165534.3741128-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827165534.3741128-1-peter@korsgaard.com>
References: <20260827165534.3741128-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 2/2] support/testing: add haproxy test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Based on the lighttpd test case.  Verify that we can download index.html
from haproxy in front of lighttpd.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                    |  1 +
 support/testing/conf/haproxy.cfg              | 13 +++++++
 support/testing/tests/package/test_haproxy.py | 38 +++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 support/testing/conf/haproxy.cfg
 create mode 100644 support/testing/tests/package/test_haproxy.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 5eb438906f..b39e01fe46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2715,6 +2715,7 @@ F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_agec.py
 F:	support/testing/tests/package/test_docker_compose.py
+F:	support/testing/tests/package/test_haproxy.py
 F:	support/testing/tests/package/test_python_hid.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
diff --git a/support/testing/conf/haproxy.cfg b/support/testing/conf/haproxy.cfg
new file mode 100644
index 0000000000..41e983ea97
--- /dev/null
+++ b/support/testing/conf/haproxy.cfg
@@ -0,0 +1,13 @@
+defaults
+    timeout connect 10s
+    timeout client 30s
+    timeout server 30s
+
+frontend myfrontend
+  mode http
+  bind :81
+  default_backend web_servers
+
+backend web_servers
+  mode http
+  server s1 localhost:80 check
diff --git a/support/testing/tests/package/test_haproxy.py b/support/testing/tests/package/test_haproxy.py
new file mode 100644
index 0000000000..6fba0c3809
--- /dev/null
+++ b/support/testing/tests/package/test_haproxy.py
@@ -0,0 +1,38 @@
+import os
+
+import infra.basetest
+
+
+class TestHaproxy(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
+        BR2_PACKAGE_HAPROXY=y
+        BR2_PACKAGE_LIGHTTPD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/copy-sample-script-to-target.sh"),
+            infra.filepath("conf/haproxy.cfg")
+        )
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        msg = "Hello Buildroot!"
+
+        # sanity check
+        self.assertRunOk("haproxy -v")
+        self.assertRunOk("haproxy -c -f .")
+
+        # proxy to lighttpd
+        self.assertRunOk("haproxy -D -f .")
+
+        self.assertRunOk(f"echo '{msg}' > /var/www/index.html")
+        self.assertRunOk("wget http://localhost:81/index.html")
+        self.assertRunOk(f"grep -F '{msg}' index.html")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
