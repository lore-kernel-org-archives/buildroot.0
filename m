From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 May 2017 22:38:56 +0200
Subject: [Buildroot] [PATCH] package/espeak: add comment to ignore 'unmet
	dependencies'
Message-ID: <20170507203856.5328-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On master 86b4eeccc4, espeak can generate spurious 'unmet dependencies'
messages:

    $ make KCONFIG_SEED=0x7A85DEE0 randconfig
    warning: (BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA) selects
    BR2_PACKAGE_PORTAUDIO_CXX which has unmet directdependencies
    (BR2_PACKAGE_PORTAUDIO && BR2_INSTALL_LIBSTDCPP)

However, the dpendency chain *is* correct. There is something that
causes the kconfig parser to get really confused...

Add a comment statng the issue is spurious, so noone tries to fix it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnaud Aujon <arnaud@intelibre.fr>
---
 package/espeak/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index aed627af92..6a8f1d4098 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -27,6 +27,9 @@ config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 	bool "alsa via portaudio"
+	# Selecting portaudio generates spurious "unmet dependencies"
+	# warnings. Unless you are changing the dependencies of espeak
+	# or portaudio, just ignore those spurious warnings.
 	select BR2_PACKAGE_PORTAUDIO
 	select BR2_PACKAGE_PORTAUDIO_CXX
 
-- 
2.11.0
