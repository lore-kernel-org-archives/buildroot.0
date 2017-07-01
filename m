From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:43:49 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: simplify (and fix)
	check-DEVELOPERS
Message-ID: <20170701174125.DFF5C8195B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91a5ec960b4c5374aaee040daaf0ff301167cf53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-DEVELOPERS test would always fail, because && will return
the exit code of the left-hand side if not 0, so it *always* returns
1.

But in fact, the test can be simplified quite a lot: we can run
getdeveloper directly, without arguments. That should just print
'No action specified', but it will also print any syntax errors it
encountered. So we can just 'grep -v' the expected output away; if
there is anything more, grep will return 0, but if there is nothing
more, it will return 1. So we just need to invert the result.

Incidentally, this also fixes the incorrect remaining reference to
support/scripts.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml    | 4 +---
 .gitlab-ci.yml.in | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cc048a0..6bd9837 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -36,9 +36,7 @@ check-gitlab-ci.yml:
 
 check-DEVELOPERS:
     script:
-        - PYTHONPATH=$PWD/support/scripts
-                python -c 'from getdeveloperlib import parse_developers; parse_developers()' |
-                grep . && exit 1
+        - ! utils/get-developers | grep -v 'No action specified'
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 0b6e634..0855bff 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -36,9 +36,7 @@ check-gitlab-ci.yml:
 
 check-DEVELOPERS:
     script:
-        - PYTHONPATH=$PWD/support/scripts
-                python -c 'from getdeveloperlib import parse_developers; parse_developers()' |
-                grep . && exit 1
+        - ! utils/get-developers | grep -v 'No action specified'
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
