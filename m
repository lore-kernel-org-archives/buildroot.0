Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158F6EE7FF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 07:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FCE404E2;
	Mon, 11 Sep 2023 07:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8FCE404E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ohs2k2wKQH7u; Mon, 11 Sep 2023 07:26:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A4664054E;
	Mon, 11 Sep 2023 07:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A4664054E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B8A761BF3FB
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E44B404E2
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 07:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E44B404E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQcjih79rWyX for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 07:26:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7717F4033A
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 07:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7717F4033A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6513E86C2A; Mon, 11 Sep 2023 07:26:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 09:22:02 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bdc97b988cfb1c12efce3488bd8aab05a8800674
X-Git-Newrev: cd3b0fa07d7e0431923cdcee06b10d45f9d5a5fb
X-Patchwork-Hint: ignore
Message-Id: <20230911072609.6513E86C2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mpd: handle expat
 and yajl explicitly
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd3b0fa07d7e0431923cdcee06b10d45f9d5a5fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 3693462a1f8bd328c1a4f8fb68f00ce9127c31cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
