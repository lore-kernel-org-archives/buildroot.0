From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Apr 2018 21:34:43 +0200
Subject: [Buildroot] [PATCH 1/7 v4] download/git: add warning not to use our
 git cache
In-Reply-To: <cover.1524944063.git.yann.morin.1998@free.fr>
References: <cover.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <55853fb3c8873211025fb58cdc2777fb0fdaf25a.1524944063.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We really want the user not to use our git cache manually, or their
changes (committed or not) may eventually get lost.

So, add a warning file, not unlike the one we put in the target/
directory, to warn the user not to use the git tree.

Ideally, we would have carried this file in support/misc/, but the git
backend does not have acces to it: the working directory is somewhere
unknown, and TOPDIR is not exported in the environment.

So, we have to carry it in-line in the backend instead.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/git | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/support/download/git b/support/download/git
index bf05c595a5..3b5c8a6cfe 100755
--- a/support/download/git
+++ b/support/download/git
@@ -43,6 +43,24 @@ _git() {
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
+# Create a warning file, that the user should not use the git cache.
+# It's ours. Our precious.
+cat <<-_EOF_ >"${dl_dir}/git.readme"
+	IMPORTANT NOTE!
+
+	The git tree located in this directory is for the exclusive use
+	by Buildroot, which uses it as a local cache to reduce bandwidth
+	usage.
+
+	Buildroot *will* trash any changes in that tree whenever it needs
+	to use it. Buildroot may even remove it in case it detects the
+	repository may have been damaged or corrupted.
+
+	Do *not* work in that directory; your changes will eventually get
+	lost. Do *not* even use it as a remote, or as the source for new
+	worktrees; your commits will eventually get lost.
+_EOF_
+
 # Initialise a repository in the git cache. If the repository already
 # existed, this is a noop, unless the repository was broken, in which
 # case this magically restores it to working conditions. In the latter
-- 
2.14.1
