From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Mon, 23 Jul 2018 22:06:27 +0200
Subject: [Buildroot] [PATCH 2/3] perl-net-ssh2: avoid build system
 inspecting host paths
In-Reply-To: <20180723200628.2256-1-thomas.de_schampheleire@nokia.com>
References: <20180723200628.2256-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180723200628.2256-3-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During investigation of adding gcrypt support in perl-net-ssh2, it became
clear that its build system is trying to find libraries via host search
paths, i.e. /usr/lib64/ etc.

This can be avoided by explicitly passing a 'lib' and 'inc' path.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.16.4
