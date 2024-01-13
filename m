Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF32C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A55B60A9A;
	Sat, 13 Jan 2024 20:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A55B60A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0xls5HqTVfO7; Sat, 13 Jan 2024 20:31:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7609F60B4C;
	Sat, 13 Jan 2024 20:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7609F60B4C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 190D71BF868
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E70AA60E13
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E70AA60E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mp9l-BgvWoJU for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:31:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00A6660706
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00A6660706
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E16218600F; Sat, 13 Jan 2024 20:31:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:25:47 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 75ed72cec32e2ed0ea9b94f2c15204ab94da56f0
X-Git-Newrev: ec74765e63869f8d4c28b1ce62c66ff6d93bd084
X-Patchwork-Hint: ignore
Message-Id: <20240113203128.E16218600F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Revert "support/download:
 generate even more reproducible tarballs"
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
Content-Type: multipart/mixed; boundary="===============2519954849669942832=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2519954849669942832==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ec74765e63869f8d4c28b1ce62c66ff6d93bd084
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 9fbd3d85745fdf32dac06355e9c524270ae034bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============2519954849669942832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2519954849669942832==--
