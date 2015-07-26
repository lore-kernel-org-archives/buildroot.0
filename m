From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:18:39 +0200
Subject: [Buildroot] [git commit] core/download: don't be needlessly verbose
	in backends
Message-ID: <20150726131855.3302281D7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dea23cf53258a3fa36cff6832fe193d75afdad1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 50c8b7e (support/download: support -q in all download backends), the
backend were made to respect the quietness of the main Makefile, when -s
is poassed on the 'make' command line. In doing so, they were all made
to be verbose by default.

However, the verbosity of some of the tools, like scp, is very high, and
is in fact intended for debug purposes.

Drop being verbose by default, just use whatever each tool deems normal
output. Only respect the quietness requested by the user.

Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/bzr  |    2 +-
 support/download/cp   |    5 +++++
 support/download/git  |    2 +-
 support/download/hg   |    2 +-
 support/download/scp  |    2 +-
 support/download/wget |    2 +-
 6 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/support/download/bzr b/support/download/bzr
index 870ce8d..c567466 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -12,7 +12,7 @@ set -e
 #   BZR      : the bzr command to call
 
 
-verbose=-v
+verbose=
 while getopts :q OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
diff --git a/support/download/cp b/support/download/cp
index 132cad7..6e29eef 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -11,7 +11,12 @@ set -e
 # Environment:
 #   LOCALFILES: the cp command to call
 
+# 'cp' usually does not print anything on its stdout, whereas the
+# other download backends, even if not verbose, at least print some
+# progress information.
+# Make 'cp' verbose by default, so it behaves a bit like the others.
 verbose=-v
+
 while getopts :q OPT; do
     case "${OPT}" in
     q)  verbose=;;
diff --git a/support/download/git b/support/download/git
index fd5f539..0e6103b 100755
--- a/support/download/git
+++ b/support/download/git
@@ -11,7 +11,7 @@ set -e
 # Environment:
 #   GIT      : the git command to call
 
-verbose=-v
+verbose=
 while getopts :q OPT; do
     case "${OPT}" in
     q)  verbose=-q; exec >/dev/null;;
diff --git a/support/download/hg b/support/download/hg
index f6880fa..d6654a1 100755
--- a/support/download/hg
+++ b/support/download/hg
@@ -11,7 +11,7 @@ set -e
 # Environment:
 #   HG       : the hg command to call
 
-verbose=-v
+verbose=
 while getopts :q OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
diff --git a/support/download/scp b/support/download/scp
index 3d6876f..1a62f30 100755
--- a/support/download/scp
+++ b/support/download/scp
@@ -11,7 +11,7 @@ set -e
 # Environment:
 #   SCP       : the scp command to call
 
-verbose=-v
+verbose=
 while getopts :q OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
diff --git a/support/download/wget b/support/download/wget
index 7eb21a4..885bcf1 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -11,7 +11,7 @@ set -e
 # Environment:
 #   WGET     : the wget command to call
 
-verbose=-v
+verbose=
 while getopts :q OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
