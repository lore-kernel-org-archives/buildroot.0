Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B41CAC594
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E5F884AC5;
	Thu, 11 Sep 2025 19:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe8uFdjtdQQL; Thu, 11 Sep 2025 19:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9259684AD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9259684AD8;
	Thu, 11 Sep 2025 19:01:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3445E20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAEFE41EBA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8dJBZ7t7yXbl for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A0D641EF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A0D641EF6
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67387842A2; Thu, 11 Sep 2025 19:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 18:01:50 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3c67d118820e5cf8f2e6ad4fc2dd74dc8cf223f8
X-Git-Newrev: 6ccaac6f2fbcdfea526a7ca6b123ec2a0f20b6e4
X-Patchwork-Hint: ignore
Message-Id: <20250911190109.67387842A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/micropython: fix
 segfault at exit() with gcc >= 14
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ccaac6f2fbcdfea526a7ca6b123ec2a0f20b6e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the TestMicroPython segfault when testing if micropython can return a
non-zero exit code.

   micropython -c "import sys ; sys.exit(123)"

This issue is related to the gcc version used to build micropython
(gcc 14 or newer). Using gcc 13 (like Bootlin toolchain 2024.05-1
previously used) micropython run without issue.

The issue has been reported upstream [2] and fixed in newer micropython
releases [3]. For now, apply a temporary workaround (suggested in the
bug report) using -DMICROPY_NLR_SETJMP=1 only for gcc 14 or newer.
MICROPY_NLR_SETJMP avoid the architecture specific implementation of
nlr_push.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774762 (TestMicroPython)

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
[2] https://github.com/micropython/micropython/issues/14115
[3] https://github.com/micropython/micropython/commit/35f3f0a87db2580041dd0f7dfd4361df48887796

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 50bc5aa17b320d91809048d5ef6a110f8c0b9157)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/micropython/micropython.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 949abe3b0b..32b361db16 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -29,6 +29,13 @@ ifeq ($(BR2_xtensa),y)
 MICROPYTHON_CFLAGS = -DMICROPY_NLR_SETJMP=1
 endif
 
+# https://github.com/micropython/micropython/issues/14115
+# Temporary fix for GCC 14 compatibility, should be removed after updating to
+# 1.23.0 or later.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_14),y)
+MICROPYTHON_CFLAGS += -DMICROPY_NLR_SETJMP=1
+endif
+
 # When building from a tarball we don't have some of the dependencies that are in
 # the git repository as submodules
 MICROPYTHON_MAKE_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
