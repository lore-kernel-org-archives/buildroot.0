Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24054C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 09:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 884F040B55;
	Wed,  5 Oct 2022 09:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 884F040B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkH3sfgUGpxT; Wed,  5 Oct 2022 09:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C156640C65;
	Wed,  5 Oct 2022 09:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C156640C65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1731BF95D
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D350383026
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 09:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D350383026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0z3j1FfBAGzB for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 09:11:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12B5D82AA2
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12B5D82AA2
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 09:11:11 +0000 (UTC)
Received: from iago.. (unknown [151.19.224.153])
 by serv15.avernis.de (Postfix) with ESMTPSA id 048E3BDE2F83;
 Wed,  5 Oct 2022 11:11:07 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 11:10:28 +0200
Message-Id: <20221005091032.3014-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220409160921.GA3547512@scaer>
References: <20220409160921.GA3547512@scaer>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 0/4] User-visible Config.in feature
 sub-options
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
Cc: Andreas Ziegler <br015@umbiko.net>, YANN E MORIN <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As indicated, this is the patch based on our discussion. I gave it the 
version number 2, even if the content has little to do with the original 
patch. I also split it into a series, to allow for partial integration. 

#1 just a bug fix
#2 add /modify comments -- mostly captures additional info, collected when
   looking up features in meson_options.txt and the mpd manual
#3 id3tag is a necessary sub-feature for mp3 decoders, so make them select
   the (already existing) sub-option, instead of doing their own selection
   and omitting id3tag
#4 introduce the sub-option logic for expat and yajl also; this cleans up
   upnp configuration also

I would appreciate integration of 1-3. #3 actually solves a possible con-
figuration error: if you configure mp3 playback, but forget id3tag, mp3 
files will not be recognized by mpd. 

I am open for discussion on #4. I can live with automatic dependencies based 
on libraries, aka

	ifeq ($(BR2_PACKAGE_FOO),y)
		MPD_DEPENDENCIES += libfoo
		MPD_CONF_OPTS += -Dfoo=enabled
	else
		MPD_CONF_OPTS += -Dfoo=disabled
	endif

(works for me), but would prefer dependencies based on Config.in sub-options. 

libicu handling remains unchanged. libicu adds approx. 40 MB to the compressed
image; whoever needs this in his firmware is welcome to the additional feature 
in mpd. It has no discernable size impact here.

Andreas Ziegler (4):
  package/mpd: fix reversed logic in tcp disable
  package/mpd: add/enhance (kconfig + code) comments
  package/mpd: introduce id3tag feature dependency
  package/mpd: introduce sub-options for expat and yajl

 package/mpd/Config.in | 30 ++++++++++++++++++++++--------
 package/mpd/mpd.mk    | 33 +++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 18 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
