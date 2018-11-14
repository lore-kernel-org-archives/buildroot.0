From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 23:35:48 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] utils/scanpypi: use
 archive file name to specify the extraction folder
Message-ID: <20181114223323.B05A6836D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea1bf543b7753fba8f164808189177e10a21cbf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Some packages have archive name that is different from package name.
For example websocket-client's archive name is websocket_client-*.tar.gz.
scanpypi expects the temporary extract folder to be:

/tmp-folder/BR-package-name/PyPI-packagename-and-version

In the case of websocket-client package the real extraction folder
will be different from the expected one because of the '_' in the
archive file name.

Use archive file name instead of package name to specify the extraction
folder. As the version is already part of this file, we don't need to
specify it.

Bonus: remove obsolete "return None, None" as the function doesn't return
anything. OSError class doesn't provide "message" member, so replace it
with "strerror".

Fixes:
https://bugs.busybox.net/show_bug.cgi?id=11251

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fd29797f659c09cbc2aeba33f8d6f5b992e65cd4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 56b9f420ff..cb4b5e76a3 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -227,13 +227,14 @@ class BuildrootPackage():
                     os.makedirs(tmp_pkg)
                 except OSError as exception:
                     if exception.errno != errno.EEXIST:
-                        print("ERROR: ", exception.message, file=sys.stderr)
-                        return None, None
-                    print('WARNING:', exception.message, file=sys.stderr)
+                        print("ERROR: ", exception.strerror, file=sys.stderr)
+                        return
+                    print('WARNING:', exception.strerror, file=sys.stderr)
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
                     os.makedirs(tmp_pkg)
                 as_zipfile.extractall(tmp_pkg)
+                pkg_filename = self.filename.split(".zip")[0]
         else:
             with tarfile.open(fileobj=as_file) as as_tarfile:
                 tmp_pkg = os.path.join(tmp_path, self.buildroot_name)
@@ -241,19 +242,19 @@ class BuildrootPackage():
                     os.makedirs(tmp_pkg)
                 except OSError as exception:
                     if exception.errno != errno.EEXIST:
-                        print("ERROR: ", exception.message, file=sys.stderr)
-                        return None, None
-                    print('WARNING:', exception.message, file=sys.stderr)
+                        print("ERROR: ", exception.strerror, file=sys.stderr)
+                        return
+                    print('WARNING:', exception.strerror, file=sys.stderr)
                     print('Removing {pkg}...'.format(pkg=tmp_pkg))
                     shutil.rmtree(tmp_pkg)
                     os.makedirs(tmp_pkg)
                 as_tarfile.extractall(tmp_pkg)
+                pkg_filename = self.filename.split(".tar")[0]
 
-        tmp_extract = '{folder}/{name}-{version}'
+        tmp_extract = '{folder}/{name}'
         self.tmp_extract = tmp_extract.format(
             folder=tmp_pkg,
-            name=self.metadata_name,
-            version=self.version)
+            name=pkg_filename)
 
     def load_setup(self):
         """
