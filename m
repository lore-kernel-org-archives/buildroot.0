Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2153FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 13:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC2E482BD6;
	Tue, 24 May 2022 13:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWGd7TFfYknv; Tue, 24 May 2022 13:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C44582978;
	Tue, 24 May 2022 13:49:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1FF41BF5B5
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0B7482978
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGT9gk2XhnRs for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 13:49:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4CCC828DF
 for <buildroot@buildroot.org>; Tue, 24 May 2022 13:49:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 36D7A8643C; Tue, 24 May 2022 13:38:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 15:44:12 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f4beaf2b50d76926eeeda6a864404913416f3f96
X-Git-Newrev: f50853466e1de297567d5157b1e604ccb6339b0a
X-Patchwork-Hint: ignore
Message-Id: <20220524133801.36D7A8643C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/espeak: fix
 pulseaudio build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f50853466e1de297567d5157b1e604ccb6339b0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Pass $(TARGET_CONFIGURE_OPTS) AUDIO="$(ESPEAK_AUDIO_BACKEND)" to
ESPEAK_INSTALL_TARGET_CMDS to avoid the following build failure with
pulseaudio raised since the addition of the package in commit
10b6d10009c70262cfb492b2abaa3a091a8fb4aa:

>>> espeak 1.48.04 Installing to target
PATH="/nvmedata/autobuild/instance-5/output-1/per-package/espeak/host/bin:/nvmedata/autobuild/instance-5/output-1/per-package/espeak/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" /usr/bin/make -j1 -C /nvmedata/autobuild/instance-5/output-1/build/espeak-1.48.04/src DESTDIR="/nvmedata/autobuild/instance-5/output-1/per-package/espeak/target" install
make[1]: Entering directory '/nvmedata/autobuild/instance-5/output-1/build/espeak-1.48.04/src'
g++ -O2 -DUSE_PORTAUDIO -D PATH_ESPEAK_DATA=\"/usr/share/espeak-data\" -Wall -fPIC -fvisibility=hidden -pedantic \
-I. -D LIBRARY -c -fno-exceptions  wave.cpp  -o x_wave.o
g++  -shared -Wl,-soname,libespeak.so.1 -o libespeak.so \
x_speak_lib.o x_compiledict.o x_dictionary.o x_intonation.o x_readclause.o x_setlengths.o x_numbers.o x_synth_mbrola.o x_synthdata.o x_synthesize.o x_translate.o x_mbrowrap.o x_tr_languages.o x_voices.o x_wavegen.o x_phonemelist.o x_espeak_command.o x_event.o x_fifo.o x_wave.o x_debug.o x_klatt.o x_sonic.o -lstdc++ -lportaudio -lpthread
/usr/bin/ld: cannot find -lportaudio

Fixes:
 - http://autobuild.buildroot.org/results/a4a6e3203ad70cd724da8130ee1648141ab39a6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b87bc7d3ad82f637bb8c9a00a1c433ab9135555c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/espeak/espeak.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index d592673ac5..44893ac9be 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -37,7 +37,8 @@ define ESPEAK_BUILD_CMDS
 endef
 
 define ESPEAK_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(TARGET_CONFIGURE_OPTS) \
+		AUDIO="$(ESPEAK_AUDIO_BACKEND)" DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
