From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 22:20:53 +0200
Subject: [Buildroot] [git commit] core/pkg-utils: add macro to
	escape-and-printf
Message-ID: <20160607202530.0E5E981F70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc05f407bcf77bc5a5c74c5e237d5a5aa5194bba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In some cases we need to escape make variables and pass them to
printf(1).

This is the case in our fs infra, where we want to shoe-horn the
commands to generate the filesystems in the fakeroot script, or the
devices, permissions and users tables to their respective files.

We currently do so by replacing $(sep) with the literal '\n' but that's
not enough. This does not protect against strings with an embedded '%'
or a backslash.

Add a new macro that properly escapes a string and calls printf(1), so
that we get the expected output.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-utils.mk | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index f88313a..c61b3b6 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -104,6 +104,43 @@ define sep
 
 endef
 
+PERCENT = %
+QUOTE = '
+# ' # Meh... syntax-highlighting
+
+# This macro properly escapes a command string, then prints it with printf:
+#
+#   - first, backslash '\' are self-escaped, so that they do not escape
+#     the following char and so that printf properly outputs a backslash;
+#
+#   - next, single quotes are escaped by closing an existing one, adding
+#     an escaped one, and re-openning a new one (see below for the reason);
+#
+#   - then '%' signs are self-escaped so that the printf does not interpret
+#     them as a format specifier, in case the variable contains an actual
+#     printf with a format;
+#
+#   - finally, $(sep) is replaced with the literal '\n' so that make does
+#     not break on the so-expanded variable, but so that the printf does
+#     correctly output an LF.
+#
+# Note: this must be escaped in this order to avoid over-escaping the
+# previously escaped elements.
+#
+# Once everything has been escaped, it is passed between single quotes
+# (that's why the single-quotes are escaped they way they are, above,
+# and why the dollar sign is not escaped) to printf(1). A trailing
+# newline is apended, too.
+#
+# Note: leading or trailing spaces are *not* stripped.
+#
+define PRINTF
+	printf '$(subst $(sep),\n,\
+			$(subst $(PERCENT),$(PERCENT)$(PERCENT),\
+				$(subst $(QUOTE),$(QUOTE)\$(QUOTE)$(QUOTE),\
+					$(subst \,\\,$(1)))))\n'
+endef
+
 # check-deprecated-variable -- throw an error on deprecated variables
 # example:
 #   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
