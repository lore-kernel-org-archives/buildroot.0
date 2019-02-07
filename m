From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 7 Feb 2019 22:09:55 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8
 errors
Message-ID: <20190207210833.7B6D48120D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f6587266e6cef81918f24c0c1c2bf9a654a2ac1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following flake8 warnings:

support/scripts/pkg-stats:34:2: W605 invalid escape sequence '\$'
support/scripts/pkg-stats:34:4: W605 invalid escape sequence '\('
support/scripts/pkg-stats:34:11: W605 invalid escape sequence '\$'
support/scripts/pkg-stats:34:13: W605 invalid escape sequence '\('
support/scripts/pkg-stats:34:32: W605 invalid escape sequence '\)'
support/scripts/pkg-stats:34:34: W605 invalid escape sequence '\)'
support/scripts/pkg-stats:35:2: W605 invalid escape sequence '\s'
support/scripts/pkg-stats:35:14: W605 invalid escape sequence '\S'
support/scripts/pkg-stats:35:17: W605 invalid escape sequence '\s'
support/scripts/pkg-stats:42:1: E302 expected 2 blank lines, found 1
support/scripts/pkg-stats:587:133: E501 line too long (157 > 132 characters)

Note that the "invalid escape sequence" errors work because Python
leaves the \ in place if it doesn't recognise the escape sequence. But
it's better practice to use a raw string for regular expressions.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/pkg-stats | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index edc78b827b..b0be7d919b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -31,14 +31,15 @@ from urllib3 import HTTPSConnectionPool
 from urllib3.exceptions import HTTPError
 from multiprocessing import Pool
 
-INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
-URL_RE = re.compile("\s*https?://\S*\s*$")
+INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
+URL_RE = re.compile(r"\s*https?://\S*\s*$")
 
 RM_API_STATUS_ERROR = 1
 RM_API_STATUS_FOUND_BY_DISTRO = 2
 RM_API_STATUS_FOUND_BY_PATTERN = 3
 RM_API_STATUS_NOT_FOUND = 4
 
+
 class Package:
     all_licenses = list()
     all_license_files = list()
@@ -584,7 +585,8 @@ def dump_html_pkg(f, pkg):
         if pkg.latest_version[1] is None:
             latest_version_text = "<b>Found, but no version</b>"
         else:
-            latest_version_text = "<a href=\"https://release-monitoring.org/project/%s\"><b>%s</b></a>" % (pkg.latest_version[2], str(pkg.latest_version[1]))
+            latest_version_text = "<a href=\"https://release-monitoring.org/project/%s\"><b>%s</b></a>" % \
+                (pkg.latest_version[2], str(pkg.latest_version[1]))
 
         latest_version_text += "<br/>"
 
