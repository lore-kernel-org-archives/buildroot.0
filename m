From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 12:09:19 +0200
Subject: [Buildroot] [PATCH] infra/perl: switch to using a reliable mirror
Message-ID: <1405764559-11332-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mirror we currently use is not a mirror, it's the main archive.

It has a few shortcomings:
  - it might not contain all the versions of the modules we use,
  - it can be unavailable at times (like now, for example)

Switch to using a realmirror, that:
  - does a round-robin on the actual mirror, so availability is better
  - contains all versions of all modules (yes, mojolicious is there!)

As a consequence, switch mojolicious to use our standard mirror,

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fran?ois Perrad <francois.perrad@gadz.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                    | 2 +-
 package/perl-mojolicious/perl-mojolicious.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 50968fb..b169678 100644
--- a/Config.in
+++ b/Config.in
@@ -242,7 +242,7 @@ config BR2_LUAROCKS_MIRROR
 
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
-	default "http://search.cpan.org/CPAN"
+	default "http://cpan.metacpan.org"
 	help
 	  CPAN (Comprehensive Perl Archive Network) is a repository
 	  of Perl packages. It has multiple software mirrors scattered
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 4d0de5e..7d3d6c0 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -6,7 +6,7 @@
 
 PERL_MOJOLICIOUS_VERSION = 5.08
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
-PERL_MOJOLICIOUS_SITE = http://backpan.perl.org/authors/id/S/SR/SRI/
+PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI/
 PERL_MOJOLICIOUS_DEPENDENCIES = perl
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
 PERL_MOJOLICIOUS_LICENSE_FILES = LICENSE
-- 
1.9.1
