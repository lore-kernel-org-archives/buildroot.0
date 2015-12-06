From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  6 Dec 2015 15:14:36 +0100
Subject: [Buildroot] [V4 3/3] package/perl-db-file: Fix berkeleydb detection
In-Reply-To: <1449411276-27492-1-git-send-email-francois.perrad@gadz.org>
References: <1449411276-27492-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1449411276-27492-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
