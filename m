From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Mar 2021 23:42:20 +0100
Subject: [Buildroot] [PATCH] package/perl: fix configure when
 BR2_VERSION_FULL contains a '/'
Message-ID: <20210327224220.961977-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_VERSION_FULL contains one or more '/', injection our version
in the perl patch-level fails:

    /usr/bin/sed: -e expression #1, char 27: unknown option to `s'

When the build is done in a git tree, and HEAD is a tag, BR2_VERSION_FULL
will contain that tag name. Even if not widely common, it is not unusual
for a tag to contain a '/', and this is perfectly legit in git.

So, mangle BR2_VERSION_FULL to escape all '/' with a backslash '\', so
that the sed expression is correct, and so that we eventually have a
correct pathclevel string in perl's --version output.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0ff288db0e..a77686f951 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -79,7 +79,7 @@ endif
 define PERL_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) HOSTCC='$(HOSTCC_NOCCACHE)' \
 		./configure $(PERL_CONF_OPTS))
-	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
+	$(SED) 's/UNKNOWN-/Buildroot $(subst /,\/,$(BR2_VERSION_FULL)) /' $(@D)/patchlevel.h
 endef
 
 define PERL_BUILD_CMDS
-- 
2.25.1
