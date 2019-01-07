From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:35 +0100
Subject: [Buildroot] [PATCH 13/19] support/check-uniq-file: invert condition
 logic
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <fc50adf73931296de20a04934cad47eadb56707b.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently have a single condition to test for to decide whether a
file should be reported or not, but in the future we're going to add
more conditions.

Invert the logic so that we can easily add such checks.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-uniq-files | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index 7020462981..cf9ea292bc 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -40,10 +40,12 @@ def main():
         file_to_pkg[record['file']].add(record['pkg'])
 
     for file in file_to_pkg:
-        if len(file_to_pkg[file]) > 1:
-            sys.stderr.write(warn.format(args.type, str_decode(file),
-                                         ", ".join([str_decode(p)
-                                                    for p in file_to_pkg[file]])))
+        if len(file_to_pkg[file]) == 1:
+            continue
+
+        sys.stderr.write(warn.format(args.type, str_decode(file),
+                                     ", ".join([str_decode(p)
+                                                for p in file_to_pkg[file]])))
 
 
 if __name__ == "__main__":
-- 
2.14.1
