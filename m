From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 23 Jul 2019 15:33:55 +0300
Subject: [Buildroot] [PATCH 1/1] pkg-infra/show-info: dump install_{staging,
 target} info
Message-ID: <20190723123355.22313-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

provide info if the package will be installed to staging/target
destinations. Might be useful for analyzing the packages which
installed only for target/staging.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/pkg-utils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b7280e930f..81222565bf 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -94,6 +94,14 @@ endef
 define _json-info-pkg-details
 	"version": "$($(1)_DL_VERSION)",
 	"licenses": "$($(1)_LICENSE)",
+	$(if $($(1)_INSTALL_TARGET), \
+		"install_target": true$(comma),
+		"install_target": false$(comma)
+	)
+	$(if $($(1)_INSTALL_STAGING), \
+		"install_staging": true$(comma),
+		"install_staging": false$(comma)
+	)
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
 		{
-- 
2.17.1
