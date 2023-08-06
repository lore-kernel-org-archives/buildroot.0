Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52946EE49A6
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09B5040BDF;
	Mon, 21 Aug 2023 20:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09B5040BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1YibX_f41QW; Mon, 21 Aug 2023 20:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4801240B5B;
	Mon, 21 Aug 2023 20:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4801240B5B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 231381BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C738E415A7
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C738E415A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pm4iqyCsRa32 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF1F3410A7
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF1F3410A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC53086025; Mon, 21 Aug 2023 20:01:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 22:14:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6cdb48a0482a093dcdf73d0d748f5435262515ab
X-Git-Newrev: 3693462a1f8bd328c1a4f8fb68f00ce9127c31cd
X-Patchwork-Hint: ignore
Message-Id: <20230821200123.DC53086025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mpd: handle expat and
 yajl explicitly
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
