From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Dec 2013 18:39:13 +0100
Subject: [Buildroot] [PATCH 4/4] graphs: support generating png graphs
In-Reply-To: <cover.1388252053.git.yann.morin.1998@free.fr>
References: <cover.1388252053.git.yann.morin.1998@free.fr>
Message-ID: <79c7bfa1de8bbca2c30fe6e29cec4387e2b2a6b3.1388252053.git.yann.morin.1998@free.fr>
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
 Makefile                         | 9 ++++++---
 docs/manual/common-usage.txt     | 2 ++
 package/pkg-generic.mk           | 2 +-
 support/scripts/graph-build-time | 3 +--
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 8107865..4320e7b 100644
--- a/Makefile
+++ b/Makefile
@@ -121,6 +121,9 @@ else
   $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
 endif
 
+# Need that early, before we scan packages
+# Avoids doing the $(or...) everytime
+BR2_GRAPH_OUT := $(or $(GRAPH_OUT),pdf)
 
 BUILD_DIR:=$(BASE_DIR)/build
 STAMP_DIR:=$(BASE_DIR)/stamps
@@ -635,17 +638,17 @@ graph-build: $(O)/build/build-time.log
 	@install -d $(O)/graphs
 	$(foreach o,name build duration,./support/scripts/graph-build-time \
 					--type=histogram --order=$(o) --input=$(<) \
-					--output=$(O)/graphs/build.hist-$(o).pdf \
+					--output=$(O)/graphs/build.hist-$(o).$(BR2_GRAPH_OUT) \
 					$(if $(GRAPH_ALT),--alternate-colors)$(sep))
 	$(foreach t,packages steps,./support/scripts/graph-build-time \
 				   --type=pie-$(t) --input=$(<) \
-				   --output=$(O)/graphs/build.pie-$(t).pdf \
+				   --output=$(O)/graphs/build.pie-$(t).$(BR2_GRAPH_OUT) \
 				   $(if $(GRAPH_ALT),--alternate-colors)$(sep))
 
 graph-depends:
 	@$(INSTALL) -d $(O)/graphs
 	@./support/scripts/graph-depends \
-	|dot -Tpdf -o $(O)/graphs/$(@).pdf
+	|dot -T$(BR2_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR2_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 7c76942..c7e4568 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -88,6 +88,8 @@ to +make+ or set in the environment:
   is the recommended way of setting it.
 * +GRAPH_ALT+, if set and non-empty, to use an alternate color-scheme in
   build-time graphs
+* +GRAPH_OUT+ to set the filetype of generated graphs, either +pdf+ (the
+  default), or +png+.
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8005ce9..b519d69 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -471,7 +471,7 @@ $(1)-show-depends:
 $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
 			@./support/scripts/graph-depends $(1) \
-			|dot -Tpdf -o $(O)/graphs/$$(@).pdf
+			|dot -T$(BR2_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR2_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 2216db2..00c2349 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -51,7 +51,6 @@
 
 import matplotlib
 import numpy
-matplotlib.use('PDF')
 
 import matplotlib.pyplot as plt
 import matplotlib.font_manager as fm
@@ -264,7 +263,7 @@ parser.add_argument("--alternate-colors", '-c', action="store_true",
 parser.add_argument("--input", '-i', metavar="OUTPUT",
                     help="Input file (usually $(O)/build/build-time.log)")
 parser.add_argument("--output", '-o', metavar="OUTPUT", required=True,
-                    help="Output file (PDF extension)")
+                    help="Output file (.pdf or .png extension)")
 args = parser.parse_args()
 
 d = read_data(args.input)
-- 
1.8.1.2
