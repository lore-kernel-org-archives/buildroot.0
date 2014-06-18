From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Wed, 18 Jun 2014 18:19:04 +0200
Subject: [Buildroot] [PATCH 2/3] pango: bump to version 1.36.3
In-Reply-To: <1403108345-12404-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1403108345-12404-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1403108345-12404-3-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note: HarfBuzz is needed to build Pango. Configure does not return an
error if HarfBuzz is missing, but without HarfBuzz it can't enable any
backends.

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pango/Config.in                   |   1 +
 package/pango/pango-0001-no-tests.patch   |  21 ++
 package/pango/pango-0002-no-gtk-doc.patch |  11 +
 package/pango/pango-no-const-return.patch | 475 ------------------------------
 package/pango/pango-no-tests.patch        |  22 --
 package/pango/pango.mk                    |  19 +-
 6 files changed, 43 insertions(+), 506 deletions(-)
 create mode 100644 package/pango/pango-0001-no-tests.patch
 create mode 100644 package/pango/pango-0002-no-gtk-doc.patch
 delete mode 100644 package/pango/pango-no-const-return.patch
 delete mode 100644 package/pango/pango-no-tests.patch

diff --git a/package/pango/Config.in b/package/pango/Config.in
index 774682d..70f4fd3 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
diff --git a/package/pango/pango-0001-no-tests.patch b/package/pango/pango-0001-no-tests.patch
new file mode 100644
index 0000000..324fd52
--- /dev/null
+++ b/package/pango/pango-0001-no-tests.patch
@@ -0,0 +1,21 @@
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,6 @@
+ ## Process this file with automake to create Makefile.in.
+ 
+-SUBDIRS= pango modules pango-view examples docs tools tests build
++SUBDIRS= pango modules pango-view examples docs tools build
+ 
+ EXTRA_DIST = 			\
+ 	autogen.sh		\
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -418,7 +418,7 @@ target_alias = @target_alias@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-SUBDIRS = pango modules pango-view examples docs tools tests build
++SUBDIRS = pango modules pango-view examples docs tools build
+ EXTRA_DIST = \
+ 	autogen.sh		\
+ 	pango.pc.in		\
diff --git a/package/pango/pango-0002-no-gtk-doc.patch b/package/pango/pango-0002-no-gtk-doc.patch
new file mode 100644
index 0000000..0c12ee4
--- /dev/null
+++ b/package/pango/pango-0002-no-gtk-doc.patch
@@ -0,0 +1,11 @@
+--- a/gtk-doc.make
++++ b/gtk-doc.make
+@@ -267,7 +267,7 @@
+ #
+ # Require gtk-doc when making dist
+ #
+-if HAVE_GTK_DOC
++if ENABLE_GTK_DOC
+ dist-check-gtkdoc: docs
+ else
+ dist-check-gtkdoc:
diff --git a/package/pango/pango-no-const-return.patch b/package/pango/pango-no-const-return.patch
deleted file mode 100644
index a0749a4..0000000
--- a/package/pango/pango-no-const-return.patch
+++ /dev/null
@@ -1,475 +0,0 @@
-From 4b060ca43c9605be2fdb219a379f8a17c33b0d98 Mon Sep 17 00:00:00 2001
-From: Ryan Lortie <desrt@desrt.ca>
-Date: Thu, 9 Jun 2011 11:36:59 -0400
-Subject: [PATCH] Stop using G_CONST_RETURN in Pango
-
-Upstream: 4c7807daee7189f48
-
-G_CONST_RETURN is headed for deprecation (as per bug #644611).  Stop
-using it in Pango.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=652202
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- modules/hebrew/hebrew-shaper.c |    2 +-
- pango/fonts.c                  |    6 +++---
- pango/pango-attributes.c       |    2 +-
- pango/pango-attributes.h       |    2 +-
- pango/pango-context.c          |    2 +-
- pango/pango-context.h          |    6 +++---
- pango/pango-font.h             |    6 +++---
- pango/pango-fontmap.c          |    2 +-
- pango/pango-language.c         |    6 +++---
- pango/pango-language.h         |    6 +++---
- pango/pango-layout.c           |    4 ++--
- pango/pango-layout.h           |    2 +-
- pango/pango-ot-ruleset.c       |    2 +-
- pango/pango-renderer.c         |    2 +-
- pango/pango-renderer.h         |    2 +-
- pango/pango-script.c           |    8 ++++----
- pango/pango-script.h           |   12 ++++++------
- pango/pango-utils.c            |    4 ++--
- pango/pango-utils.h            |   12 ++++++------
- pango/pangocairo-context.c     |    4 ++--
- pango/pangoft2.c               |    2 +-
- pango/pangox-fontmap.c         |    4 ++--
- 22 files changed, 49 insertions(+), 49 deletions(-)
-
-diff --git a/modules/hebrew/hebrew-shaper.c b/modules/hebrew/hebrew-shaper.c
-index 8aa3638..db3055b 100644
---- a/modules/hebrew/hebrew-shaper.c
-+++ b/modules/hebrew/hebrew-shaper.c
-@@ -167,7 +167,7 @@ static const gboolean compose_table[4][4] = {
- #define	is_composible(cur_wc, nxt_wc)	(compose_table[char_type_table[ucs2iso8859_8 (cur_wc)]]\
- 						      [char_type_table[ucs2iso8859_8 (nxt_wc)]])
- 
--G_CONST_RETURN char *
-+const char *
- hebrew_shaper_get_next_cluster(const char      *text,
- 			       gint		length,
- 			       gunichar        *cluster,
-diff --git a/pango/fonts.c b/pango/fonts.c
-index ab5397a..d9de7de 100644
---- a/pango/fonts.c
-+++ b/pango/fonts.c
-@@ -165,7 +165,7 @@ pango_font_description_set_family_static (PangoFontDescription *desc,
-  *               %NULL if not previously set.  This has the same life-time
-  *               as the font description itself and should not be freed.
-  **/
--G_CONST_RETURN char *
-+const char *
- pango_font_description_get_family (const PangoFontDescription *desc)
- {
-   g_return_val_if_fail (desc != NULL, NULL);
-@@ -1927,7 +1927,7 @@ pango_font_family_init (PangoFontFamily *family G_GNUC_UNUSED)
-  * Return value: the name of the family. This string is owned
-  *   by the family object and must not be modified or freed.
-  **/
--G_CONST_RETURN char *
-+const char *
- pango_font_family_get_name (PangoFontFamily  *family)
- {
-   g_return_val_if_fail (PANGO_IS_FONT_FAMILY (family), NULL);
-@@ -2060,7 +2060,7 @@ pango_font_face_is_synthesized (PangoFontFace  *face)
-  * Return value: the face name for the face. This string is
-  *   owned by the face object and must not be modified or freed.
-  **/
--G_CONST_RETURN char *
-+const char *
- pango_font_face_get_face_name (PangoFontFace *face)
- {
-   g_return_val_if_fail (PANGO_IS_FONT_FACE (face), NULL);
-diff --git a/pango/pango-attributes.c b/pango/pango-attributes.c
-index 28c11de..373fba1 100644
---- a/pango/pango-attributes.c
-+++ b/pango/pango-attributes.c
-@@ -97,7 +97,7 @@ pango_attr_type_register (const gchar *name)
-  *
-  * Since: 1.22
-  **/
--G_CONST_RETURN char *
-+const char *
- pango_attr_type_get_name (PangoAttrType type)
- {
-   const char *result = NULL;
-diff --git a/pango/pango-attributes.h b/pango/pango-attributes.h
-index 866e35d..59f97a3 100644
---- a/pango/pango-attributes.h
-+++ b/pango/pango-attributes.h
-@@ -180,7 +180,7 @@ struct _PangoAttrFontDesc
- };
- 
- PangoAttrType         pango_attr_type_register (const gchar        *name);
--G_CONST_RETURN char * pango_attr_type_get_name (PangoAttrType       type) G_GNUC_CONST;
-+const char *          pango_attr_type_get_name (PangoAttrType       type) G_GNUC_CONST;
- 
- void             pango_attribute_init        (PangoAttribute       *attr,
- 					      const PangoAttrClass *klass);
-diff --git a/pango/pango-context.c b/pango/pango-context.c
-index 6ec0b56..3c9442a 100644
---- a/pango/pango-context.c
-+++ b/pango/pango-context.c
-@@ -188,7 +188,7 @@ pango_context_set_matrix (PangoContext       *context,
-  *
-  * Since: 1.6
-  **/
--G_CONST_RETURN PangoMatrix *
-+const PangoMatrix *
- pango_context_get_matrix (PangoContext *context)
- {
-   g_return_val_if_fail (PANGO_IS_CONTEXT (context), NULL);
-diff --git a/pango/pango-context.h b/pango/pango-context.h
-index d8c3cb8..d85928a 100644
---- a/pango/pango-context.h
-+++ b/pango/pango-context.h
-@@ -84,9 +84,9 @@ void                      pango_context_set_gravity_hint     (PangoContext
- 							      PangoGravityHint            hint);
- PangoGravityHint          pango_context_get_gravity_hint     (PangoContext               *context);
- 
--void                        pango_context_set_matrix (PangoContext      *context,
--						      const PangoMatrix *matrix);
--G_CONST_RETURN PangoMatrix *pango_context_get_matrix (PangoContext      *context);
-+void                      pango_context_set_matrix           (PangoContext      *context,
-+						              const PangoMatrix *matrix);
-+const PangoMatrix *       pango_context_get_matrix           (PangoContext      *context);
- 
- /* Break a string of Unicode characters into segments with
-  * consistent shaping/language engine and bidrectional level.
-diff --git a/pango/pango-font.h b/pango/pango-font.h
-index b5b2cf1..eea27b4 100644
---- a/pango/pango-font.h
-+++ b/pango/pango-font.h
-@@ -117,7 +117,7 @@ void                 pango_font_description_set_family        (PangoFontDescript
- 							       const char           *family);
- void                 pango_font_description_set_family_static (PangoFontDescription *desc,
- 							       const char           *family);
--G_CONST_RETURN char *pango_font_description_get_family        (const PangoFontDescription *desc) G_GNUC_PURE;
-+const char          *pango_font_description_get_family        (const PangoFontDescription *desc) G_GNUC_PURE;
- void                 pango_font_description_set_style         (PangoFontDescription *desc,
- 							       PangoStyle            style);
- PangoStyle           pango_font_description_get_style         (const PangoFontDescription *desc) G_GNUC_PURE;
-@@ -212,7 +212,7 @@ GType      pango_font_family_get_type       (void) G_GNUC_CONST;
- void                 pango_font_family_list_faces (PangoFontFamily  *family,
- 						   PangoFontFace  ***faces,
- 						   int              *n_faces);
--G_CONST_RETURN char *pango_font_family_get_name   (PangoFontFamily  *family) G_GNUC_PURE;
-+const char *pango_font_family_get_name   (PangoFontFamily  *family) G_GNUC_PURE;
- gboolean   pango_font_family_is_monospace         (PangoFontFamily  *family) G_GNUC_PURE;
- 
- #ifdef PANGO_ENABLE_BACKEND
-@@ -261,7 +261,7 @@ struct _PangoFontFamilyClass
- GType      pango_font_face_get_type       (void) G_GNUC_CONST;
- 
- PangoFontDescription *pango_font_face_describe       (PangoFontFace  *face);
--G_CONST_RETURN char  *pango_font_face_get_face_name  (PangoFontFace  *face) G_GNUC_PURE;
-+const char           *pango_font_face_get_face_name  (PangoFontFace  *face) G_GNUC_PURE;
- void                  pango_font_face_list_sizes     (PangoFontFace  *face,
- 						      int           **sizes,
- 						      int            *n_sizes);
-diff --git a/pango/pango-fontmap.c b/pango/pango-fontmap.c
-index 13f4263..78b1692 100644
---- a/pango/pango-fontmap.c
-+++ b/pango/pango-fontmap.c
-@@ -290,7 +290,7 @@ pango_font_map_real_load_fontset (PangoFontMap               *fontmap,
-  *
-  * Since: 1.4
-  **/
--G_CONST_RETURN char *
-+const char *
- pango_font_map_get_shape_engine_type (PangoFontMap *fontmap)
- {
-   g_return_val_if_fail (PANGO_IS_FONT_MAP (fontmap), NULL);
-diff --git a/pango/pango-language.c b/pango/pango-language.c
-index bfde308..2bb294e 100644
---- a/pango/pango-language.c
-+++ b/pango/pango-language.c
-@@ -319,7 +319,7 @@ pango_language_from_string (const char *language)
-  * Returns: a string representing the language tag.  This is owned by
-  *          Pango and should not be freed.
-  */
--G_CONST_RETURN char *
-+const char *
- (pango_language_to_string) (PangoLanguage *language)
- {
-   return pango_language_to_string (language);
-@@ -531,7 +531,7 @@ static const LangInfo lang_texts[] = {
-  * Return value: the sample string. This value is owned by Pango
-  *   and should not be freed.
-  **/
--G_CONST_RETURN char *
-+const char *
- pango_language_get_sample_string (PangoLanguage *language)
- {
-   const LangInfo *lang_info;
-@@ -592,7 +592,7 @@ pango_language_get_sample_string (PangoLanguage *language)
-  
-  * Since: 1.22
-  **/
--G_CONST_RETURN PangoScript *
-+const PangoScript *
- pango_language_get_scripts (PangoLanguage *language,
- 			    int           *num_scripts)
- {
-diff --git a/pango/pango-language.h b/pango/pango-language.h
-index 37cdc16..31660ca 100644
---- a/pango/pango-language.h
-+++ b/pango/pango-language.h
-@@ -34,11 +34,11 @@ typedef struct _PangoLanguage PangoLanguage;
- GType          pango_language_get_type    (void) G_GNUC_CONST;
- PangoLanguage *pango_language_from_string (const char *language);
- 
--G_CONST_RETURN char *pango_language_to_string   (PangoLanguage *language) G_GNUC_CONST;
-+const char    *pango_language_to_string   (PangoLanguage *language) G_GNUC_CONST;
- /* For back compat.  Will have to keep indefinitely. */
- #define pango_language_to_string(language) ((const char *)language)
- 
--G_CONST_RETURN char *pango_language_get_sample_string (PangoLanguage *language) G_GNUC_CONST;
-+const char    *pango_language_get_sample_string (PangoLanguage *language) G_GNUC_CONST;
- PangoLanguage *pango_language_get_default (void) G_GNUC_CONST;
- 
- gboolean      pango_language_matches  (PangoLanguage *language,
-@@ -48,7 +48,7 @@ gboolean      pango_language_matches  (PangoLanguage *language,
- 
- gboolean		    pango_language_includes_script (PangoLanguage *language,
- 							    PangoScript    script) G_GNUC_PURE;
--G_CONST_RETURN PangoScript *pango_language_get_scripts	   (PangoLanguage *language,
-+const PangoScript          *pango_language_get_scripts	   (PangoLanguage *language,
- 							    int           *num_scripts);
- 
- G_END_DECLS
-diff --git a/pango/pango-layout.c b/pango/pango-layout.c
-index 12f9dee..2dc0c17 100644
---- a/pango/pango-layout.c
-+++ b/pango/pango-layout.c
-@@ -677,7 +677,7 @@ pango_layout_set_font_description (PangoLayout                 *layout,
-  *
-  * Since: 1.8
-  **/
--G_CONST_RETURN PangoFontDescription *
-+const PangoFontDescription *
- pango_layout_get_font_description (PangoLayout *layout)
- {
-   g_return_val_if_fail (PANGO_IS_LAYOUT (layout), NULL);
-@@ -1087,7 +1087,7 @@ pango_layout_set_text (PangoLayout *layout,
-  *
-  * Return value: the text in the @layout.
-  **/
--G_CONST_RETURN char*
-+const char*
- pango_layout_get_text (PangoLayout *layout)
- {
-   g_return_val_if_fail (PANGO_IS_LAYOUT (layout), NULL);
-diff --git a/pango/pango-layout.h b/pango/pango-layout.h
-index 3b769ff..d786dc6 100644
---- a/pango/pango-layout.h
-+++ b/pango/pango-layout.h
-@@ -116,7 +116,7 @@ void           pango_layout_set_markup_with_accel (PangoLayout    *layout,
- void           pango_layout_set_font_description (PangoLayout                *layout,
- 						  const PangoFontDescription *desc);
- 
--G_CONST_RETURN PangoFontDescription *pango_layout_get_font_description (PangoLayout *layout);
-+const PangoFontDescription *pango_layout_get_font_description (PangoLayout *layout);
- 
- void           pango_layout_set_width            (PangoLayout                *layout,
- 						  int                         width);
-diff --git a/pango/pango-ot-ruleset.c b/pango/pango-ot-ruleset.c
-index b5e2795..8fe7b72 100644
---- a/pango/pango-ot-ruleset.c
-+++ b/pango/pango-ot-ruleset.c
-@@ -107,7 +107,7 @@ pango_ot_ruleset_finalize (GObject *object)
-  *
-  * Since: 1.18
-  **/
--G_CONST_RETURN PangoOTRuleset *
-+const PangoOTRuleset *
- pango_ot_ruleset_get_for_description (PangoOTInfo                     *info,
- 				      const PangoOTRulesetDescription *desc)
- {
-diff --git a/pango/pango-renderer.c b/pango/pango-renderer.c
-index db75446..a1fea5e 100644
---- a/pango/pango-renderer.c
-+++ b/pango/pango-renderer.c
-@@ -1352,7 +1352,7 @@ pango_renderer_set_matrix (PangoRenderer     *renderer,
-  *
-  * Since: 1.8
-  **/
--G_CONST_RETURN PangoMatrix *
-+const PangoMatrix *
- pango_renderer_get_matrix (PangoRenderer *renderer)
- {
-   g_return_val_if_fail (PANGO_IS_RENDERER (renderer), NULL);
-diff --git a/pango/pango-renderer.h b/pango/pango-renderer.h
-index 354127b..5410a9f 100644
---- a/pango/pango-renderer.h
-+++ b/pango/pango-renderer.h
-@@ -249,7 +249,7 @@ PangoColor *pango_renderer_get_color (PangoRenderer    *renderer,
- 
- void                        pango_renderer_set_matrix (PangoRenderer     *renderer,
- 						       const PangoMatrix *matrix);
--G_CONST_RETURN PangoMatrix *pango_renderer_get_matrix (PangoRenderer     *renderer);
-+const PangoMatrix          *pango_renderer_get_matrix (PangoRenderer     *renderer);
- 
- PangoLayout     *pango_renderer_get_layout      (PangoRenderer     *renderer);
- PangoLayoutLine *pango_renderer_get_layout_line (PangoRenderer     *renderer);
-diff --git a/pango/pango-script.c b/pango/pango-script.c
-index 605e46e..1d57a69 100644
---- a/pango/pango-script.c
-+++ b/pango/pango-script.c
-@@ -164,10 +164,10 @@ pango_script_iter_free (PangoScriptIter *iter)
-  * Since: 1.4
-  **/
- void
--pango_script_iter_get_range (PangoScriptIter      *iter,
--			     G_CONST_RETURN char **start,
--			     G_CONST_RETURN char **end,
--			     PangoScript          *script)
-+pango_script_iter_get_range (PangoScriptIter  *iter,
-+                             const char      **start,
-+                             const char      **end,
-+                             PangoScript      *script)
- {
-   if (start)
-     *start = iter->script_start;
-diff --git a/pango/pango-script.h b/pango/pango-script.h
-index 32ef737..ef5f698 100644
---- a/pango/pango-script.h
-+++ b/pango/pango-script.h
-@@ -128,12 +128,12 @@ PangoScript pango_script_for_unichar         (gunichar             ch) G_GNUC_CO
- 
- PangoScriptIter *pango_script_iter_new       (const char          *text,
- 					      int                  length);
--void             pango_script_iter_get_range (PangoScriptIter      *iter,
--					      G_CONST_RETURN char **start,
--					      G_CONST_RETURN char **end,
--					      PangoScript          *script);
--gboolean         pango_script_iter_next      (PangoScriptIter      *iter);
--void             pango_script_iter_free      (PangoScriptIter      *iter);
-+void             pango_script_iter_get_range (PangoScriptIter     *iter,
-+                                              const char         **start,
-+                                              const char         **end,
-+                                              PangoScript         *script);
-+gboolean         pango_script_iter_next      (PangoScriptIter     *iter);
-+void             pango_script_iter_free      (PangoScriptIter     *iter);
- 
- #include <pango/pango-language.h>
- 
-diff --git a/pango/pango-utils.c b/pango/pango-utils.c
-index 100dbc7..71deeef 100644
---- a/pango/pango-utils.c
-+++ b/pango/pango-utils.c
-@@ -689,7 +689,7 @@ DllMain (HINSTANCE hinstDLL,
-  * Return value: the Pango sysconf directory. The returned string should
-  * not be freed.
-  */
--G_CONST_RETURN char *
-+const char *
- pango_get_sysconf_subdirectory (void)
- {
- #ifdef G_OS_WIN32
-@@ -718,7 +718,7 @@ pango_get_sysconf_subdirectory (void)
-  * Return value: the Pango lib directory. The returned string should
-  * not be freed.
-  */
--G_CONST_RETURN char *
-+const char *
- pango_get_lib_subdirectory (void)
- {
- #ifdef G_OS_WIN32
-diff --git a/pango/pango-utils.h b/pango/pango-utils.h
-index 41a8bbb..f86c662 100644
---- a/pango/pango-utils.h
-+++ b/pango/pango-utils.h
-@@ -82,13 +82,13 @@ gboolean pango_parse_stretch (const char   *str,
-  * stored in the registry). The returned string should not be
-  * g_free'd.
-  */
--G_CONST_RETURN char *   pango_get_sysconf_subdirectory (void) G_GNUC_PURE;
-+const char *   pango_get_sysconf_subdirectory (void) G_GNUC_PURE;
- 
- /* Ditto for LIBDIR/pango. On Win32, use the same Pango
-  * installation directory. This returned string should not be
-  * g_free'd either.
-  */
--G_CONST_RETURN char *   pango_get_lib_subdirectory (void) G_GNUC_PURE;
-+const char *   pango_get_lib_subdirectory (void) G_GNUC_PURE;
- 
- #endif /* PANGO_ENABLE_BACKEND */
- 
-@@ -131,12 +131,12 @@ gboolean pango_is_zero_width (gunichar ch) G_GNUC_CONST;
- int pango_version (void) G_GNUC_CONST;
- 
- /* Return run-time Pango version as an string */
--G_CONST_RETURN char * pango_version_string (void) G_GNUC_CONST;
-+const char * pango_version_string (void) G_GNUC_CONST;
- 
- /* Check that run-time Pango is as new as required */
--G_CONST_RETURN char * pango_version_check (int required_major,
--					   int required_minor,
--					   int required_micro) G_GNUC_CONST;
-+const char * pango_version_check (int required_major,
-+                                  int required_minor,
-+                                  int required_micro) G_GNUC_CONST;
- 
- G_END_DECLS
- 
-diff --git a/pango/pangocairo-context.c b/pango/pangocairo-context.c
-index 69432f0..f61e839 100644
---- a/pango/pangocairo-context.c
-+++ b/pango/pangocairo-context.c
-@@ -260,7 +260,7 @@ pango_cairo_context_set_font_options (PangoContext               *context,
-  *
-  * Since: 1.10
-  **/
--G_CONST_RETURN cairo_font_options_t *
-+const cairo_font_options_t *
- pango_cairo_context_get_font_options (PangoContext *context)
- {
-   PangoCairoContextInfo *info;
-@@ -286,7 +286,7 @@ pango_cairo_context_get_font_options (PangoContext *context)
-  * Return value: the combined set of font options. This value is owned
-  * by the context and must not be modified or freed.
-  **/
--G_CONST_RETURN cairo_font_options_t *
-+const cairo_font_options_t *
- _pango_cairo_context_get_merged_font_options (PangoContext *context)
- {
-   PangoCairoContextInfo *info = get_context_info (context, TRUE);
-diff --git a/pango/pangoft2.c b/pango/pangoft2.c
-index f4a3864..b41c468 100644
---- a/pango/pangoft2.c
-+++ b/pango/pangoft2.c
-@@ -520,7 +520,7 @@ ft_error_compare (const void *pkey,
-   return ((ft_error_description *) pkey)->code - ((ft_error_description *) pbase)->code;
- }
- 
--G_CONST_RETURN char *
-+const char *
- _pango_ft2_ft_strerror (FT_Error error)
- {
- #undef __FTERRORS_H__
-diff --git a/pango/pangox-fontmap.c b/pango/pangox-fontmap.c
-index 6d5e547..3f5343f 100644
---- a/pango/pangox-fontmap.c
-+++ b/pango/pangox-fontmap.c
-@@ -1441,7 +1441,7 @@ pango_x_fontmap_atom_from_name (PangoFontMap *fontmap,
- }
- 
- 
--G_CONST_RETURN char *
-+const char *
- pango_x_fontmap_name_from_atom (PangoFontMap *fontmap,
- 				Atom          atom)
- {
-@@ -1645,7 +1645,7 @@ pango_x_family_list_faces (PangoFontFamily  *family,
-     }
- }
- 
--static G_CONST_RETURN char *
-+static const char *
- pango_x_family_get_name (PangoFontFamily  *family)
- {
-   PangoXFamily *xfamily = PANGO_X_FAMILY (family);
--- 
-1.7.8.3
-
diff --git a/package/pango/pango-no-tests.patch b/package/pango/pango-no-tests.patch
deleted file mode 100644
index 7ebcbc6..0000000
--- a/package/pango/pango-no-tests.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- a/Makefile.in	2008-01-21 22:28:49.000000000 -0500
-+++ b/Makefile.in	2008-02-09 13:02:41.000000000 -0500
-@@ -260,7 +260,7 @@ sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = pango modules pango-view examples docs tools tests
-+SUBDIRS = pango modules pango-view examples docs tools 
- EXTRA_DIST = \
- 	autogen.sh		\
- 	pango.pc.in		\
-
---- a/Makefile.am	2008-01-17 16:37:49.000000000 -0500
-+++ b/Makefile.am	2008-02-09 13:35:13.000000000 -0500
-@@ -1,6 +1,6 @@
- ## Process this file with automake to create Makefile.in.
- 
--SUBDIRS= pango modules pango-view examples docs tools tests
-+SUBDIRS= pango modules pango-view examples docs tools 
- 
- EXTRA_DIST = 			\
- 	autogen.sh		\
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 31d92ba..45361d9 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.28
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
+PANGO_VERSION_MAJOR = 1.36
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).3
 
-PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
+PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
@@ -39,26 +39,27 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
-PANGO_CONF_OPT = --enable-explicit-deps=no --disable-debug
+PANGO_CONF_OPT = --enable-explicit-deps=no \
+	--disable-debug \
+	--disable-gtk-doc-html
 
 PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	host-pkgconf \
 	libglib2 \
 	cairo \
+	harfbuzz \
 	fontconfig \
 	freetype
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-        PANGO_CONF_OPT += --with-x \
-		--x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib --disable-glibtest
+	PANGO_CONF_OPT += --x-includes=$(STAGING_DIR)/usr/include/X11 \
+		--x-libraries=$(STAGING_DIR)/usr/lib
 	PANGO_DEPENDENCIES += xlib_libX11
-else
-        PANGO_CONF_OPT += --without-x
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
 	PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
+	PANGO_CONF_OPT += --with-xft
 endif
 
 define PANGO_INSTALL_INITSCRIPT
-- 
2.0.0
