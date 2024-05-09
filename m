Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73998C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3876B613B6;
	Thu,  9 May 2024 20:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzfHWwdqmRnv; Thu,  9 May 2024 20:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A13B6139B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A13B6139B;
	Thu,  9 May 2024 20:47:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D13B1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3664414A1
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvU9eOEnPjjJ for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E74A41E05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E74A41E05
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CC2E86ADA; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:44:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bcb51517ccbe79e5c37f211a20d1d02689298e0
X-Git-Newrev: ac92ce4961b557a0f25adac824d9190b18f830e8
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.2CC2E86ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/git: handle git attributes
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac92ce4961b557a0f25adac824d9190b18f830e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Files in a git repository can be given attributes, like the usual eol
that can convert to-from crlf, cr, lf; those are applied when comitting
or checking-out a file.

There are also two attributes that are meant to be used when generating
an archive (with git archive): export-subst, and export-ignore, that
respectively substitutes format placeholders in a file, and excludes a
file from the archive.

Some package (e.g. pcm-tools, luajit) use the export-subst attribute
to generate versioning information. luajit, specifically, uses the UNIX
timestamp of the commit as the patch-level for its semantic versioning.

We don't use git-archive, because we need to get submodules and LFS
blob, which git-archive does not handle. So, our git backend tries to
impersonate git-archive as much as possible, but the support for git
attributes was lost when we converted it from using git-archive to
manually creating the tarball in 3abd5ba42434 (support/download/git: do
not use git archive, handle it manually) in preparation for f109e7eeb53e
(support/download/git: add support for submodules) (arguably, a long
time ago...)

Extend the git backend to handle the export-subst attribute. There is
no git tool (that we could find) that does that automatically, except
git-archive, which we can't use; "git check-attr" however can report
whether a file has a specific attribute (and git check-attr can work
with \0-delimited fields and records).

So, we iterate over all the files in the repository, and filter those
that have the export-subst attribute set. Then for each file, we use a
bit of awk to do the replacement:

  - for each line (managed natively by awk), we iterate over each
    format placeholder,
  - for each placeholer, we query "git log" with the requested format,
  - we emit the replacement.

When doing the replacement, we decided to force abbreviating short
hashes to 40 chars, which is the length of a full sha1, rather than
actually abbreviating them:

  - letting git decide of the length is not reproducible over time:
    - as new commits are added, the short length will increase to avoid
      collisions,
    - newer git versions may decide on a different heuristic to shorten
      hashes,
    - users may have local settings with an arbitrary length (in their
      ~/.gitconfig for example);

  - deciding on our side of an "small" arbitrary value would not be
    viable long term either, as it might be too large to be minimum, or
    too short to avoid collisions.

The only reproducible solution is to use unabbreviated hashes.

Handling git-attributes also implies that the format of the generated
archives has changed, since we now expand placeholders, so we bump our
git format version.

Hash files for all git-downloaded packages will be updated in followup
commits.

Of all our git-downloaded packages, 5 are affected, and their hashes
will be updated in a followup commit too:

  - pcm-tools, which was known, and the one that triggered this commit;
    since we now expand placeholders, we can drop the post-extract hook;
    switching to a full hash in replacements also changes the hash of
    the generated archive;

  - qt5knx, qt5location, qt5mqtt, and qt5opcua: the file .tag at the
    repository root, contains only the full hash placeholder; that file
    is not used at all during the build (AFAICS);

Finally, a sixth package, luajit, uses export-subst; it currently relies
on the github-generated archive (because it happens to currently use a
format that is reproducible); it will also be converted in a follow-up
patch.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Francois Perrad <fperrad@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-download.mk |  2 +-
 support/download/git    | 60 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 30eeb6b1fc..9047e99f86 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -20,7 +20,7 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Version of the format of the archives we generate in the corresponding
 # download backend:
-BR_FMT_VERSION_git = -br1
+BR_FMT_VERSION_git = -br2
 BR_FMT_VERSION_svn = -br3
 
 DL_WRAPPER = support/download/dl-wrapper
diff --git a/support/download/git b/support/download/git
index 6654d98a00..8134c07214 100755
--- a/support/download/git
+++ b/support/download/git
@@ -226,6 +226,66 @@ if [ ${large_file} -eq 1 ]; then
     fi
 fi
 
+# Find files that are affected by the export-subst git-attribute.
+# There might be a .gitattribute at the root of the repository, as well
+# as in any arbitrary sub-directory, whether from the master repository
+# or a submodule.
+# "git check-attr -z" outputs results using \0 as separator for everything,
+# so there is no difference between field or records (but there is a
+# trailing \0):
+#   path_1\0attr_name\0attr_state\0path_2\0attr_name\0attr_state\0....
+mapfile -d "" files < <(
+    set -o pipefail  # Constrained to this sub-shell
+    find . -print0 \
+    |_plain_git check-attr --stdin -z export-subst \
+    |(i=0
+      while read -r -d "" val; do
+        case "$((i++%3))" in
+          (0)   path="${val}";;
+          (1)   ;; # Attribute name, always "export-subst", as requested
+          (2)
+            if [ "${val}" = "set" ]; then
+                printf "%s\0" "${path}"
+            fi;;
+        esac
+      done
+     )
+)
+# Replace format hints in those files. Always use the master repository
+# as the source of the git metadata, even for files found in submodules
+# as this is the most practical: there is no way to chdir() in (g)awk,
+# and recomputing GIT_DIR for each submodule would really be tedious...
+# There might be any arbitrary number of hints on each line, so iterate
+# over those one by one.
+for f in "${files[@]}"; do
+    TZ=UTC \
+    LC_ALL=C \
+    GIT_DIR="${git_cache}/.git" \
+    awk -v GIT="${GIT}" '
+    {
+        l = $(0);
+        while( (i = match(l, /\$Format:[^\$]+\$/)) > 0 ) {
+            len = RLENGTH;
+            printf("%s", substr(l, 1, i-1) );
+            fmt = substr(l, i, RLENGTH);
+            pretty = substr(fmt, 9, length(fmt)-9);
+            cmd = GIT " -c core.abbrev=40 log -s -n1 --pretty=format:'\''" pretty "'\''";
+            while ( (cmd | getline replace) > 0) {
+                printf("%s", replace);
+            }
+            ret = close(cmd);
+            if (ret != 0) {
+                printf("%s:%d: error while executing command \"%s\"\n", FILENAME, NR, cmd) > "/dev/stderr";
+                exit 1;
+            }
+            l = substr(l, i+len);
+        }
+        printf("%s\n", l);
+    }
+    ' "${f}" >"${f}.br-temp"
+    mv -f "${f}.br-temp" "${f}"
+done
+
 popd >/dev/null
 
 # Generate the archive.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
