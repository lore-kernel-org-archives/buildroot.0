Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AD2CD5BAC
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 09:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2559760893;
	Sat, 23 May 2026 09:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epNtwF0NVrS0; Sat, 23 May 2026 09:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00C8B60884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779528794;
	bh=/bjf6avBBZ3ogNuMuz5s/tdAFXiNt+/fSYIAh2ooSJk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=StYpWm/wLyWsJQ6AZxgZX+tPErzywiYfsBUhY8Sh+cRw+iQxztZgzBz6q7hqfrSjY
	 fTtJozd0W/v8Iw5fewizdMhkFm5wi6kybqe6WAz0S0KdRrKv+tBhRPtGqxz0yrlmYD
	 Bnza+n5r0qfyx/aLsolxjxGKmJUNsaI8Rqh6jdvhkZoB6MQuv3Dw9UE3ikspwQltrJ
	 hwv5zeCuqY8bja7ZROo1eNhCp6+foy7n2tqo9E8eEy1J9pOwfWNQaUqij7R1Li7o2i
	 7Vb3RUOflDX059xUleoDGss0R3QJPthsu9zrLnfX/0VwyWJSyKw2NngnzC2juduO5i
	 9He5kKGUqD02A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C8B60884;
	Sat, 23 May 2026 09:33:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53AD0282
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 324EE60884
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I03PfgaHZGNL for <buildroot@buildroot.org>;
 Sat, 23 May 2026 09:33:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60B3860882
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60B3860882
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60B3860882
 for <buildroot@buildroot.org>; Sat, 23 May 2026 09:33:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9DA10A4C027B
 for <buildroot@buildroot.org>; Sat, 23 May 2026 11:33:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41374)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQijD-000000004vl-4AJz
 for buildroot@buildroot.org; Sat, 23 May 2026 09:33:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 11:33:07 +0200
Message-ID: <20260523093308.186597-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779528788;
 bh=0BqYo25rJPnELEaTZwDhEZEF61avADq9Qr3vpAK6suw=;
 h=From:To:Subject:Date:From;
 b=Z55WYq7/h1xHH7W9fm6U9PRpznMx0HI+wItgq7OpTRN9nxC7Lx22kHMaAZFAtmQab
 kUNUeZVYdMeUfJ9/bqmFfpTFsx0Z4KikEWETxegEapwFXs3lTDYlnzCX7gYd9g5kOf
 ebgGFPMLxrp1bNzz8A5xavCqvqZ0RT7FzHxI5s0rH2HBZgfnhWzpCfvM7YcxdwAhu3
 i+qkjmrxFSz+qV6pFyBqJUodNftqpz0aaPGYjiYXOfqv4G75/ltehDe2zN9Tixe77S
 ZElzT1sJvu8F1pb0axK+OvV1O7aCSnalhS4HLWqitbwt5hp4leQs0PfLZazKz7CSNU
 N0W8i3WvbZEWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Z55WYq7/
Subject: [Buildroot] [PATCH/next 1/2] package/pango: bump version to 1.57.1
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

https://download.gnome.org/sources/pango/1.57/pango-1.57.0.news

https://download.gnome.org/sources/pango/1.57/pango-1.57.1.news
"* Bugs fixed:
[...]
 - !892 Include fcfreetype.h where needed"

This bump is needed to fix build errors caused by the upcoming bump of
fontconfig to 2.18.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 41aa793184..9d7909d718 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/pango/1.56/pango-1.56.4.sha256sum
-sha256  17065e2fcc5f5a5bdbffc884c956bfc7c451a96e8c4fb2f8ad837c6413cb5a01  pango-1.56.4.tar.xz
+# From https://download.gnome.org/sources/pango/1.57/pango-1.57.1.sha256sum
+sha256  e65d6d117080dc3aeeb7d8b4b3b518f7383aa2e6cfce23117c623cd624764c2f  pango-1.57.1.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 671705d0b3..a228f336ea 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PANGO_VERSION_MAJOR = 1.56
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
+PANGO_VERSION_MAJOR = 1.57
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).1
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = https://download.gnome.org/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
