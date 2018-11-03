From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat,  3 Nov 2018 01:56:20 -0300
Subject: [Buildroot] [PATCH 1/5] check-package: fix check of file in current
 dir with -b
In-Reply-To: <20181103045624.31059-1-ricardo.martincoski@gmail.com>
References: <20181103045624.31059-1-ricardo.martincoski@gmail.com>
Message-ID: <20181103045624.31059-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

One of the possible usages of check-package is to first cd to the
directory that contains the files to test (e.g. a package directory) and
then call the script passing the files in the current dir.
It already works when used for intree files, but for files in a
br2-external it throws an exception because some check functions (from
utils/checkpackagelib/lib_*.py) do need the name of the file being
processed and assume there will be a slash before the name.

Notice RemoveDefaultPackageSourceVariable and TypoInPackageVariable lead
to an exception in this case, but ApplyOrder instead generates a false
warning.

Instead of fixing any check function that could lead to different
behaviour when the script is called with -b for a file in the current
directory, always use the absolute path of the file being checked when
-b was passed. A small drawback is that the warning messages will occupy
more columns in this case, but this approach is more future-proof as new
check functions may also need to depend on the name of the file being
processed.

Fixes bug #11271.

Reported-by: Vitaliy Lotorev <lotorev@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/check-package | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index 3dbc28b0a2..aa6993dabd 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -148,7 +148,7 @@ def __main__():
         # move current dir so the script find the files
         os.chdir(base_dir)
     else:
-        files_to_check = flags.files
+        files_to_check = [os.path.abspath(f) for f in flags.files]
 
     if len(files_to_check) == 0:
         print("No files to check style")
-- 
2.17.1
