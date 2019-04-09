From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon,  8 Apr 2019 21:17:29 -0300
Subject: [Buildroot] [PATCH 1/1] .flake8: fix check for 80/132 columns
Message-ID: <20190409001729.3422-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
The result of check-flake8 does not change:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/192997289
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
 
-- 
2.17.1
