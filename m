From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Apr 2016 23:20:18 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "core: add the possibility to
	provide help for custom rules"
In-Reply-To: <cover.1460841291.git.yann.morin.1998@free.fr>
References: <cover.1460841291.git.yann.morin.1998@free.fr>
Message-ID: <433663cc842dbcbfbbde08d84d199682ca0b9518.1460841291.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 84c825f8e893bfb56847ab4a880c46066a41744f.

Turns out that the custom help is not available when the $(O) directory
has not been configure yet (i.e. when there is no .config already
filled).

Rather than trying to work around this limitation with dirty hacks, just
revert this feature. After all, this will not prevent an external.mk
from providing custom help anyway; it's just not gonna be advertised nor
displayed with the main help.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: J?r?me Pouiller <jezz@sysmic.org>
---
 Makefile                             |  7 -------
 docs/manual/customize-outside-br.txt | 14 --------------
 2 files changed, 21 deletions(-)

diff --git a/Makefile b/Makefile
index d205ac9..0e4beb2 100644
--- a/Makefile
+++ b/Makefile
@@ -968,7 +968,6 @@ endif
 	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
-	@echo '  help-custom            - print help about custom actions (if any)'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
@@ -977,12 +976,6 @@ endif
 	@echo 'it on-line at http://buildroot.org/docs.html'
 	@echo
 
-# This rule does nothing, it is expected to be overloaded by
-# a br2-external tree or a local.mk . However, it must exist,
-# as we reference it in the main help, above. Making the rule
-# .PHONY does not work.
-help-custom:
-
 list-defconfigs:
 	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index be1827e..9ad177d 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -107,17 +107,3 @@ And then in +$(BR2_EXTERNAL)/package/package1+ and
    output of +make list-defconfigs+ and allow them to be loaded with the
    normal +make <name>_defconfig+ command. They will be visible under the
    +User-provided configs+' label in the 'make list-defconfigs' output.
-
-Additionally, an +external.mk+ file may define the +help-custom+ make
-rule, to document custom make targets specific to this +BR2_EXTERNAL+
-tree. The help is completely free-form.
-
-------
-help-custom:
-    @echo 'Here goes your local help, where you may'
-    @echo 'describe some custom rules:'
-    @echo '  my-rule       - do something'
-    @echo '  my-other-rule - do something else'
-    @echo
-    @echo 'Please contact support at company.com in case of problem.'
-------
-- 
1.9.1
