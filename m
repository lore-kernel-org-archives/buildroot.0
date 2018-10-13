From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 13 Oct 2018 16:12:01 +0200
Subject: [Buildroot] [PATCH 2/2] perl-netaddr-ip: fix build of the XS version
In-Reply-To: <20181013141201.4234-1-francois.perrad@gadz.org>
References: <20181013141201.4234-1-francois.perrad@gadz.org>
Message-ID: <20181013141201.4234-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thank to the function patch_subdir_makefile

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-netaddr-ip/perl-netaddr-ip.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index a1f02c691..cd552d174 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -10,8 +10,16 @@ PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
 PERL_NETADDR_IP_LICENSE = Artistic or GPL-1.0+
 PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
 
-# we always build the Pure Perl version.
-# the build of the native part of NetAddr::IP::Util is buggy.
+define PERL_NETADDR_IP_PATCH_GENERATED_MAKEFILE
+	$(call patch_subdir_makefile,$(@D)/Lite/Makefile)
+	$(call patch_subdir_makefile,$(@D)/Lite/Util/Makefile)
+endef
+
+PERL_NETADDR_IP_POST_CONFIGURE_HOOKS += PERL_NETADDR_IP_PATCH_GENERATED_MAKEFILE
+
+ifeq ($(BR2_STATIC_LIBS),y)
+# build only the Pure Perl version.
 PERL_NETADDR_IP_CONF_OPTS = -noxs
+endif
 
 $(eval $(perl-package))
-- 
2.17.1
