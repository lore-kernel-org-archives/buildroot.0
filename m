Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD45AE7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 15:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C7C8048E;
	Fri, 27 Dec 2024 15:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9x_K5rdYqDtC; Fri, 27 Dec 2024 15:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C8680DAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C8680DAF;
	Fri, 27 Dec 2024 15:55:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFB8AE0
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 15:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95662402C2
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 15:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgQW1IMzaLM0 for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 15:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55AD6402BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55AD6402BE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55AD6402BE
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 15:55:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 23B76B005A2;
 Fri, 27 Dec 2024 16:55:19 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 27 Dec 2024 16:55:14 +0100
Message-ID: <20241227155514.2013640-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735314920;
 bh=fBNyFqFBTzUTqp1R3IajhAssxuUaCXOKMrvV1z+JOeo=;
 h=From:To:Cc:Subject:Date:From;
 b=V5K+bTpDc2ERy1yAbVTp0XKmTGC0yJu1iz6NzbVcs8IskoRGxgA/gM4DG0QB5qv3e
 LdvtBHPmSyR1D1ACKe1ClFnOBKEE/weQUL97Em1+Cal2ZxPmYz8yaXTv+4yPRJBIz/
 ykNUSJY3Jhlcegib8uE3PV8eYc7013sEJPX5PS/OkhuMlnY0Uhi1RgzS3z9+ufZeWu
 0u9mK4P392YguAzuw2x8CUzBIvjOVeoNBWWwGBFOC+Tc5pcFRPlcnDJelDJVkaCgtb
 GmZ11+xALyAHnqStDtweuuNKZ9NglNaWraV2T55FiqFYD9LPIke6HslA7x4ifM+iYO
 km83t9y9KQ8gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V5K+bTpD
Subject: [Buildroot] [PATCH 1/1] support/testing: increase test_python_boto3
 timeout
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

After python-boto3 bump in commit [1], the test_python_boto3 runtime
test can fail due to timeout on slow runners. This commit fixes the
issue by increasing the timeout value.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/7653f066e2b000b55549f53dd56dc377b375be1e

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8731967177
---
 support/testing/tests/package/test_python_boto3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_boto3.py b/support/testing/tests/package/test_python_boto3.py
index 02a1f69d40..865305411a 100644
--- a/support/testing/tests/package/test_python_boto3.py
+++ b/support/testing/tests/package/test_python_boto3.py
@@ -12,7 +12,7 @@ class TestPythonPy3Boto3(TestPythonPackageBase):
         BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
         """
     sample_scripts = ["tests/package/sample_python_boto3.py"]
-    timeout = 10
+    timeout = 30
 
     def login(self):
         ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
