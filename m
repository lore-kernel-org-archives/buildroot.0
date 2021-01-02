From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 Jan 2021 11:56:05 +0100
Subject: [Buildroot] [PATCH] Revert ".flake8: fix check for 80/132 columns"
Message-ID: <20210102105605.119264-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 7d17ae2acf63 (.flake8: fix check for 80/132 columns) introduced a
difference in how flake8 behaves between the automatic checks done in
the CI, where the maximum line length is 132, and the local checks,
where the maximum line length is 80.

The rationale at the time was that we recommend 80 char lines, but that
we accept 132 when it makes sense for readability.

However, this is very annoying when running flake8 locally, because of
two reasons:

 1. human reviews on python scripts have not been as thorough as we did
    expect; indeed, we've let a lot of long lines slip through; this
    causes a lot of spurious failures that hide away the actual errors;

 2. when hacking on a python script, the issues reported will not be
    caused by the current changes, so the many reported failures
    actually hide away the newly introduced issues.

Additionally, our 'make check-flake8' rule already enforces the 132-char
limit, and the issues reported are different than when manually running
flake8 on individual files.

Furthermore, the readability rationale for the 80-char limit is
definitely shattered by the mere rationale of allowing 132-char limit
for... readability...

We've arrived to a point where this separation is causing our checks
around flake8 to become mostly unusable and useless, as they do not
report meaningful issues, and people are no longer paying attention, and
this has caused actual issues to be introduced.

Finally, terminal emulators of today have long lifted the 80-char limit,
and are more than capable of displaying 132-char wide lines.

Switch back to using a 132-char limit.

This reverts commit 7d17ae2acf63810495cc480da38127c4612e4da9.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 .flake8  | 2 +-
 Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.flake8 b/.flake8
index ee3d5035a0..7dd7b541cc 100644
--- a/.flake8
+++ b/.flake8
@@ -2,4 +2,4 @@
 exclude=
     # copied from the kernel sources
     utils/diffconfig
-max-line-length=80
+max-line-length=132
diff --git a/Makefile b/Makefile
index f0b3e43e0f..4d334adcd6 100644
--- a/Makefile
+++ b/Makefile
@@ -1223,7 +1223,7 @@ check-flake8:
 	| xargs file \
 	| grep 'Python script' \
 	| cut -d':' -f1 \
-	| xargs -- python3 -m flake8 --statistics --max-line-length=132
+	| xargs -- python3 -m flake8 --statistics
 
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
-- 
2.25.1
