From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2019 23:04:40 +0200
Subject: [Buildroot] [git commit] scanpypi: write every license file once
Message-ID: <20191011210447.C96648D48E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=143f135833a94e973d5921a09b9791f8aa008d40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some cases, when the package contains multiple license files
and some of them from the same type, the scanpypi script will write
the same license type more than once under _LICENSE.
Hence, before creating the _LICENSE variable, we'll remove every
possible duplication.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/scanpypi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index 55b3d1e61c..b48eda49aa 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -461,6 +461,7 @@ class BuildrootPackage():
                       ' likely wrong, please change it if need be'.format(
                           license=', '.join(licenses)))
                 licenses = [self.metadata['info']['license']]
+            licenses = set(licenses)
             license_line = '{name}_LICENSE = {license}\n'.format(
                 name=self.mk_name,
                 license=', '.join(licenses))
@@ -473,6 +474,7 @@ class BuildrootPackage():
                     license_names.append(match.license.id)
                 else:
                     license_names.append("FIXME: license id couldn't be detected")
+            license_names = set(license_names)
 
             if len(license_names) > 0:
                 license_line = ('{name}_LICENSE ='
