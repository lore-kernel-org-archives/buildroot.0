Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF69CD5BD1
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 21:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 351D742041;
	Tue,  2 Jun 2026 21:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5FmgHO4RcoSH; Tue,  2 Jun 2026 21:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3344B4203D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780436956;
	bh=MX6pEPPZ12hN5Vnp6dutzOlkvUTyUko+iI0TEjE+M8M=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pqORKTepEO1T2g6OL2yDsee6bC9lE8U45cFRx9s4/c07cP/bkENY6b4rBc1Oo8UtA
	 51cymq3Ed8JA8tk6zSS1XedEP8u3dGwkQ4qm4eDWFmitUjjF9oSaz7X/v86x0y2zBv
	 ILQf0W++jAAN0Mh8UqMlBIUoLnMJ5sh+TsfXBlMw6Pjq7osMtGwmaGONOVYy2JYg8F
	 tsOpwlu4hqmCP5+se+gnmh5fjiLBQqTT32PwkHUlCVj2BsjVUVw++DL8mvsGJEcv/f
	 iR3inpN7v+3NHphCIZNmgtUY5+wBzhMsZ5aUga/zwv1Md1U6TAcS6S5CfOT39tMsI1
	 adQZ7GThBAMEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3344B4203D;
	Tue,  2 Jun 2026 21:49:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85481187
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77DD1613C4
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WaUmgbS9foOA for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 21:49:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB279613C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB279613C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB279613C3
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 21:49:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ef.dip0.t-ipconnect.de [91.58.8.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06552A4C3942
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 23:49:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48452)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUWyy-000000007Pd-0l2d
 for buildroot@buildroot.org; Tue, 02 Jun 2026 21:49:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 23:49:08 +0200
Message-ID: <20260602214908.1292981-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780436949;
 bh=P8wA5Zc8cYHUUSPBrwsAN/g/73j1NS5IGsR/ScJLz6Q=;
 h=From:To:Subject:Date:From;
 b=cmLXEVOBKaI8BUqoV1B+QrWCdP62QZGgo3Ku8FDVFHxRgV9Klre/LLFrzRC8ppPLw
 qiJf7rbb7VAMEv8b89ZCMw46xqJ4NaSque9mvZnaIGJbqu0uAV/g4LFvZrOrfMXcHS
 B7kWwnM7zS+XCNab/2hJUXXyCMmsyxoyHi36jCWs+pUI4syNlAf0k5AEqiMvqaZIok
 4W7Fsjh2xicBHSiww5pxDMcrqpFNCniv+PsyYG9d7RHIlO5WlqfL+Hki3M1WAoUFYd
 EwxOs4ait6+jjfJA6ZXQuX+cNjb/XwlNvNjcxP8YE8ISsQo0VevtMoawzkxpq+qTr7
 WgZNh+oVO2SwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cmLXEVOB
Subject: [Buildroot] [PATCH 1/1] package/privoxy: security bump version to
 4.2.0
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

https://www.privoxy.org/gitweb/?p=privoxy.git;a=blob;f=ChangeLog;h=d62aa6bf0b2cb26100e4ba8e528638259502711d;hb=0c5225b6844dd1a838b80d09d715a6c4ccbda2c6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/57576281f13331dfc2e60673a30098448d05e75d

 package/privoxy/privoxy.hash | 6 +++---
 package/privoxy/privoxy.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index cfb6f5a5c8..2678a4ec25 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/ijbswa/files/Sources/4.1.0%20%28stable%29/
-sha1  6afc12dc38781a37670c7e4bb69700900123084f  privoxy-4.1.0-stable-src.tar.gz
+# From https://sourceforge.net/projects/ijbswa/files/Sources/4.2.0%20%28stable%29/
+sha1  deb927b172a3b473bcf246ea848ba6ed931274bf  privoxy-4.2.0-stable-src.tar.gz
 # Locally computed
-sha256  23e4686e5848c74cb680c09c2811f0357739ecfe641f9c4072ee42399092c97b  privoxy-4.1.0-stable-src.tar.gz
+sha256  6f91267f81f626c416994db89ab62f4d09246eebf4754b81186e13a18ee9028f  privoxy-4.2.0-stable-src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index bfd4996292..9bafc1385d 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRIVOXY_VERSION = 4.1.0
+PRIVOXY_VERSION = 4.2.0
 PRIVOXY_SITE = https://downloads.sourceforge.net/project/ijbswa/Sources/$(PRIVOXY_VERSION)%20%28stable%29
 PRIVOXY_SOURCE = privoxy-$(PRIVOXY_VERSION)-stable-src.tar.gz
 # configure not shipped
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
