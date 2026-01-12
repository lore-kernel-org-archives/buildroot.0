Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BB3D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B08548449A;
	Mon, 12 Jan 2026 08:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_3mhQfbaZTC; Mon, 12 Jan 2026 08:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB7E844C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205950;
	bh=RNsYpYcYRTcCA1vX0m0n3b+t9X71gCrQHoR5JVspK7c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iSi890Nub27UeUQxMD5LMxd5inZYxXhP2F+va+jL5VZX0fCa/glCG62ebwR2wnfX9
	 CkmoMgme4FgF8L3+YXGEufovJw03c5mNx0rRa5hafyY0fIDO6Av26ZRiQlcDxGQYEl
	 /+GW8zO5kj/+eWo3ZOWnoORtH0qMcWsKEf3dnll8VLSIt+hzPmQCYHdzat0BmnHGOR
	 l0WJrNbgwn7Yx+giQTgV9QRbcW0sMNjJWS9Bj/SOkomb0dA0tdQoBV+BLkT9Rdz88z
	 4xVmFhg5XpfxDRtTeq75I/JlOQHRJ+TrRMl6VOGu+qsEhr5npvuqcvzJdEfstMSmlU
	 +DbmQmvyC+6ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB7E844C1;
	Mon, 12 Jan 2026 08:19:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3228C12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24451844BD
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mV1F1UoNSs6 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 180EF8449A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180EF8449A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 180EF8449A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:19:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF473A4C3FBB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuW-000000003M6-0Jsk
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:58 +0100
Message-ID: <20260112080419.2516889-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205143;
 bh=+Q0XYGdWWX0v0nwUitYnn20jXUNv//KAK88jrriLVpw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=T45GFS0C0tLd+UVLQmXIHnxl40MAhjc9l0YjrK8oAJx/Oms8zy+aCigmF+uJDLBzu
 +laEDcF4Fa8nKez9T6/DTmivt3ST+wufRn+7pizWzVB6xbzfkk3yRcLpuWw9T9VFZR
 IpU9JcheTZjW/9Iibh/xVQKluxizeZOOr542JqsvJo4Uh0mhaDftuXKTnUcVpZffV4
 I380xTFh3lMwFKEaPmoYbZyvvJ4MUeHvX0UDAF7VuN8NvuFxeoH0g75gyiDI9CB40k
 HJNkYILiuteIdt8/EMZugymqXPV6hJMrtvSLZWp3R5P4xVc9gEm6sox4yyMU7gge75
 mSaxW+dlzEOuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=T45GFS0C
Subject: [Buildroot] [PATCH 023/104] package/x11r7/xapp_xcursorgen: bump
 version to 1.0.9
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

https://lists.x.org/archives/xorg-announce/2025-May/003605.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash | 6 +++---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
index 45bff55ed2..50d65d6c2a 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003264.html
-sha256  32b33ce27b4e285e64ff375731806bb7988cc626ff10915c65f1dc4da640cc9b  xcursorgen-1.0.8.tar.xz
-sha512  dede5b9e1e09f9253365bbb83fdab26c681641913f3586cef52d4802db9cecc7e252344911cd969a873c3a5c5ebbd4b862f786de263f92ea1bcb2df90236f9c4  xcursorgen-1.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003605.html
+sha256  0cc9e156ac84ca16ea902710af35e0faffa51d13797071e3b4b6cc7cbd493bbc  xcursorgen-1.0.9.tar.xz
+sha512  d40b96d6f60ee3815ef8ed6217028b39b127f200415661e39cf23af89662aafc6783f9e311f8021fe1a5ccfbc47610909796e569991e6680b8c2133401af476e  xcursorgen-1.0.9.tar.xz
 # Locally computed
 sha256  8c773336b654442ac8018715a52be1a8254895c57c898d5387016e9488cc2009  COPYING
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index 318cd562db..e262001837 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCURSORGEN_VERSION = 1.0.8
+XAPP_XCURSORGEN_VERSION = 1.0.9
 XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.xz
 XAPP_XCURSORGEN_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCURSORGEN_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
