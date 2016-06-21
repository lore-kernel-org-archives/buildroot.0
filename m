From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jun 2016 09:47:58 +0200
Subject: [Buildroot] [PATCH 2/2] gettext: install ABOUT-NLS for the host
In-Reply-To: <1466495278-30897-1-git-send-email-peter@korsgaard.com>
References: <1466495278-30897-1-git-send-email-peter@korsgaard.com>
Message-ID: <1466495278-30897-3-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gettextize copies a number of files from usr/share/gettext into the project
when it is run.  One of these is ABOUT-NLS, which is simply a text file
explaining some details about gettext - So it isn't really critical but
autoreconf fails if gettext functionality is used and ABOUT-NLS is missing.

Normally this isn't an issue as the release tarball typically already
contains an ABOUT-NLS file, but as this is a generated file it normally
isn't checked into git so it fails for packages from git snapshots using
<foo>_GETTEXTIZE = YES (E.G. libuio):

configure.ac:42: error: required file './ABOUT-NLS' not found

As is evident from GETTEXT_REMOVE_UNNEEDED, this file normally gets
installed by gettext-runtime, but as we don't build/install that for the
host instead install it by hand.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gettext/gettext.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 8cbb112..1435388 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -75,6 +75,16 @@ define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 endef
 HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 
+# autoreconf expects gettextize to install ABOUT-NLS, but it only gets
+# installed by gettext-runtime which we don't build/install for the
+# host, so do it manually
+define HOST_GETTEXT_ADD_ABOUT_NLS
+	$(INSTALL) -m 0644 $(@D)/$(HOST_GETTEXT_SUBDIR)/ABOUT-NLS \
+		$(HOST_DIR)/usr/share/gettext/ABOUT-NLS
+endef
+
+HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_ADD_ABOUT_NLS
+
 GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/usr/bin/autom4te $(HOST_DIR)/usr/bin/gettextize -f
 
 $(eval $(autotools-package))
-- 
2.7.0
