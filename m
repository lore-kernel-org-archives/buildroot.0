From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 13:51:21 +0200
Subject: [Buildroot] [PATCH 06/10] infra/pkg-generic: introduce foo-show-info
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <6e3c4eccb009f45ccb25b549c88e6a6603091ddb.1554637858.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Users are increasingly trying to extract information about packages.
For example, they might need to get the list of URIs, or the
dependencies of a package.

Although we do have a bunch of rules to generate some of that, this is
done in ad-hic way, with most of the output formats just as-hoc, raw,
unformatted blurbs, mostly internal data dumped as-is.

Introduce a new rule, foo-show-info, that provides a properly formatted
output of all the meta-information about a package: name, type, version,
licenses, dependencies...

We choose to use JSON as the output format, because it is pretty
veratile, has parsers in virtually all languages, has tols to parse from
the shell (jq). It also closely matches Python data structure, which
makes it easy to use with our own internal tools as well. Finally, JSON
being a key-value store, allows for easy expanding the output without
requiring existing consumers to be updated; new, unknown keys are simply
ignored by those (as long as they are true JSON parsers).

The complex part of this change was the conditional output of parts of
the data: virtual packages have no source, version, license or
downloads, unlike non-virtual packages. The basic idea was to
intersperse those conditions directly inside the $(info ...) block.
However, becasue key-value pairs in JSON are separated with commas, and
that the comma is also the parameters separator in Makefile, we'd have
had to use $(comma) to output an actual comma when inside an $(if ...)
statement, like so:

    $(if $$($(2)_IS_VIRTUAL), \
        "virtual": true$(comma), \
        "virtual": false$(comma) \
        "version": "$$($(2)_DL_VERSION)"$(comma) \
        [...]
    )

This was, with the trailing '\'i and the indentation, a bit cumbersome
to handle, and would be difficult to maintain.

Instead, an intermediate variable is used, which is set conditionally.
And to make the rest of the information look similar, it is also stored
in an intermediate variable. This makes it easier to read, and thus to
maintain (hopefully so).

Note that we can't set part of the variable conditionally, like so:

    SOMETHING = YES
    define FOO
    ifeq ($(SOMETHING),YES)
        Meh $(SOMETHING)
    else
        Meh --$(SOMETHING)--
    endif
    endef
    $(info $(FOO))

as that would yield:

    ifeq (YES,YES)
        Meh YES
    else
        Meh --YES--
    endif

So, we use intermediate variables.

Finally, the variable is $(strip...)ed before being displayed, so as to
make it fit on a single line, one per package info. This is just JSON,
so it does not matter, but at least it should be parallel-safe in the
future.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f78ff2e665..72b1a87f5f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -843,6 +843,49 @@ $(1)-external-deps:
 	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
 endif
 
+ifeq ($$($(2)_IS_VIRTUAL),YES)
+define $(2)_SHOW_INFO_VIRTUAL
+	"virtual": true,
+endef
+else
+define $(2)_SHOW_INFO_VIRTUAL
+	"virtual": false,
+	"version": "$$($(2)_DL_VERSION)",
+	"licenses": "$$($(2)_LICENSE)",
+	"downloads": [
+	$$(foreach dl,$$($(2)_ALL_DOWNLOADS),
+		{
+			"source": "$$(notdir $$(dl))",
+			"URIs": [
+			$$(call make-comma-list,
+				$$(subst \|,|,
+					$$(call DOWNLOAD_URIS,$$(dl),$(2))
+				)
+			)
+			]
+		},
+	)
+	null
+	],
+endef
+endif
+
+define $(2)_SHOW_INFO
+	"name": "$(1)",
+	"type": "$(4)",
+	$$($(2)_SHOW_INFO_VIRTUAL)
+	"depends on": [
+		$$(call make-comma-list,$$($(2)_FINAL_ALL_DEPENDENCIES))
+	],
+	"dependency of": [
+		$$(call make-comma-list,$$($(2)_RDEPENDENCIES))
+	]
+endef
+
+$(1)-show-info:
+	@:
+	$$(info { $$(strip $$($(2)_SHOW_INFO)) })
+
 $(1)-show-version:
 			@echo $$($(2)_VERSION)
 
@@ -1099,6 +1142,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-rsync \
 	$(1)-show-dependency-tree \
 	$(1)-show-depends \
+	$(1)-show-info \
 	$(1)-show-version \
 	$(1)-source
 
-- 
2.14.1
