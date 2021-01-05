From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jan 2021 22:38:38 +0100
Subject: [Buildroot] [git commit] package/perl: add option to enable threads
Message-ID: <20210105212044.46989810DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c20eda273ca3937bfb2d1175a0dc7346fadd33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add config option for Perl to enable threads usage.

Signed-off-by: Hector Kesari <hector.kesari@rockwellcollins.com>
Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl/Config.in | 10 ++++++++++
 package/perl/perl.mk   |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/perl/Config.in b/package/perl/Config.in
index 32a3fd2ee9..0ead1c4a46 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -24,4 +24,14 @@ config BR2_PACKAGE_PERL_MODULES
 	  Leave empty for all modules (as far as the external libraries
 	  are available).
 
+config BR2_PACKAGE_PERL_THREADS
+	bool "thread support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Enable use of threads in Perl scripts
+
+	  WARNING: The use of interpreter-based threads in Perl
+	  is officially discouraged.
+	  See https://perldoc.perl.org/threads.html#WARNING
+
 endif
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 2f82e1d6d5..5f6aa97674 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -62,6 +62,10 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
 PERL_CONF_OPTS += -Dusedevel
 endif
 
+ifeq ($(BR2_PACKAGE_PERL_THREADS),y)
+PERL_CONF_OPTS += -Dusethreads
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 PERL_CONF_OPTS += --all-static --no-dynaloader
 endif
