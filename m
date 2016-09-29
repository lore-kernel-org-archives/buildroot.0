From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 29 Sep 2016 17:26:29 -0400
Subject: [Buildroot] [PATCH 1/1] rapidxml: add patch to fix usage with gcc
	4.7+
Message-ID: <20160929212629.34000-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The official `rapidxml` package release only supports up to GCC 4.6.x
for all capabilities. Implementers attempting to include the file
"rapidxml_print.hpp" will all result in a compilation failure when using
a currently supported Buildroot GCC version (all 4.7+ at this time).
With the provided patch, dependent packages will be able to use all of
rapidxml's capabilities using a generated toolchain from Buildroot (let
alone external toolchains).

This commit also forcefully converts "rapidxml_print.hpp"'s line endings
from CRLF to LF. Since official rapidxml sources are packaged in a CRLF-
based environment, patches applied by Buildroot will fail:

    patching file rapidxml_print.hpp
    Hunk #1 FAILED at 101 (different line endings).

While patches can be configured to match expected line endings, the
patch process will fail since "the heuristic for transforming CRLF line
endings into LF line endings" [1] is always enabled. While providing the
`--binary` option for patch could resolve this, older distributions (ie.
RHEL4/5) do not support it [2] (which is still desired).

[1]: http://git.savannah.gnu.org/cgit/patch.git/tree/patch.man#n306
[2]: https://patchwork.ozlabs.org/patch/676643/

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
See also: https://patchwork.ozlabs.org/patch/676644/
---
 ...rnal-print-operations-are-declared-before.patch | 45 ++++++++++++++++++++++
 package/rapidxml/rapidxml.mk                       | 10 +++++
 2 files changed, 55 insertions(+)
 create mode 100644 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch

diff --git a/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch b/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch
new file mode 100644
index 0000000..0526beb
--- /dev/null
+++ b/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch
@@ -0,0 +1,45 @@
+From fa6c67c5cb9dd3ae77ca0fdc8770236f197b0ee1 Mon Sep 17 00:00:00 2001
+From: James Knight <james.knight@rockwellcollins.com>
+Date: Wed, 28 Sep 2016 16:27:52 -0400
+Subject: [PATCH 1/1] ensure internal print operations are declared before use
+
+Stock rapidxml-1.13 does not allow implementers of the
+`rapidxml_print.hpp` header to build under GCC 4.7 (or newer) due to
+compliation issues. This is a result of "Name lookup changes" introduced
+in GCC 4.7 [1]. The following adds forward declarations required to
+compile with GCC 4.7+.
+
+This issue has been mentioned upstream [2], but it has yet to be fixed
+in official sources.
+
+[1]: https://gcc.gnu.org/gcc-4.7/porting_to.html
+[2]: https://sourceforge.net/p/rapidxml/bugs/16/
+
+Signed-off-by: James Knight <james.knight@rockwellcollins.com>
+---
+ rapidxml_print.hpp | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/rapidxml_print.hpp b/rapidxml_print.hpp
+index 0ae2b14..dd89c26 100644
+--- a/rapidxml_print.hpp
++++ b/rapidxml_print.hpp
+@@ -101,6 +101,15 @@ namespace rapidxml
+ 
+         ///////////////////////////////////////////////////////////////////////////
+         // Internal printing operations
++
++        template<class OutIt, class Ch> inline OutIt print_cdata_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_children(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_comment_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_data_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_declaration_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_doctype_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_element_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_pi_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
+     
+         // Print node
+         template<class OutIt, class Ch>
+-- 
+2.8.4.windows.1
+
diff --git a/package/rapidxml/rapidxml.mk b/package/rapidxml/rapidxml.mk
index a76a21b..7dba2f9 100644
--- a/package/rapidxml/rapidxml.mk
+++ b/package/rapidxml/rapidxml.mk
@@ -20,6 +20,16 @@ define RAPIDXML_EXTRACT_CMDS
 	rmdir $(@D)/rapidxml-$(RAPIDXML_VERSION)
 endef
 
+# 0001-ensure-internal-print-operations-are-declared-before.patch
+#
+# Convert CRLF packaged file to LF before attempting to patch. See:
+#  https://patchwork.ozlabs.org/patch/676643/
+#  https://patchwork.ozlabs.org/patch/676644/
+define RAPIDXML_PRE_PATCH
+    $(SED) 's;\r$$;;' $(@D)/rapidxml_print.hpp
+endef
+RAPIDXML_PRE_PATCH_HOOKS += RAPIDXML_PRE_PATCH
+
 define RAPIDXML_INSTALL_STAGING_CMDS
 	cp -dpfr $(@D)/*hpp $(STAGING_DIR)/usr/include
 endef
-- 
2.8.4.windows.1
