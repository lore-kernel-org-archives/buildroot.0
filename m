From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Tue, 11 Dec 2018 15:05:44 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/check-uniq-files: Only
 report each package once
Message-ID: <1544537144-10197-1-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebuilding the same package should not trigger
a 'touched by more than one package' warning

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 support/scripts/check-uniq-files | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/check-uniq-files b/support/scripts/check-uniq-files
index fbc6b5d..03faa71 100755
--- a/support/scripts/check-uniq-files
+++ b/support/scripts/check-uniq-files
@@ -28,7 +28,8 @@ def main():
     with open(args.packages_file_list[0], 'rb') as pkg_file_list:
         for line in pkg_file_list.readlines():
             pkg, _, file = line.rstrip(b'\n').partition(b',')
-            file_to_pkg[file].append(pkg)
+            if not pkg in file_to_pkg[file]:
+                file_to_pkg[file].append(pkg)
 
     for file in file_to_pkg:
         if len(file_to_pkg[file]) > 1:
-- 
2.7.4
