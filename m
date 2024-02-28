Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27251C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 11:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E445960E66;
	Wed, 28 Feb 2024 11:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqR6YxQdl0oJ; Wed, 28 Feb 2024 11:49:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A4360E5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25A4360E5E;
	Wed, 28 Feb 2024 11:48:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DEFA1BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 11:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BEDC82090
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 11:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Eabwe8oviQi for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 11:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7941E81CBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7941E81CBA
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 11:48:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6590087B73; Wed, 28 Feb 2024 11:48:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 12:47:20 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: b448305ae61ac2a447d1b1892b0c344c3b9deed7
X-Git-Newrev: 0bb42e170d4247dc097df08b692a72b4410324c4
X-Patchwork-Hint: ignore
Message-Id: <20240228114855.6590087B73@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/refpolicy: move
 patch to version subdir for custom git support
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bb42e170d4247dc097df08b692a72b4410324c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit e88823d667cf0 (package/refpolicy: fix build with smartmontools) added
a 0001-policy-modules-services-smartmon.te-make-fstools-opt.patch patch, but
forgot to put it in the version specific sub directory - Breaking builds
using BR2_PACKAGE_REFPOLICY_CUSTOM_GIT as shown by the TestSELinuxCustomGit
test:

>>> refpolicy RELEASE_2_20200818 Extracting
gzip -d -c /builds/buildroot.org/buildroot/test-dl/refpolicy/refpolicy-RELEASE_2_20200818-br1.tar.gz | tar --strip-components=1 -C /builds/buildroot.org/buildroot/test-output/TestSELinuxCustomGit/build/refpolicy-RELEASE_2_20200818   -xf -
>>> refpolicy RELEASE_2_20200818 Patching

Applying 0001-policy-modules-services-smartmon.te-make-fstools-opt.patch using patch:
patching file policy/modules/services/smartmon.te
Hunk #1 FAILED at 143.
1 out of 1 hunk FAILED -- saving rejects to file policy/modules/services/smartmon.te.rej
make[1]: *** [package/pkg-generic.mk:241: /builds/buildroot.org/buildroot/test-output/TestSELinuxCustomGit/build/refpolicy-RELEASE_2_20200818/.stamp_patched] Error 1

https://gitlab.com/buildroot.org/buildroot/-/jobs/5929796183

Fix it by moving the patch to a versioned sub directory.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bde468127c9d131de380d0dd2849527597ecf5e0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-policy-modules-services-smartmon.te-make-fstools-opt.patch       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch b/package/refpolicy/2.20231002/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
similarity index 100%
rename from package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
rename to package/refpolicy/2.20231002/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
