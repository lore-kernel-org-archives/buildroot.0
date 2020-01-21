From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue, 21 Jan 2020 13:29:16 -0600
Subject: [Buildroot] [PATCH v2 1/1] perl: Add option to enable threads
Message-ID: <20200121192916.63356-1-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Hector Kesari <hector.kesari@rockwellcollins.com>

Add config option for Perl to enable threads usage.

Signed-off-by: Hector Kesari <hector.kesari@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

---
Changes v1 -> v2:
  - Changed references of PERL to Perl
  - Added a warning about using Perl threads
---
 package/perl/Config.in | 13 +++++++++++++
 package/perl/perl.mk   |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 32a3fd2ee9..34b87ee575 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -24,4 +24,17 @@ config BR2_PACKAGE_PERL_MODULES
 	  Leave empty for all modules (as far as the external libraries
 	  are available).
 
+config BR2_PACKAGE_PERL_ENABLE_THREADS
+	bool "Support for Threads in Perl"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Enable use of threads in Perl scripts
+
+	  WARNING: The use of interpreter-based threads in Perl
+	  is officially discouraged.
+	  See https://perldoc.perl.org/threads.html#WARNING
+
+comment "Perl threads need toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 endif
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0ab81ddb34..e0bbf9cfd4 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -62,6 +62,10 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
 PERL_CONF_OPTS += -Dusedevel
 endif
 
+ifeq ($(BR2_PACKAGE_PERL_ENABLE_THREADS),y)
+PERL_CONF_OPTS += -Dusethreads
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 PERL_CONF_OPTS += --all-static --no-dynaloader
 endif
-- 
2.23.0
