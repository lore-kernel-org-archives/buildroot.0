From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat,  3 Aug 2019 15:49:33 +0200
Subject: [Buildroot] [PATCH] package/pkg-utils.mk: add dl_dir to show-info
 output
Message-ID: <20190803134933.27050-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It can be useful for scripts to be able to access a package's source
file after download. That used to be easy, just DL_DIR/PKG_SOURCE.
However, with the subdirectories in DL_DIR which can be overridden with
PKG_DL_SUBDIR, that is no longer easy.

Therefore, this patch adds dl_dir to the package information. It prints
just PKG_DL_SUBDIR, to avoid dumping absolute paths to the buildroot
directory in the show-info output.

It can be used with the following jq script to get a newline-separated
list of all downloaded files:

make show-info | jq -r '.[] | ("dl/" + .dl_dir + "/" + .downloads[]?.source)'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
v1 -> v2:
 - Use DL_SUBDIR (i.e. relative path) instead of DL_DIR (i.e. absolute
   path). (Yann)
 - Move the definition one level higher, because it is anyway the same
   for all sources. (Yann)
 - Update jq script in commit message to handle the above.
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b7280e930f..d3345f7c91 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -94,6 +94,7 @@ endef
 define _json-info-pkg-details
 	"version": "$($(1)_DL_VERSION)",
 	"licenses": "$($(1)_LICENSE)",
+	"dl_dir": "$($(1)_DL_SUBDIR)",
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
 		{
@@ -104,8 +105,7 @@ define _json-info-pkg-details
 						$(call DOWNLOAD_URIS,$(dl),$(1))
 					)
 				)
-			]
-		},
+			]		},
 	)
 	],
 endef
-- 
2.21.0
