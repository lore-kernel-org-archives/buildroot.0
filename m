Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D556D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D92E06150D;
	Mon, 12 Jan 2026 08:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rdp8NRM7d6bu; Mon, 12 Jan 2026 08:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25969614C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206011;
	bh=F9ba25Br9jKh2hgn8msvxvtEPioMM8NlyetW1i6M0ds=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=phLjDMEjtdqQiGIh5M8vLdqiU7IUjrDB4XnPDWdzaz9PoSAAIunT9WzEnS8uIRAte
	 xI8jJJHRZBMMtqiNotKMfw8CZrVPnA0U8W8CdZpipUUtR/Vwyeozp7xC2GKbu9/0mM
	 sMzvWZ96lJcNynetUu3i3Lke6cR+IIITfJIWFyoCEGwmpRnZ19Ig5GHEwYyIk+2slC
	 r+OeMwR/jpVoKJjPHQP5CIUJihOrU1eg2Xxz9/eV28kQrHjhXunefUXFopWhhx7CCk
	 2SVEsBg61Prj9jh68v6RSB2GGUa5lPdUT0J704ks7PaLlHPjaFvYxzSU7tEoObrawv
	 WwUfov4I3w9Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25969614C0;
	Mon, 12 Jan 2026 08:20:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6284218D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54EEF414E3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dDA8ttCFnUgu for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 501D5414E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 501D5414E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 501D5414E2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:20:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A9987A4C4101
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-1mA8
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:03 +0100
Message-ID: <20260112080419.2516889-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205145;
 bh=mb+oWv0Gsm+asXNosATAVwfxdzAV/tSryrr8lG6QSOg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ppxcjF1gxBO74eCayx92EDGDFkCcIIixvwM8KcmE+5JmKsKoi3fb5NSfm/psbcT5k
 vhH0fr+bOupE6lu47qXWASY9bHjVhSOoWFhpek1f9j1XY2002YZpJY4H3eY1TQgN6T
 /HGQXdxRvmIpTLc8wBs6Ht6tsxpOghreVCpF2q5f9k9AJDZygeOrPQoF1b++GvmV4w
 ulbrct4Ib2KbH9z28D7qalNNB0QYdNnJF68sWfp4b+vtf8upXQDLrSqXSN2muSkUgc
 pMBzV0GShkT5M/pydETKTKx+qlfNdkMqZjCHsv3W7W3A2N7A1mjlAR3BlqySYAWUSd
 sqAGEzP6et2NA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ppxcjF1g
Subject: [Buildroot] [PATCH 028/104] package/x11r7/xapp_twm: bump version to
 1.0.13.1
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

https://lists.x.org/archives/xorg-announce/2025-May/003600.html
https://lists.x.org/archives/xorg-announce/2025-May/003599.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_twm/xapp_twm.hash | 6 +++---
 package/x11r7/xapp_twm/xapp_twm.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.hash b/package/x11r7/xapp_twm/xapp_twm.hash
index 75d89a9984..c2ed52c07a 100644
--- a/package/x11r7/xapp_twm/xapp_twm.hash
+++ b/package/x11r7/xapp_twm/xapp_twm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003135.html
-sha256  aaf201d4de04c1bb11eed93de4bee0147217b7bdf61b7b761a56b2fdc276afe4  twm-1.0.12.tar.xz
-sha512  f3d68df7e06516f6b74f19181efcfd9db2479c8ea0c72c3a6ed0dc1b222405b40d81a2dea17b662955e0c1783e87d0d3eb067c3b6e7c6eed8c0d38d03d362260  twm-1.0.12.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003600.html
+sha256  a52534755aa8b492c884e52fa988bac84ab4d54641954679b9aaf08e323df2c5  twm-1.0.13.1.tar.xz
+sha512  6976e62c322d4d7e15501a290b65a771101a23f3ff7733b039215b583f12da9db22048947a4851a88f08c74b72c310891e721291487e63972da23819f8ae9656  twm-1.0.13.1.tar.xz
 # Locally computed
 sha256  4809ffc9656bc9a704e19ab467d1cedc97c48c9d1f9a4018e6d99d2e61f75945  COPYING
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index b222830497..00e43f00bd 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_TWM_VERSION = 1.0.12
+XAPP_TWM_VERSION = 1.0.13.1
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.xz
-XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_TWM_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_TWM_LICENSE = MIT
 XAPP_TWM_LICENSE_FILES = COPYING
 XAPP_TWM_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
