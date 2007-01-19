From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 01:47:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070119094730.134EB4858E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 01:47:29 -0800 (Fri, 19 Jan 2007)
New Revision: 17374

Log:
- Correct some typos
- Add some more explanation to the -clean and -dirclean targets


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-01-19 09:24:39 UTC (rev 17373)
+++ trunk/buildroot/docs/buildroot.html	2007-01-19 09:47:29 UTC (rev 17374)
@@ -36,7 +36,7 @@
       <li><a href="#downloaded_packages">Location of downloaded packages</a></li>
       <li><a href="#add_software">Extending Buildroot with more
       Software</a></li>
-      <li><a href="#links">Ressources</a></li>
+      <li><a href="#links">Resources</a></li>
     </ul>
 
     <h2><a name="about" id="about"></a>About Buildroot</h2>
@@ -455,9 +455,9 @@
      4  #
      5  #############################################################
      6  FOO_VERSION:=1.0
-     7  FOO_SOURCE:=less-$(FOO_VERSION).tar.gz
+     7  FOO_SOURCE:=foo-$(FOO_VERSION).tar.gz
      8  FOO_SITE:=http://www.foosoftware.org/downloads
-     9  FOO_DIR:=$(BUILD_DIR)/less-$(FOO_VERSION)
+     9  FOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
     10  FOO_BINARY:=foo
     11  FOO_TARGET_BINARY:=usr/bin/foo
     12
@@ -466,10 +466,10 @@
     15
     16  $(FOO_DIR)/.source: $(DL_DIR)/$(FOO_SOURCE)
     17          $(ZCAT) $(DL_DIR)/$(FOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-    18          touch $(FOO_DIR)/.source
+    18          touch $@
     19
     20  $(FOO_DIR)/.configured: $(FOO_DIR)/.source
-    21          (cd $(FOO_DIR); \
+    21          (cd $(FOO_DIR); rm -rf config.cache ; \
     22                  $(TARGET_CONFIGURE_OPTS) \
     23                  CFLAGS="$(TARGET_CFLAGS)" \
     24                  ./configure \
@@ -479,7 +479,7 @@
     28                  --prefix=/usr \
     29                  --sysconfdir=/etc \
     30          );
-    31          touch $(FOO_DIR)/.configured;
+    31          touch $@
     32
     33  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
     34          $(MAKE) CC=$(TARGET_CC) -C $(FOO_DIR)
@@ -600,14 +600,21 @@
 
     <p>Line 42 defines a simple target that only downloads the code
     source. This is not used during normal operation of Buildroot, but
-    might be useful.</p>
+    is needed if you intend to download all required sources at once
+    for later offline build. Note that if you add a new package providing
+    a <code>foo-source</code> target is <i>mandatory</i> to support
+    users that wish to do offline-builds. Furthermore it eases checking
+    if all package-sources are downloadable.</p>
 
-    <p>Lignes 44-46 define a simple target to clean the software build
-    by calling the <i>Makefiles</i> with the appropriate option.</p>
+    <p>Lines 44-46 define a simple target to clean the software build
+    by calling the <i>Makefiles</i> with the appropriate option.<br>
+    The <code>clean</code> target should run <code>make clean</code>
+    on $(BUILD_DIR)/package-version and MUST uninstall all files of the
+    package from $(STAGING_DIR) and from $(TARGET_DIR).</p>
 
     <p>Lines 48-49 define a simple target to completely remove the
     directory in which the software was uncompressed, configured and
-    compiled.</p>
+    compiled. This target MUST completely rm $(BUILD_DIR)/package-version.</p>
 
     <p>Lines 51-58 adds the target <code>foo</code> to the list
     of targets to be compiled by Buildroot by first checking if
@@ -630,7 +637,7 @@
     <p>If you package software that might be useful for other persons,
     don't forget to send a patch to Buildroot developers !</p>
 
-     <h2><a name="links" id="links"></a>Ressources</h2>
+     <h2><a name="links" id="links"></a>Resources</h2>
 
     <p>To learn more about Buildroot you can visit these
     websites:</p>
