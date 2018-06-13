From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 13 Jun 2018 09:37:10 +0200
Subject: [Buildroot] [PATCH] scanpypi: rework download_package error handling
Message-ID: <20180613073710.5715-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Some packages don't provide source archive but only a wheel file. In
this case download variable is not defined. So define this variable at
the very beginning and check whether it is None after searching for
source archives in the metadata.

Bonus: fix PEP8 issue with wrong indentation.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 utils/scanpypi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 8a2ae00434..12c96b842e 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -178,6 +178,7 @@ class BuildrootPackage():
         """
         Download a package using metadata from pypi
         """
+        download = None
         try:
             self.metadata['urls'][0]['filename']
         except IndexError:
@@ -201,7 +202,7 @@ class BuildrootPackage():
                 continue
             try:
                 print('Downloading package {pkg} from {url}...'.format(
-                      pkg=self.real_name, url=download_url['url']))
+                    pkg=self.real_name, url=download_url['url']))
                 download = six.moves.urllib.request.urlopen(download_url['url'])
             except six.moves.urllib.error.HTTPError as http_error:
                 download = http_error
@@ -213,11 +214,14 @@ class BuildrootPackage():
                 self.md5_sum = hashlib.md5(self.as_string).hexdigest()
                 if self.md5_sum == download_url['digests']['md5']:
                     break
-        else:
-            if download.__class__ == six.moves.urllib.error.HTTPError:
-                raise download
-            raise DownloadFailed('Failed to download package {pkg}'
+
+        if download is None:
+            raise DownloadFailed('Failed to download package {pkg}: '
+                                 'No source archive available'
                                  .format(pkg=self.real_name))
+        elif download.__class__ == six.moves.urllib.error.HTTPError:
+            raise download
+
         self.filename = self.used_url['filename']
         self.url = self.used_url['url']
 
-- 
2.17.0
