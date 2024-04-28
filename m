Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30737C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 12:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F34760669;
	Sun, 28 Apr 2024 12:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HccDwr3G4-lX; Sun, 28 Apr 2024 12:12:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3235760621
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3235760621;
	Sun, 28 Apr 2024 12:12:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BADA1BF399
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 12:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4877960621
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 12:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXFY_0f89g10 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 12:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F50C605F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F50C605F1
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 12:12:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6239786127; Sun, 28 Apr 2024 12:12:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 14:11:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a2ce536193d828f023b7315263143d2aa119a87d
X-Git-Newrev: 39643530f54e8ef0b7dc685b5a2259bf5935df63
X-Patchwork-Hint: ignore
Message-Id: <20240428121230.6239786127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/check-package:
 don't ignore check-package
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

commit: https://git.buildroot.net/buildroot/commit/?id=39643530f54e8ef0b7dc685b5a2259bf5935df63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 32934b526b64 (utils/checkpackagelib: check for Upstream trailers)
introduced a new python module to check Upstream tags in patch files. In
doing so, it introduced a flake8 coding style issue. That was not caught
when applying the change, and neither was it caught by our daily checks,
because the .checkpackagefile was regenerated right just in the next
commit, to apply ignore patterns to existing patch files.

It is a bit sad that one of our checks does not itself passes all our
checks...

Fix that trivial issue now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 81bb14a93535da0fbf02ca715ac9ebdca3486732)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                | 1 -
 utils/checkpackagelib/lib_patch.py | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e678d64498..829fd7d0f1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1471,4 +1471,3 @@ support/scripts/setlocalversion Shellcheck
 support/testing/tests/core/post-build.sh Shellcheck
 support/testing/tests/package/test_opkg/post-build.sh Shellcheck
 support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch NumberedSubject Upstream
-utils/checkpackagelib/lib_patch.py Flake8
diff --git a/utils/checkpackagelib/lib_patch.py b/utils/checkpackagelib/lib_patch.py
index 1909d3acd0..b01d28a7e7 100644
--- a/utils/checkpackagelib/lib_patch.py
+++ b/utils/checkpackagelib/lib_patch.py
@@ -62,6 +62,7 @@ class Sob(_CheckFunction):
                     "({}#_format_and_licensing_of_the_package_patches)"
                     .format(self.filename, self.url_to_manual)]
 
+
 class Upstream(_CheckFunction):
     UPSTREAM_ENTRY = re.compile(r"^Upstream: .*$")
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
