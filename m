Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9F9C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67ADA60EDD;
	Sat, 13 Jan 2024 20:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67ADA60EDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unFtdgkZOjlT; Sat, 13 Jan 2024 20:35:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C448660F1D;
	Sat, 13 Jan 2024 20:35:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C448660F1D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82A591BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26DB683B56
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26DB683B56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o9FsWgaGExgs for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:33:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E811C83B41
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E811C83B41
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5CB986062; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:20:38 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 4d45256263f1232ea5e75d6826041e2fe71c9d50
X-Git-Newrev: 26509bc06e1efc8fa1e300ccb6f89054492c516d
X-Patchwork-Hint: ignore
Message-Id: <20240113203307.E5CB986062@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/udev: move back
 sgx group from systemd
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

commit: https://git.buildroot.net/buildroot/commit/?id=26509bc06e1efc8fa1e300ccb6f89054492c516d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 6d163e12a4784580 (package/udev: move render and sgx to
package/systemd) moved the sgx group creation to the systemd package because
eudev at that time did not reference it.  This changed in eudev 3.1.12 with
commit a8ffcd1b985fb4 (rules/50-udev-default.rules: fix issue 160) so move
it back to get rid of a warning from udevd:

udevd[303]: specified group 'sgx' unknown

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit edfa9ea45ce3c2ddad2c52ab57a8047f4257c76f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 1 -
 package/udev/udev.mk       | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ccc0e14874..55d30eec62 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -639,7 +639,6 @@ endef
 define SYSTEMD_USERS
 	# udev user groups
 	- - render -1 * - - - DRI rendering nodes
-	- - sgx -1 * - - - SGX device nodes
 	# systemd user groups
 	- - systemd-journal -1 * - - - Journal
 	$(SYSTEMD_REMOTE_USER)
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index d70d13ebb3..21c1a71f5a 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -8,6 +8,7 @@
 define UDEV_USERS
 	- - input -1 * - - - Input device group
 	- - kvm -1 * - - - kvm nodes
+	- - sgx -1 * - - - SGX device nodes
 endef
 
 $(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
