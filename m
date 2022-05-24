Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E32C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 13:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD804157D;
	Tue, 24 May 2022 13:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzPOj9aZbsTt; Tue, 24 May 2022 13:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0EBE41499;
	Tue, 24 May 2022 13:45:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5837D1BF5B5
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4501760B2F
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 13:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViltVu0i2zd3 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 13:44:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EABE960093
 for <buildroot@buildroot.org>; Tue, 24 May 2022 13:44:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6404B20003;
 Tue, 24 May 2022 13:44:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ntUqD-00F1Ve-C8; Tue, 24 May 2022 15:44:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220417215822.1070695-1-fontaine.fabrice@gmail.com>
Date: Tue, 24 May 2022 15:44:53 +0200
In-Reply-To: <20220417215822.1070695-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 17 Apr 2022 23:58:22 +0200")
Message-ID: <871qwjujsa.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/espeak: fix pulseaudio build
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
Cc: Arnaud Aujon <arnaud@intelibre.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Pass $(TARGET_CONFIGURE_OPTS) AUDIO="$(ESPEAK_AUDIO_BACKEND)" to
 > ESPEAK_INSTALL_TARGET_CMDS to avoid the following build failure with
 > pulseaudio raised since the addition of the package in commit
 > 10b6d10009c70262cfb492b2abaa3a091a8fb4aa:

 >>>> espeak 1.48.04 Installing to target
 > PATH="/nvmedata/autobuild/instance-5/output-1/per-package/espeak/host/bin:/nvmedata/autobuild/instance-5/output-1/per-package/espeak/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
 > /usr/bin/make -j1 -C
 > /nvmedata/autobuild/instance-5/output-1/build/espeak-1.48.04/src
 > DESTDIR="/nvmedata/autobuild/instance-5/output-1/per-package/espeak/target"
 > install
 > make[1]: Entering directory '/nvmedata/autobuild/instance-5/output-1/build/espeak-1.48.04/src'
 > g++ -O2 -DUSE_PORTAUDIO -D PATH_ESPEAK_DATA=\"/usr/share/espeak-data\" -Wall -fPIC -fvisibility=hidden -pedantic \
 > -I. -D LIBRARY -c -fno-exceptions  wave.cpp  -o x_wave.o
 > g++  -shared -Wl,-soname,libespeak.so.1 -o libespeak.so \
 > x_speak_lib.o x_compiledict.o x_dictionary.o x_intonation.o
 > x_readclause.o x_setlengths.o x_numbers.o x_synth_mbrola.o
 > x_synthdata.o x_synthesize.o x_translate.o x_mbrowrap.o
 > x_tr_languages.o x_voices.o x_wavegen.o x_phonemelist.o
 > x_espeak_command.o x_event.o x_fifo.o x_wave.o x_debug.o x_klatt.o
 > x_sonic.o -lstdc++ -lportaudio -lpthread
 > /usr/bin/ld: cannot find -lportaudio

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a4a6e3203ad70cd724da8130ee1648141ab39a6a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
