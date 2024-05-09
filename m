Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87875C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 164206139E;
	Thu,  9 May 2024 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueLVj_TEC2Ep; Thu,  9 May 2024 20:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07FA7613BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07FA7613BB;
	Thu,  9 May 2024 20:47:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8471BF990
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A146A83FFD
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBOH33KNp_Te for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D3C383FF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D3C383FF4
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88CC086DD1; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:44:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e87da9eab3db01210c9cb6fe5607140c81f980c
X-Git-Newrev: 3035fc23dec383ddcbbc32a605c029c337f7c5c7
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.88CC086DD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: even more reproducible
 archives (until next time)
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

commit: https://git.buildroot.net/buildroot/commit/?id=3035fc23dec383ddcbbc32a605c029c337f7c5c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when we generate archives, we rely on a few assumptions and
mechanisms to ensure reproducilibity. So far, we mostly accounted for
the content (i.e. content, filenames, and path) of the files we
archived, and this is OK (git and svn should provide reproducilbe
content by design, and cargo and go vendoring are also supposed to be
generating reproducible content.

However, tarballs do not only contain the content of the files; they
also have a few metadata about those files. Beyond filenames and paths,
which are already reproducible, there is the timestamp, the user and
group name and ID. Those are also accounted for and made reproducible.

The final touch (so far!) is that files have access rights (aka mode),
and those too are stored in tarballs. So far we accounted for those by
ensuring that Buildroot would always run under a known umask, thus
generating files with reproducible modes.

That falls short in one case that we did not envision, though: a shared
download directory, where extended attributes are set to provide a
default ACL that is permissive, to allow two or more users (with
different uid and gid) to all read and write to such a directory. This
is trivially achieved with something like:

    $ mkdir -p "${BR2_DL_DIR}"
    $ setfacl -m 'default:user::rwx' "${BR2_DL_DIR}"
    $ setfacl -m 'default:group::rwx' "${BR2_DL_DIR}"
    $ setfacl -m 'default:other::rwx' "${BR2_DL_DIR}"

This has the effect that:

  - files below BR2_DL_DIR are all set with user, group, and world read
    and write access,
  - files executable by the owner will also be group and world
    executable,
  - directories are user, group, and world readable, writable, and
    searchable.

This means that all the archives we generate from files in BR2_DL_DIR
will have modes that are different from those generated on other systems,
where only the traditional umask is used.

There are various solutions to solve that issue:

  - detect the situation and abort: that's not nice, because users have
    a legitimiate reason to want to share that directory,

  - find a solution for each affected download mechanism: git, svn, hg,
    cvs, bzr... and for each of the affected vendoring mechanism: go and
    cargo [0]; this is not nice, because it means a lot of repetition,
    with the risk that they diverge over time (e.g. one is fixed for a
    newer issue, while the others are left out due to an oversight...)

  - find a single, common solution that works in all cases, whatever the
    download mechanism and/or vendoring: this is the best, because we
    can extend and fix it once and everything else benefits from it.

We obviously go for the third option.

The common solution is rather simple. When creating the tarball in
support/download/helpers, give an option to tar to set the group and
other permissions to those of the user, but without write permission.

This implies that we must bump the version-suffix for the download
backends [1] and for the vendoring post-processes. It also implies that
the hash may change, under the following circumstances:

- Symlinks normally have permissions 0777 (because symlink permissions
  are in fact meaningless). They will now have permission 0755 in the
  tarball.
- If the original tarball (for vendored go and cargo packages) contained
  files that are readable or executable by owner but not by group or
  other, they will now be readable resp. executable by group and other
  too. Note that for writeable it is not the case, because those were
  already handled by our 0022 umask (which makes them not writeable by
  group and other).

Because the hash may change, we need to update the BR_FMT_VERSION for
everything that creates tarballs. Go and cargo didn't have one up to
now, the the previous commit added the possibility to give one. The ones
for git and svn have to be updated. Since it is now possible to have a
suffix for both the VCS and the post-processing, change the suffix to
something more descriptive than "-brX", i.e. -git3 for git, -go1 for
golang, etc.

The hash updates and filename changes will be handled in a follow-up
commit.

[0] Note however that the vendoring is currently not done in a
sub-directory of BR2_DL_DIR, but the cargo and go caches are located
there. Files that get copied from there to the vendoring area would be
tainted as well, and thus we want to address that situation as well.

[1] we currently do not have a CVS version suffix, because we do not
guarantee the reproducilibity of CVS archives (we can't); for hg, we are
currently using hg's own archive tool, and presumably that does not have
the mode issue because it is not using the checked-out files. Still,
doing the mode fix in a single location will help extend those two
backends in the future (if that ever happens...).

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-download.mk  | 8 +++++---
 support/download/helpers | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9047e99f86..61e565b002 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -19,9 +19,11 @@ export SFTP := $(call qstrip,$(BR2_SFTP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Version of the format of the archives we generate in the corresponding
-# download backend:
-BR_FMT_VERSION_git = -br2
-BR_FMT_VERSION_svn = -br3
+# download backend and post-process:
+BR_FMT_VERSION_git = -git3
+BR_FMT_VERSION_svn = -svn4
+BR_FMT_VERSION_go = -go1
+BR_FMT_VERSION_cargo = -cargo1
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/support/download/helpers b/support/download/helpers
index 90a7d6c1ec..823e4d2f91 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -61,7 +61,7 @@ mk_tar_gz() {
     # Create POSIX tarballs, since that's the format the most reproducible
     tar cf - --transform="s#^\./#${base_dir}/#S" \
              --numeric-owner --owner=0 --group=0 --mtime="${date}" \
-             --format=posix --pax-option="${pax_options}" \
+             --format=posix --pax-option="${pax_options}" --mode='go=u,go-w' \
              -T "${tmp}.sorted" >"${tmp}.tar"
 
     # Compress the archive
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
