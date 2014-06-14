From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 17:10:24 +0200
Subject: [Buildroot] [PATCH 5/5] legal-info: properly error out on missing
	license file
In-Reply-To: <cover.1402758331.git.yann.morin.1998@free.fr>
References: <cover.1402758331.git.yann.morin.1998@free.fr>
Message-ID: <8c742a7155e0b24c14ae90f7be00c1043eceb848.1402758331.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

When saving the license files, if a declared license file is missing,
print a proper error message, instead of the sometime-criptic error
message from 'cp'.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>

---
Note: when I wrote this back in March 2014, I had a concrete example of
a criptic error message (the name of the license did not make it obvious
we were saving a license file?), but today I can't remember what it was
exactly.

Since I believe showing a properly-formatted error message to the user
is anyway a good thing, I kept that patch. Feel free to ditch it if you
don't like it.
---
 package/pkg-utils.mk | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 471f3ed..c3f9142 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -101,6 +101,10 @@ define legal-warning-pkg # pkg, text
 	echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
 endef
 
+define legal-error-pkg # pkg, text
+	echo "ERROR: $(1): $(2)" && false
+endef
+
 define legal-license-nosource # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources not saved ($(2) packages not handled))
 endef
@@ -119,9 +123,13 @@ define legal-license-nofiles # pkg, {HOST|TARGET}
 endef
 
 define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
-	$(call legal-license-header,$(1),$(2) file,$(4)) && \
-	cat $(3) >>$(LEGAL_LICENSES_TXT_$(4)) && \
-	echo >>$(LEGAL_LICENSES_TXT_$(4)) && \
-	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
-	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
+	if [ -e $(3) ]; then \
+		$(call legal-license-header,$(1),$(2) file,$(4)) && \
+		cat $(3) >>$(LEGAL_LICENSES_TXT_$(4)) && \
+		echo >>$(LEGAL_LICENSES_TXT_$(4)) && \
+		mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
+		cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2); \
+	else \
+		$(call legal-error-pkg,$(1),license file $(2) not found); \
+	fi
 endef
-- 
1.8.3.2
