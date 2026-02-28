Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673C1FEE4EB
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 11:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A16A418AF;
	Sat, 28 Feb 2026 11:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xu4P1SGdwTje; Sat, 28 Feb 2026 11:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0188C418E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772276640;
	bh=o1jh+AyABvu2aSJphW0Sla/w1v6jsTGLgyRFgZ2Exwc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CPBOmiIVkk6LLUdRAg3+9vByOEqOlSq8Pk/lYHRV5gyon2rnWFqG0uB7GLqnNiZm7
	 YUmPyoM+J8U2ecmEZcvg7PNvK9dxlnngvPUkerlREskrZuk2DXHVhoqKrbaPwrmFJZ
	 dSAvTGRhL8NoDJ7yQroWLu+35Q/kK4iMO9AY+/P9V9bfwzIDwrdQjmXop/MgFynjnZ
	 /ShoHdCXJEyaG1ZJCbDAjLARCb6Qkv+NswAHiRVsPdUY6UsvBtcIzHsSydFjtBa/oH
	 nl1TWTu/NyZcaGlM+XxMSo65cXOIncygpfn6FQ/5l2NWLydPkLK3otCYI6t9wJE+E2
	 j6Xs4AZiZt4YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0188C418E0;
	Sat, 28 Feb 2026 11:04:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DA511D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 11:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F17B4011A
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 11:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdgBh2-RL25N for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 11:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA0E64002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA0E64002A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA0E64002A
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 11:03:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6CEE9A4C324A
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:03:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41062)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwI6z-000000003Y0-1aZy
 for buildroot@buildroot.org; Sat, 28 Feb 2026 11:03:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 12:03:52 +0100
Message-ID: <20260228110352.2521276-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772276633;
 bh=I2qSui75uEUQkGvIiIL+SCK1TUiQLK5fTN4b8MlmKfU=;
 h=From:To:Subject:Date:From;
 b=auQW1sJITiMuBQfg5zCfPR6l5GG5WJBA/gP3orvVKO6k3S+qJswbIKdDr5cCzw1vn
 A3vgglIWCpwtQxxnSllBzjr9UC5WtVldBha7ZHQNl/8GiGoo9gwrH7O0ApGllRIS0O
 cZobEh6LKv5FXCjx/j+xzfrXqduEFJyI5KKWmII93cBrx78pTxMOPfXeBSanOaNoqL
 MddC8JuetzmLaHOhhSXVU+yd9k8owH3jXA3ViLigEGOw9vTS3uf46dKlaJDarrMGe9
 gMXPykkVoCp0t4hS6Lih8qOSYPWLJWu8VrTef8fcVe/Ts002bwZV3VE2uqJtszwVJW
 enXLEgcVBKLtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=auQW1sJI
Subject: [Buildroot] [PATCH 1/1] package/nano: bump to version 8.7.1
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

Changelog:
https://www.nano-editor.org/dist/v8/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index c8bdb0913f..5d369a514f 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.7.tar.xz.asc
+# https://www.nano-editor.org/dist/v8/nano-8.7.1.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  afd287aa672c48b8e1a93fdb6c6588453d527510d966822b687f2835f0d986e9  nano-8.7.tar.xz
+sha256  76f0dcb248f2e2f1251d4ecd20fd30fb400a360a3a37c6c340e0a52c2d1cdedf  nano-8.7.1.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index ee82225a72..0e2b0af574 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).7
+NANO_VERSION = $(NANO_VERSION_MAJOR).7.1
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
