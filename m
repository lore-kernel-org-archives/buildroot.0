Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6645CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F7454159E;
	Mon, 18 Sep 2023 20:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F7454159E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZIGNHi8mMPj; Mon, 18 Sep 2023 20:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C1FE415AD;
	Mon, 18 Sep 2023 20:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C1FE415AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 248251BF3D8
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE02D40948
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:31:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE02D40948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxfP9KyTK4zl for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:31:06 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7775C40103
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7775C40103
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-403012f27e1so52965145e9.1
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695069064; x=1695673864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q8XCMvgnghmNQlwO4lGTP8aibDrjDpO2S+JLM4SYcVQ=;
 b=Dx5PaK35a9ayB5M+kKR0kv7GsPrmBlRKo5k3jBW+0lEkRztcRFCEygUvZDLdI5Dz3L
 woxaqx2lz47w/sl44bD80DIzfg+XkG1r98fDKUb84M0YR3/fZqivAAZHlYMMgmxJJB3R
 ug8VT4juO00fwos6q9HK0h+RiDTPh89Yj1gTBhkvZLb2LJC/rWuHJH7KDyeCDYbKDOn5
 VOS828+o0kDN+UNpIQ6OOAY7IIA19eGOWoscyzl+e/8kkeiJHd2Zg5WTWgwKw9FnZLnv
 Pm0kzkxaICPgTTX5fHAUWsD3t8CNa8rgKLrX8oLJQMtafA3VWyV8arcdurYbEZ712usf
 I7AA==
X-Gm-Message-State: AOJu0Yx1HFfHJfUsAQ1yHudEyt+y5fuwghVY9J/7LzO8wT07FsRd3vZc
 iQtaJhYmSLLV+zrRgDzNt0sA43zcAYA=
X-Google-Smtp-Source: AGHT+IEOPHkwgRxvbs++JY1+Enkvg/PFVlyp1HShoSFFApRf47rRLqFOAkWAqBt6zwO4ylRKI5E0mA==
X-Received: by 2002:a05:600c:2053:b0:3fb:b5c0:a079 with SMTP id
 p19-20020a05600c205300b003fbb5c0a079mr9180728wmg.21.1695069064574; 
 Mon, 18 Sep 2023 13:31:04 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:9624:48f1:9fd0:3d3c])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a7bc8ca000000b00401d8181f8bsm16238956wml.25.2023.09.18.13.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:31:04 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:30:58 +0200
Message-Id: <d1d862cb7d02d3bd2b683ecc1aebf0e901b04efe.1695069059.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695069059.git.yann.morin.1998@free.fr>
References: <cover.1695069059.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695069064; x=1695673864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q8XCMvgnghmNQlwO4lGTP8aibDrjDpO2S+JLM4SYcVQ=;
 b=hxo5SMvfyJ+SfOkiTzw36gbNnZbvOUzRsxjOFHkKYYn59RSGW8XDziTKWYmjiqkvNG
 R21slkS5D99rr+xsYjUNJFWDQUHgK2UxpxHmmw6xxKCA06YYNC87Lu84H8Zh/hCpnE0W
 90CcBCQxZU9feKU5djFcOzYMLfDp2WXwUi42ktx/241KlPrZ7M7Ks37sK0/qaDXCQTV+
 B/qy3CgQvL2Y0tjZbd2dvzg69x68Fbwn6/wnlG9KB2FM1z/cXdqkm4dypXvXE5mjjwW7
 TlqqVTCfhaOddN7mvTHpkr6crMRPzZ+OrhlCwcUVNdLJwybB8OUlV5Iepg/yNXniDdOW
 M9hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hxo5SMvf
Subject: [Buildroot] [PATCH 1/6 v2] support/download/git: handle git
 attributes
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
Cc: Francois Perrad <fperrad@gmail.com>,
 Woody Douglass <wdouglass@carnegierobotics.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
format that is reproducible); it will also be converted in a floowup
patch.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Francois Perrad <fperrad@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2;
  - offload update of hash files and runtime test in spearate patches
  - fix minor coding style in awk script
---
 package/pkg-download.mk |  2 +-
 support/download/git    | 60 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e5cd83d859..b134c3d4eb 100644
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
