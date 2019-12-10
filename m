From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:41 +0100
Subject: [Buildroot] [PATCH 02/12] package/pkg-utils.mk: add
 extractor-pkg-dependency macro
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191210215952.902477-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To extract some archive types, if the extracting tool is not available
on the system where Buildroot runs on, we build it using a Buildroot
host package.

Such dependencies are currently explicitly handled by the
inner-generic-package macro, but in fact we also need to handle them
in all places where the "suitable-extractor" macro is invoked, and
some packages invoke it directly. Otherwise, such packages may be
missing a dependency to the appropriate host Buildroot package
building the extracting tool they need. An example is gettext-tiny,
whose source code is a gzip-compressed tarball, but in addition
manually extracts a xz-compressed tarball.

This extractor-pkg-dependency macro will be used in follow-up commits
to ensure all the packages that use suitable-extractor properly add
the correct dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0f916d81d8..35a441e0aa 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -46,6 +46,14 @@ INFLATE.tar  = cat
 # suitable-extractor(filename): returns extractor based on suffix
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
+EXTRACTOR_PKG_DEPENDENCY.lzma = $(BR2_XZCAT_HOST_DEPENDENCY)
+EXTRACTOR_PKG_DEPENDENCY.xz   = $(BR2_XZCAT_HOST_DEPENDENCY)
+EXTRACTOR_PKG_DEPENDENCY.lz   = $(BR2_LZIP_HOST_DEPENDENCY)
+
+# extractor-pkg-dependency(filename): returns a Buildroot package
+# dependency needed to extract file based on suffix
+extractor-pkg-dependency = $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1)))
+
 # extractor-system-dependency(filename): returns the name of the tool
 # needed to extract 'filename', and is meant to be used with
 # DL_TOOLS_DEPENDENCIES, in order to check that the necesary tool is
-- 
2.23.0
