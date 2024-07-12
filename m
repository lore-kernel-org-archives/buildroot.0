Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1244DC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 18:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E2BE613DF;
	Fri, 12 Jul 2024 18:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lITHscozknZi; Fri, 12 Jul 2024 18:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A1D613E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A1D613E8;
	Fri, 12 Jul 2024 18:31:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DFDC1BF4D5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3647F40487
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 18:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDoQKzi_NMfH for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 18:31:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 253B940003
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 253B940003
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 18:31:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C75886140; Fri, 12 Jul 2024 18:31:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 20:30:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d57555407f2a0708515e7c377f57a6466c78b1b
X-Git-Newrev: cca315f814888025daa80fc320610117a6f69007
X-Patchwork-Hint: ignore
Message-Id: <20240712183131.0C75886140@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: fix check for
 <pkg>_REDISTRIBUTE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cca315f814888025daa80fc320610117a6f69007
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "8e87d76c12 check-package: check *.mk files" added a typo that
prevents check-package from checking <PKG>_REDISTRIBUTE default value.

Fix the typo: _INSTALL_REDISTRIBUTE -> _REDISTRIBUTE

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/checkpackagelib/lib_mk.py      | 2 +-
 utils/checkpackagelib/test_lib_mk.py | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index ce2ab5157c..4d97571f50 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -324,7 +324,7 @@ class UselessFlag(_CheckFunction):
         r"_LIBTOOL_PATCH\s*=\s*YES"])))
     DEFAULT_GENERIC_FLAG = re.compile(r"^.*{}".format("|".join([
         r"_INSTALL_IMAGES\s*=\s*NO",
-        r"_INSTALL_REDISTRIBUTE\s*=\s*YES",
+        r"_REDISTRIBUTE\s*=\s*YES",
         r"_INSTALL_STAGING\s*=\s*NO",
         r"_INSTALL_TARGET\s*=\s*YES"])))
     END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 2086237ebb..11fecdd5cf 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -602,13 +602,13 @@ UselessFlag = [
     ('generic',
      'any.mk',
      'ANY_INSTALL_IMAGES = NO\n'
-     'ANY_INSTALL_REDISTRIBUTE = YES\n'
+     'ANY_REDISTRIBUTE = YES\n'
      'ANY_INSTALL_STAGING = NO\n'
      'ANY_INSTALL_TARGET = YES\n',
      [['any.mk:1: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
        'ANY_INSTALL_IMAGES = NO\n'],
       ['any.mk:2: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
-       'ANY_INSTALL_REDISTRIBUTE = YES\n'],
+       'ANY_REDISTRIBUTE = YES\n'],
       ['any.mk:3: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
        'ANY_INSTALL_STAGING = NO\n'],
       ['any.mk:4: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
@@ -618,9 +618,9 @@ UselessFlag = [
      'ifneq (condition)\n'
      'ANY_INSTALL_IMAGES = NO\n'
      'endif\n'
-     'ANY_INSTALL_REDISTRIBUTE = YES\n',
+     'ANY_REDISTRIBUTE = YES\n',
      [['any.mk:4: useless default value (url#_infrastructure_for_packages_with_specific_build_systems)',
-       'ANY_INSTALL_REDISTRIBUTE = YES\n']]),
+       'ANY_REDISTRIBUTE = YES\n']]),
     ]
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
