From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Jun 2016 18:30:49 +0200
Subject: [Buildroot] [PATCH 3/8 v3] core/pkg-utils: add a macro to
	pretty-print a help entry
In-Reply-To: <cover.1465056706.git.yann.morin.1998@free.fr>
References: <cover.1465056706.git.yann.morin.1998@free.fr>
Message-ID: <b8877529af920372c5ae617cef87a9bd21d04641.1465056706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To ensure that all the help entries we display are all formatted the
same, we currently indent the help texts manually.

Add a macro to pretty-print make rules in the help texts.

The output is formatted as the rest of the help text is (the left pipe
denotes the left of the terminal ditto the right one for the right):

    |.-----------------79-------------------.|
    |  .------22------.   .-------52-------. |
    |  action-name      - Help text on maybe |
    |                     more than a line   |

The macro is not using a simple:
    printf "  %-22s - %-52s\n" "$(1)" "$(2)"

because some packages may want to print a long description that does not
fit on a 80-char wide line (actually, linux is such a package, with the
help text for its linux-update-defconfig rule).

Instead, we use a little trick:

 1- print the action to the correct width, followed by the separating
    hyphen, but with no terminating new line;

 2- use fmt(1) to re-format the help text to the correct width, but
    with no left margin;

 3- use a simple awk script to indent all but the first line of the
    re-formated help text.

We can't use only fmt, as it is not smart enough to achieve the above
formatting; it is only as good as for what we use it. Un-assigned
variables in awk are treated as zero when evaluated as a int, so we need
not assign it before using it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v2 -> v3:
  - only print a single help entry
  - expect two args, one for action, one for help

Changes v1 -> v2:
  - properly format multi-line output
---
 docs/manual/adding-packages-generic.txt | 12 +++++++++++-
 package/pkg-utils.mk                    | 27 +++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index de8aca2..047f3ec 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -499,7 +499,8 @@ different steps of the build process.
 
 * +LIBFOO_HELP_CMDS+ lists the actions to print the package help, which
   is included to the main +make help+ output. These commands can print
-  anything in any format.
+  anything in any format; to help format the output the same as the main
+  help, you can use the +print-help+ macro (see below for an example).
   This is seldom used, as packages rarely have custom rules. *Do not use
   this variable*, unless you really know that you need to print help.
 
@@ -531,4 +532,13 @@ In the action definitions, you can use the following variables:
 * Of course the +$(HOST_DIR)+, +$(STAGING_DIR)+ and +$(TARGET_DIR)+
   variables to install the packages properly.
 
+To pretty-print the help text, you can use the +print-help+ macro:
+
+----
+define LIBFOO_HELP_CMDS
+	$(call print-help,package-action,help text for package-action)
+	$(call print-help,some-action,help text for some-action)
+endef
+----
+
 Finally, you can also use hooks. See xref:hooks[] for more information.
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index f88313a..40578de 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -104,6 +104,33 @@ define sep
 
 endef
 
+# Pretty-print a make rule in the help text
+#
+# $(1): the action (aka the make target); should be less than 22
+#       characters, otherwise the help text will not be correctly
+#       indented.
+# $(2): the help text
+#
+# Both should be un-quoted.
+#
+# The output is a 79-char wide line formatted as such (with two
+# leading spaces):
+#   action-up-to-22-chars-long - help for action up to 52 chars wide
+#                                with the remaining of the help text
+#                                that does not fit on the first line
+#
+# Note: in the awk script, the 'i' variable is first used unset, but
+# in awk, unset variables are evaluated to zero, which is right what
+# we need on the first line; then i is set and will be used for the
+# second-and-further lines.
+#
+define print-help
+	@printf "  %-22s - " "$(strip $(1))"; \
+	printf "%s\n" "$(strip $(2))" \
+	|fmt -w52 -g52 -u \
+	|awk '{ printf( "%-*s%s\n", i, "", $$(0) ); i=27 }'
+endef
+
 # check-deprecated-variable -- throw an error on deprecated variables
 # example:
 #   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
-- 
2.7.4
