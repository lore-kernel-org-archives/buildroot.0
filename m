From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Sep 2016 22:37:51 +0200
Subject: [Buildroot] [git commit] package/ustr: really fix ldconfig
Message-ID: <20160926204447.A623B8218D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22069232c25e3e227ed181dd1cda442533a3adc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 99067c1 (package/ustr: don't run ldconfig), we tried to fix parallel
build issues, caused by running ldconfig, by not running ldconfig.

We borked that fix, as build issues still crop up from time to time:
ldconfig is still run because our override is not accounted for by
ustr's buildsystem. Instead of overriding ldconifg at build time, we
need to override it at configure time.

Just do that.

Fixes:
    http://autobuild.buildroot.org/results/7b1/7b12f00612da4ad8dffe0c8010b95db881630b17/
    http://autobuild.buildroot.org/results/242/24209ba13f56889357024b0e460d508b7a03d1d2/
    http://autobuild.buildroot.org/results/963/963141370a9b127f473a7fae161656a6b0a4f33b/

(Those are the only three build issues in the more-than-a-month since we
initially tried to fix that.)

To be noted: upstream has accepted my patch, plus they completely
removed calls to ldconfig altogether. Add a comment so we don't forget
to remove our workaround when we bump.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ustr/ustr.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index 1d629ab..b3de50b 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# When bumping the version to a new upstream release, be sure to remove
+# the ldconfig hack, below.
 USTR_VERSION = 1.0.4
 USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
 USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
@@ -23,7 +25,7 @@ USTR_INSTALL_STAGING = YES
 # 'all-shared' to the default 'all' rule.
 USTR_MAKE_OPTS = all all-shared
 
-USTR_MAKE_OPTS += LDCONFIG=/bin/true
+USTR_CONF_OPTS += LDCONFIG=/bin/true
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
