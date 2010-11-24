From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Nov 2010 15:38:41 +0100
Subject: [Buildroot] [PATCH 7/8] documentation: Document the GIT/SVN
	download capabilities
In-Reply-To: <cover.1290609511.git.thomas.petazzoni@free-electrons.com>
References: <cover.1290609511.git.thomas.petazzoni@free-electrons.com>
Message-ID: <488c055329218689d761edb82817f8cb5f444ac1.1290609511.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |   46 +++++++++++++++++++++++++++++++++++++---------
 1 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index a7dd8d6..97f5db7 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -997,9 +997,12 @@ $(eval $(call GENTARGETS,package,libfoo,host))
     <code>libfoo</code>) :</p>
 
     <ul>
-      <li><code>LIBFOO_VERSION</code>, mandatory, must contain the version
-      of the package. Note that if <code>HOST_LIBFOO_VERSION</code> doesn't
-      exist, it is assumed to be the same as <code>LIBFOO_VERSION</code>.<br/>
+      <li><code>LIBFOO_VERSION</code>, mandatory, must contain the
+      version of the package. Note that
+      if <code>HOST_LIBFOO_VERSION</code> doesn't exist, it is assumed
+      to be the same as <code>LIBFOO_VERSION</code>. It can also be a
+      Subversion or Git branch or tag, for packages that are fetched
+      directly from their revision control system.<br/>
       Example: <code>LIBFOO_VERSION = 0.1.2</code></li>
 
       <li><code>LIBFOO_SOURCE</code> may contain the name of the tarball of
@@ -1018,13 +1021,38 @@ $(eval $(call GENTARGETS,package,libfoo,host))
       in the package directory inside Buildroot will be applied to the
       package after extraction.</li>
 
-      <li><code>LIBFOO_SITE</code> may contain the Internet location of the
-      tarball of the package. If <code>HOST_LIBFOO_SITE</code> is not
-      specified, it defaults to <code>LIBFOO_SITE</code>. If none are
-      specified, then the location is assumed to be
+      <li><code>LIBFOO_SITE</code> may contain the Internet location
+      of the package. It can either be the HTTP or FTP location of a
+      tarball, or the URL of a Git or Subversion repository
+      (see <code>LIBFOO_SITE_METHOD</code>
+      below). If <code>HOST_LIBFOO_SITE</code> is not specified, it
+      defaults to <code>LIBFOO_SITE</code>. If none are specified,
+      then the location is assumed to be
       <code>http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename</code>.
-      <br/>Example:
-      <code>LIBFOO_SITE=http://www.libfoosoftware.org/libfoo</code>.</li>
+      <br/>Examples:<br/>
+      <code>LIBFOO_SITE=http://www.libfoosoftware.org/libfoo</code><br/>
+      <code>LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/</code></li>
+
+      <li><code>LIBFOO_SITE_METHOD</code> may contain the method to
+      fetch the package source code. It can either
+      be <code>WGET</code> (for normal FTP/HTTP downloads of
+      tarballs), <code>SVN</code> or <code>GIT</code>. When not
+      specified, it is guessed from the URL given
+      in <code>LIBFOO_SITE</code>: <code>git://</code>
+      and <code>svn://</code> URLs will use the <code>GIT</code>
+      and <code>SVN</code> methods respectively. All other URL-types
+      will use the <code>WGET</code> method. So for example, in the
+      case of a package whose source code is available through
+      Subversion repository on HTTP, one <i>must</i>
+      specifiy <code>LIBFOO_SITE_METHOD=SVN</code>. For <code>SVN</code>
+      and <code>GIT</code> methods, what Buildroot does is a
+      checkout/clone of the repository which is then tarballed and
+      stored into the download cache. Next builds will not
+      checkout/clone again, but will use the tarball
+      directly. When <code>HOST_LIBFOO_SITE_METHOD</code> is not
+      specified, it defaults to the value
+      of <code>LIBFOO_SITE_METHOD</code>. See <code>package/multimedia/tremor/</code>
+      for an example.</li>
 
       <li><code>LIBFOO_DEPENDENCIES</code> lists the dependencies (in terms
       of package name) that are required for the current target package to
-- 
1.7.0.4
