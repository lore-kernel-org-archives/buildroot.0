From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Aug 2017 18:27:38 +0200
Subject: [Buildroot] [git commit] Revert "alsa-utils: amidi option needs seq
	support in alsa-lib"
Message-ID: <20170812162306.109EF81941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=684e0371bc6584b8921c133bff64b42d196c118d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit c69088b8c35177cecdd0f1f385c13f5b2c509f1d, which is
no longer needed now that alsa-lib has been fixed properly.

Indeed, this commit was made because alsa-utils failed to build with:

/home/buildroot/build/instance-0/output/host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libasound.a(pcm_dmix.o): In function `snd_pcm_dmix_htimestamp':
pcm_dmix.c:(.text+0x5c0): warning:
/home/buildroot/build/instance-0/output/host/usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libasound.a(rawmidi_symbols.o):(.data.rel+0x4): undefined reference to `_snd_module_rawmidi_virt'
collect2: error: ld returned 1 exit status

Which is exactly the problem that we fixed in alsa-lib by making sure
that rawmidi_symbols.c doesn't reference symbols from rawmidi_virt.c
when SEQ support is not enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/alsa-utils/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index d3fd18d..1a48fc0 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -49,7 +49,6 @@ config BR2_PACKAGE_ALSA_UTILS_ALSATPLG
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	bool "amidi"
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
-	select BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_UTILS_AMIXER
 	bool "amixer"
