From: Aleksander Morgado <aleksander@aleksander.es>
Date: Sun, 27 Aug 2017 13:09:20 +0200
Subject: [Buildroot] [PATCH] autoconf: use host-gettext's autopoint if
	available in autoreconf
Message-ID: <20170827110920.15579-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 7ee8ebbd813ad0a6d2392ef628c17241 explicitly disabled autopoint
calls during autoreconf, to avoid having the host autopoint called, as
there was no host-gettext package.

Commit 3a188b578e490f2a8b5922329b7abfae introduced the host-gettext
package support.

This commit recovers the support for automatically calling autopoint
during autoreconf.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---

Hey,

I see this is a recurring issue when a package that builds from git (bootstrapping using autoreconf before configure) requires gettext processing. automake would fail as autopoint wasn't being run (disabled in buildroot's autoconf package) and therefore not creating config.rpath and ABOUT-NLS (among other things, although these are the ones automake complains about). Specifying $(PKG)_GETTEXTIZE isn't an option as that may actually update the gnulib-imported files in a non-expected way, and "touch"-ing the missing files just seems a bit of a hack...

Calling autopoint from autoreconf was disabled back in 2011 because no host-gettext package was available, but this package was added in 2013, so how about removing that limitation?

Cheers!

---
 package/autoconf/autoconf.mk | 2 +-
 package/gettext/gettext.mk   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index e5f474c72..f1c60224f 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,4 @@ $(eval $(host-autotools-package))
 # variables used by other packages
 AUTOCONF = $(HOST_DIR)/bin/autoconf
 AUTOHEADER = $(HOST_DIR)/bin/autoheader
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT="$(AUTOPOINT)" $(HOST_DIR)/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)" --verbose
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index ec9588f8a..08afc8fc3 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -95,6 +95,7 @@ endef
 HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_ADD_ABOUT_NLS

 GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
+AUTOPOINT = $(HOST_DIR)/bin/autopoint

 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
--
2.14.1
