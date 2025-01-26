Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA36C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 16:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49080410C8;
	Sun, 26 Jan 2025 16:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t1zKMDJryjNU; Sun, 26 Jan 2025 16:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 171FA410D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 171FA410D1;
	Sun, 26 Jan 2025 16:55:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D158941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A7BD40FAD
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VklJ8eYcKrl4 for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 16:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2663D40FA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2663D40FA0
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 16:55:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DEB686506; Sun, 26 Jan 2025 16:55:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 16:46:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0eefe1ce635edd2482e1706afa3fa8646bdfbf0
X-Git-Newrev: d577c0208c7e0d5fbbd985ca2475793db6cf05fd
X-Patchwork-Hint: ignore
Message-Id: <20250126165523.0DEB686506@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_gdb.py:
 fix ARC test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d577c0208c7e0d5fbbd985ca2475793db6cf05fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the disabling of the Synopsys ARC toolchain in
11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8, the test
tests.package.test_gdb.TestGdbArc was failing as it was relying on
this external toolchain.

Let's switch the test to use BR2_archs38, which allows to use a
Bootlin toolchain.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/8892696282

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_gdb.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gdb.py b/support/testing/tests/package/test_gdb.py
index 4712162349..324052efdb 100644
--- a/support/testing/tests/package/test_gdb.py
+++ b/support/testing/tests/package/test_gdb.py
@@ -95,7 +95,7 @@ class TestGdbArc(BaseGdb):
     config = \
         """
         BR2_arcle=y
-        BR2_archs4x_rel31=y
+        BR2_archs38=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_PACKAGE_HOST_GDB=y
         BR2_PACKAGE_GDB=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
