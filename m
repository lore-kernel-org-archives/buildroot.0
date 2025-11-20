Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F1CF9C72
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 17:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 539CE84659;
	Thu, 20 Nov 2025 17:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rniEJBFTDnvx; Thu, 20 Nov 2025 17:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DB2B843D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB2B843D9;
	Thu, 20 Nov 2025 17:05:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CEA8158
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 17:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D275410A5
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 17:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPXueTjszwIS for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 17:05:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3929A402BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3929A402BC
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 17:05:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 272E285BF9; Thu, 20 Nov 2025 17:05:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 20 Nov 2025 17:01:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb004ddba26ea86687d917fa16d313ea92aff41c
X-Git-Newrev: 903c0db86e17fc49d5980425fcefd72bcd9ada6b
X-Patchwork-Hint: ignore
Message-Id: <20251120170540.272E285BF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-scp: fix dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=903c0db86e17fc49d5980425fcefd72bcd9ada6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 3963c3c06e3a4161e0ebb570db80ab0b297c9a6a added this
package which selects python-paramiko but forgot to add its dependency.

Fixes warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PARAMIKO
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_SCP [=y] && BR2_PACKAGE_PYTHON3 [=y]

seen with https://autobuild.buildroot.net/results/423/4235283218bc49f53bf7cafd4a67f380dba659c0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-scp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-scp/Config.in b/package/python-scp/Config.in
index 1db0e910f4..28a649e406 100644
--- a/package/python-scp/Config.in
+++ b/package/python-scp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_SCP
 	bool "python-scp"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko -> python-cryptography, python-bcrypt
 	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 	help
 	  scp module for paramiko.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
