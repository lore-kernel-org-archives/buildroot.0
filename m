From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 23:07:22 +0200
Subject: [Buildroot] [git commit] rapidxml: add patch to fix usage with gcc
	4.7+
Message-ID: <20161015210942.E642C81914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3532dec3739d1f21226bc2087fd8667d87a3916
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The official `rapidxml` package release only supports up to GCC 4.6.x
for all capabilities. Implementers attempting to include the file
"rapidxml_print.hpp" will all result in a compilation failure when using
a currently supported Buildroot GCC version (all 4.7+ at this time).
With the provided patch, dependent packages will be able to use all of
rapidxml's capabilities using a generated toolchain from Buildroot (let
alone external toolchains).

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
[Thomas: rework patch so that it contains the proper line endings, and
applies properly without a pre-patch hook to convert the line endings
beforehand.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rnal-print-operations-are-declared-before.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch b/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch
new file mode 100644
index 0000000..fcf1b3c
--- /dev/null
+++ b/package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch
@@ -0,0 +1,38 @@
+[PATCH] ensure internal print operations are declared before use
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
+
+Index: b/rapidxml_print.hpp
+===================================================================
+--- a/rapidxml_print.hpp
++++ b/rapidxml_print.hpp
+@@ -101,7 +101,16 @@
+ 
+         ///////////////////////////////////////////////////////////////////////////
+         // Internal printing operations
+-    
++
++        template<class OutIt, class Ch> inline OutIt print_cdata_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_children(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_comment_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_data_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_declaration_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_doctype_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_element_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++        template<class OutIt, class Ch> inline OutIt print_pi_node(OutIt out, const xml_node<Ch> *node, int flags, int indent);
++
+         // Print node
+         template<class OutIt, class Ch>
+         inline OutIt print_node(OutIt out, const xml_node<Ch> *node, int flags, int indent)
