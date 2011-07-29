From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jul 2011 08:53:55 +0200
Subject: [Buildroot] [git commit] autoconf: use dummy autopoint
Message-ID: <20110729065701.8D74E88C82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7ee8ebbd813ad0a6d2392ef628c1724104f0619b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We currently don't build a host-gettext package, so when a package using
gettext is autoreconf'ed, we end up using autopoint from the host.

Autopoint unfortunately requires CVS, so if that isn't available autoreconf
fails.

From reading:

http://www.gnu.org/software/gnulib/manual/html_node/gettextize-and-autopoint.html

It seems that we don't really need to rerun autopoint, so fix it by
passing autopoint=/bin/true instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/autoconf/autoconf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 0ff0644..45bb635 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,4 @@ $(eval $(call AUTOTARGETS,package,autoconf,host))
 # variables used by other packages
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
 AUTOHEADER:=$(HOST_DIR)/usr/bin/autoheader
-AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
+AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
-- 
1.7.3.4
