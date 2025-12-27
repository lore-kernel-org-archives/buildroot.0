Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B941E8FDCD
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFDFC607BB;
	Sat, 27 Dec 2025 15:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfKD7-2kGsb7; Sat, 27 Dec 2025 15:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A515606CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766850903;
	bh=rf9k9CD/8yaDcU1us+BiC7WjubdT0mS0Z00qxSYYxLs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SFx0QHcJxNeuTBw3JXUWWwDKwJ+o8+iT44qN2c6/bQei5lewP3maD/xN51AgRTItN
	 XPLcELIrBbBcskB/8h5syAfw9asV3FP1oxq8Q1v3Q/zEP7jol3EdH5Tkw9Dy5fyG7o
	 ViOm5PXzzxJAB/P3enw1VvofIcUVHb9R2z28snkfcszk6wZbA2hMr+aYO8KBpUqpDM
	 /iAJ4LXE45qBchJsmgTED/tyES7k4FiWqS9p+3Ir1vKxQ85SZsxN1LOr3mpPRFz338
	 lzOY+0b9AIlzBa6gRKrDNKsbvDB0sVSllgIacmSakrEkfKXK2ouEqGzlP4PhNvFnJd
	 ThEQVmNh7HUcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A515606CC;
	Sat, 27 Dec 2025 15:55:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF5E3D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A67DD40298
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrmQakQlR_P4 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:55:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C890C4027F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C890C4027F
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:55:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6B41877A6; Sat, 27 Dec 2025 15:55:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 16:54:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 193df1cbec8b4e18b998494a7dc05c2a06445036
X-Git-Newrev: 61966c213322b192a62cc19200902934f9f432d7
X-Patchwork-Hint: ignore
Message-Id: <20251227155500.C6B41877A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add libiio python
 bindings runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=61966c213322b192a62cc19200902934f9f432d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../testing/tests/package/sample_libiio_bindings_python.py  |  3 +++
 .../testing/tests/package/test_libiio_bindings_python.py    | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/support/testing/tests/package/sample_libiio_bindings_python.py b/support/testing/tests/package/sample_libiio_bindings_python.py
new file mode 100644
index 0000000000..74452192c2
--- /dev/null
+++ b/support/testing/tests/package/sample_libiio_bindings_python.py
@@ -0,0 +1,3 @@
+import iio
+
+assert len(iio.scan_contexts()) == 1
diff --git a/support/testing/tests/package/test_libiio_bindings_python.py b/support/testing/tests/package/test_libiio_bindings_python.py
new file mode 100644
index 0000000000..e8cf5c3d13
--- /dev/null
+++ b/support/testing/tests/package/test_libiio_bindings_python.py
@@ -0,0 +1,13 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestLibiioBindingsPython(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_LIBIIO=y
+        BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON=y
+        """
+    sample_scripts = ["tests/package/sample_libiio_bindings_python.py"]
+    timeout = 10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
