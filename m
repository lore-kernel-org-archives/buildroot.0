From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:47 +0200
Subject: [Buildroot] [PATCH 13/25 v7] docs/manual: rename the generic
	dependency rules
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <49fa7aeb8585ca3a3f1061426ee2e47580493740.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those rules are generic, and not specific to our manual, we want them
always called:
  - manual-check-dependencies
  - manual-check-dependencies-pdf

So, rename them to be generic to gendoc.

Cascade the document's dependency checking to call those rules, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 docs/manual/manual.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 536f939..f6ef71e 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,6 +1,6 @@
 # we can't use suitable-host-package here because that's not available in
 # the context of 'make release'
-manual-check-dependencies:
+gendoc-check-dependencies:
 	$(Q)if [ -z "$(shell support/dependencies/check-host-asciidoc.sh)" ]; then \
 		echo "You need a sufficiently recent asciidoc on your host" \
 			"to generate documents"; \
@@ -11,7 +11,7 @@ manual-check-dependencies:
 		exit 1; \
 	fi
 
-manual-check-dependencies-pdf:
+gendoc-check-dependencies-pdf:
 	$(Q)if [ -z "`which dblatex 2>/dev/null`" ]; then \
 		echo "You need dblatex on your host to generate PDF documents"; \
 		exit 1; \
@@ -55,7 +55,10 @@ $(1): $(1)-$(5)
 .PHONY: $(1)-$(5)
 $(1)-$(5): $$(O)/docs/$(1)/$(1).$(6)
 
-$(1)-check-dependencies-$(5):
+$(1)-check-dependencies: gendoc-check-dependencies
+
+gendoc-check-dependencies-$(5):
+$(1)-check-dependencies-$(5): gendoc-check-dependencies-$(5)
 
 $(2)_$(4)_ASCIIDOC_CONF = $(3)/asciidoc-$(4).conf
 ifneq ($$(wildcard $$($(2)_$(4)_ASCIIDOC_CONF)),)
-- 
1.9.1
