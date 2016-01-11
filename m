From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Mon, 11 Jan 2016 10:24:07 +0200
Subject: [Buildroot] [PATCH 2/2 v3] linux-pam: enable nis support if
	yp-tools selected
In-Reply-To: <1452500647-10035-1-git-send-email-yba@tkos.co.il>
References: <1452500647-10035-1-git-send-email-yba@tkos.co.il>
Message-ID: <1452500647-10035-2-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>

Enable the NIS support in linux-pam when the yp-tools package is
selected.

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/linux-pam/linux-pam.mk |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 26b627e..3d860d2 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -11,7 +11,6 @@ LINUX_PAM_INSTALL_STAGING = YES
 LINUX_PAM_CONF_OPTS = \
 	--disable-prelude \
 	--disable-isadir \
-	--disable-nis \
 	--disable-db \
 	--disable-regenerate-docu \
 	--enable-securedir=/lib/security \
@@ -21,6 +20,14 @@ LINUX_PAM_AUTORECONF = YES
 LINUX_PAM_LICENSE = BSD-3c
 LINUX_PAM_LICENSE_FILES = Copyright
 
+ifeq ($(BR2_PACKAGE_YP_TOOLS),y)
+LINUX_PAM_CONF_OPTS += \
+	--enable-nis
+else
+LINUX_PAM_CONF_OPTS += \
+	--disable-nis
+endif
+
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 LINUX_PAM_DEPENDENCIES += gettext
 LINUX_PAM_MAKE_OPTS += LIBS=-lintl
-- 
1.7.9.5
