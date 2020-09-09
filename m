From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:24:20 +0200
Subject: [Buildroot] [git commit] gitlab-ci: defconfig_check is included in
 defconfig build
Message-ID: <20200909073014.0C11980E3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc8ee069d268a67c29822f6b2913ce165458e7e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we build the defconfigs, we already check they are correct, so
there is no need to run the correctness check explicitly.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/generate-gitlab-ci-yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index ed56a516a7..23db376944 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -47,9 +47,10 @@ gen_defconfigs() {
     esac
 
     for cfg in "${defconfigs[@]}"; do
-        printf '%s_check: { extends: .defconfig_check }\n' "${cfg}"
         if ${build_defconfigs}; then
             printf '%s: { extends: .defconfig }\n' "${cfg}"
+        else
+            printf '%s_check: { extends: .defconfig_check }\n' "${cfg}"
         fi
     done
 }
