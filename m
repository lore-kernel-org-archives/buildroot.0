From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:48 +0100
Subject: [Buildroot] [PATCH next 03/12] package/pkg-download.mk: add
 <pkg>_DL_ENV variable
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-4-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This variable can be used by package to pass extra environment
variables to the download logic. It will be used for the Go/Cargo
vendoring.

The <pkg>_DL_ENV variable is intentionally not documented: at this
point, it is not meant to be used by packages directly, but only by
package infrastructures.

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-download.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 175b9d7dba..c914d016e2 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -99,7 +99,9 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(2)_DL_DIR)
-	$(Q)$(EXTRA_ENV) flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
+	$(Q)$(EXTRA_ENV) \
+		$($(2)_DL_ENV) \
+		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
 		-d '$($(2)_DL_DIR)' \
 		-D '$(DL_DIR)' \
-- 
2.28.0
