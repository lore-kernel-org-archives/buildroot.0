From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 22:46:22 +0100
Subject: [Buildroot] [git commit] package/llvm: specify
 LLVM_ENABLE_BINDINGS=OFF
Message-ID: <20200318215635.7224582621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6a1ee9a8aee9faecb8d1d1bdd8697d18c23b605
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LLVM builds bindings for other languages such as Go and OCaml when the
appropriate dependencies can be found. We currently don't support
building these bindings in Buildroot, as they're currently unused by any
package.

Building these bindings was originally disabled by overriding the
dependencies with values indicating that they were not found.

Newer versions of LLVM no longer disable the OCaml bindings when overriding
OCAMLFIND. Consequently, the build process attempts to install the bindings
to the default location on the host of /usr/lib/ocaml/llvm, causing a
permissions error and build failure.

Additionally, LLVM has since added the variable LLVM_ENABLE_BINDINGS to
control whether bindings are enabled, so we override that to disable the
bindings.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/llvm/llvm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/llvm/llvm.mk b/package/llvm/llvm.mk
index 28ad6a5704..f1034f0365 100644
--- a/package/llvm/llvm.mk
+++ b/package/llvm/llvm.mk
@@ -193,7 +193,8 @@ LLVM_CONF_OPTS += -DLLVM_HOST_TRIPLE=$(GNU_TARGET_NAME)
 # check preventively. Building the Go and OCaml bindings is yet unsupported.
 HOST_LLVM_CONF_OPTS += \
 	-DGO_EXECUTABLE=GO_EXECUTABLE-NOTFOUND \
-	-DOCAMLFIND=OCAMLFIND-NOTFOUND
+	-DOCAMLFIND=OCAMLFIND-NOTFOUND \
+	-DLLVM_ENABLE_BINDINGS=OFF
 
 # Builds a release host tablegen that gets used during the LLVM build.
 HOST_LLVM_CONF_OPTS += -DLLVM_OPTIMIZED_TABLEGEN=ON
