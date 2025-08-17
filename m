Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FD9CA0EE4
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 16:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC0A418E8;
	Sun, 17 Aug 2025 16:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqT5EptWsekR; Sun, 17 Aug 2025 16:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D2D41481
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93D2D41481;
	Sun, 17 Aug 2025 16:31:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CE2CE2
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 16:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF28843B3
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 16:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrJXKK38aR3e for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 16:31:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9F047843AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F047843AE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F047843AE
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 16:31:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2001:18c0:a22:bf00:5c2b:f296:f108:6612])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 95434780395;
 Sun, 17 Aug 2025 18:31:51 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 17 Aug 2025 18:31:44 +0200
Message-ID: <20250817163144.1217520-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755448314;
 bh=F10QNfv3b830/4J3V4c4BQepmUKYGr2GQaWZ4vqZgJM=;
 h=From:To:Cc:Subject:Date:From;
 b=AxXT57XMF6BDX3BXFIR4t8wZIY9FOPvpQl4MQaKVEb67PjbQsG/gJ0yq9PUynfE3k
 jsVBFQmg4wfbUdzrXNvBdYG0q65xXhvitqDZcIJjWlf7FcNDi/SJD+tkgKUW+8R75I
 0BS8/xZYmlIjy/WNHne3l/jJG0nhuZboaRW9rY+KskTYlkaPyzx5x0AOnfTBYSNcup
 lC7U0cDcax6TT/gUbxrSoW5qGbCRfF9zIV/14hJPryZj4Jw36S+iwTFDH7xVJZ3fhL
 w5fTdW+ux+266LzJvxm3kwYvqVY6Hqx8mC60NkCMT6GfOVtzlZ1LnV9H83BKuPYEOj
 d1QvMwst3ypyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AxXT57XM
Subject: [Buildroot] [PATCH 1/1] support/testing: test_systemd_selinux: fix
 test after bootlin toolchains update
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the tests.init.test_systemd_selinux fails when building its
Kernel 6.1.26 with gcc 15.1.0.

This commit fixes the issue by updating the test Kernel to the
latest 6.1.y version (6.1.148 at the time of this commit) which
includes the fix for gcc-15.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984685949
https://gitlab.com/buildroot.org/buildroot/-/jobs/10984685950

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/init/test_systemd_selinux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index e9bb3405cd..398cfbaa82 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -12,7 +12,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         BR2_INIT_SYSTEMD=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.148"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
