From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Wed, 28 Feb 2018 09:38:52 -0800
Subject: [Buildroot] [PATCH 1/1] rust: make sure the cxx compiler is also
 set for the target
Message-ID: <20180228173852.66069-1-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

Noticed that building the LLVM build -DCMAKE_CXX_COMPILER=c++
during the rust build which the C compiler was set to the
expected buildroot compiler. So, update the toml file to
also set the cxx variable.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/rust/rust.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index ff2634b996..9ea4c79af5 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -62,7 +62,10 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo '[rust]'; \
 		echo 'use-jemalloc = $(HOST_RUST_JEMALLOC_ENABLED)'; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
-		echo 'cc = "$(TARGET_CROSS)gcc"'; \
+		if [ "x$(RUSTC_HOST_NAME)" != "x$(RUSTC_TARGET_NAME)" ]; then \
+			echo 'cc = "$(TARGET_CROSS)gcc"'; \
+			echo 'cxx = "$(TARGET_CROSS)g++"'; \
+		fi; \
 		echo $(HOST_RUST_JEMALLOC_CONF); \
 	) > $(@D)/config.toml
 endef
-- 
2.14.3 (Apple Git-98)
