From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 16 Jun 2017 14:37:09 -0500
Subject: [Buildroot] [PATCH 1/1] br2-external: Check for invalid BR2_EXTERNAL
Message-ID: <1497641829-32201-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Judd Meinders <judd.meinders@rockwellcollins.com>

This patch checks for BR2_EXTERNAL paths that begin with "../" which
do not work with multiple external support.

Signed-off-by: Judd Meinders <judd.meinders@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 support/scripts/br2-external | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 00cb57d..b695400 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -75,6 +75,10 @@ do_validate_one() {
     local br2_ext="${1}"
     local br2_name br2_desc n d
 
+    # Check for BR2_EXTERNAL paths that begin with "../"
+    if [[ "${br2_ext}" =~ ^\.\./ ]]; then
+        error "'%s': BR2_EXTERNAL must begin as an absolute path" "${br2_ext}"
+    fi
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
     fi
-- 
1.9.1
