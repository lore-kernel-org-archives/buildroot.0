From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 May 2010 22:33:27 +0200
Subject: [Buildroot] [PATCH 3/3] Add documentation on gettext integration
In-Reply-To: <cover.1274733199.git.thomas.petazzoni@free-electrons.com>
References: <cover.1274733199.git.thomas.petazzoni@free-electrons.com>
Message-ID: <77e026bbfabe01fc4c4f3410d283dbd7d836162a.1274733199.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   58 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index abe822f..3702b44 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -798,6 +798,8 @@ community support.</p>
 	<li><a href="#manual-tutorial">Manual Makefile : tutorial</a></li>
       </ul>
       </li>
+      <li><a href="#gettext-integration">Gettext integration and
+      interaction with packages</a></li>
     </ul>
 
     <h3><a name="package-directory"></a>Package directory</h3>
@@ -1583,6 +1585,62 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     line <a href="#ex2line40">40</a>, which is used by Buildroot to download,
     compile, and then install this package. </p>
 
+    <h3><a name="gettext-integration"></a>Gettext integration and
+    interaction with packages</h3>
+
+    <p>Many packages that support internationalization use the gettext
+    library. Dependency on this library are fairly complicated and
+    therefore deserves a few explanations.</p>
+
+    <p>The <i>uClibc</i> C library doesn't implement gettext
+    functionality, therefore with this C library, a separate gettext
+    must be compiled. On the other hand, the <i>glibc</i> C library
+    does integrate its own gettext, and in this case, the separate
+    gettext library should not be compiled, because it creates various
+    kind of build failures.</p>
+
+    <p>Additionnaly, some packages (such as libglib2) do require
+    gettext unconditionnally, while other packages (those who
+    support <code>--disable-nls</code> in general) only require
+    gettext when locale support is enabled.</p>
+
+    <p>Therefore, Buildroot defines two configuration options:</p>
+
+    <ul>
+      <li><code>BR2_NEEDS_GETTEXT</code>, which is true as soon as the
+      toolchain doesn't provide its own gettext implementation</li>
+
+      <li><code>BR2_NEEDS_GETTEXT_IF_LOCALE</code>, which is true if
+      the toolchain doesn't provide its own gettext implementation and
+      if locale support is enabled</li>
+
+    </ul>
+
+    <p>Therefore, packages that unconditionnally need gettext should:</p>
+
+    <ol>
+      <li>Use <code>select BR2_PACKAGE_GNUTTEXT if
+      BR2_NEEDS_GETTEXT</code> and possibly <code>select
+      BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT</code> if libintl is
+      also needed</li>
+
+      <li>Use <code>$(if $(BR2_NEEDS_GETTEXT),gettext)</code> in the
+      package <code>DEPENDENCIES</code> variable</li>
+    </ol>
+
+    <p>Packages that need gettext only when locale support is enabled
+    should:</p>
+
+    <ol>
+      <li>Use <code>select BR2_PACKAGE_GNUTTEXT if
+      BR2_NEEDS_GETTEXT_IF_LOCALE</code> and possibly <code>select
+      BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE</code> if
+      libintl is also needed</li>
+
+      <li>Use <code>$(if
+      $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)</code> in the
+      package <code>DEPENDENCIES</code> variable</li>
+    </ol>
 
     <h3>Conclusion</h3>
 
-- 
1.6.3.3
