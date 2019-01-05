From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat,  5 Jan 2019 22:00:44 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/wine: Add gettext dependency for
 host-wine only with NLS enabled
In-Reply-To: <20190105200046.31512-1-vadim4j@gmail.com>
References: <20190105200046.31512-1-vadim4j@gmail.com>
Message-ID: <20190105200046.31512-2-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Checked that host-wine compiles ok without host-gettext, so no
needs to specify this dependency.

libgettextpo is required by tools/wrc (https://linux.die.net/man/1/wrc)
which allows to convert windows resources also to *.po format, which is
not needed if NLS is disabled.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/wine/wine.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 78c8e6ab63..7e44e3c81d 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -307,8 +307,12 @@ WINE_CONF_OPTS += --without-zlib
 endif
 
 # host-gettext is essential for .po file support in host-wine wrc
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 HOST_WINE_DEPENDENCIES += host-gettext
 HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
+else
+HOST_WINE_CONF_OPTS += --without-gettext --without-gettextpo
+endif
 
 # Wine needs to enable 64-bit build tools on 64-bit host
 ifeq ($(HOSTARCH),x86_64)
-- 
2.14.1
