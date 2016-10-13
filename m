From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 22:13:55 -0300
Subject: [Buildroot] [PATCH 4/8] poppler: add explicit libglib2 support
In-Reply-To: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476321239-13894-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1476321239-13894-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Evince needs poppler-glib support (when poppler is enabled, for PDF
reading support), so add explicit handling to the package.
And poppler-glib requires cairo output, hence the conditional on both
libglib2 and cairo to enable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
