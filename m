From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 04 Oct 2013 15:12:34 +0200
Subject: [Buildroot] [PATCH 5 of 5] legal info: cleanup utility functions
In-Reply-To: <patchbomb.1380892349@argentina>
References: <patchbomb.1380892349@argentina>
Message-ID: <9939e8c5aeece3d9c897.1380892354@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The legal-info utility functions where defined using two ways
util-foo = command-foo
and
define util-bar # parameter description
	command-bar
endef

This commit changes these functions to use the second form for clarity and
additionally adds parameter descriptions on all functions.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-utils.mk |  16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -91,17 +91,23 @@ endef
 # legal-info helper functions
 #
 LEGAL_INFO_SEPARATOR="::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
-legal-warning=echo "WARNING: $(1)" >>$(LEGAL_WARNINGS)
-legal-warning-pkg=echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
+define legal-warning # text
+	echo "WARNING: $(1)" >>$(LEGAL_WARNINGS)
+endef
+define legal-warning-pkg # pkg, text
+	echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
+endef
 define legal-warning-pkg-savednothing # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources and license files not saved ($(2) packages not handled))
 endef
-legal-manifest=echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
-define legal-license-header
+define legal-manifest # pkg, version, license, license-files, source, type
+	echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
+endef
+define legal-license-header # pkg, license-file, type
 	echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
 		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT_$(3))
 endef
-define legal-license-nofiles
+define legal-license-nofiles # pkg, type
 	$(call legal-license-header,$(1),unknown license file(s),$(2))
 endef
 define legal-license-file # pkg, filename, file-fullpath, type
