From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 18:14:21 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/cargo: pass
 appropriate library path to the linker
Message-ID: <20190128171404.4C9A181530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adad8807fe825d848dad971313f3f684ebc27e95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

When linking the host cargo binary, the linker should be told to find
libraries in $(HOST_DIR)/lib, otherwise it will not work libraries
such as libhttp_parser. This was found with per-package directory
support, where the build failed with:

  = note: /usr/bin/ld: cannot find -lhttp_parser
          collect2: error: ld returned 1 exit status

In order to fix this, instead of passing -L$(HOST_DIR)/lib during the
build of Cargo, we make sure all flags in $(HOST_LDFLAGS) are passed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b5e1b51dd1ee68ee342a3340c9c947c083861eb8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cargo/cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index 3fd088d727..666e0bc77b 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -70,7 +70,7 @@ HOST_CARGO_SNAP_OPTS = \
 	$(if $(VERBOSE),--verbose)
 
 HOST_CARGO_ENV = \
-	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib" \
+	RUSTFLAGS="$(addprefix -Clink-arg=,$(HOST_LDFLAGS))" \
 	CARGO_HOME=$(HOST_CARGO_HOME)
 
 define HOST_CARGO_BUILD_CMDS
