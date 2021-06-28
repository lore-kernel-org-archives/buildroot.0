From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Jun 2021 22:15:13 +0200
Subject: [Buildroot] [PATCH 2/4 v5] utils/test-pkg: remove configurations
 that are skipped
In-Reply-To: <cover.1624911306.git.yann.morin.1998@free.fr>
References: <cover.1624911306.git.yann.morin.1998@free.fr>
Message-ID: <5734b04e93f6ce2212a81963d8a0e79500f942c3.1624911306.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the config fragment provided by the user is not usable with a
specific toolchain configuration, the resulting .config file was kept
around.

In a follow up commit, we'll need to know, from outside test-pkg, if a
specific configuration was indeed usable or not.

So, unless if the user actually requested to keep the build directories,
remove the .config file when it contains a configration that would be
skipped.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
v5: new patch
---
 utils/test-pkg | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/test-pkg b/utils/test-pkg
index a317d8c17a..54c6c5e8fe 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -161,6 +161,10 @@ build_one() {
     # done in the same locale.
     comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
     if [ -s "${dir}/missing.config" ]; then
+        if [ ${keep} -ne 1 ]; then
+            # Invalid configuration, drop it
+            rm -f "${dir}/.config"
+        fi
         return 1
     fi
     # Remove file, it's empty anyway.
-- 
2.25.1
