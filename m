From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 00:12:52 +0100
Subject: [Buildroot] [PATCH 4/4] graphs: support generating png graphs
In-Reply-To: <cover.1388185918.git.yann.morin.1998@free.fr>
References: <cover.1388185918.git.yann.morin.1998@free.fr>
Message-ID: <22105197db33dde1f1cee82511ce9c6d00d86853.1388185918.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

PDF files can not be easily embedded in other documents (eg. ODT, or HTML).

Add support for generating PNG graphs, by setting the GRAPH_OUT=pdf|png on
the command line:
    make GRAPH_OUT=png graph-build graph-depends

The default is still to generate PDF graphs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                         | 15 +++++++++------
 support/scripts/graph-build-time |  3 +--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index f09f744..e85eec3 100644
--- a/Makefile
+++ b/Makefile
@@ -631,30 +631,32 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
 show-targets:
 	@echo $(TARGETS)
 
+BR2_GRAPH_OUT := $(or $(GRAPH_OUT),pdf)
+
 graph-build: $(O)/build/build-time.log
 	@install -d $(O)/graphs
 	$(foreach o,name build duration,./support/scripts/graph-build-time \
 					--type=histogram --order=$(o) \
-					--output=$(O)/graphs/build.hist-$(o).pdf \
+					--output=$(O)/graphs/build.hist-$(o).$(BR2_GRAPH_OUT) \
 					$(if $(GRAPH_ALT),--alternate-colors) \
 					<$(<)$(sep))
 	$(foreach t,packages steps,./support/scripts/graph-build-time \
 				   --type=pie-$(t) \
-				   --output=$(O)/graphs/build.pie-$(t).pdf \
+				   --output=$(O)/graphs/build.pie-$(t).$(BR2_GRAPH_OUT) \
 				   $(if $(GRAPH_ALT),--alternate-colors) \
 				   <$(<)$(sep))
 
 graph-depends:
 	@install -d $(O)/graphs
 	@./support/scripts/graph-depends \
-	|dot -Tpdf -o $(O)/graphs/graph-depends.pdf
-	-o $(O)/graphs/graph-depends.pdf
+	|dot -T$(BR2_GRAPH_OUT) \
+	-o $(O)/graphs/$(@).$(BR2_GRAPH_OUT)
 
 %-graph-depends:
 	@install -d $(O)/graphs
 	@./support/scripts/graph-depends $(@:-graph-depends=) \
-	|dot -Tpdf \
-	-o $(O)/graphs/$(@).pdf
+	|dot -T$(BR2_GRAPH_OUT) \
+	-o $(O)/graphs/$(@).$(BR2_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
@@ -880,6 +882,7 @@ endif
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
 	@echo '  make GRAPH_ALT=1       - use alternate color-scheme for build-time graphs'
+	@echo '  make GRAPH_OUT=pdf|png - generate either pdf (default) or png graphs'
 	@echo
 	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index a1a82eb..2611c2c 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -51,7 +51,6 @@
 
 import matplotlib
 import numpy
-matplotlib.use('PDF')
 
 import matplotlib.pyplot as plt
 import matplotlib.font_manager as fm
@@ -258,7 +257,7 @@ parser.add_argument("--order", metavar="GRAPH_ORDER",
 parser.add_argument("--alternate-colors", action="store_true",
                     help="Use alternate colour-scheme")
 parser.add_argument("--output", metavar="OUTPUT", required=True,
-                    help="Output file (PDF extension)")
+                    help="Output file (.pdf or .png extension)")
 args = parser.parse_args()
 
 d = read_data()
-- 
1.8.1.2
