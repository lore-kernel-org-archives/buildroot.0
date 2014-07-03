From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  3 Jul 2014 18:53:26 +0200
Subject: [Buildroot] [v2 3/3] perl-net-ssleay: fix build
In-Reply-To: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
References: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1404406406-9209-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the following error occurs after the previous patch
    arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-shared '

so, force LDDLFLAGS without quote

note: previously LDDLFLAGS was correct
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssleay/perl-net-ssleay.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 7e4c194..48ff715 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -13,4 +13,9 @@ PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 
 PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
 
+define PERL_NET_SSLEAY_FIX_MAKEFILE
+	$(SED) 's/^LDDLFLAGS =.*/LDDLFLAGS = -shared/' $(@D)/Makefile
+endef
+PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
+
 $(eval $(perl-package))
-- 
1.9.1
