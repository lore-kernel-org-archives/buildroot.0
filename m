From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:31:36 +0100
Subject: [Buildroot] [git commit] package/raptor: fix CVE-2017-18926
Message-ID: <20201122141842.58CCC7FA87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a683a54cc9b4adb4ad527e7d5efdf1808ba4163
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

raptor_xml_writer_start_element_common in raptor_xml_writer.c in Raptor RDF
Syntax Library 2.0.15 miscalculates the maximum nspace declarations for the
XML writer, leading to heap-based buffer overflows (sometimes seen in
raptor_qname_format_as_xml).

For more details, see the oss-security discussion:
https://www.openwall.com/lists/oss-security/2020/11/13/1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ax-nspace-declarations-correctly-for-XML-.patch | 47 ++++++++++++++++++++++
 package/raptor/raptor.mk                           |  3 ++
 2 files changed, 50 insertions(+)

diff --git a/package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch b/package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
new file mode 100644
index 0000000000..406e265cf3
--- /dev/null
+++ b/package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
@@ -0,0 +1,47 @@
+From 590681e546cd9aa18d57dc2ea1858cb734a3863f Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Sun, 16 Apr 2017 23:15:12 +0100
+Subject: [PATCH] Calcualte max nspace declarations correctly for XML writer
+
+(raptor_xml_writer_start_element_common): Calculate max including for
+each attribute a potential name and value.
+
+Fixes Issues #0000617 http://bugs.librdf.org/mantis/view.php?id=617
+and #0000618 http://bugs.librdf.org/mantis/view.php?id=618
+
+[Peter: fixes CVE-2017-18926, upstream:
+ https://github.com/dajobe/raptor/commit/590681e546cd9aa18d57dc2ea1858cb734a3863f]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/raptor_xml_writer.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
+index 693b9468..0d3a36a5 100644
+--- a/src/raptor_xml_writer.c
++++ b/src/raptor_xml_writer.c
+@@ -181,9 +181,10 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
+   size_t nspace_declarations_count = 0;  
+   unsigned int i;
+ 
+-  /* max is 1 per element and 1 for each attribute + size of declared */
+   if(nstack) {
+-    int nspace_max_count = element->attribute_count+1;
++    int nspace_max_count = element->attribute_count * 2; /* attr and value */
++    if(element->name->nspace)
++      nspace_max_count++;
+     if(element->declared_nspaces)
+       nspace_max_count += raptor_sequence_size(element->declared_nspaces);
+     if(element->xml_language)
+@@ -237,7 +238,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
+         }
+       }
+ 
+-      /* Add the attribute + value */
++      /* Add the attribute's value */
+       nspace_declarations[nspace_declarations_count].declaration=
+         raptor_qname_format_as_xml(element->attributes[i],
+                                    &nspace_declarations[nspace_declarations_count].length);
+-- 
+2.20.1
+
diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index 4c7135fc64..d674627f90 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -15,6 +15,9 @@ RAPTOR_INSTALL_STAGING = YES
 # Flag is added to make sure the patch is applied for the configure.ac of raptor.
 RAPTOR_AUTORECONF = YES
 
+# 0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
+RAPTOR_IGNORE_CVES += CVE-2017-18926
+
 RAPTOR_CONF_OPTS =\
 	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
 	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
