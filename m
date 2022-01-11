Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291B4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C83B882521;
	Tue, 11 Jan 2022 21:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tPj7VVTwmRSn; Tue, 11 Jan 2022 21:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26BC9824B4;
	Tue, 11 Jan 2022 21:22:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24C1A1BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 211EC824B4
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gQ_sCb9XHWA for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:22:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F9618249E
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:22:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 898B782DEC; Tue, 11 Jan 2022 21:16:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 22:22:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 350bddf7efa17f5cc67023d2f4537b7f6d65fb41
X-Git-Newrev: c60df47735e2bfc91f7dbaf5642fc82744feeb86
X-Patchwork-Hint: ignore
Message-Id: <20220111211601.898B782DEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/git: add xdg SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=c60df47735e2bfc91f7dbaf5642fc82744feeb86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xdg SELinux module is needed to avoid the following build failure raised
since bump of refpolicy to version 2.20220106 in commit
f6691d122ce25fc580ca88243f79f75cc2808ca7 and
https://github.com/SELinuxProject/refpolicy/commit/64e637d895c516d7a6b6cbcd46b187136279fddd:

 policy/modules/services/git.te:121:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 115358:
 	typeattribute git_xdg_config_t xdg_config_type;
 #line 121
 checkpolicy:  error(s) encountered while parsing configuration
 Rules.monolithic:78: recipe for target 'policy.30' failed

Fixes:
 - http://autobuild.buildroot.org/results/98d5b3db313000855721c0ad994951fe8cc781c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 556921a9fc..90b1acd6a4 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -10,7 +10,7 @@ GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_CPE_ID_VENDOR = git-scm
-GIT_SELINUX_MODULES = apache git
+GIT_SELINUX_MODULES = apache git xdg
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 # We're patching configure.ac
 GIT_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
