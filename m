Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1928D1BDD8
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 19:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975834073E;
	Wed,  3 Dec 2025 19:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8P2KQs4jN1I; Wed,  3 Dec 2025 19:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD02040691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764791806;
	bh=fqSAxQOxT664S9Yohk5JKcel9V6kUyXqWYeOAQUrHNo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PAGfdWtHvDAOlUdHG7HDXiwgQ2u89TXu+UBfPTh3ZKYXa+sfRpGXCq+6yhKeJPzLh
	 0Ra1vjYmasr0bNiaUrLB81S8bmw9oUnEhR8+tFWpNzO1o4hdAKumkjXhOIJShDkZJa
	 PXEy9hqVSoFfJlyPJHxV9IihY/5Cr6Wl5LfjUf2JeoXoO7osHMx1+1vAZ6ryIf8m1X
	 hMQHUaILKFY2N/LvHChZ0O87Xf1r3OcT4Ga3bbazi6Ont3tBVLK7Hkkk266R+lfunf
	 nnCO6oeVWumGawqE59qJkA2P6iZE8mczz0EWBNVM/ExvynzYqV0Gug9BRQIVJKCY+L
	 7c6ydr03gjJrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD02040691;
	Wed,  3 Dec 2025 19:56:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 748AAD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66BF782266
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FG8z4IbLRdoP for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 19:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50AF88220B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50AF88220B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50AF88220B
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 19:56:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63A32A4C7961;
 Wed,  3 Dec 2025 20:56:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36768)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQsxt-0000000056X-2jZK;
 Wed, 03 Dec 2025 19:56:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Wed,  3 Dec 2025 20:56:37 +0100
Message-ID: <20251203195640.2297610-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764791802;
 bh=IXzcCZnEIwT+75BSxaGRgtaJ6e45SijlRASob1lVslo=;
 h=From:To:Cc:Subject:Date:From;
 b=UQvC3o5YusEjW29JRpzJBv1DWhspEaoDvPdp8btubFM+CrZBlruaXP/J6Q7gcID3L
 fohSaZt8ro5yidfGEswngu66IKVLEoBZV3XcLRyQVj3vGF+RYeQCE6RA1gCcWCBE0M
 UqseCoBU1/dCxc3NEQt/5J3p5nqQlIOlj6298z6UxRFki13ZHeJfYEDcMu/f+7rX2U
 2yysu+Eaf7YZ9jDtwk0PS3aag9NWfsRpPPRw1PTvlUoz8pxn6rssN5SwI67c1f9H6Y
 OQ1Gf/xEgnqzL7iRznK363DoOsP17GoGzjNkWJ66ZqgLlr/u/CH1QA54xURFVhkgWj
 5SdRMvmMTU2RA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=UQvC3o5Y
Subject: [Buildroot] [PATCH/next v2 1/4] package/libvncserver: bump to
 version 0.9.15
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

From: Christian Hitz <christian.hitz@bbv.ch>

Fixes building with OpenSSL >= 3.0.0.

For more details on the version bump, see the release notes:
  - https://github.com/LibVNC/libvncserver/releases/tag/LibVNCServer-0.9.15

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/libvncserver/libvncserver.hash | 2 +-
 package/libvncserver/libvncserver.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libvncserver/libvncserver.hash b/package/libvncserver/libvncserver.hash
index 225c42e46a..127a163fe2 100644
--- a/package/libvncserver/libvncserver.hash
+++ b/package/libvncserver/libvncserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  83104e4f7e28b02f8bf6b010d69b626fae591f887e949816305daebae527c9a5  LibVNCServer-0.9.14.tar.gz
+sha256  62352c7795e231dfce044beb96156065a05a05c974e5de9e023d688d8ff675d7  libvncserver-0.9.15.tar.gz
 sha256  4d23c8c814e5baf007d854f01d8502e77dc56a41144934e003fb32c4e052d20f  COPYING
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 082f838f12..c6cbc834f6 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBVNCSERVER_VERSION = 0.9.14
-LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
-LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
+LIBVNCSERVER_VERSION = 0.9.15
+LIBVNCSERVER_SITE = $(call github,LibVNC,libvncserver,LibVNCServer-$(LIBVNCSERVER_VERSION))
 LIBVNCSERVER_LICENSE = GPL-2.0+
 LIBVNCSERVER_LICENSE_FILES = COPYING
 LIBVNCSERVER_CPE_ID_VALID = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
