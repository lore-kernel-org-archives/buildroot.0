Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329C7C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 18:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B92D740A5F;
	Sun, 17 Jul 2022 18:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B92D740A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVb9Gli4FJBN; Sun, 17 Jul 2022 18:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8526408F8;
	Sun, 17 Jul 2022 18:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8526408F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76E481BF3BB
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 18:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E30E60B3D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 18:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E30E60B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpNZo_PmiBm0 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 18:42:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B82460B11
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B82460B11
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 18:42:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E994C780503;
 Sun, 17 Jul 2022 20:42:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 20:42:46 +0200
Date: Sun, 17 Jul 2022 20:42:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220717184246.GV2249625@scaer>
References: <20220717173510.1388390-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220717173510.1388390-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658083370;
 bh=qUOcn3FQ3aVZe7CopeR3ge5r/EXSSRwtCcT/g3AJph8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ftCm4Egprr4h1rbgevtbzAl4TmjpyNVoiv/5NG0E8/QEb3lvjDKjxkmgyP+u5qbWg
 RKKuY89WsihQePL9ZoQ8pyaSMxpHlgMbyAg3zaCSjnJP3qMddCKTpyYPxUwefApfg9
 awjAgM6fKooVh+rTHjJl6QYywAr0DTeTDEzuGIFyd8B39mbO+xzDiXKxU9rC5f0xEP
 PoSvAPqGX5BsjcVyA7ONFi1kT72HVaQN6hmIyf9wixE/5ZBfL4JBcfAo38hFxdpdEU
 YlyfvNQPCO9u7cSkcXO9HHOe61qAJvun8KFAvf2xhqjNR10CTWSyKDPezzHY7psL3L
 1hKR+Y7QDTF/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ftCm4Egp
Subject: Re: [Buildroot] [PATCH] package/alsa-utils: fix two build issues
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-17 19:35 +0200, Thomas Petazzoni via buildroot spake thusly:
> Commit 4dc8563363d639255217ffc59482eaccf93a1b51 ("package/alsa-utils:
> bump version to 1.2.7") has bumped alsa-utils to 1.2.7, triggering
> several build failures in the autobuilders.
> 
> The two build issues are fixed by two different patches, both of which
> have been submitted upstream.
> 
> The first patch fixes:
> 
>   http://autobuild.buildroot.net/results/c185ad120eb95cb3af0cd3be5fe47c924c565d3e/
> 
> The second patch fixes:
> 
>   http://autobuild.buildroot.net/results/31f52013db927511bbf0ad8e9d8701ac70e27be0/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> diff --git a/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch b/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch
> new file mode 100644
> index 0000000000..cd5c96bd55
> --- /dev/null
> +++ b/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch
> @@ -0,0 +1,89 @@
> +From 1921efacfe1a230021849b83b2877c8f239b44ab Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sun, 17 Jul 2022 19:09:04 +0200
> +Subject: [PATCH] aplay/aplay.c: make UCM support optional
> +
> +Commit 90f59671784a7e47b40485095cd66892d4840ed7 ("topology:
> +pre-processor: Move the call to expand variables") modified aplay by
> +unconditionally invoking features of the use case manager (UCM) from
> +alsa-lib. However, alsa-lib can be compiled with UCM support.

I guess you meant:  alsa-lib can be compiled with*out* UCM support.

Fixed, and applied to master, thanks.

Regards,
Yann E. MORIN.

> +In order to properly support this situation, this commit changes aplay
> +to only conditionally compile the UCM related code.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Upstream: https://mailman.alsa-project.org/pipermail/alsa-devel/2022-July/203847.html
> +---
> + aplay/aplay.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/aplay/aplay.c b/aplay/aplay.c
> +index b3b3635..59f937d 100644
> +--- a/aplay/aplay.c
> ++++ b/aplay/aplay.c
> +@@ -41,7 +41,9 @@
> + #include <time.h>
> + #include <locale.h>
> + #include <alsa/asoundlib.h>
> ++#ifdef HAVE_ALSA_USE_CASE_H
> + #include <alsa/use-case.h>
> ++#endif
> + #include <assert.h>
> + #include <termios.h>
> + #include <signal.h>
> +@@ -453,6 +455,7 @@ static ssize_t xwrite(int fd, const void *buf, size_t count)
> + 	return offset;
> + }
> + 
> ++#ifdef HAVE_ALSA_USE_CASE_H
> + static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *name)
> + {
> + 	char *s, *p;
> +@@ -476,6 +479,7 @@ static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *na
> + 	}
> + 	return err;
> + }
> ++#endif
> + 
> + static long parse_long(const char *str, int *err)
> + {
> +@@ -553,7 +557,9 @@ int main(int argc, char *argv[])
> + 	int do_device_list = 0, do_pcm_list = 0, force_sample_format = 0;
> + 	snd_pcm_info_t *info;
> + 	FILE *direction;
> ++#ifdef HAVE_ALSA_USE_CASE_H
> + 	snd_use_case_mgr_t *uc_mgr = NULL;
> ++#endif
> + 
> + #ifdef ENABLE_NLS
> + 	setlocale(LC_ALL, "");
> +@@ -852,6 +858,7 @@ int main(int argc, char *argv[])
> + 		goto __end;
> + 	}
> + 
> ++#ifdef HAVE_ALSA_USE_CASE_H
> + 	if (strncmp(pcm_name, "ucm.", 4) == 0) {
> + 		err = open_ucm(&uc_mgr, &pcm_name, pcm_name + 4);
> + 		if (err < 0) {
> +@@ -861,6 +868,7 @@ int main(int argc, char *argv[])
> + 		if (verbose)
> + 			fprintf(stderr, _("Found UCM PCM device: %s\n"), pcm_name);
> + 	}
> ++#endif
> + 
> + 	err = snd_pcm_open(&handle, pcm_name, stream, open_mode);
> + 	if (err < 0) {
> +@@ -951,8 +959,10 @@ int main(int argc, char *argv[])
> + 	if (verbose==2)
> + 		putchar('\n');
> + 	snd_pcm_close(handle);
> ++#ifdef HAVE_ALSA_USE_CASE_H
> + 	if (uc_mgr)
> + 		snd_use_case_mgr_close(uc_mgr);
> ++#endif
> + 	handle = NULL;
> + 	free(audiobuf);
> +       __end:
> +-- 
> +2.36.1
> +
> -- 
> 2.36.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
