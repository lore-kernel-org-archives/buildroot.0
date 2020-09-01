From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2020 20:34:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/graphite2:
 security bump to version 1.3.14
Message-ID: <20200901183229.1A78C81358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=164ef30bfeb4f0178fa16ae092e5acfc39811adb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Switch site to github, here is an extract of
  https://sourceforge.net/projects/silgraphite:
  "This project has been deprecated. Graphite2, a new version of the
  Graphite engine, is available at: https://github.com/silnrsi/graphite
  with its own bug tracker."
- graphite2 can be built statically since version 1.3.11 and
  https://github.com/silnrsi/graphite/commit/2f143c04da5caa43ddf4dba437b2f2bc26bf4238
- Update indentation in hash file (two spaces)

Extract from ChangeLog:

1.3.14
    . Bug fixes
    . Allow features to be hidden (for aliases)
    . Move to python3
    . Rename doc files from .txt to .asc

1.3.13
    . Resolve minor spacing issue in rtl non-overlap kerning
    . python3 for graphite.py
    . Better fuzzing
    . Better building on windows

1.3.12
    . Graphite no longer does dumb rendering for fonts with no smarts
    . Segment caching code removed. Anything attempting to use the segment cache gets given a regular face instead
    . Add libfuzzer support
    . Builds now require C++11
    . Improvements to Windows 64 bit builds
    . Support different versions of python including 32 bit and python 3
    . Various minor bug fixes

1.3.11
    . Fixes due to security review
    . Minor collision avoidance fixes
    . Fix LZ4 decompressor against high compression

The fixes due to security review are a little bit vague, a quick search
on github seems to indicate that those issues could be related to
segcache which has been removed since version 1.3.12:
https://github.com/silnrsi/graphite/search?q=security&type=Issues
https://github.com/silnrsi/graphite/commit/b0f77e4a9dc50a888f74e904000a2486b2fc5527

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d3a06c2fc4c5a692189a21712f138c6e2b428e37)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/graphite2/Config.in      | 7 +++----
 package/graphite2/graphite2.hash | 6 ++----
 package/graphite2/graphite2.mk   | 5 +++--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/graphite2/Config.in b/package/graphite2/Config.in
index 5499e17e27..ec92ff7be0 100644
--- a/package/graphite2/Config.in
+++ b/package/graphite2/Config.in
@@ -1,13 +1,12 @@
 config BR2_PACKAGE_GRAPHITE2
 	bool "graphite2"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
 	help
 	  Graphite is a project within SIL's scripts and software dev
 	  groups to provide cross-platform rendering for complex
 	  writing systems.
 
-	  http://graphite.sil.org/
+	  https://github.com/silnrsi/graphite
 
-comment "graphite2 needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "graphite2 needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
index e0c1aae670..e005375f8a 100644
--- a/package/graphite2/graphite2.hash
+++ b/package/graphite2/graphite2.hash
@@ -1,6 +1,4 @@
-# From http://sourceforge.net/projects/silgraphite/files/graphite2
-md5 b39d5ed21195f8b709bcee548c87e2b5  graphite2-1.3.10.tgz
-sha1 668f3bce96fc02d90ea875b401ed36b2e8957d2f  graphite2-1.3.10.tgz
+# From https://github.com/silnrsi/graphite/releases/download/1.3.14/graphite2-1.3.14.sha256sum
+sha256  f99d1c13aa5fa296898a181dff9b82fb25f6cc0933dbaa7a475d8109bd54209d  graphite2-1.3.14.tgz
 # Locally computed
-sha256  90fde3b2f9ea95d68ffb19278d07d9b8a7efa5ba0e413bebcea802ce05cda1ae  graphite2-1.3.10.tgz
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index 2bb4f463b0..40206bf0f8 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-GRAPHITE2_VERSION = 1.3.10
+GRAPHITE2_VERSION = 1.3.14
 GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
-GRAPHITE2_SITE = http://downloads.sourceforge.net/project/silgraphite/graphite2
+GRAPHITE2_SITE = \
+	https://github.com/silnrsi/graphite/releases/download/$(GRAPHITE2_VERSION)
 GRAPHITE2_INSTALL_STAGING = YES
 GRAPHITE2_LICENSE = LGPL-2.1+
 GRAPHITE2_LICENSE_FILES = LICENSE
