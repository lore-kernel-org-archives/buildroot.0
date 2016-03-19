From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 16:41:22 +0100
Subject: [Buildroot] [git commit] core: add the possibility to provide help
	for custom rules
Message-ID: <20160320135249.BDDD081841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84c825f8e893bfb56847ab4a880c46066a41744f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using a br2-external tree, it is possible (as stated in our manual)
to implement whatever arbitrary extra make rules (such as flashing a
board, or extracting the rootfs in an NFS export...). Some of those
extra rules might be exposed to the user as new entry points that the
user can call by itself.

However, there is no way for the br2-external to advertise those new
rules in the help text.

We add the possibility to do so, by adding a new make rule, called
help-custom, advertised in our own help info.

It is up to the br2-external tree to provide whatever help text is
deemed necessary. The format of the help is completely free-form.

Note that we need to provide an empty, dummy help-custom rule, since it
is always advertised (making it .PHONY does not work). Since this rule
is empty, make gently reports that there is "Nothing to be done for
`help-local'", which is pretty well fitting when help-local was not
provided (either because there's no br2-external tree, or when the
br2-external tree does not provide it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J??r??me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                             |  7 +++++++
 docs/manual/customize-outside-br.txt | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Makefile b/Makefile
index 98c8dc7..7bb5f6d 100644
--- a/Makefile
+++ b/Makefile
@@ -966,6 +966,7 @@ endif
 	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  help-custom            - print help about custom actions (if any)'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
@@ -974,6 +975,12 @@ endif
 	@echo 'it on-line at http://buildroot.org/docs.html'
 	@echo
 
+# This rule does nothing, it is expected to be overloaded by
+# a br2-external tree or a local.mk . However, it must exist,
+# as we reference it in the main help, above. Making the rule
+# .PHONY does not work.
+help-custom:
+
 list-defconfigs:
 	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 9ad177d..be1827e 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -107,3 +107,17 @@ And then in +$(BR2_EXTERNAL)/package/package1+ and
    output of +make list-defconfigs+ and allow them to be loaded with the
    normal +make <name>_defconfig+ command. They will be visible under the
    +User-provided configs+' label in the 'make list-defconfigs' output.
+
+Additionally, an +external.mk+ file may define the +help-custom+ make
+rule, to document custom make targets specific to this +BR2_EXTERNAL+
+tree. The help is completely free-form.
+
+------
+help-custom:
+    @echo 'Here goes your local help, where you may'
+    @echo 'describe some custom rules:'
+    @echo '  my-rule       - do something'
+    @echo '  my-other-rule - do something else'
+    @echo
+    @echo 'Please contact support at company.com in case of problem.'
+------
