From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 21:58:32 +0100
Subject: [Buildroot] [git commit] Makefile: printvars: don't print anything
 when VARS is not set
Message-ID: <20190312205609.1F00A8E21E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd5bd12379dcacc9ca359a40624148e8c3fea3c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using 'make printvars' for printing all variables is not very useful.
E.g. all macros will output some bogus value. In addition, the same can
be achieved with 'make -p'.

We can simply remove the condition on $(VARS). If VARS is not set, the
filter expression will be empty which matches nothing, so nothing is
printed.

Note that the old behaviour can still be achieved with:
make printvars VARS=%

Update the 'make help' text to match the new behaviour.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a64196f9c3..6af8923892 100644
--- a/Makefile
+++ b/Makefile
@@ -1031,7 +1031,7 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 printvars:
 	@:
 	$(foreach V, \
-		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
+		$(sort $(filter $(VARS),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
 		$(if $(QUOTED_VARS),\
@@ -1124,7 +1124,7 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
-	@echo '  printvars              - dump all the internal variables'
+	@echo '  printvars              - dump internal variables selected with VARS=...'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
