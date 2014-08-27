From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Aug 2014 13:51:59 +0200
Subject: [Buildroot] [PATCH] perl-gd: mark as broken
Message-ID: <1409140319-9796-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perl-gd doesn't build on gcc10 due to the host Perl being a bit
old. This shows a defiency in the perl package infrastructure, which
is being worked on. However, since it won't be solved before 2014.08,
our only solution for now is to mark perl-gd as broken, as well as its
reverse dependency perl-gdgraph.

Avoids:

  http://autobuild.buildroot.org/results/228/228b43e67e683cecfa3851a8a030d06e9fdc6dac/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-gd/Config.in      | 2 ++
 package/perl-gdgraph/Config.in | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/perl-gd/Config.in b/package/perl-gd/Config.in
index 7c85cfc..3434507 100644
--- a/package/perl-gd/Config.in
+++ b/package/perl-gd/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PERL_GD
 	bool "perl-gd"
 	depends on !BR2_PREFER_STATIC_LIB
+	# Does not build on machines having a old host perl
+	depends on BR2_BROKEN
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_FREETYPE
diff --git a/package/perl-gdgraph/Config.in b/package/perl-gdgraph/Config.in
index e722c06..972a5c5 100644
--- a/package/perl-gdgraph/Config.in
+++ b/package/perl-gdgraph/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_GDGRAPH
 	bool "perl-gdgraph"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_BROKEN # perl-gd
 	select BR2_PACKAGE_PERL_GD
 	select BR2_PACKAGE_PERL_GDTEXTUTIL
 	help
-- 
2.0.0
