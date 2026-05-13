Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5080FCD4F24
	for <buildroot@archiver.kernel.org>; Wed, 13 May 2026 08:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAC9E41420;
	Wed, 13 May 2026 08:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlO_4UOlLh3Y; Wed, 13 May 2026 08:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 141704140C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778660516;
	bh=R+aEWvruR7DLOZZ0tu/JFr4ZMtw53YmPlnpIaxa1UP8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h+Qx9dXRwGquR9BHu7nigpZQSkWeOKQ50NAa0xpGMCF1Ko3tHjTHjZ4OPfSTo0tzq
	 lXE50myue+2XbUwhpKMKCpIXkVoxEiSxZmCcqB+uYEcv/VJBcqTzZhFqSM6ACJ2HJ0
	 kxfvZR7il9g4R4z1IQunzfddHK6uuCFWOHYMOnCEg5sb1BZcZJsb5dIs2lmAlBRBse
	 X9xAK0ffTqiuRqlztLEaUFeXGK+BUggjL2Mkj+cN9rh1tTZxNYcY+piqlSLaoPWOnI
	 L0B701M39O/Qwo3KBBoodhjqwCAW8lVawXcP4oP5pgcNlXsj3cxyZctexXe+YXvqyC
	 kNsGVKEEAb1qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 141704140C;
	Wed, 13 May 2026 08:21:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F31A270
 for <buildroot@buildroot.org>; Wed, 13 May 2026 08:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44DA2610DA
 for <buildroot@buildroot.org>; Wed, 13 May 2026 08:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q48w7NcXx3KP for <buildroot@buildroot.org>;
 Wed, 13 May 2026 08:21:53 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 May 2026 08:21:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AA7F610D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AA7F610D8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.133;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AA7F610D8
 for <buildroot@buildroot.org>; Wed, 13 May 2026 08:21:52 +0000 (UTC)
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.134]) with ESMTPSA (Nemesis) id 1Mw9Lw-1xCz2915iG-00xwPJ; Wed, 13
 May 2026 10:16:45 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 10:15:54 +0200
Message-ID: <20260513081618.14018-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:xNd5wPJi+B/CKQvQg0BYv7rV8tPFkaNBVOrBjz9a+cs5bUfqdl7
 h8MKazaLuh/2WMWyF4bQNk1hpG1iCFxr6JAYA6fkBXTMVR0TJAc/6RHI9akxhR2wRWMJ0v8
 6bF6eHfIrF8N5Jb9/uj0PmQSRW52RTd0pDwn+Wloi8avjSY4j3TBUFnlHNwdwFK6vSDT10g
 6X8eF+i6DxoZpP2KVHMSg==
UI-OutboundReport: notjunk:1;M01:P0:8G1E89635vU=;XzX+HePQJRBC0zj1yzc7eXrOmTg
 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
 =
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.9.3
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

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.3

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index e8c155c994..11eab3001c 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6f097c82fc06ece4f40539fb17e9d41baf1a5a2fc26b1b8562d21b89bc355fe6  libgit2-1.9.2.tar.gz
+sha256  d532172d7ab24d2a25944e2434212d63ee85f3650e97b5f7579e7f201a78ad64  libgit2-1.9.3.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 34cb67929e..b2607a178a 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.2
+LIBGIT2_VERSION = 1.9.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
