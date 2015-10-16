From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 16 Oct 2015 12:49:03 -0300
Subject: [Buildroot] [PATCH] webkitgtk24: add patch to disable dependency
	tracking
Message-ID: <1445010543-26875-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Saves about 2 minutes of build time, on a 4c4t build machine from
42 minutes down to 40.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 .../webkitgtk24/0004-fix-dependency-tracking.patch | 117 +++++++++++++++++++++
 package/webkitgtk24/webkitgtk24.mk                 |   2 -
 2 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 package/webkitgtk24/0004-fix-dependency-tracking.patch

diff --git a/package/webkitgtk24/0004-fix-dependency-tracking.patch b/package/webkitgtk24/0004-fix-dependency-tracking.patch
new file mode 100644
index 0000000..68d9a82
--- /dev/null
+++ b/package/webkitgtk24/0004-fix-dependency-tracking.patch
@@ -0,0 +1,117 @@
+Fixes the need to enable depedency tracking on multicore builds.
+Reduced version from https://bugs.webkit.org/show_bug.cgi?id=94488
+
+Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
+
+diff --git a/Source/WebCore/GNUmakefile.am b/Source/WebCore/GNUmakefile.am
+index cfecee7..d41fe63 100644
+--- a/Source/WebCore/GNUmakefile.am
++++ b/Source/WebCore/GNUmakefile.am
+@@ -390,11 +390,14 @@ audio_DATA = $(WebCore)/platform/audio/resources/Composite.wav
+ dist_audio_DATA = $(audio_DATA)
+ endif  # END ENABLE_WEB_AUDIO
+ 
++DerivedSources/ANGLE:
++	$(AM_V_at)mkdir -p $@
++
+ # ANGLE tokenizer & parser
+-DerivedSources/ANGLE/glslang.cpp: Source/ThirdParty/ANGLE/src/compiler/glslang.l DerivedSources/ANGLE/glslang_tab.cpp
++DerivedSources/ANGLE/glslang.cpp: Source/ThirdParty/ANGLE/src/compiler/glslang.l DerivedSources/ANGLE/glslang_tab.cpp DerivedSources/ANGLE
+ 	$(AM_V_GEN)$(FLEX) --noline --nounistd --outfile="$@" "$<"
+ 
+-DerivedSources/ANGLE/glslang_tab.cpp: Source/ThirdParty/ANGLE/src/compiler/glslang.y
++DerivedSources/ANGLE/glslang_tab.cpp: Source/ThirdParty/ANGLE/src/compiler/glslang.y DerivedSources/ANGLE
+ 	$(AM_V_GEN)$(BISON) --no-lines --defines="DerivedSources/ANGLE/glslang_tab.h" --skeleton=yacc.c --output="$@" $<
+ DerivedSources/ANGLE/glslang_tab.h: DerivedSources/ANGLE/glslang_tab.cpp
+ 
+diff --git a/Source/WebCore/bindings/gobject/GNUmakefile.am b/Source/WebCore/bindings/gobject/GNUmakefile.am
+index 6864e10..4e4eaac 100644
+--- a/Source/WebCore/bindings/gobject/GNUmakefile.am
++++ b/Source/WebCore/bindings/gobject/GNUmakefile.am
+@@ -474,10 +474,12 @@ BUILT_SOURCES += \
+ 
+ gdom_class_list := $(subst WebKitDOM,, $(filter-out %Private, $(basename $(notdir $(webkitgtk_gdom_built_sources)))))
+ gdom_class_list += Custom EventTarget Object Deprecated
+-DerivedSources/webkitdom/webkitdom.h: $(WebCore)/bindings/scripts/gobject-generate-headers.pl $(WebCore)/bindings/gobject/GNUmakefile.am
++DerivedSources/webkitdom:
++	$(AM_V_at)mkdir -p $@
++DerivedSources/webkitdom/webkitdom.h: $(WebCore)/bindings/scripts/gobject-generate-headers.pl $(WebCore)/bindings/gobject/GNUmakefile.am DerivedSources/webkitdom
+ 	$(AM_V_GEN)echo $(gdom_class_list) | $(PERL) $< gdom > $@
+ 
+-DerivedSources/webkitdom/webkitdomdefines.h: $(WebCore)/bindings/scripts/gobject-generate-headers.pl $(WebCore)/bindings/gobject/GNUmakefile.am
++DerivedSources/webkitdom/webkitdomdefines.h: $(WebCore)/bindings/scripts/gobject-generate-headers.pl $(WebCore)/bindings/gobject/GNUmakefile.am DerivedSources/webkitdom
+ 	$(AM_V_GEN)echo $(gdom_class_list) | $(PERL) $< defines > $@
+ 
+ noinst_DATA += DerivedSources/webkitdom/webkitdom.symbols
+@@ -519,16 +521,16 @@ CLEAN_FILES = \
+ # DerivedSources/webkitdom directory.  The reason is that we want all header files distributed in the
+ # include/webkit-x.y/webkitdom directory, but do not want to name the WebCore/bindings/gobject directory
+ # "webkitdom", as that's a bit presumptuous for a GTK binding.
+-$(top_builddir)/DerivedSources/webkitdom/WebKitDOMObject.h: $(WebCore)/bindings/gobject/WebKitDOMObject.h
++$(top_builddir)/DerivedSources/webkitdom/WebKitDOMObject.h: $(WebCore)/bindings/gobject/WebKitDOMObject.h $(top_builddir)/DerivedSources/webkitdom
+ 	$(AM_V_GEN)cp -f $< $@
+ 
+-$(top_builddir)/DerivedSources/webkitdom/WebKitDOMEventTarget.h: $(WebCore)/bindings/gobject/WebKitDOMEventTarget.h
++$(top_builddir)/DerivedSources/webkitdom/WebKitDOMEventTarget.h: $(WebCore)/bindings/gobject/WebKitDOMEventTarget.h $(top_builddir)/DerivedSources/webkitdom
+ 	$(AM_V_GEN)cp -f $< $@
+ 
+-$(top_builddir)/DerivedSources/webkitdom/WebKitDOMEventTargetPrivate.h: $(WebCore)/bindings/gobject/WebKitDOMEventTargetPrivate.h
++$(top_builddir)/DerivedSources/webkitdom/WebKitDOMEventTargetPrivate.h: $(WebCore)/bindings/gobject/WebKitDOMEventTargetPrivate.h $(top_builddir)/DerivedSources/webkitdom
+ 	$(AM_V_GEN)cp -f $< $@
+ 
+-$(top_builddir)/DerivedSources/webkitdom/WebKitDOMCustom.h: $(WebCore)/bindings/gobject/WebKitDOMCustom.h
++$(top_builddir)/DerivedSources/webkitdom/WebKitDOMCustom.h: $(WebCore)/bindings/gobject/WebKitDOMCustom.h $(top_builddir)/DerivedSources/webkitdom
+ 	$(AM_V_GEN)cp -f $< $@
+ 
+ $(top_builddir)/DerivedSources/webkitdom/WebKitDOMDeprecated.h: $(WebCore)/bindings/gobject/WebKitDOMDeprecated.h
+diff --git a/Source/WebKit/gtk/GNUmakefile.am b/Source/WebKit/gtk/GNUmakefile.am
+index 4954f19..db1e777 100644
+--- a/Source/WebKit/gtk/GNUmakefile.am
++++ b/Source/WebKit/gtk/GNUmakefile.am
+@@ -349,13 +349,16 @@ $(GENSOURCES_WEBKIT)/webkitmarshal.cpp: stamp-webkitmarshal.cpp
+ $(GENSOURCES_WEBKIT)/webkitmarshal.h: stamp-webkitmarshal.h
+ 	@true
+ 
+-stamp-webkitmarshal.cpp: $(WEBKIT_MARSHAL_LIST)
++$(GENSOURCES_WEBKIT):
++	$(AM_V_at)mkdir -p $@
++
++stamp-webkitmarshal.cpp: $(WEBKIT_MARSHAL_LIST) $(GENSOURCES_WEBKIT)
+ 	$(AM_V_GEN) echo "extern \"C\" {" > $(GENSOURCES_WEBKIT)/webkitmarshal.cpp && \
+ 	$(GLIB_GENMARSHAL) --prefix=webkit_marshal $(WEBKIT_MARSHAL_LIST) --body >> $(GENSOURCES_WEBKIT)/webkitmarshal.cpp && \
+ 	echo '}' >> $(GENSOURCES_WEBKIT)/webkitmarshal.cpp && \
+ 	echo timestamp > $(@F)
+ 
+-stamp-webkitmarshal.h: $(WEBKIT_MARSHAL_LIST)
++stamp-webkitmarshal.h: $(WEBKIT_MARSHAL_LIST) $(GENSOURCES_WEBKIT)
+ 	$(AM_V_GEN)$(GLIB_GENMARSHAL) --prefix=webkit_marshal $(WEBKIT_MARSHAL_LIST) --header > $(GENSOURCES_WEBKIT)/webkitmarshal.h && \
+ 	echo timestamp > $(@F)
+ 
+@@ -370,7 +373,7 @@ stamp-webkitenumtypes.h: $(webkitgtk_h_api) $(WebKit)/GNUmakefile.am
+ 	&& rm -f xgen-gth \
+ 	&& echo timestamp > $(@F)
+ 
+-$(GENSOURCES_WEBKIT)/webkitenumtypes.cpp: $(webkitgtk_h_api) $(WebKit)/GNUmakefile.am
++$(GENSOURCES_WEBKIT)/webkitenumtypes.cpp: $(webkitgtk_h_api) $(WebKit)/GNUmakefile.am $(GENSOURCES_WEBKIT)
+ 	$(AM_V_GEN)glib-mkenums --template $(srcdir)/Source/WebKit/gtk/webkit/webkitenumtypes.cpp.template $(webkitgtk_h_api) | \
+ 		sed 's,web_kit,webkit,' \
+ 		> xgen-gtc \
+diff --git a/Tools/WebKitTestRunner/GNUmakefile.am b/Tools/WebKitTestRunner/GNUmakefile.am
+index 0e17835..cbfa8e2 100644
+--- a/Tools/WebKitTestRunner/GNUmakefile.am
++++ b/Tools/WebKitTestRunner/GNUmakefile.am
+@@ -156,7 +156,10 @@ code_generation_dependencies = \
+ 	Source/WebCore/bindings/scripts/InFilesParser.pm \
+ 	Source/WebCore/bindings/scripts/generate-bindings.pl
+ 
+-DerivedSources/InjectedBundle/JS%.cpp: Tools/WebKitTestRunner/InjectedBundle/Bindings/%.idl $(code_generation_dependencies)
++$(top_builddir)/DerivedSources/InjectedBundle:
++	$(AM_V_at)mkdir -p $@
++
++DerivedSources/InjectedBundle/JS%.cpp: Tools/WebKitTestRunner/InjectedBundle/Bindings/%.idl $(code_generation_dependencies) $(top_builddir)/DerivedSources/InjectedBundle
+ 	$(AM_V_GEN)$(PERL) \
+ 		-I $(srcdir)/Source/WebCore/bindings/scripts \
+ 		-I $(srcdir)/Tools/WebKitTestRunner/InjectedBundle/Bindings \
+-- 
+1.8.4.2
+
diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index 3be1cc7..a9f8aef 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -33,9 +33,7 @@ ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_sh),y)
 WEBKITGTK24_CONF_ENV += LIBS="-latomic"
 endif
 
-# dependency tracking is to avoid build issues in the GEN/WTF phase
 WEBKITGTK24_CONF_OPTS = \
-	--enable-dependency-tracking \
 	--enable-spellcheck \
 	--disable-geolocation \
 	--disable-glibtest \
-- 
2.4.9
