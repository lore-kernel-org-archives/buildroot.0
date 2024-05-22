Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8207EC25B78
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 20:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23501400BA;
	Wed, 22 May 2024 20:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q25I9oHb3K26; Wed, 22 May 2024 20:13:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1915140385
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1915140385;
	Wed, 22 May 2024 20:13:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B90D11C5F4C
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 20:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1A0E401CF
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 20:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYk5IysgDA3v for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 20:13:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B8BB401C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B8BB401C1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B8BB401C1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 20:13:36 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CB272B004FF;
 Wed, 22 May 2024 22:13:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 22:13:26 +0200
Message-ID: <20240522201327.117599-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716408813;
 bh=q28WMSI6pLuXuqIt663adizES8kgJV0d1TvVs00uwmA=;
 h=From:To:Cc:Subject:Date:From;
 b=C8jdKn7ly64KM2k2WFDVLmIpSqDZ7MqxIab1wf7uWEqz+kzudrMZIxt18YEoY7je1
 bwterNGpST9OL1ry6cZQdkXZ6Tk5FgeCci8U98OHs06XZIxtNemFeld230H4RxBys4
 dy0pRxhxYURhTj9jcEV1spgZVhUOeWhbXII9KlsRQPtQw80EcJD1GEMe2kEI8OWOyu
 1MjGe6FH7mNSH6GKzpFhIuT1WDldxYA5SLZs5YNPLUlWjn566evorn+1gYKNQ8LjUn
 uOuZE7PqjUoS7WIPGMGaQRazeLX3oHgZjJZVZy9Uk+mnznvKa5+lXOl9ccQVJ7czNy
 menkWBpq+KJxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C8jdKn7l
Subject: [Buildroot] [PATCH 1/1] package/octave: add optional bzip2 support
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/octave/octave.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index b84e043679b..05255137828 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -19,6 +19,13 @@ OCTAVE_DEPENDENCIES = \
 	openblas \
 	pcre2
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+OCTAVE_CONF_OPTS += --with-bz2
+OCTAVE_DEPENDENCIES += bzip2
+else
+OCTAVE_CONF_OPTS += --without-bz2
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 OCTAVE_CONF_OPTS += \
 	--enable-readline \
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
