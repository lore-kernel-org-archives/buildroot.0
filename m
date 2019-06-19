From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 19 Jun 2019 22:17:32 +0200
Subject: [Buildroot] [PATCH] package/pkg-utils.mk: add dl_dir to show-info
 output
Message-ID: <20190619201732.24027-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It can be useful for scripts to be able to access a package's source
file after download. That used to be easy, just DL_DIR/PKG_SOURCE.
However, with the subdirectories in DL_DIR which can be overridden with
PKG_DL_SUBDIR, that is no longer easy.

Therefore, this patch adds dl_dir to the downloads list of a package. It
can be used with the following jq script to get a newline-separated list
of all downloaded files:

make show-info | jq -r '.[].downloads[]? | (.dl_dir + "/" + .source)'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b7280e930f..4de0bc042c 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -104,7 +104,8 @@ define _json-info-pkg-details
 						$(call DOWNLOAD_URIS,$(dl),$(1))
 					)
 				)
-			]
+			],
+			"dl_dir": "$($(1)_DL_DIR)"
 		},
 	)
 	],
-- 
2.21.0
