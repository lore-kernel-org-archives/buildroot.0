From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 15:03:28 +0100
Subject: [Buildroot] [git commit] ustr: not available for static-only
	configurations
Message-ID: <20151227140443.6A1027FAFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ac65b37bd34a4ba9a97156ace0fe91ce3670912
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ustr now unconditionally builds a shared library, so we have to mark
it as not available for static-only builds. The only reverse
dependencies of ustr is libsemanage, which was anyway already not
available for pure static builds.

Fixes:

  http://autobuild.buildroot.org/results/734/734975f6ac041e8aece07205c0b8966fe51e7df1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ustr/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ustr/Config.in b/package/ustr/Config.in
index a86b26d..0d9c272 100644
--- a/package/ustr/Config.in
+++ b/package/ustr/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_USTR
 	bool "ustr"
+	# unconditionally builds a shared library
+	depends on !BR2_STATIC_LIBS
 	help
 	  A small, safe string library.
 
 	  http://www.and.org/ustr/
+
+comment "ustr needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
