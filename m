From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Mar 2021 08:14:26 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/perl: fix
 configure when BR2_VERSION_FULL contains a '/'
Message-ID: <20210331055758.42B6988278@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=852d936be8a8fc9cb7852ec9fca056128e8e6712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

When BR2_VERSION_FULL contains one or more '/', injection our version
in the perl patch-level fails:

    /usr/bin/sed: -e expression #1, char 27: unknown option to `s'

When the build is done in a git tree, and HEAD is a tag, BR2_VERSION_FULL
will contain that tag name. Even if not widely common, it is not unusual
for a tag to contain a '/', and this is perfectly legit in git.

So, mangle BR2_VERSION_FULL to escape all '/' with a backslash '\', so
that the sed expression is correct, and so that we eventually have a
correct patchlevel string in perl's --version output.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0a2141349c12fcab639182b744ec3e2e5ab5d1f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
