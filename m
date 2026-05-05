Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67370CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35F9160B0A;
	Tue,  5 May 2026 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6DITvjmXl-c; Tue,  5 May 2026 19:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5DC560B04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778009837;
	bh=uXQGkntcl18+l1zQCdHKqkmiN3h22JXZUbFQ7Nd7ZT8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oj3+TtElL8CcOmmjGDoXTtbOrte/nkMkFYZclBk6UrfkVY4XOk+8Vc7xSl2LwU3Xr
	 gC5/ukNV6bH7Tm/xOD/Hy28MlpeQJkWzEP2JeoM7kj5Kl3QQAavhdyNfDfJDsOWbIG
	 hkah84SQJZWPLQJwq+avc4srei4/An/hGxjmftytXp2JbgKOT2bU6n2bo4IVSCOADR
	 z7TGkx63pnpHaZvu92J9T/gMDoCLX1p3HBFWQTFtQiS3McZfnuX8R1pe4w9SX3//PM
	 Wmgcb2SqfGj7KxF9YxNH38n8y1ELBUgGnE2oxQWALAT2/t7ddN8plaE96jrE1RN0h8
	 R/Bg5J95+5Plw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5DC560B04;
	Tue,  5 May 2026 19:37:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DE4C280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73C2A60B04
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqAmo2CsvdLJ for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:37:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 671B560B01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 671B560B01
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 671B560B01
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:37:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E75D1A4C1345;
 Tue,  5 May 2026 21:37:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53298)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKLZx-0000000068K-0GFk;
 Tue, 05 May 2026 19:37:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Tue,  5 May 2026 21:37:12 +0200
Message-ID: <20260505193712.2389858-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778009832;
 bh=ADCHlVMfQTS9zv4tk03rXCl7YMk93my2m7qsip4uVV0=;
 h=From:To:Cc:Subject:Date:From;
 b=ducQYVNWRCCy7vWiCNWnsCHGM4qIE/BSsijYyVmpC6Ky4WPPdaUJwNc+N38Vabi2a
 oZk6W0Lo2R3f21whQM0zNwXojRgwGjoXTa7NHIJYsfixchMN5qiAMyl274JWC3B9Hx
 yhUhHmyQBdDcqa0moqe11538nU5u8zJbmCgKBxthAyEY2FOiXTyEVQNYlU0MlnWWBW
 +7cPPnHkRcszNE3I+w1K6eKKjpBIFkztaXfCSJPxyTgwvOC3TaExAamw9rXa/xP+wA
 2b9gwuE6p0c2Fo3zcrTW1q6M7ByDROf4LuD7vzZCF0zZg0m/fBx+f2rR9a5b23pZ5W
 1v7D+24G6NqVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ducQYVNW
Subject: [Buildroot] [PATCH 1/1] package/ccache: bump version to 4.13.6
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

https://ccache.dev/releasenotes.html#_ccache_4_13_6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index c01bcd8f1b..46ec78bf06 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.13.5
-sha256  7a8945f4ac7d4bb79c0055cd3db7857a6934c2b7ab3d80bb11a0f5271e36fd94  ccache-4.13.5.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.13.6
+sha256  a7de667ca08cf67c3c8af9f213f6aa701a1188a2b3163fb74483858ce5e79fbb  ccache-4.13.6.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 74fa2fbf90..a7302d6361 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.13.5
+CCACHE_VERSION = 4.13.6
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
