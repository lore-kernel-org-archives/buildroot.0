From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 12:35:20 +0200
Subject: [Buildroot] [git commit] php: fix selection of interfaces depending
	on BR2_USE_MMU
Message-ID: <20161025103557.CFA207FFCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d1ceeba0264c32b782d3a27ffbf532230274efd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c457213fbca5f3493544c8a4335b623620458b0c reworked the selection
of PHP interfaces, moving from a choice..endchoice to a three
independent sub-options.

Thanks to how choices are handled by kconfig, an option suitable for
noMMU platforms was automatically chosen by default. When the
choice...endchoice got removed in
c457213fbca5f3493544c8a4335b623620458b0c, we introduced a "select" for
one of the interfaces, to make sure at least one interface is
selected.

Unfortunately, the selected interface does not build on noMMU
platforms. In order to preserve the previous behavior (CGI interface
is selected by default on MMU capable platforms), this commit makes
the select logic a bit more complicated:

 - CGI is selected on MMU-capable platforms if neither CLI or FPM are
   selected

 - CLI is selected on MMU-less platforms, since this is anyway the
   only available interface.

Fixes:

  http://autobuild.buildroot.net/results/85ea09188f1e996cb14b4b83a17736c096c569a8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/php/Config.in b/package/php/Config.in
index 2e9e344..3020bcc 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_PHP
 	bool "php"
 	select BR2_PACKAGE_PHP_SAPI_CGI if \
 	       !BR2_PACKAGE_PHP_SAPI_CLI && \
-	       !BR2_PACKAGE_PHP_SAPI_FPM
+	       !BR2_PACKAGE_PHP_SAPI_FPM &&  \
+	       BR2_USE_MMU
+	select BR2_PACKAGE_PHP_SAPI_CLI if !BR2_USE_MMU
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
