Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF2ECA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E03D660A59;
	Sat, 10 Oct 2026 09:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7x5qdzJs44Cw; Sat, 10 Oct 2026 09:27:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8324D60AEF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624460;
	b=MEd7osrcbKPzfvocvE8Ya1ACu1WwaxQftFz/CTsqVu7gweLnUk/ZvbJuLYVM3BhDSyfS
	 t6XIOK5KC7eJndoWTTJfWjWhVtssUZz/hOC1qyKgjklcFReU51uzifiD3xARoyGf1wFPv
	 7VC0LE7dM+r/Z5hepfANKReKK7KDjwGc7Q7MhJ0sHS0yB/gXlxcvhzu9u0HPC3ds6aewo
	 aQMk4YlKY6dG5G0NxxErLXp/BbZV3cVq5nRfYu9TmAjlxYybMNgGKat/WE7wP5P+jgZy+
	 wje/AYlRbddiXLxE/iZhgNFJ75vfPH+jkBVVKWLPny/3Dj12MXUa4xv1Y7t0vmRb7CQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624460;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=dtYtEDsBsu00AkkOLQw7sRaoQdg77wWyGS+DeQ8njX8=;
	b=Ex+q5cJUdCGziBxB/KSUviYTdgp2u82YJDZr1AnXZdzmr3y+uZBGEFaTDdtqUbyJObNS
	 A54HjqU/acTmSq3MLbJYd+dhz/SXxLgeZVc0mlIbAphtU8a+Sos4dNktUwqC/GYJnhvT9
	 UsKvZE0d8OolXE9HWzy5/CvWdbInfFr6UASzgIhnHm2649B2xtCQDcZajzO0p4IZZMkdL
	 peb/dht4D7ZdTms+w7ZQR3GoSrok+CyYUXU637x83wA/dzg6ZyAc+u04Y7uo3yvu8m7oZ
	 a/FdRq4ZhHVXsyhDN85fksIoF1bkOQsgMELM3pwIXyJo+y5nDA7jppRZK1oPrBOmMug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624460;
	bh=dtYtEDsBsu00AkkOLQw7sRaoQdg77wWyGS+DeQ8njX8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tfwd1R7kHBGp4CidmVmoqyiTZBRhHdbHmxR5gunOeLIhuQfdC6n++lmdxLLPIYmHm
	 FWNRdCmniAaLkFtY7ipd6E3wqmUaBfykcCVIrKp3mZ/ZL0cguaiOmIL6Qzuj6hQKz9
	 5t5YXePKLbRW6p8Ly9nbcRmBrCSSb2uFCz6Giqf5laWPbxikbKhY+kRxjM7ORWGTyw
	 7wKrwdRmmAhBRPDfCF0yYId5sySkcl6fbDuMnfXKo+mbCFR9HzRdZgQ04CW4gHbYnV
	 znRW5/a2wC4NW+axRyLtt0jF2KwdIhZEhToDak7eKo+31oEz/KkGN2OUQ06sNNO9Pd
	 Yys4KcvD5zxvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8324D60AEF;
	Sat, 10 Oct 2026 09:27:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F384DE1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33FE3811F1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUuFXTtaXTOx for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7AA4381166
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624441;
 b=oLwZxC1+72teOl6iV8f4Bx96H5rvTTzmwH5krcZM451dTaCu7TO/E/RwVO1Ca4dDUMqD
 jsIWB9Pw+JNm5PcsPzDlscyPMxf0VJf8xzLEad4rVdLsKYGri1yWbmqNy+g6b1SeFI8FF
 zNaSdNOIs6CaUjdhPRzJ4bzAPVRXWz1HbKOLWu1GqEQHfufSeY5tFdPUtKUHnmqbkB2Hz
 XGa0biACYlCBS/wer2Y++bt/PnB1k+TM8axLEaxms0f+d/b2z50hvSq7krquoWizJFX0b
 nbbzpj/qZt3sZSgbNvCjaqY8b047KRpFo/eVY3ageNPYYVLvm8c96dsjOZprVqg9wtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624441;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Bpx0JULau3DdcKyC+LIoWoI/T/qEczSmbr3IybLmh0E=;
 b=VdBIFdYi8pxu064jLzPWjNioVCUgk4A8AvX0KShMzKWMrXcP59WVNoh+mLd72Ho202kb
 DIhO8sC+RnqaGUaOn4k3Ua/b/XdRM5ZME+nKq0kBURlkaDo30ZCQNJCsr1vnwDLvw/vQO
 utjg6hfpTwgKQ67GRJFGAq2xkexsucCEcdUun/Skq5uZ3NNvcb70uZpiPFzCOhXQ3vAWi
 00/RiD7wiIac3vddx1db0kThWKbTpQK9I0r8q+4MIkWz0nc5OVw/LQIDus7MbCBF0n67+
 WgzngXfAsZLv4QsZHBhvNB9oClRT7Fn2VC6W9oWoRECiSz2oXyCETC4c2vhz7z09jMw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AA4381166
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 643368F1BD; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:01:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f07a7086dc0249fa9e36183eb913be2552f55552
X-Git-Newrev: 11e72b07674268188fda614923b1bb43add80c45
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.643368F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
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
Content-Type: multipart/mixed; boundary="===============2519565817508051877=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2519565817508051877==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11e72b07674268188fda614923b1bb43add80c45
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7fccf3a91eee92f084f1d453647c0bc7b4fc5c2f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_harfbuzz.py | 33 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 29acec54ad..7d24722f58 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2730,6 +2730,7 @@ F:	support/testing/tests/package/sample_python_s3transfer.py
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

--===============2519565817508051877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2519565817508051877==--
