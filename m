From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Feb 2014 17:47:09 -0300
Subject: [Buildroot] [PATCH 1/3] wpa_supplicant: modify .config rework order
Message-ID: <1393534031-696-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to first enable and then disable.
Otherwise a wildcard enable can't have a single option disabled which is
far more usual than the opposite (and required for a simple bump to
version 2.1).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index d2b21c2..34e8e1f 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -106,8 +106,8 @@ endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
-	sed -i $(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
-	       $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
+	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
+	       $(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
 	       $(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
 	       $(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
 	       $(WPA_SUPPLICANT_CONFIG)
-- 
1.8.3.2
