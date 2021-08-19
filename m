Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93C0C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 18:14:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CA6F60F5E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 18:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CA6F60F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0281A80AAE;
	Thu, 19 Aug 2021 18:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZXj_nOpaMSB; Thu, 19 Aug 2021 18:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B2980AB0;
	Thu, 19 Aug 2021 18:14:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43E1A1BF402
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 18:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 337C1613D8
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 18:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxlnetsOuEHw for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 18:14:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 150BE613E5
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 18:14:07 +0000 (UTC)
Received: from fwd31.aul.t-online.de (fwd31.aul.t-online.de [172.20.26.136])
 by mailout09.t-online.de (Postfix) with SMTP id EF9F19E11;
 Thu, 19 Aug 2021 20:13:59 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (bNckpYZUwhZiRSNqpSaAex5DgKkIYvW8uQwcRL-PUT-L9R5u-93CoHTHZGGIdkawdb@[79.214.196.70])
 by fwd31.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mGmYA-0zIWwq0; Thu, 19 Aug 2021 20:13:58 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:42876)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>)
 id 1mGmY9-0003Jk-QG; Thu, 19 Aug 2021 20:13:58 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 20:13:57 +0200
Message-Id: <20210819181357.1019919-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: bNckpYZUwhZiRSNqpSaAex5DgKkIYvW8uQwcRL-PUT-L9R5u-93CoHTHZGGIdkawdb
X-TOI-EXPURGATEID: 150726::1629396838-000102A7-42C49429/0/0 CLEAN NORMAL
X-TOI-MSGID: 9dbbdb4d-06d0-4e1d-a64f-b7a500f76ba6
Subject: [Buildroot] [PATCH 1/1] package/mpv: enable OpenGL context support
 also with libegl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

mpv considers libegl as a valid dependency for OpenGL context support:
https://github.com/mpv-player/mpv/blob/master/wscript#L726

Fixes:
http://autobuild.buildroot.net/results/fcf/fcf8cf3c4961bf0be9d7ebeec86065730b0f9210/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpv/mpv.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index d4d4d4811d..19ae783edf 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -148,6 +148,9 @@ MPV_DEPENDENCIES += libgl
 else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MPV_CONF_OPTS += --enable-gl
 MPV_DEPENDENCIES += libgles
+else ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
+MPV_CONF_OPTS += --enable-gl
+MPV_DEPENDENCIES += libegl
 else
 MPV_CONF_OPTS += --disable-gl
 endif
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
