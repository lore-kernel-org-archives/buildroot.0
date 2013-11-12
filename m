From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 12 Nov 2013 09:48:00 +0100
Subject: [Buildroot] [PATCH 5 of 6 v3] legal info: cleanup utility functions
In-Reply-To: <patchbomb.1384246075@argentina>
References: <patchbomb.1384246075@argentina>
Message-ID: <b5883388fc28c12013ea.1384246080@argentina>
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
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

---
v3: no changes
v2:
- add whitespace between functions
- replace 'type' with {HOST|TARGET} (comment Luca)

 package/pkg-utils.mk |  25 +++++++++++++++++++------
 1 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -99,20 +99,33 @@ endef
 # legal-info helper functions
 #
 LEGAL_INFO_SEPARATOR="::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
-legal-warning=echo "WARNING: $(1)" >>$(LEGAL_WARNINGS)
-legal-warning-pkg=echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
+
+define legal-warning # text
+	echo "WARNING: $(1)" >>$(LEGAL_WARNINGS)
+endef
+
+define legal-warning-pkg # pkg, text
+	echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
+endef
+
 define legal-warning-pkg-savednothing # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources and license files not saved ($(2) packages not handled))
 endef
-legal-manifest=echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
-define legal-license-header
+
+define legal-manifest # pkg, version, license, license-files, source, {HOST|TARGET}
+	echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV_$(6))
+endef
+
+define legal-license-header # pkg, license-file, {HOST|TARGET}
 	echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
 		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT_$(3))
 endef
-define legal-license-nofiles
+
+define legal-license-nofiles # pkg, {HOST|TARGET}
 	$(call legal-license-header,$(1),unknown license file(s),$(2))
 endef
-define legal-license-file # pkg, filename, file-fullpath, type
+
+define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
 	$(call legal-license-header,$(1),$(2) file,$(4)) && \
 	cat $(3) >>$(LEGAL_LICENSES_TXT_$(4)) && \
 	echo >>$(LEGAL_LICENSES_TXT_$(4)) && \
