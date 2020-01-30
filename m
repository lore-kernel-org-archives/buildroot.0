From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 30 Jan 2020 16:24:35 -0700
Subject: [Buildroot] [PATCH v4 1/1] package/nodejs: Remove --shared-zlib
 configure arg
Message-ID: <20200130232435.113452-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Preston <thomas.preston@codethink.co.uk>

The nodejs configure.py file orders zlib headers before the bundled ICU
headers. The zlib headers happen to be located in the system include
directory, next to some system ICU headers (not bundled). If these are
built before nodejs is, nodejs will get confused and try to use the
system ICU headers instead of the bundled ones.

Fix this by removing the --shared-zlib configure argument, since we
search in the system include directory after bundled ICU headers anyway.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/nodejs/nodejs.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e6eb73d576..205e8a8bd5 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -63,7 +63,6 @@ define HOST_NODEJS_CONFIGURE_CMDS
 		--shared-openssl \
 		--shared-openssl-includes=$(HOST_DIR)/include/openssl \
 		--shared-openssl-libpath=$(HOST_DIR)/lib \
-		--shared-zlib \
 		--no-cross-compiling \
 		--with-intl=small-icu \
 	)
-- 
2.20.1
