Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5723D5B86F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D51F40AEA;
	Mon, 15 Dec 2025 21:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PodyfpdvhK4d; Mon, 15 Dec 2025 21:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19D1C40AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834173;
	bh=BlNJNXVspS4Qsokhtss1QpgWFyBRhtMXNc4W6rV9ypI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V+81lvH3+jjJNDy41PiXF2es5Rs4D715bzoyfvrHjidhbi+cdnT0jHb6+Ybn5GBwO
	 zh9DZvKlkHxXfX9eah2Cz2CqxXHGXtBT82J/ax5Pa6WKCxoyGn4x0+ntsbZp5haB71
	 atK3fBm+wrR7p7F9OcrVGAqcWMIFyo7nQrhrwgnaEJ36VPBvTt0gynTPSwCNm6eNbk
	 IvCBhsE0UxTABBhW7vn3iSnrO3WjGbjAIQYhq0LTcGhnqFor3MyK7MqNkPkttd6PG0
	 vkMdVWUKk3xNsw6TEYRNwPu7k4eiawa1o0yKAdaV/JCKerUV7u7Wg8jOx7sKuaOZ6v
	 RNofdlc+Ot1nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D1C40AD5;
	Mon, 15 Dec 2025 21:29:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3B02117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E50C3408B7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEd66kgG_ubB for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:29:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3ACFA400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ACFA400F1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ACFA400F1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:29:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F02ADA4C37A6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:29:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59482)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVG8C-000000003eJ-0doO
 for buildroot@buildroot.org; Mon, 15 Dec 2025 21:29:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:29:24 +0100
Message-ID: <20251215212924.2618218-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765834165;
 bh=ZaHro+STWr3Hx9tCDNe/D2SOSEVRHE5wmtzFIddl73k=;
 h=From:To:Subject:Date:From;
 b=kKnM1zAu25Yb7L13NxR1jFYo5QsOiC4+A2bvo8V+g1ySglmKDIkP/XgehLl67m5QA
 N81wsFzAtDmXPqKb+Df8KODAXsTjAH6agFSwE98bsR0lQDdhvbNrZ5es19m6A50BMC
 KEStfzfrcBCWvd7bQLCkf8yCMBHVwcgvEIr+KiTozONZ3vlbXguvOMRc1g5Qob7TRw
 2PuPOrPEfDVu37Yts1g9EuSH/wRBbcBCh5hy9JMSBJEVVnwdgLYGyOymzKs/YJIA+r
 VC2ZXUKGdexGZPAYsAXvxMn8zsnZVgubQtTs07hc9jTBGpIrSoPjH4A2V3SX76Ckat
 3zYYL3in2jeBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kKnM1zAu
Subject: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.30.1
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

https://lore.freedesktop.org/wayland-devel/20251125050917.GA854973@quokka/T/#u
https://lore.freedesktop.org/wayland-devel/20251208024732.GA3642318@quokka/T/#u

Added optional dependency to lua-5.4:
https://gitlab.freedesktop.org/libinput/libinput/-/commit/9461d1a9a17337c6ee5a4baee836fb9b9e12906c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index cd60e70c40..230b29b12b 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  7160c16c409c9ea4f7da9d91923ae0a92df7f3453a292bf684bed071acd7b4ff  libinput-1.29.0.tar.bz2
+sha256  c5169568f337c4a3bda927c42afef3a9d4c891e48a405cba39d57cb4631b9fb0  libinput-1.30.1.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 93d8a51aca..ee7c2146ab 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.29.0
+LIBINPUT_VERSION = 1.30.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
@@ -31,6 +31,13 @@ else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
 endif
 
+ifeq ($(BR2_PACKAGE_LUA_5_4),y)
+LIBINPUT_CONF_OPTS += -Dlua-plugins=enabled
+LIBINPUT_DEPENDENCIES += lua
+else
+LIBINPUT_CONF_OPTS += -Dlua-plugins=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MTDEV),y)
 LIBINPUT_CONF_OPTS += -Dmtdev=true
 LIBINPUT_DEPENDENCIES += mtdev
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
