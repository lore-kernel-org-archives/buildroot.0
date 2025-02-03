Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D960DC02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 11:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FBD64155C;
	Mon,  3 Feb 2025 11:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrFer81Eq6iE; Mon,  3 Feb 2025 11:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F7940301
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F7940301;
	Mon,  3 Feb 2025 11:44:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20AAC185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0333B40195
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZAsrSYYtdW3 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 11:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2DF540258
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2DF540258
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:44:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1A6C7FC47; Mon,  3 Feb 2025 11:44:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 12:43:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab0aac817936b53c613dc77907dd04480a9d0896
X-Git-Newrev: 38e63800f6a33d7294fe8b2573432062f11c6537
X-Patchwork-Hint: ignore
Message-Id: <20250203114421.E1A6C7FC47@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: select host Python 3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=38e63800f6a33d7294fe8b2573432062f11c6537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building Python for the target requires host Python via
PYTHON3_DEPENDENCIES. Host Python is exposed as a standalone Kconfig
option, so when BR2_PACKAGE_PYTHON3=y, it is possible for host Python to
be built even when BR2_PACKAGE_HOST_PYTHON3=n. Normally this is OK for
host packages. However, host-python3 has a number of sub-options, which
sometimes need to be selected by a package. In that case, that
particular package has to add the `select BR2_PACKAGE_HOST_PYTHON3`
while it doesn't have a direct dependency on host-python3.

Add `select BR2_PACKAGE_HOST_PYTHON3' to python3 itself.

Signed-off-by: Liam Hupfer <lhupfer@xes-inc.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 38f0580aa4..cfc08bad86 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_PYTHON3
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_HOST_PYTHON3
 	help
 	  The python language interpreter.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
