From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 2 Nov 2020 20:53:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: bump to version 3.4.0
In-Reply-To: <CAPi7W81js5YTDezCVv1XAJEUchYTEkRBkbQx8Ou6S7z2jO_A0g@mail.gmail.com>
References: <20201101163057.1944742-1-fontaine.fabrice@gmail.com>
 <20201102194306.GB41334@pevik>
 <CAPi7W81js5YTDezCVv1XAJEUchYTEkRBkbQx8Ou6S7z2jO_A0g@mail.gmail.com>
Message-ID: <20201102195322.GA37476@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

> Le lun. 2 nov. 2020 ? 20:43, Petr Vorel <petr.vorel@gmail.com> a ?crit :

> > Actually, c-ares are required since v3.3.0
> > (commit 451a241e50 Add c-ares to the required library list.)

> > You still keep it as optional dependency, thus by default build fails.
> Thanks for spotting this mistake, I'll send a v2.

You know it better than me, but this fixed build for me.

Kind regards,
Petr

diff --git package/wireshark/Config.in package/wireshark/Config.in
index b26aa7a3df..95fc9b38f3 100644
--- package/wireshark/Config.in
+++ package/wireshark/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_WIRESHARK
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
diff --git package/wireshark/wireshark.mk package/wireshark/wireshark.mk
index 58262f2d2e..4dd2130bbc 100644
--- package/wireshark/wireshark.mk
+++ package/wireshark/wireshark.mk
@@ -9,8 +9,8 @@ WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
-WIRESHARK_DEPENDENCIES = host-pkgconf host-python3 libgcrypt libpcap libglib2 \
-	speexdsp
+WIRESHARK_DEPENDENCIES = c-ares host-pkgconf host-python3 libgcrypt libpcap \
+	libglib2 speexdsp
 
 WIRESHARK_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
@@ -63,13 +63,6 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_BROTLI=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_C_ARES),y)
-WIRESHARK_CONF_OPTS += -DENABLE_CARES=ON
-WIRESHARK_DEPENDENCIES += c-ares
-else
-WIRESHARK_CONF_OPTS += -DENABLE_CARES=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=ON
 WIRESHARK_DEPENDENCIES += gnutls
