From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Sep 2012 00:02:58 +0200
Subject: [Buildroot] [PATCH 08/11] package/pulseaudio: fix build-dependency
	on gettext
In-Reply-To: <1346709781-18158-1-git-send-email-yann.morin.1998@free.fr>
References: <1346709781-18158-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1346709781-18158-9-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In its Config.in, pulseaudio declares a dependency on gettext
using the documented construct:
    select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT

but in its .mk file, declares a dependency on the package:
    PULSEAUDIO_DEPENDENCIES = [...] $(if $(BR2_PACKAGE_GETTEXT),gettext) [...]

instead of the documented:
    $(if $(BR2_NEEDS_GETTEXT),gettext)

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
CC: Samuel Martin <s.martin49@gmail.com>
---
 package/multimedia/pulseaudio/pulseaudio.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 6f7d7d2..406dd8f 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -16,7 +16,7 @@ PULSEAUDIO_CONF_OPT = \
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkg-config libtool json-c libsndfile speex host-intltool \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
+	$(if $(BR2_NEEDS_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
-- 
1.7.2.5
