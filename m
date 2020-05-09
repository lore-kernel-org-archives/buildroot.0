From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 14:18:39 +0200
Subject: [Buildroot] [git commit branch/next] support/gnuconfig: add update
 script
Message-ID: <20200509120323.B4B1791082@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca7a6ef8aa3f27761ffe7e7f694f29226fadb101
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/gnuconfig/README.buildroot | 14 ++++----------
 support/gnuconfig/update           | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
index 7e7d49830f..fbf0662543 100644
--- a/support/gnuconfig/README.buildroot
+++ b/support/gnuconfig/README.buildroot
@@ -13,15 +13,9 @@ files of your package to be updated by using:
 <pkg>_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 --- UPDATE ---
-GNU config is now managed in git, so to update:
+Run the script 'update' in this directory, and commit the result.
 
-# git clone git://git.savannah.gnu.org/config.git
-# cp config/config.* .
-# for p in $(ls patches/*.patch); do patch -p1 < $p; done
-# rm -rf config
+The current Buildroot version is based on this commit of the config.git
+repository (leave alone on its own line, the script updates it):
 
-Currently no patches are needed, but they may be needed again in the
-future.
-
-The current Buildroot version is based on the Git commit
-104ee6463c4bfaac3f3029d9be9bdd6e93879323 of the config.git repository.
+104ee6463c4bfaac3f3029d9be9bdd6e93879323
diff --git a/support/gnuconfig/update b/support/gnuconfig/update
new file mode 100755
index 0000000000..c8728eadd2
--- /dev/null
+++ b/support/gnuconfig/update
@@ -0,0 +1,14 @@
+#!/usr/bin/env bash
+
+set -e
+
+cd "${0%/*}"
+
+git clone https://git.savannah.gnu.org/git/config.git
+sha="$(cd config; git log -1 --pretty=tformat:%H)"
+sed -r -i -e "\$s/.*/${sha}/" README.buildroot
+cp config/config.* .
+for p in $(ls patches/*.patch 2>/dev/null); do
+    patch -p1 < "${p}"
+done
+rm -rf config
