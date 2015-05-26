From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:01 +0200
Subject: [Buildroot] [PATCH 06/21 RFC] doc/asciidoc: add possibility to
	define document dependencies
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <ac0d74676c273b2b77105182193c8990e8292a6f.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, a document can not have dependencies, except for the purely
internal ones (like checking asciidoc version, and presence of dblatex).

For our own manual, this will come in handy when we introduce a
generated kconfig snippet, so we can actually make the manual depend on
that snippet being generated first.

For external documents, it can be used to depend on host-packages if
need be (e.g. a custom host packages that generates specific media files
included in the manual).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/adding-packages-asciidoc.txt | 3 +++
 package/doc-asciidoc.mk                  | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
index 6e21786..0c10fd1 100644
--- a/docs/manual/adding-packages-asciidoc.txt
+++ b/docs/manual/adding-packages-asciidoc.txt
@@ -63,6 +63,9 @@ information is (assuming the document name is +foo+) :
   to one or more directories containing so-called resources (like CSS or
   images). By default, empty.
 
+* +FOO_DEPENDENCIES+, optional, the list of packages (most probably,
+  host-packages) that must be built before building this document.
+
 There are also additional hooks (see xref:hooks[] for general information
 on hooks), that a document may set to define extra actions to be done at
 various steps:
diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index 6ab5ad2..ede6ed1 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -140,7 +140,7 @@ endef
 ################################################################################
 define ASCIIDOC
 # Single line, because splitting a foreach is not easy...
-$(1)-check-dependencies: asciidoc-check-dependencies
+$(1)-check-dependencies: asciidoc-check-dependencies $$($(2)_DEPENDENCIES)
 	$$(Q)$$(foreach hook,$$($(2)_CHECK_DEPENDENCIES_HOOKS),$$(call $$(hook))$$(sep))
 
 # Single line, because splitting a foreach is not easy...
-- 
1.9.1
