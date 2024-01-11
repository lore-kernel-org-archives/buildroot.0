Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D3EC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 11:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D30044287E;
	Thu, 11 Jan 2024 11:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D30044287E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvYwwpTqZs1P; Thu, 11 Jan 2024 11:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D89D14287F;
	Thu, 11 Jan 2024 11:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D89D14287F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED78D1BF983
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C680083EF7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C680083EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cskewm_hmUTR for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 11:40:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E850F83EFC
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 11:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E850F83EFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D32AF85E8D; Thu, 11 Jan 2024 11:40:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 12:00:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edfa9ea45ce3c2ddad2c52ab57a8047f4257c76f
X-Git-Newrev: 9fbd3d85745fdf32dac06355e9c524270ae034bb
X-Patchwork-Hint: ignore
Message-Id: <20240111114057.D32AF85E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "support/download: generate even
 more reproducible tarballs"
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
Content-Type: multipart/mixed; boundary="===============0407214235741896994=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0407214235741896994==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9fbd3d85745fdf32dac06355e9c524270ae034bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 768f9f80f62c (support/download: generate even more reproducible
tarballs) causes non-reproducibility in tarballs we previousy
generated, especially the archives for two cargo-vendored packages,
ripgrep and sentry-cli.

The cause is that those two pakcages eventually vendor a file that has
the u+x bit set, but is otehrwise go-x. With 768f9f80f62c, the files are
now go+x, so the hash for those generated archives has changed.

Besides, that commit was wrong: it did not account for the 'r' bit for
go part, leaving some non-reproducibility still unaccounted for.

So, to generate really reproducible archives, we would need to fix that
read bit as well, and that has the potential to affect all the archives
we generated so far. If we wanted to do so, we'd need a way to version
all generated archives, like we do for git and svn, but now for all the
different CVSes, as well as for all the vendoring post-processes.

For 768f9f80f62c, all that was of conern was the working copies of CVSes
(i.e. git, svn, cvs...) that we cache in the Buildroot download dir, not
the temporary files during post-processing. Indeed, in that latter case,
the user has virtually no way to mangle with the mode of the
intermediate extract before repack.

And we do have a big fat warning that users should not attempt to meddle
with the git tree that Buildroot caches.

As 768f9f80f62c however demonstrates, is that it took quite a long time
between the introduction of the git caching, and the time someone
eventually discovered they could meddle in there. This shows that the
issue it not actually critical in most setups.

Also, the tar manual [0] hints at a better solution to handle
reproducibility, which even avoids touching the files on disk which is
even nicer:

    ‘--mode='go+u,go-w'’
        Omit irrelevant information about file permissions.

If we were to actually handle the mode bit for reproducibility, we'd
need to:
  - introduce archive versioning for all download backends and
    prost-processing
  - use the tar officially suggested method

So, revert that change, as it was incomplete, was not really fixing much
issues, and causes actual issues.

This reverts commit 768f9f80f62c1da6e298c680f0f4bfa887f38c78.

[0] https://www.gnu.org/software/tar/manual/tar.html#Reproducibility

Thanks to Vincent and Arnout for pointing at the tar manual.

Reported-by: Antoine Coutant <antoine.coutant@smile.fr>
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
 support/download/helpers | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/support/download/helpers b/support/download/helpers
index 265685eff5..90a7d6c1ec 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -53,9 +53,6 @@ mk_tar_gz() {
     tmp="$(mktemp --tmpdir="$(pwd)")"
     pushd "${in_dir}" >/dev/null
 
-    # Enforce group/others mode bits
-    chmod -R go-wx+X .
-
     # Establish list
     find . -not -type d -and -not \( -false "${find_opts[@]}" \) >"${tmp}.list"
     # Sort list for reproducibility

--===============0407214235741896994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0407214235741896994==--
