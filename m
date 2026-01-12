Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2C0D25043
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6CC28083A;
	Mon, 12 Jan 2026 08:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WyvQU2voiNrH; Mon, 12 Jan 2026 08:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5FFD8083D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205164;
	bh=cmAYIXIL3Hy+/jQigqdttnlP3raMeNiNr9zXsNzFQnc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIFLN1N0NonAun/nC0In/Er9kK3a+q0nLmaYqSyBfwqyPT7Tn+V8HCVAWHSgvD1BX
	 Zahg0IE1GxCYpiPWbWGaeXE3UbQ+dlmDQLjfn36f5KNZFCIpPCB5tZ+qAloMJ7dpE4
	 2m1oenRfYSFOP9n6ClHxm7JvkS4pcdTxTi4DJHS3AJWqYhWyO5DRjtvQ11pIQgeMTE
	 al1B2v0YOaIl2qAMcWWJNvZPvAeLRWC6+SiJTqsCapInLLcPGH+T9u8inQKBa6IRsa
	 bLY7mtK4RO/OXgXm//gMOCHLVlDzhsHAEx7+YTQncnikkKDngUPfa8OGS+lLrIjOoh
	 6oKtBsEuybWVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5FFD8083D;
	Mon, 12 Jan 2026 08:06:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03CB712E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAB6F41026
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xylz5ZKOXbB for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:06:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFE9F41025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE9F41025
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFE9F41025
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DED4DA4C41A5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-28Ca
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:32 +0100
Message-ID: <20260112080419.2516889-57-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205081;
 bh=wK5yyftVclXYRPo7tBrr+qARke59FE8nJL5ErdghfgE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=psOB77jRRZ5cfZgaUl10unH+jN1efhJDsXrVNkat6htULUOc7eqMZYJvvWItt3rKI
 q/ED6pXT6Lg50jU7WN9srWco0NDgL6BtRINMSbD4gbxFyh7haur6Br0OFZ//9f0V5u
 fOHlduJD1a47DB422ktTPpMhxo13Io8RP5JiLG4LKX6YfXgigrWm9xs/2k/96ZortX
 untVi0UvlWM90FJq41pX45HvqG/ojjI8V83TofZTzclSn/O0l4mFQ31/J46yvvm3EC
 Pi65BVV+uftaPQpkKbujlS7Xox10MFidNmupY+3vlB1AD/6zmI6G31TIL1WjzJYO3L
 Qs+SK84gae58g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=psOB77jR
Subject: [Buildroot] [PATCH 057/104] package/x11r7/xapp_xmag: bump version
 to 1.0.8
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

https://lists.x.org/archives/xorg-announce/2024-October/003536.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xmag/xapp_xmag.hash | 6 +++---
 package/x11r7/xapp_xmag/xapp_xmag.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xmag/xapp_xmag.hash b/package/x11r7/xapp_xmag/xapp_xmag.hash
index c0cfbcfa68..abd564dec8 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.hash
+++ b/package/x11r7/xapp_xmag/xapp_xmag.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003191.html
-sha256  009936cc5a2706084079127b26cf55c713767650a34cb69e5682d60e33ce7461  xmag-1.0.7.tar.xz
-sha512  d35ac5d977b9f3bd03fb919bf178f68bdbc6ef2a57915b407d836fce0582f5cb78d0b79043bb6f8d015464ca113deb09469c3b724aed03901a4c3fc4a9982984  xmag-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003536.html
+sha256  326d3c583d795bb53ac609d144e7f7fb1499baba7eaec14b8e6cd232ea069532  xmag-1.0.8.tar.xz
+sha512  d4dbf6bf60a5a3ac88309cdc8f07284a20bd3b044795cd54e002ee5956fa317a09e5f21a9469a6fd9a786f109d8592d8b8e5128ac86850391a6445ccc1f7a11c  xmag-1.0.8.tar.xz
 # Locally computed
 sha256  ef8744e617719339c4934579f8558ee4a5aec4396bebd6af02562b63a7c16d27  COPYING
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index 0e8831d25b..5e7e2c7688 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMAG_VERSION = 1.0.7
+XAPP_XMAG_VERSION = 1.0.8
 XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.xz
-XAPP_XMAG_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAG_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMAG_LICENSE = MIT
 XAPP_XMAG_LICENSE_FILES = COPYING
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
