From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Apr 2014 17:05:55 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-perl: fix for Perl XS packages
	configured by a Makefile.PL
Message-ID: <1398006356-5425-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

for native package, ExtUtils::MakeMaker detects all include filenames on system perl,
all these includes will be required by the generated Makefile but on STAGING_DIR.

patchlevel-debian.h is not a part of the Perl distribution,
but it was added by some Linux distributions (Debian, Ubuntu, ...)
In this case, we create an empty file on STAGING_DIR.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 447f364..876ffdb 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -88,6 +88,7 @@ define $(2)_CONFIGURE_CMDS
 			INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
 			INSTALLVENDORMAN3DIR=/usr/share/man/man3 \
 			$$($(2)_CONF_OPT); \
+		touch $(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-debian.h; \
 	fi
 endef
 else
-- 
1.9.1
