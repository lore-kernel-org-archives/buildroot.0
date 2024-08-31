Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B10CD13D9
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 21:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39AE560753;
	Sat, 31 Aug 2024 21:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXMmLB9QyP2n; Sat, 31 Aug 2024 21:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2345C6078D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2345C6078D;
	Sat, 31 Aug 2024 21:51:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD1EF1BF588
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D732B4199F
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 21:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nlTTOqRztElB for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 21:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98907419A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98907419A0
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 21:50:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8644386878; Sat, 31 Aug 2024 21:50:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 23:47:30 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 96e0b1bd7a66fdad061bcb5bbf74d4f7389f76f3
X-Git-Newrev: 56393a6a44481d2f9c1fa0a18de0fc1f2f07c1a9
X-Patchwork-Hint: ignore
Message-Id: <20240831215057.8644386878@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/tinyssh: fix
 static-only build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=56393a6a44481d2f9c1fa0a18de0fc1f2f07c1a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

When using BR2_STATIC_LIBS=y, tinysshd's build was successful, but the
binary didn't work on the final target: this is because a dynamically
linked ELF was produced, on a target having no dynamic loader at all.

Using $(TARGET_CONFIGURE_OPTS) propagates all the options and not only
"CC", resulting in a correct static binary able to run on the target.

Without the patch:

> tinysshd: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
> dynamically linked, interpreter /lib/ld-musl-armhf.so.1, stripped

With the patch:

> tinysshd: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV),
> statically linked, stripped

Fixes: a7b3de8a3b1b446c081593192c3acb847f6f5f05
Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 90e22ff48bb5705c146a64b75556157667b551d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyssh/tinyssh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
index 80b6ccb850..e92ac628f2 100644
--- a/package/tinyssh/tinyssh.mk
+++ b/package/tinyssh/tinyssh.mk
@@ -10,7 +10,7 @@ TINYSSH_LICENSE = CC0-1.0
 TINYSSH_LICENSE_FILES = LICENCE
 
 define TINYSSH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) CC="$(TARGET_CC)" $(MAKE) -C $(@D) cross-compile
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) cross-compile
 endef
 
 define TINYSSH_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
