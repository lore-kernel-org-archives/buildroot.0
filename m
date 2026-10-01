Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3EACA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E804881220;
	Thu,  1 Oct 2026 16:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0SVJBBfrVwz; Thu,  1 Oct 2026 16:55:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 05AB08118B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873712;
	b=boHZ8x41QIES7fU0n4VVK9O/Oi8MKcl+/YOa/ZsR8SYM+3+dchjKwU0YkxDyLuMrV4FT
	 tuWqKxQfM4jLT8W+pWtVFBhINaC7sYWbTRtcjK1KnPr5aCSnE3O9jqimDk+BFAtF2/LEB
	 2VsLRS0ELaP/PeaxNT5/hqy6YB8aswaJUim/sI980gHKZFtoiVwhs526ZUgznUuzddp0H
	 KRqWLuIgLfyfBuPxZPFhsF/buiz9hmrPn/jdUMLuRw4llJJ6id0ACvssDLB4HoMHJ2JWk
	 MTlKk3RFKPXwf21RDK5v2EZZLyz98+jabEMAoB61U6TIVsnDW52kcYmJmaorB7IefHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873712;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EaLJxMhiAgHuTtFkWdg4rA5EPdoSGAqOpki+f5Rx39U=;
	b=TYwRKL9McpcVrNvMdFXJ1GBN4NznYzahFgg2ghUML5sa8TzK9Ejo91GYG6JNBLL8IcLY
	 9PRfrWOtDSb8xGaoTLQRTOpfnYufEiuc0JJDMSbCT8aIkK1zDsvXYLqseas3fTn5VkaRx
	 +ReUYe/6wJibN3Ire5TZoIxhMG3d2tU8KS+csSzifsw4gljrm68Tu8U+CK5YchyErYvpB
	 x+9jSKCS72fbZOZ01dGUm0moO0l28sLleeyM9xE0CWwR2BgqgFkXBXo63cqR7OduPk35B
	 QFosfWJWB3qqxKWeiVu0BG7OIUC8K5vFaeZjVGds5fG524BumzIbrPsK/ETLQGgWZNg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873712;
	bh=EaLJxMhiAgHuTtFkWdg4rA5EPdoSGAqOpki+f5Rx39U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N0wSxF01q1JGp1/RNcuCvg8CxSiHsuiO+oHLUlHplkbQ2kKJZ5pIIehK/i96twIsK
	 CzYEI1aCfiwNKtGHhgatMDV5QHGIJZUW2rOdtta4L1iWyIMaHAHmMBVXUYXYRcGQmu
	 +oNEI/Fy9eZrHIhNaaUR7wEUWufGVfPVY4eiSJIQ9TU6T5QGXjgCvUE8VY/DNv2YlP
	 CLdCK05L5tWy4Y0SqoX/ak5HONuFV4qjqynOviIDB+ehMiYI0uFVzp/sZ3sKaLkS9Q
	 M9YEllD903ULnxQXGb7j3z2P0Pd9HIoWvLEO/jlWhCYNDNhJr5lztgc+yIR8sdNtKo
	 dI+W0ZXxJiPRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05AB08118B;
	Thu,  1 Oct 2026 16:55:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 819AC32A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F2B68118B
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KosaIZ3t3jkd for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:55:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DEBA68117F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873709;
 b=qRasA6wa/+jHzUZW0PHg3MOTNYO2/DEEBe0rJfxHWfxrGnj2iKO9wXSxJfhH9R1ImQFe
 dvvIfT8gr2d3cZgdEVlpAldmVEydhwZOhSTelU08s8r7zeAuGhS3zRGGoOzGPStV4VgkC
 FzqK7Lwe3fiBbg1yfX6QrCy96sd/AHC6Ev7n29wGSOtxPAa4Zcnsq8gXBzZjHvIJV4kuw
 g01vqZsfi3oLtn/NHFtp3XI+FG8ipXS6V/6fqwanu+GNgV2FLbHaZP20yWPKW5Bpeo6nZ
 ifueStr7woOZdfXI55hnqrAc8cB5/2Bycjs+sbOgg5aJcn5KmbLHyhe+c8QZh0vym2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873709;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CrKIYa9eG4iS7NxhZt+1ewG1e9rlGelJyvp5leipPGw=;
 b=Pwh90+LWRZIXR5sg1z2AqbbpyFP2srhSUF5sscEKCC5Zmspb1ZQWsnnu1G62bg4ItCmw
 bsQs87+Z8aA8G2jyeRMZva8DZH2KAtXg7CHqy3KyIN+CDdm37Ak+VA3uho9vK7rZb/EsP
 73CNGHG9pXRSWD9k+wV3GvOKp2L0XybEJz+589rzNYU4WQqZVm22r2g+GqWDoo1EOFsX/
 ZZfTUqhcEplQDCE+0AKPUi56LhCSfQFVoMtau+vQSe9+6rdFo4onoUkPQOYRmm3886pNF
 dLSB8Aaanj9ci9KT5worrE7tKne62xj5AVm/M1E9e+MBjAewh8sfXrt+GvGZkSRf8AA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEBA68117F
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17F447FA57; Thu,  1 Oct 2026 16:53:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Oct 2026 18:53:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 850e5de7ea327ad8abc1258e0b0fa9a5c4054a17
X-Git-Newrev: 7fccf3a91eee92f084f1d453647c0bc7b4fc5c2f
X-Patchwork-Hint: ignore
Message-Id: <20261001165356.17F447FA57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: harfbuzz: new runtime test
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
Content-Type: multipart/mixed; boundary="===============6781518354604168816=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6781518354604168816==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fccf3a91eee92f084f1d453647c0bc7b4fc5c2f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                     |  1 +
 support/testing/tests/package/test_harfbuzz.py | 33 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d62bfaafb3..7fa97fb36d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2861,6 +2861,7 @@ F:	support/testing/tests/package/sample_python_s3transfer.py
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

--===============6781518354604168816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6781518354604168816==--
