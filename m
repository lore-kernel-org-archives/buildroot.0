From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  7 Feb 2020 19:08:21 +0100
Subject: [Buildroot] [PATCH v3 02/10] package/rust: build and install cargo
In-Reply-To: <20200207180829.165689-1-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
Message-ID: <20200207180829.165689-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Cargo source code is not provided anymore as a separate tarball but is
now built along with the Rust compiler.

So update rust host variant to build Cargo and install the
cross-compilation configuration file.

All this will be overwritten again by the host-cargo package, but
that will be removed in later commits.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Tested-by: Sam Voss <sam.voss@rockwellcollins.com>
[Arnout: merge all install commands in HOST_RUST_INSTALL_CMDS]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rust/rust.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 5d14fc6682..9bbed15082 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -47,11 +47,14 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'python = "$(HOST_DIR)/bin/python2"'; \
 		echo 'submodules = false'; \
 		echo 'vendor = true'; \
+		echo 'extended = true'; \
+		echo 'tools = ["cargo"]'; \
 		echo 'compiler-docs = false'; \
 		echo 'docs = false'; \
 		echo 'verbose = $(HOST_RUST_VERBOSITY)'; \
 		echo '[install]'; \
 		echo 'prefix = "$(HOST_DIR)"'; \
+		echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
 		echo '[rust]'; \
 		echo 'channel = "stable"'; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
-- 
2.24.1
