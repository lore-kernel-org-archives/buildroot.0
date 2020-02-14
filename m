From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Fri, 14 Feb 2020 13:48:27 +0100
Subject: [Buildroot] [PATCH v2 10/10] docs/manual/adding-packages-cargo:
 Update for legal-info
In-Reply-To: <20200214124827.30767-1-patrick.havelange@essensium.com>
References: <20200214124827.30767-1-patrick.havelange@essensium.com>
Message-ID: <20200214124827.30767-10-patrick.havelange@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added a bit of explanations regarding the vendored licenses.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
---
 docs/manual/adding-packages-cargo.txt | 45 ++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index e7d03eb7b5..e92b8bc353 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -38,19 +38,25 @@ with an example:
 04: #
 05: ################################################################################
 06:
-07: FOO_VERSION = 1.0
-08: FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
-09: FOO_SITE = http://www.foosoftware.org/download
-10: FOO_LICENSE = GPL-3.0+
-11: FOO_LICENSE_FILES = COPYING
-12:
-13: $(eval $(cargo-package))
+07: include package/foo/vendor.inc
+08:
+09: FOO_VERSION = 1.0
+10: FOO_SOURCE = foo-$(FOO_VERSION).tar.gz
+11: FOO_SITE = http://www.foosoftware.org/download
+12: FOO_LICENSE = GPL-3.0+
+13: FOO_LICENSE_FILES = COPYING $(FOO_VENDOR_LICENSE_FILES)
+14:
+15: $(eval $(cargo-package))
 --------------------------------
 
-The Makefile starts with the definition of the standard variables for package
-declaration (lines 7 to 11).
+The Makefile starts with the inclusion of a second file that
+contains the vendored licenses, more info on that topic later.
+Then it continues with the definition of the standard variables
+for package declaration (lines 9 to 13).
 
-As seen in line 13, it is based on the cargo-package infrastructure. Cargo will
+FOO_VENDOR_LICENSE_FILES is defined in the previously included file vendor.inc
+
+As seen in line 15, it is based on the cargo-package infrastructure. Cargo will
 be invoked automatically by this infrastructure. The required dependencies of the
 crate will be downloaded and the buildroot dependencies will also be set.
 
@@ -58,7 +64,20 @@ It is still possible to define custom build commands or install commands (i.e.
 with FOO_BUILD_CMDS and FOO_INSTALL_TARGET_CMDS).
 Those will then replace the commands from the cargo infrastructure.
 
-==== About Dependencies Management
+The file vendor.inc contains only one variable :
+
+------------------------------
+01: FOO_VENDOR_LICENSES_FILES = \
+02: 	VENDOR/bar/COPYING \
+03: 	VENDOR/blah/LICENSE-MIT \
+04:	VENDOR/bleh/COPYING \
+05: 
+--------------------------------
+
+It is recommended to generate the list via scripting.
+A script example can be found in the ripgrep directory.
+
+==== About Dependencies Management and Licenses
 
 A crate can depend on other libraries from crates.io or git repositories, listed
 in its Cargo.toml file. Before starting a build, the +cargo vendor+ command
@@ -66,3 +85,7 @@ will be run and will take care of downloading those dependencies.
 
 The final source tarball will contain all the required dependencies, effectively
 permitting us to do an offline build.
+
+In order for the +legal-info+ target to work as expected, it is necessary to list
+the licenses of the vendored dependencies. Each of those entries should be added
+to the +.mk+ and +.hash+ files.
-- 
2.17.1
