From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Oct 2016 21:53:02 +0200
Subject: [Buildroot] [PATCH] core/br2-external: export paths and descriptions
Message-ID: <1476906782-30017-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we support multiple br2-external trees, BR2_EXTERNAL is no
longer exported in the environment.

This means that post-build scripts in a br2-external tree can no longer
find their own files (well, they could re-invent the path by stripping
their known-relative path, but that'd be ugly, especially since we can
very well provide it).

Export the path for each br2-external trees as environment variables.
Do so for the description as well, as a courtesy.

Also, re-order variable definitions to be more logical: first, purely
internal variables, then exported variables.

Reported-by: Beno?t Allard <benoit.allard@greenbone.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Beno?t Allard <benoit.allard@greenbone.net>
---
 support/scripts/br2-external | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 038525e..848c851 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -142,10 +142,10 @@ do_mk() {
         br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
         printf '\n'
         printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
-        printf 'BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
-        printf 'BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
         printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
         printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
+        printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
+        printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
     done
 }
 
-- 
2.7.4
