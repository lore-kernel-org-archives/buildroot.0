Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333C510AB827
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 21:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E43864094A;
	Thu, 26 Mar 2026 21:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h07R6WmVjnCs; Thu, 26 Mar 2026 21:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 018AF40E70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774559694;
	bh=D7yb3pPpPnhCiOitZM92VaWGf/CVdPyHsEc+05uu3Vo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iqnVlWjOJ8VH8B64Ysxo3Jqi83m5UWHwXQuTPAEwG0aarMZN06AE4676BfEDaSm9G
	 9d5pFjJd0secfQKLQFDCrmCviDPShabXxR6vfSSlV+ZVKl4tFmmJ7Sk9OJ7+QMkgtA
	 wErdpIVXtQvsYxWgiH4s6YofU/wemktOMOiqGONAjTWvC/Mf8zKWxNpPbV9u+dFLhk
	 xUIdewN7WUeJfOesYnv/jR/NuqacEhz8ABGTYZJLfPTKtRw7E5INQqrhAemKNbUdOA
	 yg6hgtnUjLHcTLRjPl4DENusovXUcs3BSgN8z+q6jmItqH/Y8ch8rZX1zKEjPQxUrs
	 MwtsDtaGVmAlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018AF40E70;
	Thu, 26 Mar 2026 21:14:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C7C249
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8EDF80A91
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAwpxN3XiMkq for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 21:14:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9CFC8098E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9CFC8098E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9CFC8098E
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 21:14:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c201.dip0.t-ipconnect.de [79.214.194.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AEDA8A4C0DCF
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 22:14:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57776)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w5s2S-000000006tz-1dbu
 for buildroot@buildroot.org; Thu, 26 Mar 2026 21:14:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 22:14:48 +0100
Message-ID: <20260326211448.3598621-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774559688;
 bh=m15o7zKgGzHPtzrEoUm6uwEJnEdbP38DHBta9vDGzwk=;
 h=From:To:Subject:Date:From;
 b=K/s8AAHE+kBjpN4nmk70h9qKmMZY7eghT8/oNAtYsWatdEZs3OyG2kJnr9FM6WRwB
 8dy9QOQkI6tEJUzjqcoDQnnYS/hJVVhKTEJV2EDJmVofyI+aQLZ+NwIgLOShJepm3B
 aWPKFVryD+wLzeq92GJf7+5uTksyUiVbigVZKQwJN9pHiSIHS2h+iyKmekSImg50QP
 KQWPLll0zY78De6vJxsto2M14J4Xm2XGHUBmghrjJY3KQT4moDMbq66wH2iE0fDkY/
 QHn9BuD9infpkeUrbNfEi05DBCcogN7FdqXXeVPKfOiiI8H6eey3TY45kWdNBYk6q8
 HXJJfpwKuLSjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=K/s8AAHE
Subject: [Buildroot] [PATCH 1/1] package/freetype: security bump version to
 2.14.3
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

https://sourceforge.net/projects/freetype/files/freetype2/2.14.3/
"- A bunch of potential security problems have been found.  All users
 should update."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 520e6c2bcf..9bd01d3ad6 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/
-sha1  28200b8f8df5a524f476bdacb20f05da1c33280c  freetype-2.14.2.tar.xz
-sha256  4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1  freetype-2.14.2.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.3/
+sha1  62e26b89a057ad4f1e28af977945d5c1975a8e67  freetype-2.14.3.tar.xz
+sha256  36bc4f1cc413335368ee656c42afca65c5a3987e8768cc28cf11ba775e785a5f  freetype-2.14.3.tar.xz
 
 # Locally calculated
 sha256  bd36c8b474855fa294c2ec5c184544478ef3720aad37d65a6296a4f264fd2d3b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index fbf9d13235..634d9107fe 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.14.2
+FREETYPE_VERSION = 2.14.3
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
