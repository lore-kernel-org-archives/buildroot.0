From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Apr 2019 21:47:31 +0200
Subject: [Buildroot] [PATCH 09/12 v3] core: introduce new global show-info
In-Reply-To: <cover.1555357644.git.yann.morin.1998@free.fr>
References: <cover.1555357644.git.yann.morin.1998@free.fr>
Message-ID: <30455cde143814806008e9654974452726602e55.1555357644.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Users are increasingly trying to extract information about packages. For
example, they might need to get the list of URIs, or the dependencies of
a package.

Although we do have a bunch of rules to generate some of that, this is
done in ad-hoc way, with most of the output formats just ad-hoc, raw,
unformatted blurbs, mostly internal data dumped as-is.

Introduce a new rule, show-info, that provides a properly formatted
output of all the meta-information about packages: name, type, version,
licenses, dependencies...

We choose to use JSON as the output format, because it is pretty
versatile, has parsers in virtually all languages, has tools to parse
from the shell (jq). It also closely matches Python data structure,
which makes it easy to use with our own internal tools as well. Finally,
JSON being a key-value store, allows for easy expanding the output
without requiring existing consumers to be updated; new, unknown keys
are simply ignored by those (as long as they are true JSON parsers).

The complex part of this change was the conditional output of parts of
the data: virtual packages have no source, version, license or
downloads, unlike non-virtual packages. Same goes for filesystems. We
use a wrapper macro, show-info, that de-multiplexes unto either the
package-related- or filesystem-related macros, and for packages, we also
use a detailed macro for non-virtual packages.

It is non-trivial to properly output correct JSON blurbs, especially
when trying to output an array of objects, like so, where the last item
shall not be followed by a comma:  [ { ... }, { ... } ]

So, we use a trick (as sugegsted by Arnout), to $(subst) any pair of
",}" or ", }" or ",]" or ", ]" with only the respective closing symbol,
"}" or "]".

The whole stuff is $(strip)ed to make it a somewhat-minified JSON blurb
that fits on a single line with all spaces squashed (but still with
spaces, as it is not possible to differentiate spaces between JSON
elements from spaces inside JSON strings).

Reported-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v2 -> v3:
  - set the virtual field in a single place  (Arnout)
  - rename the macros  (Arnout)
  - don't add opening and closing {} in clean-json  (Arnout)
  - add to 'make help'

Changes v1 -> v2:
  - make it a macro to be called  (Arnout)
  - make it a top-level rule  (Arnout)
---
 Makefile             | 16 +++++++++++++
 package/pkg-utils.mk | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/Makefile b/Makefile
index 60bf7d7d08..0f5331ec7e 100644
--- a/Makefile
+++ b/Makefile
@@ -903,6 +903,21 @@ check-dependencies:
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends -C
 
+.PHONY: show-info
+show-info:
+	@:
+	$(info $(call clean-json, \
+			{ $(foreach p, \
+				$(sort $(foreach i,$(PACKAGES) $(TARGETS_ROOTFS), \
+						$(i) \
+						$($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \
+					) \
+				), \
+				$(call json-info,$(call UPPERCASE,$(p)))$(comma) \
+			) } \
+		) \
+	)
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # Some subdirectories are also package names. To avoid that "make linux"
@@ -1128,6 +1143,7 @@ help:
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  show-info              - generate info about packages, as a JSON blurb'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index bffd79dfb0..b7280e930f 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -62,6 +62,70 @@ $$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
 endif
 endef
 
+# json-info -- return package or filesystem metadata formatted as an entry
+#              of a JSON dictionnary
+# $(1): upper-case package or filesystem name
+define json-info
+	"$($(1)_NAME)": {
+		"type": "$($(1)_TYPE)",
+		$(if $(filter rootfs,$($(1)_TYPE)), \
+			$(call _json-info-fs,$(1)), \
+			$(call _json-info-pkg,$(1)), \
+		)
+	}
+endef
+
+# _json-info-pkg, _json-info-pkg-details, _json-info-fs: private helpers
+# for json-info, above
+define _json-info-pkg
+	$(if $($(1)_IS_VIRTUAL), \
+		"virtual": true$(comma),
+		"virtual": false$(comma)
+		$(call _json-info-pkg-details,$(1)) \
+	)
+	"dependencies": [
+		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
+	],
+	"reverse_dependencies": [
+		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
+	]
+endef
+
+define _json-info-pkg-details
+	"version": "$($(1)_DL_VERSION)",
+	"licenses": "$($(1)_LICENSE)",
+	"downloads": [
+	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
+		{
+			"source": "$(notdir $(dl))",
+			"uris": [
+				$(call make-comma-list,
+					$(subst \|,|,
+						$(call DOWNLOAD_URIS,$(dl),$(1))
+					)
+				)
+			]
+		},
+	)
+	],
+endef
+
+define _json-info-fs
+	"dependencies": [
+		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
+	]
+endef
+
+# clean-json -- cleanup pseudo-json into clean json:
+#  - remove commas before closing ] and }
+#  - minify with $(strip)
+clean-json = $(strip \
+	$(subst $(comma)},}, $(subst $(comma)$(space)},$(space)}, \
+	$(subst $(comma)],], $(subst $(comma)$(space)],$(space)], \
+		$(strip $(1)) \
+	)))) \
+)
+
 #
 # legal-info helper functions
 #
-- 
2.14.1
