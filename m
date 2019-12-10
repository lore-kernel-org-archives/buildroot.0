From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:51 +0100
Subject: [Buildroot] [PATCH 12/12] package/rust-bin: add missing extract
 dependencies
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191210215952.902477-13-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rust-bin uses suitable-extractor to manually extract a tarball, so it
should have the appropriate package dependencies added to
<pkg>_EXTRACT_DEPENDENCIES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index a374215e20..526c45a45e 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -32,7 +32,9 @@ define HOST_RUST_BIN_LIBSTD_EXTRACT
 	cd $(@D)/rustc/lib/rustlib/$(RUSTC_HOST_NAME)/lib; \
 		ln -sf ../../../../../std/$(HOST_RUST_BIN_LIBSTD_HOST_PREFIX)/lib/rustlib/$(RUSTC_HOST_NAME)/lib/* .
 endef
-
+HOST_RUST_BIN_EXTRACT_DEPENDENCIES += \
+	$(foreach f,$(HOST_RUST_BIN_EXTRA_DOWNLOADS),\
+		$(call extractor-pkg-dependency,$(f)))
 HOST_RUST_BIN_POST_EXTRACT_HOOKS += HOST_RUST_BIN_LIBSTD_EXTRACT
 
 HOST_RUST_BIN_INSTALL_OPTS = \
-- 
2.23.0
