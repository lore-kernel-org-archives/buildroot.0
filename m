From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 18:41:11 +0100
Subject: [Buildroot] [PATCH 3/9 v2] core/pkg-utils: add a macro to
	pretty-print a help entry
In-Reply-To: <cover.1457717002.git.yann.morin.1998@free.fr>
References: <cover.1457717002.git.yann.morin.1998@free.fr>
Message-ID: <7871ae2104ff0285dcfce8f4670a2c7427271218.1457717002.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To ensure that all the help entries we display are all formatted the
same, we currently indent the help texts manually.

Also, when a br2-external tree wants to display local custom help, they
have to rely on a hard-coded layout (if they want to match our iwn
output, which is not mandatory).

Add a macro to pretty-print make rules in the help texts.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - properly format multi-line output
---
 package/pkg-utils.mk | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index f88313a..e9219d8 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -104,6 +104,28 @@ define sep
 
 endef
 
+# Pretty-print a make rule in the help text
+#
+# $(1): a list of double- or single-quoted string representing the rule
+#       and their help text, formatted as:  "action : help for action"
+#       'action' should be less than 22 characters, otherwise the help
+#       text will not be correctly indented.
+#
+# The output is a line formatted as such (with two leading spaces):
+#   action-up-to-22-chars-long - help for action up to 52 chars wide
+#                                with the remaining of the help text
+#                                that does not fit on the first line
+#
+# (The long spaces are 27 chars.)
+define print-help
+	for h in $(1); do \
+		printf "  %-22s - " "$${h%% : *}"; \
+		printf "%s\n" "$${h#* : }" \
+		|fmt -w52 -u \
+		|sed '2,$$s/^/                           /;'; \
+	done
+endef
+
 # check-deprecated-variable -- throw an error on deprecated variables
 # example:
 #   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
-- 
1.9.1
