Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2648C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 17:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D8C383F44;
	Sun, 17 Jul 2022 17:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D8C383F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRExqjaoz59N; Sun, 17 Jul 2022 17:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 430AA83F28;
	Sun, 17 Jul 2022 17:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 430AA83F28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 855891BF3CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 17:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C99F41779
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 17:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C99F41779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhWo3HJRaxqr for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 17:35:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDDEE4176D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDDEE4176D
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 17:35:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7779760005;
 Sun, 17 Jul 2022 17:35:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 19:35:09 +0200
Message-Id: <20220717173510.1388390-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658079312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ro+XiDLF6ZA0JiHJSnDanikDNG6FLyZsUvAd2GhZ+4A=;
 b=UKTpvWNf2lY0LMYVotBN4L1M7C/PXprzIjkaiJwfz4mwihyknLODpIKeWca00NVZB9t0k5
 qkxd+fX+O1w7uUNidNNk32qhtp5q6Jaai1DevkzcpMEqT+3nzpwdgbIASL6W7o97ynQmtG
 JRik6JdYjVqCNKPyVRnqPW1F9Hg+Tm9h82/XzIwnehnBwmrJkelxMIGasfKVzMBwTiQNbt
 10QELFWsz2gQrBzxevl6nbnF2Jr3jUfDqUx8s114661tTYn24fORW+j5k4ZFVCXUmysfPe
 lUlvP8yRil4pb2HJsvGULfX+LhCHFevoKyAL9lwuK8aZrV0VzzsMVM+uQsJagw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UKTpvWNf
