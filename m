From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Apr 2018 21:34:47 +0200
Subject: [Buildroot] [PATCH 5/7 v4] download/git: ensure we checkout to a
 clean state
In-Reply-To: <cover.1524944063.git.yann.morin.1998@free.fr>
References: <cover.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <a2163717a6bf4dde0c8f6c165be1d72f5c5a3831.1524944063.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 support/download/git | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 921a35998b..ca8c94fa3b 100755
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
-- 
2.14.1
