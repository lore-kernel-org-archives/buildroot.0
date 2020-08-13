From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 13 Aug 2020 13:29:52 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/mender-artifact: do not download
 modules during the build process
Message-ID: <20200813202952.926828-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

By default, go will attempt to download needed modules before building, which
is not desirable. This behavior also causes permission issues when cleaning,
as go downloads modules as read-only by default. Because mender-artifact
includes the modules in the vendor directory, mod=vendor prevents the package
from downloading the go modules during the build process and prevents
permission issues when cleaning.

Fixes:
http://autobuild.buildroot.net/results/d5bcaca73ae74fe8b0ebd39b6331564cd639fb66

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Reword commit message
  - Add a comment in the .mk file

 package/mender-artifact/mender-artifact.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index c81ec9ba53..67fdc44b9d 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -31,6 +31,14 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
+# By default, go will attempt to download needed modules before building, which
+# is not desirable. This behavior also causes permission issues when cleaning,
+# as go downloads modules as read-only by default. Because mender-artifact
+# includes the modules in the vendor directory, mod=vendor prevents the package
+# from downloading the go modules during the build process and prevents
+# permission issues when cleaning.
+HOST_MENDER_ARTIFACT_GO_ENV = GOFLAGS="-mod=vendor"
+
 HOST_MENDER_ARTIFACT_LDFLAGS = -X main.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
 HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact
-- 
2.26.2
