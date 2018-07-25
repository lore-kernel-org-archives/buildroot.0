From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 23:03:02 +0200
Subject: [Buildroot] [git commit] perl-net-ssh2: avoid build system
 inspecting host paths
Message-ID: <20180725205908.C72C18A402@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c3da6140bdf93d76740515582507b651297fd1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During investigation of adding gcrypt support in perl-net-ssh2, it became
clear that its build system is trying to find libraries via host search
paths, i.e. /usr/lib64/ etc.

This can be avoided by explicitly passing a 'lib' and 'inc' path.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-ssh2/perl-net-ssh2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index b174fa6210..77d39edef5 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -10,5 +10,9 @@ PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SSH2_LICENSE_FILES = README
 PERL_NET_SSH2_DEPENDENCIES = libssh2 zlib
+# build system will use host search paths by default
+PERL_NET_SSH2_CONF_OPTS += \
+	lib="$(STAGING_DIR)/usr/lib" \
+	inc="$(STAGING_DIR)/usr/include"
 
 $(eval $(perl-package))
