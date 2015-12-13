From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 15:56:06 +0100
Subject: [Buildroot] [git commit] package/perl-db-file: Fix berkeleydb
	detection
Message-ID: <20151213145615.DD6117FEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=593bd60c4d67cad26a3b8ed839887ecbce2e6a2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this patch libdb.so is not detected and
lib/perl5/site_perl/5.22.0/i586-linux/auto/DB_File/DB_File.so
is not linked against it:

Parsing config.in...
Looks Good.
Checking if your kit is complete...
Looks good
Warning (mostly harmless): No library found for -ldb
Generating a Unix-style Makefile
Writing Makefile for DB_File
Writing MYMETA.yml and MYMETA.json
>>> perl-db-file 1.835 Building

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/perl5/site_perl/5.22.0/i586-linux/auto/DB_File/DB_File.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

After applying this patch configure output will look like this:

Parsing config.in...
Looks Good.
Checking if your kit is complete...
Looks good
Generating a Unix-style Makefile
Writing Makefile for DB_File
Writing MYMETA.yml and MYMETA.json
>>> perl-db-file 1.835 Building

and the resulting library is correctly linked against libdb:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/perl5/site_perl/5.22.0/i586-linux/auto/DB_File/DB_File.so | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libdb-5.3.so]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-db-file/perl-db-file.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/perl-db-file/perl-db-file.mk b/package/perl-db-file/perl-db-file.mk
index 6d611ea..3db8c56 100644
--- a/package/perl-db-file/perl-db-file.mk
+++ b/package/perl-db-file/perl-db-file.mk
@@ -11,4 +11,12 @@ PERL_DB_FILE_DEPENDENCIES = berkeleydb
 PERL_DB_FILE_LICENSE = Artistic or GPLv1+
 PERL_DB_FILE_LICENSE_FILES = README
 
+define PERL_DB_FILE_FIX_CONFIG_IN
+	$(SED) 's%^INCLUDE.*%INCLUDE = $(STAGING_DIR)/usr/include%' \
+		$(@D)/config.in
+	$(SED) 's%^LIB.*%LIB = $(STAGING_DIR)/usr/lib%' \
+		$(@D)/config.in
+endef
+PERL_DB_FILE_POST_PATCH_HOOKS += PERL_DB_FILE_FIX_CONFIG_IN
+
 $(eval $(perl-package))
