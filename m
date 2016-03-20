From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Mar 2016 22:24:29 +0100
Subject: [Buildroot] [PATCH] core/help: fix custom help without a .config
Message-ID: <1458509069-11960-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When there is no .config, we do not source $(BR2_EXTERNAL)/external.mk.
So we can not expose the custom help in that situation.

It is now known whether sourcing $(BR2_EXTERNAL)/external.mk outside the
HAVE_DOT_CONFIG conditional block is entirely safe. Even if it would
work today, we would have a hard time not breaking it in the future,
because we do not have automatic checks for that and would need to rely
on users reporting issues after the fact.

Instead, we require the custom help to be defined in its own file in the
br2-external tree. This way, we can safely include it unconditionally.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                             | 11 +++++++----
 docs/manual/customize-outside-br.txt |  7 ++++---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index ea8b1e4..03657d5 100644
--- a/Makefile
+++ b/Makefile
@@ -976,10 +976,13 @@ endif
 	@echo 'it on-line at http://buildroot.org/docs.html'
 	@echo
 
-# This rule does nothing, it is expected to be overloaded by
-# a br2-external tree or a local.mk . However, it must exist,
-# as we reference it in the main help, above. Making the rule
-# .PHONY does not work.
+ifneq ($(wildcard $(BR2_EXTERNAL)/help.mk),)
+include $(BR2_EXTERNAL)/help.mk
+endif
+
+# This rule does nothing, it is expected to be overloaded by a
+# br2-external tree. However, it must exist, as we reference it
+# as a dependency of the main help, above.
 help-custom:
 
 list-defconfigs:
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index be1827e..4f1c752 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -108,9 +108,10 @@ And then in +$(BR2_EXTERNAL)/package/package1+ and
    normal +make <name>_defconfig+ command. They will be visible under the
    +User-provided configs+' label in the 'make list-defconfigs' output.
 
-Additionally, an +external.mk+ file may define the +help-custom+ make
-rule, to document custom make targets specific to this +BR2_EXTERNAL+
-tree. The help is completely free-form.
+Additionally, a +BR2_EXTERNAL+ tree may provide a file named +help.mk+
+that defines the +help-custom+ make rule, to document custom make
+targets specific to this +BR2_EXTERNAL+ tree. The help is completely
+free-form. See below for a sample +$(BR2_EXTERNAL)/help.mk+ file:
 
 ------
 help-custom:
-- 
1.9.1
