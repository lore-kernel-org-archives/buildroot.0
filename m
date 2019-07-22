From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 22 Jul 2019 04:11:46 -0300
Subject: [Buildroot] [PATCH] package/cups-filters: fix build without NLS
Message-ID: <20190722071146.30199-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

texttotext must be linked to libiconv if !BR2_ENABLE_LOCALE so patch
Makefile.am to add the required -liconv argument.

We could patch configure.ac to use AM_ICONV but it would require more
change adding AM_GNU_GETTEXT_VERSION([x.y.z]) to bring iconv.m4.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12031

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/cups-filters/cups-filters.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 214647a90e..8368be5e4b 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -13,6 +13,17 @@ CUPS_FILTERS_AUTORECONF = YES
 
 CUPS_FILTERS_DEPENDENCIES = cups libglib2 lcms2 qpdf fontconfig freetype jpeg
 
+# texttotext must be linked to libiconv if !BR2_ENABLE_LOCALE. We could patch
+# configure.ac to use AM_ICONV but it would require iconv.m4, increasing the
+# patch size by at least 130 lines. Let's keep it simple and just patch
+# Makefile.am to append -liconv to the link command line.
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+define CUPS_FILTERS_LINK_LIBICONV
+	$(SED) '/texttotext_LDADD =/s/(CUPS_LIBS)$$/(CUPS_LIBS) -liconv/' $(@D)/Makefile.am
+endef
+CUPS_FILTERS_PRE_CONFIGURE_HOOKS += CUPS_FILTERS_LINK_LIBICONV
+endif
+
 CUPS_FILTERS_CONF_OPTS = --disable-imagefilters \
 	--disable-mutool \
 	--disable-foomatic \
-- 
2.18.1
