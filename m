From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 14 Nov 2017 11:07:08 -0500
Subject: [Buildroot] [NEXT v2 3/7] libpjsip: enable portaudio support
In-Reply-To: <20171114160712.20086-1-aduskett@gmail.com>
References: <20171114160712.20086-1-aduskett@gmail.com>
Message-ID: <20171114160712.20086-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If portaudio is selected, libpjsip should depend on it.
Specifying --with-external-pa was originally used to prevent libpjsip
from building the portaudio library in the third_party directory, however,
portaudio no longer exists in the third_party directory.  This option now
is used to force libpjsip to check for external portaudio headers. 

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Remove the option to enable or disable portaudio support in favor of
    just depending on portaudio if it's selected by the user.

 package/libpjsip/libpjsip.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 14dbb8e..3c9d789 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -70,4 +70,9 @@ ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBPJSIP_DEPENDENCIES += alsa-lib
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+LIBPJSIP_DEPENDENCIES += portaudio
+LIBPJSIP_CONF_OPTS += --with-external-pa
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
