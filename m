From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 21:22:28 +0200
Subject: [Buildroot] [git commit] download/git: ensure we checkout to a
 clean state
Message-ID: <20180501192232.642F882627@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d2e0188890648ac02874667c2d9f6ae0e3d65ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force the checkout to ignore and throw away any local changes. This
allows recovering from a previous partial checkout (e.g. killed by
the user, or by a CI job...)

git checkout -f has been supported since the inception of git, so we
can use it without any second thought.

Also do a forced-forced clean, to really get rid of all untracked stuff.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 39e57aac34..c88249ee63 100755
--- a/support/download/git
+++ b/support/download/git
@@ -154,7 +154,11 @@ fi
 
 # Checkout the required changeset, so that we can update the required
 # submodules.
-_git checkout -q "'${cset}'"
+_git checkout -f -q "'${cset}'"
+
+# Get rid of now-untracked directories (in case a git operation was
+# interrupted in a previous run).
+_git clean -ffdx
 
 # Get date of commit to generate a reproducible archive.
 # %cD is RFC2822, so it's fully qualified, with TZ and all.
