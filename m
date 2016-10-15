From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:34:21 +0200
Subject: [Buildroot] [git commit] poppler: add explicit libglib2 support
Message-ID: <20161015094202.D2E687FC3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d0a731d8f3e0314e579523fdcb9812ea737bd7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Evince needs poppler-glib support (when poppler is enabled, for PDF
reading support), so add explicit handling to the package.
And poppler-glib requires cairo output, hence the conditional on both
libglib2 and cairo to enable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 4632d8d..172c428 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -28,6 +28,13 @@ else
 POPPLER_CONF_OPTS += --enable-cms=none
 endif
 
+ifeq ($(BR2_PACKAGE_CAIRO)$(BR2_PACKAGE_LIBGLIB2),yy)
+POPPLER_CONF_OPTS += --enable-poppler-glib
+POPPLER_DEPENDENCIES += libglib2
+else
+POPPLER_CONF_OPTS += --disable-poppler-glib
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 POPPLER_CONF_OPTS += --enable-libtiff
 # Help poppler to find libtiff in static linking scenarios
