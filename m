Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0EBC83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1955B61475;
	Thu, 24 Jul 2025 19:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjuvnZgJ1FO2; Thu, 24 Jul 2025 19:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AEEE613C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AEEE613C0;
	Thu, 24 Jul 2025 19:26:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9DAAB83
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C04E7407B5
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bOo-gEdnNZa for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D69F404E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D69F404E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D69F404E4
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:26:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8BA31A4C0F26
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 21:26:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33196)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uf1aY-000000000IT-479x
 for buildroot@buildroot.org; Thu, 24 Jul 2025 19:26:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 21:26:46 +0200
Message-Id: <20250724192646.1192963-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753385208;
 bh=e8pfQb3B+H0068KZi34fi2rj4lYDKryNekJvYX+G8pk=;
 h=From:To:Subject:Date:From;
 b=AG5wRZGODCew1mc9VN3wpfiMAMxsB8eXqm+RAPQaW5nx1hLtbB/oonOFcQd+ZWruA
 vIPjelkM5d2dU8mX8Jg/h0o7IYd+fAiKCEA0R3BBeNwZUfxLcZbZoUOah3tpH0rhIt
 WRmq0K/W7FAb0w0i+2tJHR/qtRk/Io8q2D8ToM6sPpZZXCZ/a2T3REwVDRmjj4Ob7P
 XMz/0vcad4KFTR2BrS8eUcj4DtWp1aIhUSHjfY+udE3KADUd1Azq2+mJ2oLjst9mOf
 Tgye4G00O5NK2tLqwkwcIgMy8xG6Fr9HQ8ROi24fG9PRWs+lW42mJnZmmGuYeNYFJS
 ay26p3koxKG7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=AG5wRZGO
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index a480302988..bf1281f818 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  24d45f9d5f0b92a706e827e553850cc4e0ed5d7f5f4555d16d4c56eaa2f606bb  tvheadend-730718c2888a121a00b96f3460b2e8f5ca8396d1.tar.gz
+sha256  287c875ed08aa9ad8e2b90c209d57ec300ac89b2dfbcefe060a103eaf24dd3f7  tvheadend-0af87f13f786046df7bb610f8a6b291c26af1b14.tar.gz
 sha256  0420f5d2e0df002e31320d9f58fc5454cbb8f53fa0ab1fc85afb8821c6b103e3  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index a37d4dac57..cd0bb68380 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 730718c2888a121a00b96f3460b2e8f5ca8396d1
+TVHEADEND_VERSION = 0af87f13f786046df7bb610f8a6b291c26af1b14
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
