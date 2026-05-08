Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BEBCD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 19:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BD6D41F80;
	Fri,  8 May 2026 19:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69zEDLKQu6Nh; Fri,  8 May 2026 19:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A208E41F7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778268923;
	bh=7a07hXYTiVWbVouhycPu5sTfhPV18GRkMfNqhPgWffk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M+mDCc+le96y436cZcNswhVfYhJQSULHZ2ebTWJ3DLDCE99045YjysBAuO7d33OzO
	 QqpxztKa8tpsvIHBO8kHid0ArdRsCmapw/kshhza/B286l0wuJ8BT4p6UrMB5Hlfx5
	 sOQlF9JO2i7XZUVFJQPIJIJCqquVqO7fdR3tmJFL5bWwK3aiur3JO6tJQlbEYNFHo7
	 QfsH05Aj08/ML0XxrQi1hhWDyE09nG2i45ojmjqTpev3oRVawx0W0XOGzodZFCF+UF
	 Eo4S1BgMSR5yRg+YU9TlWIagtnUYqa9Pff4hvMhFbGF9I0z5vzpLLXkjpbmQkAqles
	 xtYbdOsd7BgEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A208E41F7D;
	Fri,  8 May 2026 19:35:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6502928D
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56E5761B40
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Enk5rIeRfKZo for <buildroot@buildroot.org>;
 Fri,  8 May 2026 19:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C69DB61B3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C69DB61B3E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C69DB61B3E
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:35:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05da.dip0.t-ipconnect.de [91.58.5.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 298A5A4C2CE2
 for <buildroot@buildroot.org>; Fri,  8 May 2026 21:35:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51180)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wLQyk-000000002A3-03pQ
 for buildroot@buildroot.org; Fri, 08 May 2026 19:35:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  8 May 2026 21:35:17 +0200
Message-ID: <20260508193517.4014949-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778268918;
 bh=QyMp9R8lL7b9r9hPvDFPHtQmR8PsHGF1lajW6DO1DaE=;
 h=From:To:Subject:Date:From;
 b=otQ87FM32+CDYXkagF6Nqaei2ymu/vEDngoTJgjxISyYu65anIOLnPK0+fmTRrY+q
 9UYWXKWb1rBnbTTpgAmxoM5B6cggfOfSfie1pMbWeUsgsA2EUylQxKeaJscXkntU1F
 8f/Ogl42b/M01WqRPLkdPhJY4LSwtDYkLPpudcuHvTeyUf/NHGe9trG8IlrIu2IvYR
 O5SlLb2WF5UKXVJe/skqSzrwTtWZjEImOVhWQuKgFS5BUWV1vr7lMY3iab4AbRcmda
 t1uJTND3UdyNJWtb8UdxNpiEnFxYd1uORf8EesuEFCvYxXveN3n+hxqy5XCt/BuN0H
 iB80mvTsVH5VQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=otQ87FM3
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sourceforge.net/p/fetchmail/mailman/message/59332343/

Updated license hash due to upstream commit
https://sourceforge.net/p/fetchmail/git/ci/389729194921d7ccc7054819678657a5b2054876/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fetchmail/fetchmail.hash | 6 +++---
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 0dfe404f93..60c950476c 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59316921/
-sha256  246e5fc0e35c93dde1a3fb66778e3ab700e16809232e4959c508b91214374bb2  fetchmail-6.6.3.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59332343/
+sha256  efe01690d22bda359a579c77e2b0072658a092bff490ec0478a212c6b7d0eb70  fetchmail-6.6.4.tar.xz
 # Locally computed:
-sha256  a502ffd59034feee7e924b29500451b984992ae361bd8084736afc470f32135a  COPYING
+sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 00c816cdce..d021c2c7bd 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).3
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
