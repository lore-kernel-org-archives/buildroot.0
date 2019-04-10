From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 10 Apr 2019 12:31:33 +0200
Subject: [Buildroot] [git commit] .flake8: fix check for 80/132 columns
Message-ID: <20190410102732.C703981509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d17ae2acf63810495cc480da38127c4612e4da9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We recommend wrapping at 80 columns but we accept 132 columns when it
makes more readable.

When running flake8 locally, use maximum line length 80.
But when running in GitLab CI, keep the check-flake8 job failing only
for lines longer than 132.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .flake8           | 2 +-
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.flake8 b/.flake8
index 7dd7b541cc..ee3d5035a0 100644
--- a/.flake8
+++ b/.flake8
@@ -2,4 +2,4 @@
 exclude=
     # copied from the kernel sources
     utils/diffconfig
-max-line-length=132
+max-line-length=80
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 572868a557..e62e1c3e38 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -38,7 +38,7 @@ check-flake8:
         - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
         - sort -u files.txt | tee files.processed
     script:
-        - python -m flake8 --statistics --count $(cat files.processed)
+        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
     after_script:
         - wc -l files.processed
 
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index a506840892..b1ec671867 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -38,7 +38,7 @@ check-flake8:
         - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
         - sort -u files.txt | tee files.processed
     script:
-        - python -m flake8 --statistics --count $(cat files.processed)
+        - python -m flake8 --statistics --count --max-line-length=132 $(cat files.processed)
     after_script:
         - wc -l files.processed
 
