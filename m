Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E60C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 20:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CECC2405D8;
	Sun,  6 Aug 2023 20:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CECC2405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iB_IX7eJ-js; Sun,  6 Aug 2023 20:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAC2E400A5;
	Sun,  6 Aug 2023 20:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAC2E400A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46D2F1BF2F3
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3E8681948
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3E8681948
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vN6_8o39qiIX for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 20:14:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CE268176B
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 20:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE268176B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B296845F6; Sun,  6 Aug 2023 20:14:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 22:14:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cdb48a0482a093dcdf73d0d748f5435262515ab
X-Git-Newrev: 3693462a1f8bd328c1a4f8fb68f00ce9127c31cd
X-Patchwork-Hint: ignore
Message-Id: <20230806201450.1B296845F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: handle expat and yajl
 explicitly
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3693462a1f8bd328c1a4f8fb68f00ce9127c31cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mpd's Config.in selects expat and/or yajl depending on which
sub-options is enabled, and adds build dependencies, but does not pass
-D<option>=enabled/disabled for both of these features, relying on
auto-detection.

This commit fixes that by explicitly enabling/disabling expat and yajl
depending on their presence. The mpd sub-options no longer need to
have these as build-time dependencies, as it is handled globally.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
[Thomas: extracted from
https://patchwork.ozlabs.org/project/buildroot/patch/20221005091032.3014-5-br015@umbiko.net/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpd/mpd.mk | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 4b737c715c..f03a459b8c 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -29,6 +29,13 @@ else
 MPD_CONF_OPTS += -Dzeroconf=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+MPD_DEPENDENCIES += expat
+MPD_CONF_OPTS += -Dexpat=enabled
+else
+MPD_CONF_OPTS += -Dexpat=disabled
+endif
+
 # MPD prefers libicu for utf8 collation instead of libglib2.
 ifeq ($(BR2_PACKAGE_ICU),y)
 MPD_DEPENDENCIES += icu
@@ -37,6 +44,13 @@ else
 MPD_CONF_OPTS += -Dicu=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_YAJL),y)
+MPD_DEPENDENCIES += yajl
+MPD_CONF_OPTS += -Dyajl=enabled
+else
+MPD_CONF_OPTS += -Dyajl=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_ALSA),y)
 MPD_DEPENDENCIES += alsa-lib
 MPD_CONF_OPTS += -Dalsa=enabled
@@ -251,7 +265,7 @@ MPD_CONF_OPTS += -Dpulse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_QOBUZ),y)
-MPD_DEPENDENCIES += libgcrypt yajl
+MPD_DEPENDENCIES += libgcrypt
 MPD_CONF_OPTS += -Dqobuz=enabled
 else
 MPD_CONF_OPTS += -Dqobuz=disabled
@@ -272,7 +286,6 @@ MPD_CONF_OPTS += -Dsidplay=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
-MPD_DEPENDENCIES += yajl
 MPD_CONF_OPTS += -Dsoundcloud=enabled
 else
 MPD_CONF_OPTS += -Dsoundcloud=disabled
@@ -307,12 +320,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_MPD_UPNP_PUPNP),y)
 MPD_DEPENDENCIES += \
-	expat \
 	libupnp
 MPD_CONF_OPTS += -Dupnp=pupnp
 else ifeq ($(BR2_PACKAGE_MPD_UPNP_NPUPNP),y)
 MPD_DEPENDENCIES += \
-	expat \
 	libnpupnp
 MPD_CONF_OPTS += -Dupnp=npupnp
 else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
