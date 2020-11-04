From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Nov 2020 15:51:39 +0100
Subject: [Buildroot] [PATCH 05/10] package/pkg-utils.mk: expose CPE ID in
 show-info when available
In-Reply-To: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201104145145.1316167-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit exposes a new per-package property in the "make show-info"
JSON output: "cpe-id", which exists when a valid CPE ID is available
for the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 4fcb076e21..a2cc160d0b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -119,6 +119,9 @@ define _json-info-pkg
 	"reverse_dependencies": [
 		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
 	]
+	$(if $($(1)_CPE_ID_VALID), \
+		$(comma) "cpe-id": "$($(1)_CPE_ID)" \
+	)
 	$(if $($(1)_IGNORE_CVES),
 		$(comma) "ignore_cves": [
 			$(call make-comma-list,$(sort $($(1)_IGNORE_CVES)))
-- 
2.26.2
