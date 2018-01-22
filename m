From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:42 -0200
Subject: [Buildroot] [PATCH 14/14] .gitlab-ci.yml: check flake8
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-15-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a test to check Python code style in the whole buildroot tree.

Install the needed tool on the fly instead of adding it to the Docker
image since it's only used for this one test.
Use the latest version of the tool because it is actively maintained.
But use a fixed version of the tool and its dependencies to get stable
results. It can be manually bumped from time to time.

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
---
For a demo, see the end of the log at this job:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/48876752
---
 .gitlab-ci.yml    | 16 ++++++++++++++++
 .gitlab-ci.yml.in | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bf975fc..b665410 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -30,6 +30,22 @@ check-DEVELOPERS:
     script:
         - "! utils/get-developers | grep -v 'No action specified'"
 
+check-flake8:
+    before_script:
+        # Use a fixed version of the tool in order to get stable results.
+        - sudo apt-get update -qq
+        - sudo apt-get install -y -qq --no-install-recommends python-pip
+        - pip install -q setuptools
+        - pip install -q flake8==3.5.0 mccabe==0.6.1 pycodestyle==2.3.1 pyflakes==1.6.0
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
index f763fdd..798404e 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -30,6 +30,22 @@ check-DEVELOPERS:
     script:
         - "! utils/get-developers | grep -v 'No action specified'"
 
+check-flake8:
+    before_script:
+        # Use a fixed version of the tool in order to get stable results.
+        - sudo apt-get update -qq
+        - sudo apt-get install -y -qq --no-install-recommends python-pip
+        - pip install -q setuptools
+        - pip install -q flake8==3.5.0 mccabe==0.6.1 pycodestyle==2.3.1 pyflakes==1.6.0
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
-- 
2.7.4
