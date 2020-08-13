From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 13 Aug 2020 11:49:47 -0700
Subject: [Buildroot] [PATCH 1/1] package/mender-artifact: fix module
 permissions
Message-ID: <20200813184947.4042927-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Modules downloaded with "go mod" are downloaded as read-only, which the Go
maintainers have intentionally done.
https://github.com/golang/go/issues/27161

As mender-artifact now uses go modules, when cleaning, a user will receive
permission-denied errors due to the above issue.

The fix, however, is relatively straight forward. Setting the "-mod=vendor"
flag in the GO_ENV will set go modules to read/write, which allows
"make clean" to work correctly.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender-artifact/mender-artifact.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index c81ec9ba53..b3869518ed 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -31,6 +31,8 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
+HOST_MENDER_ARTIFACT_GO_ENV = GOFLAGS="-mod=vendor"
+
 HOST_MENDER_ARTIFACT_LDFLAGS = -X main.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
 HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact
-- 
2.26.2
