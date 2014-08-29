From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Aug 2014 08:59:01 +0200
Subject: [Buildroot] [git commit] libroxml: fix pthread linking issue
Message-ID: <20140829070108.DC7C79D588@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=134f51bf0db816027703cf6830e07fab4e798804
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/d18/d188bcf5c374273ffe09589f7db5a40e4c5d7bc9/

Thread handling can get disabled with --disable-xml-thread-safe, but that's
a change for next.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libroxml/libroxml.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 9a6c97a..f30169f 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -12,4 +12,8 @@ LIBROXML_LICENSE_FILES = License.txt
 
 LIBROXML_CONF_OPT = --disable-silent-rules
 
+# libroxml forgets to compile/link with -pthread, even though it uses
+# thread functions breaking static linking
+LIBROXML_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -pthread" LIBS="-pthread"
+
 $(eval $(autotools-package))
