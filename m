Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDC3E8538D
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 18:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0141F61129;
	Fri,  3 Apr 2026 18:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUP1oSD16Tg9; Fri,  3 Apr 2026 18:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81C161120
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775240891;
	bh=wkhxOWy0g20iBsd6wQVDW332/DzLWsq/e3wiYFu8nsw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lDc3wxgrYwGfmkEGk3ObKg9pU9N54Q6ucVbuhUJkQBE3IC6efUhf9Lrn8EITV4END
	 PR4VzYOfHc/nI/uXhszPV9FEDn3ju1oQUoIGoeneuMM9EgqtmP3r2TtLEsSB1OaX8f
	 knXR8UslPVQ68zNh9VfuihQmeMlAnX6rgzPCBalDh2gNizAYBjGSYRhbvg5Pkt1s7I
	 ZWeQvVVlMmr+HoHdqn9G0F+Wo+heUsYLsz/PiUWefXkLvw5CqIxnpnQpm2y2ym762M
	 clbU8HkQmuKa6hN5hrEN1EXI1LKdtMnxkV+r6SgiNS/Jeq+JcpwcAQTXWJ92Xk0PKk
	 Aw8QQyVAp52og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E81C161120;
	Fri,  3 Apr 2026 18:28:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A29D1F3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70233402E2
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gj15oREjJuRh for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 18:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88D7640202
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88D7640202
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88D7640202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 18:28:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb24.dip0.t-ipconnect.de [79.214.203.36])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87B3BA4C115A;
 Fri,  3 Apr 2026 20:28:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44244)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8jFW-000000001LF-0s6q;
 Fri, 03 Apr 2026 18:28:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Fri,  3 Apr 2026 20:28:06 +0200
Message-ID: <20260403182806.4087549-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775240886;
 bh=CxqnlTT8PrrmZ/lwMOZ8WnCKbO/qGdTaLVNn3LtGfso=;
 h=From:To:Cc:Subject:Date:From;
 b=WqiOdjvdTxAotwKOmtnFYljrtt4P7DaN5MN4Buvlv73IJF4TYp4pwBpLFKivgH9Zn
 fdOsOcHJFAQ4ErGPR/KqyLGs4HueKx1LDYVg1+bibH9lfPzU00nOWZ+rYcTPS3iOdy
 jELsuAgIZPT+6hV7OiKVnKxDuarBecJ40XzQ0DraNVVQvEr5N7eVFLl8p87GfVyQY/
 34KeMF58xk7rox2wuX6zjp6/EOaVy5vrEle4kEMs84TVmxB99t3lAtycQgAHAiFQke
 Sbst9yYbxUfMxxNDZxIETcXTnTU9DA0qV40iPheyU8vgzjEplgAbTvPJun4UvIzDWZ
 tcSO/1rYlAmAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WqiOdjvd
Subject: [Buildroot] [PATCH 1/1] package/sway: needs pcre2 instead of pcre
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

Buildroot commit 0645cb39e0ce3af743190e587812a5bd4c1f4b24 bumped the
package from 1.7 to 1.81.

Upstream included commit
https://github.com/swaywm/sway/commit/f614f35e7354980bf4f0a66ca99be9b5f3a7ac90
in version 1.8 to switch from pcre to pcre2 but the buildroot package
was not updated accordingly.

Pcre2 was already selected by pango -> libglib2 -> pcre2 so this bug was
never noticed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sway/Config.in | 2 +-
 package/sway/sway.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 1e4c8bfd3e..c89c0607d3 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SWAY
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 	select BR2_PACKAGE_WLROOTS
 	select BR2_PACKAGE_JSON_C
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_PANGO
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index f27d147852..a497a2cbe7 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -8,7 +8,7 @@ SWAY_VERSION = 1.11
 SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
-SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
+SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre2 cairo pango
 SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
