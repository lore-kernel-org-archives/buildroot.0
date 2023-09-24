Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FE3CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 16:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B33A41752;
	Sun, 24 Sep 2023 16:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B33A41752
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FRVnpE67vjYj; Sun, 24 Sep 2023 16:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24E134175C;
	Sun, 24 Sep 2023 16:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24E134175C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D95D1BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06E2041600
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06E2041600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BSanrsLL2Ace for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 16:07:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E514A41775
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 16:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E514A41775
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2E19875A9; Sun, 24 Sep 2023 16:07:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 17:58:23 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 25d59c073ac355d5b499a9db5318fb4dc14ad56c
X-Git-Newrev: 1eafba40a2e5ff09853f1bb99e301c7112505d37
X-Patchwork-Hint: ignore
Message-Id: <20230924160736.D2E19875A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] support/download:
 generate even more reproducible tarballs
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

commit: https://git.buildroot.net/buildroot/commit/?id=1eafba40a2e5ff09853f1bb99e301c7112505d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

When we generate the taballs off a local working copy of a VCS tree,
the umask is the one that we enforce in out top-level Makefile.

However, it is possible that a user manually tinkers in said working
copy (e.g. to check an upstream bug fix, or regression). If the user
umask is different from the one Buildroot enfirces, such tinkering
can impact the mode bits of the files, even if their content is not
modified.

When we eventually need to create a tarball from said working copy,
the VCS (e.g. git) will only be interested in checking whether the
content of the files have changed before chcking them out, and will
not look at, and restore/fix the mode bits.

As a consequence, we may create non-reproducible archives.

We fix that by enforcing the mode bits on the files before we create
the tarball: we disable the write and execute bits, and only set the
execute bit if the user execute bit is set.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 768f9f80f62c1da6e298c680f0f4bfa887f38c78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/helpers | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/download/helpers b/support/download/helpers
index 90a7d6c1ec..265685eff5 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -53,6 +53,9 @@ mk_tar_gz() {
     tmp="$(mktemp --tmpdir="$(pwd)")"
     pushd "${in_dir}" >/dev/null
 
+    # Enforce group/others mode bits
+    chmod -R go-wx+X .
+
     # Establish list
     find . -not -type d -and -not \( -false "${find_opts[@]}" \) >"${tmp}.list"
     # Sort list for reproducibility
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