Subject: [Buildroot] [PATCH] package/alsa-utils: fix two build issues
 following 1.2.7 bump
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4dc8563363d639255217ffc59482eaccf93a1b51 ("package/alsa-utils:
bump version to 1.2.7") has bumped alsa-utils to 1.2.7, triggering
several build failures in the autobuilders.

The two build issues are fixed by two different patches, both of which
have been submitted upstream.

The first patch fixes:

  http://autobuild.buildroot.net/results/c185ad120eb95cb3af0cd3be5fe47c924c565d3e/

The second patch fixes:

  http://autobuild.buildroot.net/results/31f52013db927511bbf0ad8e9d8701ac70e27be0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-conditionals-on-__ALSA_PCM_H-and-.patch | 108 ++++++++++++++++++
 ...ay-aplay.c-make-UCM-support-optional.patch |  89 +++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch
 create mode 100644 package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch

diff --git a/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch b/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch
new file mode 100644
index 0000000000..97c4729bf9
--- /dev/null
+++ b/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch
@@ -0,0 +1,108 @@
+From 4bfd1f15114550e1be7e43ae37a61906e1bff809 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 17 Jul 2022 18:59:48 +0200
+Subject: [PATCH] alsactl/info.c: fix conditionals on __ALSA_PCM_H and
+ __ALSA_RAWMIDI_H
+
+Commit bbc74a61ac7c35e506c3d7f76ecf943cb55736a6 ("alsactl: implement
+'info' command") implemented an alsactl info command. In this
+implementation, there was an attempt to properly address optional
+features from alsa-lib by using conditions on __ALSA_PCM_H,
+__ALSA_RAWMIDI_H.
+
+Unfortunately, this attempt does not work entirely: only the code
+inside pcm_device_list(), rawmidi_device_list() was conditionally
+compiled, but their very prototype also use type definitions provided
+in pcm.h and rawmidi.h. So really, it's the entire function that needs
+to be conditionally implemented.
+
+Also, snd_rawmidi_stream_name() was not handled properly, for the same
+reason.
+
+This commit implements pcm_device_list() only if __ALSA_PCM_H is
+defined, and implements snd_rawmidi_stream_name() and
+rawmidi_device_list() only if __ALSA_RAWMIDI_H is defined.
+
+general_card_info() is modified to not call the PCM or raw MIDI
+functions when support is not available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://mailman.alsa-project.org/pipermail/alsa-devel/2022-July/203846.html
+---
+ alsactl/info.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/alsactl/info.c b/alsactl/info.c
+index 253539d..9bd72af 100644
+--- a/alsactl/info.c
++++ b/alsactl/info.c
+@@ -22,9 +22,9 @@
+ #include "aconfig.h"
+ #include "alsactl.h"
+ 
++#ifdef __ALSA_PCM_H
+ static int pcm_device_list(snd_ctl_t *ctl, snd_pcm_stream_t stream, bool *first)
+ {
+-#ifdef __ALSA_PCM_H
+ 	int err, dev, idx;
+ 	unsigned int count;
+ 	snd_pcm_info_t *pcminfo;
+@@ -76,10 +76,12 @@ static int pcm_device_list(snd_ctl_t *ctl, snd_pcm_stream_t stream, bool *first)
+ 						idx, snd_pcm_info_get_subdevice_name(pcminfo));
+ 		}
+ 	}
+-#endif
++
+ 	return 0;
+ }
++#endif
+ 
++#ifdef __ALSA_RAWMIDI_H
+ static const char *snd_rawmidi_stream_name(snd_rawmidi_stream_t stream)
+ {
+ 	if (stream == SND_RAWMIDI_STREAM_INPUT)
+@@ -91,7 +93,6 @@ static const char *snd_rawmidi_stream_name(snd_rawmidi_stream_t stream)
+ 
+ static int rawmidi_device_list(snd_ctl_t *ctl, snd_rawmidi_stream_t stream, bool *first)
+ {
+-#ifdef __ALSA_RAWMIDI_H
+ 	int err, dev, idx;
+ 	unsigned int count;
+ 	snd_rawmidi_info_t *info;
+@@ -143,9 +144,10 @@ static int rawmidi_device_list(snd_ctl_t *ctl, snd_rawmidi_stream_t stream, bool
+ 						idx, snd_rawmidi_info_get_subdevice_name(info));
+ 		}
+ 	}
+-#endif
++
+ 	return 0;
+ }
++#endif
+ 
+ static int hwdep_device_list(snd_ctl_t *ctl)
+ {
+@@ -227,17 +229,21 @@ int general_card_info(int cardno)
+ 	}
+ 	err = card_info(ctl);
+ 
++#ifdef __ALSA_PCM_H
+ 	first = true;
+ 	if (err >= 0)
+ 		err = pcm_device_list(ctl, SND_PCM_STREAM_PLAYBACK, &first);
+ 	if (err >= 0)
+ 		err = pcm_device_list(ctl, SND_PCM_STREAM_CAPTURE, &first);
++#endif
+ 
++#ifdef __ALSA_RAWMIDI_H
+ 	first = true;
+ 	if (err >= 0)
+ 		err = rawmidi_device_list(ctl, SND_PCM_STREAM_PLAYBACK, &first);
+ 	if (err >= 0)
+ 		err = rawmidi_device_list(ctl, SND_PCM_STREAM_CAPTURE, &first);
++#endif
+ 
+ 	if (err >= 0)
+ 		err = hwdep_device_list(ctl);
+-- 
+2.36.1
+
diff --git a/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch b/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch
new file mode 100644
index 0000000000..cd5c96bd55
--- /dev/null
+++ b/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch
@@ -0,0 +1,89 @@
+From 1921efacfe1a230021849b83b2877c8f239b44ab Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 17 Jul 2022 19:09:04 +0200
+Subject: [PATCH] aplay/aplay.c: make UCM support optional
+
+Commit 90f59671784a7e47b40485095cd66892d4840ed7 ("topology:
+pre-processor: Move the call to expand variables") modified aplay by
+unconditionally invoking features of the use case manager (UCM) from
+alsa-lib. However, alsa-lib can be compiled with UCM support.
+
+In order to properly support this situation, this commit changes aplay
+to only conditionally compile the UCM related code.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://mailman.alsa-project.org/pipermail/alsa-devel/2022-July/203847.html
+---
+ aplay/aplay.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/aplay/aplay.c b/aplay/aplay.c
+index b3b3635..59f937d 100644
+--- a/aplay/aplay.c
++++ b/aplay/aplay.c
+@@ -41,7 +41,9 @@
+ #include <time.h>
+ #include <locale.h>
+ #include <alsa/asoundlib.h>
++#ifdef HAVE_ALSA_USE_CASE_H
+ #include <alsa/use-case.h>
++#endif
+ #include <assert.h>
+ #include <termios.h>
+ #include <signal.h>
+@@ -453,6 +455,7 @@ static ssize_t xwrite(int fd, const void *buf, size_t count)
+ 	return offset;
+ }
+ 
++#ifdef HAVE_ALSA_USE_CASE_H
+ static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *name)
+ {
+ 	char *s, *p;
+@@ -476,6 +479,7 @@ static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *na
+ 	}
+ 	return err;
+ }
++#endif
+ 
+ static long parse_long(const char *str, int *err)
+ {
+@@ -553,7 +557,9 @@ int main(int argc, char *argv[])
+ 	int do_device_list = 0, do_pcm_list = 0, force_sample_format = 0;
+ 	snd_pcm_info_t *info;
+ 	FILE *direction;
++#ifdef HAVE_ALSA_USE_CASE_H
+ 	snd_use_case_mgr_t *uc_mgr = NULL;
++#endif
+ 
+ #ifdef ENABLE_NLS
+ 	setlocale(LC_ALL, "");
+@@ -852,6 +858,7 @@ int main(int argc, char *argv[])
+ 		goto __end;
+ 	}
+ 
++#ifdef HAVE_ALSA_USE_CASE_H
+ 	if (strncmp(pcm_name, "ucm.", 4) == 0) {
+ 		err = open_ucm(&uc_mgr, &pcm_name, pcm_name + 4);
+ 		if (err < 0) {
+@@ -861,6 +868,7 @@ int main(int argc, char *argv[])
+ 		if (verbose)
+ 			fprintf(stderr, _("Found UCM PCM device: %s\n"), pcm_name);
+ 	}
++#endif
+ 
+ 	err = snd_pcm_open(&handle, pcm_name, stream, open_mode);
+ 	if (err < 0) {
+@@ -951,8 +959,10 @@ int main(int argc, char *argv[])
+ 	if (verbose==2)
+ 		putchar('\n');
+ 	snd_pcm_close(handle);
++#ifdef HAVE_ALSA_USE_CASE_H
+ 	if (uc_mgr)
+ 		snd_use_case_mgr_close(uc_mgr);
++#endif
+ 	handle = NULL;
+ 	free(audiobuf);
+       __end:
+-- 
+2.36.1
+
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
