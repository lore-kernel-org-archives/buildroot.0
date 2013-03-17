From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2013 23:37:10 +0100
Subject: [Buildroot] [PATCH 5/5] fs/ext2: remove count- and time-based fsck
In-Reply-To: <cover.1363559530.git.yann.morin.1998@free.fr>
References: <cover.1363559530.git.yann.morin.1998@free.fr>
Message-ID: <fa74e9a7415c88821e059a2a2574221fb0f81e60.1363559530.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set the count- and time-based checks intervals to 0, thus effectively
disabling automatic checks at boot (after a suggestion by Arnout).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/ext2/genext2fs.sh |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/ext2/genext2fs.sh b/fs/ext2/genext2fs.sh
index 76f454c..a4eb351 100755
--- a/fs/ext2/genext2fs.sh
+++ b/fs/ext2/genext2fs.sh
@@ -73,8 +73,11 @@ e2tunefsck() {
            "${IMG##*/}" "${GEN}"
 
     # e2fsck will force a *random* UUID, which is bad
-    # for reproducibility, so we do not want it
-    tune2fs -U clear "${IMG}"
+    # for reproducibility, so we do not want it.
+    # Remove count- and time-based checks, they are not welcome
+    # on embedded devices, where they can cause serious boot-time
+    # issues by tremendously slowing down the boot.
+    tune2fs -U clear -c 0 -i 0 "${IMG}"
 }
 
 # Check we know what generation to generate
-- 
1.7.2.5
