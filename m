Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D4DE8305C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 07:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A586405DE;
	Tue,  3 Feb 2026 07:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWPvZ4Hvjm5D; Tue,  3 Feb 2026 07:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87EEB405E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770105507;
	bh=j8DfoNXz0xqi727Yo4kazvjEj75ltLWbI7ao2zcmGLo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lWUqwwNVRo28LqF7txEjtSWijwUNZNS+0e2XNwe42J+AJZTwdESwqBhKeEQvJDzw2
	 i6dZ7sUoJuQfTGVr2/jiFtYOige7IxE+5T6VqEGx/c5d/b93ccA+PEDAo55caqyO1y
	 gZb1niqkKA0TxbMTXfiVYG05mMoqYKxTBc+OIok9fHrLAm9N4R91OMhpDrsCp1RBH+
	 0+mc7yaC9c1SPhfroKulQNRv1RDer8iJpvtY8K4nhAbWSTo/WjlijDHLa1HZtpTN77
	 FUNKaTd447HoyiF3FBTuZWatuNy1OBj+FkgyUt7v4BIZLgUDiOj8+MsSAOdo5qIW8v
	 Y376K376gAk7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87EEB405E2;
	Tue,  3 Feb 2026 07:58:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8777F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 953E2405E2
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:58:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oC9MJO8DOiDH for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 07:58:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CB8B405DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB8B405DE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CB8B405DE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 07:58:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1679212467; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 07:58:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vnBIj-00000008AE4-0YPn;
 Tue, 03 Feb 2026 08:58:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 08:58:18 +0100
Message-ID: <20260203075820.1945913-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XJYZK0Rj08QHEXvc5wujeD8ySZr7eUoKweyYWvm01MywNxqwvAjwy+Nyalqi/6XWVYL+RzsROa0AEee5nb2T0d6d739eA4R3p7jccVhmf2kVl3q3UNyenMueWuSdLv8eCTz9RkHP9kIFg6/l3JbnZcHuQa3cfJrRqDrf1jZkwCHyq/tTcX5g1xtBcQP4+uiaYyXc3vg7rqR+S9kyL7WhO9GOXVAvdU1ePzdDEkp6ZluJ5cYsUkTsNqkaW48+K10+7Fbj+leF1u3cjkYUMb7oTXFqmjxA//lBQSouZzrwIN9mxaLPQQI8yc5jpikSyCBKL+5+moTQlUP5yZ+QlaS2rw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=3j3HHzTENq8Xy8+Dp/Xtb+cu+WXaICYIiA+44zCC+nE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=XJYZK0Rj
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/mpg123: add sdl2 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mpg123 supports (and prefers) SDL2 as well for the sdl backends since 1.26.9
with:

https://github.com/madebr/mpg123/commit/792615f6512a0908081b5a2e98ca61f8677ed452

So support that here as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 2f04e0f979..23e061614d 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -64,10 +64,10 @@ MPG123_DEPENDENCIES += portaudio
 MPG123_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs portaudio-2.0`"
 endif
 
-ifeq ($(BR2_PACKAGE_SDL),y)
+ifneq ($(BR2_PACKAGE_SDL)$(BR2_PACKAGE_SDL2),)
 MPG123_AUDIO += sdl
 MPG123_CONF_OPTS += --with-default-audio=sdl
-MPG123_DEPENDENCIES += sdl
+MPG123_DEPENDENCIES += $(if $(BR2_PACKAGE_SDL2),sdl2,sdl)
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
