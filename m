From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:08 +0100
Subject: [Buildroot] [PATCH 13/21 RFC] package/perl: include perl-cross in
	the legal-info output
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <235ff089d38728311bea17ff542d5380d5c4555c.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The perl-cross sources are combined with the perl sources, so they must
be redistributed for proper compliance.

Add a post-legal-info hook that also installs them in the legal-info
output.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/perl/perl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f3b7b2b..25294e6 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -32,6 +32,13 @@ define PERL_CROSS_EXTRACT
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
+# ... and as such should be part of the legal-info redistribution
+define PERL_CROSS_LEGAL_INFO
+	$(Q)$(call hardlink-copy,$(DL_DIR)/$(PERL_CROSS_SOURCE),\
+				 $(PERL_REDIST_SOURCES_DIR))
+endef
+PERL_POST_LEGAL_INFO_HOOKS += PERL_CROSS_LEGAL_INFO
+
 define PERL_CROSS_SET_POD
 	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
 endef
-- 
1.9.1
