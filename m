Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A23FD3C92D
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 20:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04BC84054D;
	Sat, 19 Oct 2024 20:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWziFN6Khiup; Sat, 19 Oct 2024 20:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 825C940543
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 825C940543;
	Sat, 19 Oct 2024 20:17:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A5BE4961
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C4896065A
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbUCu1hkOsuz for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 20:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7395F6063A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7395F6063A
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:17:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F364860A6; Sat, 19 Oct 2024 20:17:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 22:04:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6ee34a96bb812a164391623f17cc822420fdd482
X-Git-Newrev: ad57e625736bafff04b452b6b87f18e4218b36be
X-Patchwork-Hint: ignore
Message-Id: <20241019201749.6F364860A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] boot/grub2: replace
 host-python3 with BR2_PYTHON3_HOST_DEPENDENCY
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad57e625736bafff04b452b6b87f18e4218b36be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 86bb1b236 "boot/grub2: needs host-python3" [1] introduced a
dependency on host-python3.

Since grub does not have any specific requirements on host Python
modules, or recent host Python version, this commit replaces the
host-python3 dependency with BR2_PYTHON3_HOST_DEPENDENCY. This will
skip the host-python3 compilation if a sufficient version (3.4 or
greater at the time of this commit) is already present on host. This
will save build time.

This optimization was suggested by Peter, in [2].

Note 1: this commit was checked to ensure that grub is building with
Python 3.4.

Note 2: BR2_PYTHON3_HOST_DEPENDENCY was introduced in commit b60729784
"support/dependencies: add a check for python3" [3].

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/86bb1b2360bdaed069cd087541f4edad1d5ce925
[2] https://lists.buildroot.org/pipermail/buildroot/2024-September/763967.html
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/b60729784ab1c2f75dca30f924f4dd3176713ae8

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8a71fda371c1785f9e4364f05ab0a632e1946c53)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/grub2/grub2.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 7c95adc739..4df12774a3 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -9,8 +9,10 @@ GRUB2_SITE = http://ftp.gnu.org/gnu/grub
 GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
-GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-grub2 host-python3
-HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-python3
+GRUB2_DEPENDENCIES = host-bison host-flex host-gawk host-grub2 \
+	$(BR2_PYTHON3_HOST_DEPENDENCY)
+HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk \
+	$(BR2_PYTHON3_HOST_DEPENDENCY)
 GRUB2_INSTALL_IMAGES = YES
 
 # CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
