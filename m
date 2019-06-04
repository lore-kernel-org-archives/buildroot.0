From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  4 Jun 2019 23:07:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/mender-artifact: fix lzma detection
Message-ID: <20190604210753.15731-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use CGO_CFLAGS and CGO_LDFLAGS to help mender-artifact to find lzma.h
and link with liblzma (with a correct rpath)

Fixes:
 - http://autobuild.buildroot.org/results/b436d50a11687afa7021efc7eedd24fc337b0994

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mender-artifact/mender-artifact.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index f8b364166f..730bc69338 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -24,6 +24,9 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/sirupsen/logrus/LICENSE
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
+HOST_MENDER_ARTIFACT_GO_ENV = \
+	CGO_CFLAGS=-I$(HOST_DIR)/usr/include \
+	CGO_LDFLAGS="-L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib"
 HOST_MENDER_ARTIFACT_LDFLAGS = -X main.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
 HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact
-- 
2.14.1
