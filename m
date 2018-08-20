From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:11 -0700
Subject: [Buildroot] [PATCH 10/18] perl-template-toolkit: new package
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-11-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/perl-template-toolkit/Config.in            | 11 ++++++++
 .../perl-template-toolkit.hash                     |  6 +++++
 .../perl-template-toolkit/perl-template-toolkit.mk | 31 ++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/perl-template-toolkit/Config.in
 create mode 100644 package/perl-template-toolkit/perl-template-toolkit.hash
 create mode 100644 package/perl-template-toolkit/perl-template-toolkit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bb43154698..1b17ada11d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -509,6 +509,7 @@ F:	package/perl-sub-install/
 F:	package/perl-sys-cpu/
 F:	package/perl-sys-meminfo/
 F:	package/perl-sys-mmap/
+F:	package/perl-template-toolkit/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
 
diff --git a/package/Config.in b/package/Config.in
index b4aa57ab19..9ec5dd1007 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -735,6 +735,7 @@ menu "Perl libraries/modules"
 	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
 	source "package/perl-sys-mmap/Config.in"
+	source "package/perl-template-toolkit/Config.in"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-time-parsedate/Config.in"
 	source "package/perl-timedate/Config.in"
diff --git a/package/perl-template-toolkit/Config.in b/package/perl-template-toolkit/Config.in
new file mode 100644
index 0000000000..1caca074aa
--- /dev/null
+++ b/package/perl-template-toolkit/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_TEMPLATE_TOOLKIT
+	bool "perl-template-toolkit"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_APPCONFIG
+	help
+	  comprehensive template processing system
+
+	  https://metacpan.org/release/Template-Toolkit
+
+comment "perl-template-toolkit needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-template-toolkit/perl-template-toolkit.hash b/package/perl-template-toolkit/perl-template-toolkit.hash
new file mode 100644
index 0000000000..54d4553695
--- /dev/null
+++ b/package/perl-template-toolkit/perl-template-toolkit.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    a7fae5d4fe5918f33105d92a62134067 Template-Toolkit-2.27.tar.gz
+sha256 1311a403264d0134c585af0309ff2a9d5074b8ece23ece5660d31ec96bf2c6dc Template-Toolkit-2.27.tar.gz
+
+# computed by scancpan
+sha256 d897b2d98affd4f0489340e54ceb542383101e3d21408dfad025df71d770d842 README
diff --git a/package/perl-template-toolkit/perl-template-toolkit.mk b/package/perl-template-toolkit/perl-template-toolkit.mk
new file mode 100644
index 0000000000..f65d685fa1
--- /dev/null
+++ b/package/perl-template-toolkit/perl-template-toolkit.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# perl-template-toolkit
+#
+################################################################################
+
+PERL_TEMPLATE_TOOLKIT_VERSION = 2.27
+PERL_TEMPLATE_TOOLKIT_SOURCE = Template-Toolkit-$(PERL_TEMPLATE_TOOLKIT_VERSION).tar.gz
+PERL_TEMPLATE_TOOLKIT_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABW
+PERL_TEMPLATE_TOOLKIT_DEPENDENCIES = perl-appconfig
+PERL_TEMPLATE_TOOLKIT_LICENSE = Artistic or GPL-1.0+
+PERL_TEMPLATE_TOOLKIT_LICENSE_FILES = README
+
+# There has got to be a better way... :(
+# Some arguments to Makefile.PL do not get propagated to subdirectories
+# similar to:
+# https://rt.cpan.org/Public/Bug/Display.html?id=28632
+define PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SED
+	$(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(@D)/xs/Makefile
+	$(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g" $(@D)/xs/Makefile
+	$(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $(@D)/xs/Makefile
+	$(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g" $(@D)/xs/Makefile
+	$(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $(@D)/xs/Makefile
+	$(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared $(TARGET_LDFLAGS):g" $(@D)/xs/Makefile
+	$(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g" $(@D)/xs/Makefile
+	$(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g" $(@D)/xs/Makefile
+endef
+
+PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_HOOKS += PERL_TEMPLATE_TOOLKIT_POST_CONFIGURE_SED
+
+$(eval $(perl-package))
-- 
2.14.4
