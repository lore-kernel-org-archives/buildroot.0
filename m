From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:54:35 +0200
Subject: [Buildroot] [git commit] package/espeak: add comment to ignore
	'unmet dependencies'
Message-ID: <20170511195438.DC67C81DE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abb825bd6b3dd74108d89a1fed60217b80470067
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/espeak/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index aed627a..6a8f1d4 100644
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
 
