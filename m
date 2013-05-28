From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 13:17:17 +0200
Subject: [Buildroot] [git commit] flex: fix autobuilder failures
Message-ID: <20130528111842.B67D09A61B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=240843cce36850de37719940e7578c2e3b7d041b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since fe6a9e5e9d (flex: needs M4 at runtime), the autobuilders have
been producing a number of flex related build failures. They have been
hard to track down, because even on the same machine, with the same
Git commit ID and the same configuration, the failure could not be
reproduced.

However, a close inspection of flex's config.log file allowed to find
out what the problem was. In its configure script, flex uses the
host-flex to generate a minimal example, and find out the name of the
output file of flex.

When the M4 environment is passed when building the target flex, it
also affects the *execution* of the host-flex, which tries to use
/usr/bin/m4 (which doesn't exist in the autobuilder machines) instead
of the one built in $(HOST_DIR)/usr/bin/m4. So generating the minimal
example fails. And this is where what I could reproduce and what the
autobuilders script produce differ: in my case, even though host-flex
fails to run, it creates an empty lex.yy.c, which is enough to make
the configure script happy. In the context of the autobuild scripts,
this file is apparently not created at all, for an unknown reason, and
this leads to the configure script to abort.

The fix is to set ac_cv_path_M4. This will affect the default m4 used
by the target flex, but it will not affect the m4 used by the
host-flex. It allows the test made during the configure script to work
properly, and therefore should fix the issue seen in the autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flex/flex.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 748365b..2361536 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -11,7 +11,7 @@ FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_GETTEXT_IF_LOCALE),gettext) host-m4
-FLEX_CONF_ENV = M4=/usr/bin/m4
+FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
 # we don't have a host-gettext/libintl
 HOST_FLEX_DEPENDENCIES = host-m4
 
