Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB62C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A8DB84DB6;
	Fri, 26 Jan 2024 08:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A8DB84DB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XLQ2XOMZsr_x; Fri, 26 Jan 2024 08:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A76684D93;
	Fri, 26 Jan 2024 08:30:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A76684D93
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 526031BF420
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BE7D45223
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BE7D45223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xENniqUcz9LL for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:29:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 488F044F3E
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 488F044F3E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DE2E864EE; Fri, 26 Jan 2024 08:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 09:26:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed7335d256f0327666168416b6278cfa4811faed
X-Git-Newrev: bde468127c9d131de380d0dd2849527597ecf5e0
X-Patchwork-Hint: ignore
Message-Id: <20240126082958.2DE2E864EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: move patch to version
 subdir for custom git support
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

commit: https://git.buildroot.net/buildroot/commit/?id=bde468127c9d131de380d0dd2849527597ecf5e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
