From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:27 +0200
Subject: [Buildroot] [git commit] docs/manual: rename the generic dependency
	rules
Message-ID: <20141012072419.D954BB1B51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2ece0cf8d9c353b277e550d54d4aeb40697463a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

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
