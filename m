From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 22:48:29 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: check flake8
Message-ID: <20180331204834.A64C781565@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1960eda2f681c16c22ab613fbd54a2aaa2a5e7dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a test to check Python code style in the whole buildroot tree.

Search files by type in order to help flake8 to find the Python scripts
without .py extension. But don't rely only in the output of 'file' as it
uses heuristics and sometimes it is wrong (specially identifying Python
files as C++ source for the 'file' version currently in the Docker
image).

Include in the output:
 - the list of Python files processed;
 - statistics for each kind of warning;
 - the total number of warnings;
 - the number of Python files processed.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml    | 11 +++++++++++
 .gitlab-ci.yml.in | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1f4d506196..fd1aeb3408 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -30,6 +30,17 @@ check-DEVELOPERS:
     script:
         - "! utils/get-developers | grep -v 'No action specified'"
 
+check-flake8:
+    before_script:
+        # Help flake8 to find the Python files without .py extension.
+        - find * -type f -name '*.py' > files.txt
+        - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
+        - sort -u files.txt | tee files.processed
+    script:
+        - python -m flake8 --statistics --count $(cat files.processed)
+    after_script:
+        - wc -l files.processed
+
 check-package:
     script:
         - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index c0e9563f2f..bffcb02be1 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -30,6 +30,17 @@ check-DEVELOPERS:
     script:
         - "! utils/get-developers | grep -v 'No action specified'"
 
+check-flake8:
+    before_script:
+        # Help flake8 to find the Python files without .py extension.
+        - find * -type f -name '*.py' > files.txt
+        - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
+        - sort -u files.txt | tee files.processed
+    script:
+        - python -m flake8 --statistics --count $(cat files.processed)
+    after_script:
+        - wc -l files.processed
+
 check-package:
     script:
         - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
