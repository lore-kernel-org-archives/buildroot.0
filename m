From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Apr 2018 21:44:07 +0200
Subject: [Buildroot] [PATCH 3/7 v3] download/git: quickly exit when the cset
 does not exist
In-Reply-To: <cover.1524426211.git.yann.morin.1998@free.fr>
References: <cover.1524426211.git.yann.morin.1998@free.fr>
Message-ID: <6c69cdbd3a4722dd8c08adf15da0620cc5d1c697.1524426211.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Check that the given cset is indeed something we can checkout. If not,
then exit early.

This will be usefull when a later commit will trap any failing git
command to try to recover the repository by doing a clone from scratch:
when the cset is not a commit, it does not mean the repository is broken
or what, and recloning from scratch would not help, so no need to trash
a good cache.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/git | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/download/git b/support/download/git
index 60d6c24f1e..bd37a0a8d9 100755
--- a/support/download/git
+++ b/support/download/git
@@ -114,6 +114,13 @@ if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
     printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
 fi
 
+# Check that the changeset does exist. If it does not, no reason to go
+# on, we can fast-track to the exit path.
+if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
+    printf "Commit '%s' does not exist in this repository\n." "${cset}"
+    exit 1
+fi
+
 # Checkout the required changeset, so that we can update the required
 # submodules.
 _git checkout -q "'${cset}'"
-- 
2.14.1
