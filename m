From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:40 +0100
Subject: [Buildroot] [PATCH v6 18/28] package/cmake: Fix for using -O in
 top-level make
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-19-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Setting -O in top level make somehow interferes with the explicit setting of
-jX in the cmake bootstrap script. Avoid passing down MAKEFLAGS in the configure
case.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/cmake/cmake.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1f30736023..690603b09c 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -41,6 +41,7 @@ define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CMAKE_CFLAGS)" \
+		MAKEFLAGS= \
 		./bootstrap --prefix=$(HOST_DIR) \
 			--parallel=$(PARALLEL_JOBS) -- \
 			-DCMAKE_C_FLAGS="$(HOST_CMAKE_CFLAGS)" \
-- 
2.25.0
