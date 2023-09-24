Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1684CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 16:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76A65417DC;
	Sun, 24 Sep 2023 16:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A65417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IogUx9xdM3y; Sun, 24 Sep 2023 16:08:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B40841776;
	Sun, 24 Sep 2023 16:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B40841776
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4F391BF3BB
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F07660759
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F07660759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGiQRdUKialh for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 16:07:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EE1560739
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 16:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EE1560739
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D204875A9; Sun, 24 Sep 2023 16:07:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 17:58:30 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d214ce779b3285cd28dce89a5cc0deaf3b94ce24
X-Git-Newrev: d3c18718c1b44bfbffc85a56ec71fd86d56796c8
X-Patchwork-Hint: ignore
Message-Id: <20230924160736.4D204875A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] support/download:
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3c18718c1b44bfbffc85a56ec71fd86d56796c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
