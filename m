From: Louis des Landes <louis@psykar.com>
Date: Wed, 17 Apr 2019 09:39:31 +0930
Subject: [Buildroot] [PATCH 2/2] package/pkg-generic: add chmod when
 cleaning.
In-Reply-To: <20190417000931.5356-1-louis.deslandes@fleet.space>
References: <20190417000931.5356-1-louis.deslandes@fleet.space>
Message-ID: <20190417000931.5356-2-louis.deslandes@fleet.space>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some build systems (looking at you golang) create read only directories
as caches.
As such rm -rf will actually fail, causing clean and <pkg>-dirclean to fail.

This patch will cause `make <pkg>-dirclean` to force chmod -R +w on the relevant
directory first, which will allow rm -rf to work.

This may be resolved if https://github.com/golang/go/issues/31481 is
resolved satisfactorily.

Signed-off-by: Louis des Landes <louis.deslandes@fleet.space>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 67782138b4..fd72fc8cf5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -346,6 +346,10 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
+	# Some build systems (looking at you golang) create read only directories
+	# As such rm -rf will actually fail, so brute force them all to writeable
+	# before removing them.
+	chmod -R u+w $(@D)
 	rm -Rf $(@D)
 
 ################################################################################
-- 
2.21.0
