From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:48 -0000
Subject: [Buildroot] [git commit branch/next] docs: rework
	LIBFOO_SITE_METHOD documentation
Message-ID: <20120802195247.9CD668E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fd16a175b228888669a4e7b0b582c92893a9f7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The current structure of the LIBFOO_SITE_METHOD paragraph would make
it difficult to add documentation for the "file" and "local" methods.
There are enough possible values for LIBFOO_SITE_METHOD that
describing them in a sub-list seems to work well, which makes it
easier to add documentation for new methods.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-gentargets.txt |   46 +++++++++++++++++----------
 1 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index 918580e..b296ac4 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -180,23 +180,35 @@ information is (assuming the package name is +libfoo+) :
     +LIBFOO_SITE=/opt/software/libfoo.tar.gz+
     +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
 
-* +LIBFOO_SITE_METHOD+ may contain the method to fetch the package
-  source code. It can either be +wget+ (for normal FTP/HTTP downloads
-  of tarballs), +scp+ (for downloads over SSH with scp), +svn+, +git+,
-  +hg+ or +bzr+.  When not specified, it is guessed from the URL given
-  in +LIBFOO_SITE+: +scp://+, +svn://+, +git://+ and
-  +bzr://+ URLs will use the +scp+, +svn+, +git+ and +bzr+ methods
-  respectively. All other URL-types will use the +wget+ method. So for
-  example, in the case of a package whose source code is available
-  through a Subversion repository on HTTP, one 'must' specifiy
-  +LIBFOO_SITE_METHOD=svn+. Similarly, for Mercurial repositories, one
-  'must' specify +LIBFOO_SITE_METHOD=hg+. For +svn+, +git+, +hg+ and
-  +bzr+ methods, what Buildroot does is a checkout/clone of the repository
-  which is then tarballed and stored into the download cache. Next
-  builds will not checkout/clone again, but will use the tarball directly.
-  When +HOST_LIBFOO_SITE_METHOD+ is not specified, it defaults to the value
-  of +LIBFOO_SITE_METHOD+. See +package/multimedia/tremor/+ for an
-  example.
+* +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
+  package source code. In many cases, Buildroot guesses the method
+  from the contents of +LIBFOO_SITE+ and setting +LIBFOO_SITE_METHOD+
+  is unnecessary. When +HOST_LIBFOO_SITE_METHOD+ is not specified, it
+  defaults to the value of +LIBFOO_SITE_METHOD+. +
+  The possible values of +LIBFOO_SITE_METHOD+ are:
+  ** +wget+ for normal FTP/HTTP downloads of tarballs.  Used by
+     default when +LIBFOO_SITE+ begins with +http://+, +https://+ or
+     +ftp://+.
+  ** +scp+ for downloads of tarballs over SSH with scp.  Used by
+     default when +LIBFOO_SITE+ begins with +scp://+.
+  ** +svn+ for retrieving source code from a Subversion repository.
+     Used by default when +LIBFOO_SITE+ begins with +svn://+.  When a
+     +http://+ Subversion repository URL is specified in
+     +LIBFOO_SITE+, one 'must' specify +LIBFOO_SITE_METHOD=svn+.
+     Buildroot performs a checkout which is preserved as a tarball in
+     the download cache; subsequent builds use the tarball instead of
+     performing another checkout.
+  ** +git+ for retrieving source code from a Git repository.  Used by
+     default when +LIBFOO_SITE+ begins with +git://+. The downloaded
+     source code is cached as with the +svn+
+     method.
+  ** +hg+ for retrieving source code from a Mercurial repository. One
+     'must' specify +LIBFOO_SITE_METHOD=hg+ when +LIBFOO_SITE+
+     contains a Mercurial repository URL. The downloaded source code
+     is cached as with the +svn+ method.
+  ** +bzr+ for retrieving source code from a Bazaar repository. Used
+     by default when +LIBFOO_SITE+ begins with +bzr://+. The
+     downloaded source code is cached as with the +svn+ method.
 
 * +LIBFOO_DEPENDENCIES+ lists the dependencies (in terms of package
   name) that are required for the current target package to
