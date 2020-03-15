From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 21:38:55 +0100
Subject: [Buildroot] [git commit]
 package/perl-mojolicious-plugin-authorization: new package
Message-ID: <20200315203841.DA86C8158B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98de719cffb0f2de7e8b4757a141f0f0a1bcb5a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added via utils/scancpan, but removing the 'suspicious' dependency on
'host-perl-mojolicious'.

    During configuration, the package warns:

    Checking prerequisites...
      requires:
        !  Mojo::Base is not installed
      build_requires:
        !  Mojolicious::Lite is not installed
        !  Test::Mojo is not installed

    ERRORS/WARNINGS FOUND IN PREREQUISITES.  You may wish to install the versions
    of the modules indicated above before proceeding with this installation

    Run 'Build installdeps' to install missing prerequisites.

But the build and installation continues correctly nonetheless.

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                |  1 +
 package/Config.in                                         |  1 +
 package/perl-mojolicious-plugin-authorization/Config.in   |  7 +++++++
 .../perl-mojolicious-plugin-authorization.hash            |  6 ++++++
 .../perl-mojolicious-plugin-authorization.mk              | 15 +++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 86e653f854..d3ed653dd9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2405,6 +2405,7 @@ F:	package/perl-locale-maketext-lexicon/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
+F:	package/perl-mojolicious-plugin-authorization/
 F:	package/perl-net-snmp/
 F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
diff --git a/package/Config.in b/package/Config.in
index 06c22ee3cd..10f3131ea5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -779,6 +779,7 @@ menu "Perl libraries/modules"
 	source "package/perl-module-runtime/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-mojolicious-plugin-authentication/Config.in"
+	source "package/perl-mojolicious-plugin-authorization/Config.in"
 	source "package/perl-moo/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
diff --git a/package/perl-mojolicious-plugin-authorization/Config.in b/package/perl-mojolicious-plugin-authorization/Config.in
new file mode 100644
index 0000000000..87976cbbe8
--- /dev/null
+++ b/package/perl-mojolicious-plugin-authorization/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION
+	bool "perl-mojolicious-plugin-authorization"
+	select BR2_PACKAGE_PERL_MOJOLICIOUS # runtime
+	help
+	  A plugin to make authorization a bit easier.
+
+	  https://metacpan.org/module/Mojolicious::Plugin::Authorization
diff --git a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash
new file mode 100644
index 0000000000..c55eefe2ff
--- /dev/null
+++ b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    9c009599cf397e3eacf5d7cd0dec45b8 Mojolicious-Plugin-Authorization-1.05.tar.gz
+sha256 87f84092d5698595ad0d01e745eca1d6affd1f3d662786f39f3583c54ffed0e3 Mojolicious-Plugin-Authorization-1.05.tar.gz
+
+# computed by scancpan
+sha256 fd9632faca5a3d6af4cb9cf776514de87d2b34bff3a6cf06c23eea0f9cc3ab06 LICENSE
diff --git a/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
new file mode 100644
index 0000000000..3fcee08a46
--- /dev/null
+++ b/package/perl-mojolicious-plugin-authorization/perl-mojolicious-plugin-authorization.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-mojolicious-plugin-authorization
+#
+################################################################################
+
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION = 1.05
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_SOURCE = Mojolicious-Plugin-Authorization-$(PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_VERSION).tar.gz
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BY/BYTEROCK
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_DEPENDENCIES = host-perl-module-build
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_LICENSE = Artistic or GPL-1.0+
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_LICENSE_FILES = LICENSE
+PERL_MOJOLICIOUS_PLUGIN_AUTHORIZATION_DISTNAME = Mojolicious-Plugin-Authorization
+
+$(eval $(perl-package))
