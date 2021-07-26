Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6727C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:06:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C5D960249
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C5D960249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32E5C402A0;
	Mon, 26 Jul 2021 09:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8L51e4bWg3hD; Mon, 26 Jul 2021 09:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C447401C0;
	Mon, 26 Jul 2021 09:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2B131BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BED026062E
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3HnY5ttIEJW for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:06:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD013605BA
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:06:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h14so2212416wrx.10
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P5yIECv0G55nhBK2sHfWAv1fNxMP+OCUIj4L8W7MoK8=;
 b=aqwYnW1dUU19y+pKim5ZK2K6D1Me2erpfZl/v1IwcK1Y66p9U5TrV47ByPtIzFJtl1
 aEftR+H/gPEQOIQQ2CdOfuoxY8ELtecBBDn9fLCoHR527l7G53JE1lbpgKviPIGOw6KV
 0ZQ7jyKHCw2V8RuX0DQYTlFS5T0H9BkqRr2LqOVzZbbPgzvffTky1ItD0+DDN6z71Avi
 k7QG4cH6C6dG3ZcDq7wE6C6hKP7SIHlT9JoPInF71Dr1GW0f8c9orUu2RSMuAH9sn3lK
 e44G2t8ZJb/d1+PYt5pWyJyFmQIn7PYUdc6rtgovkqOXHzWvN/UZ+I54TmCqf/FcPibt
 28Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P5yIECv0G55nhBK2sHfWAv1fNxMP+OCUIj4L8W7MoK8=;
 b=Rc+UvAxbQHbnay1ru96zzKoke4c/UQh5faqiBiFyHRgv3uTB/RhTITzcp52V0h4XxX
 fpZZmx2JAN45PW5sELyMBop5BXMtFhAEs7WmhElCFGcKq1WwXtQ8fnWQAPpV6bzvUp92
 EBD3lQkHQoNTYzpSENJG0dp8vdIPjZ2SX5AIdvp2hGESuXM50daVR8FOTkvhZul6/vz0
 Kxz18MPBXjiFvG0aKhw6zSerNICOueo8kXqviBR4eUlX/X8R/rzwbEPZFPuChlNbPyQM
 9r7lgV6owDoGaH7echr0Pu9VNAbBhbobNrztpiiWixZpSiVMpiAATM28lrnaH6lm7vBF
 vg5A==
X-Gm-Message-State: AOAM5315MpYjYnuLzUbiKckupJa9camXJTR1FX0OFD/CseGtpIVuvH6U
 YHcj10hC3ugiEsloen4K2Vd4pKy8XzaWgA==
X-Google-Smtp-Source: ABdhPJyN/osGbVagpsmo5AzsYlVbZFCWgCg/2kmqwShKLbwO4Vww1nSy1vzvZxUbBGjNcyMc0FyhrQ==
X-Received: by 2002:a05:6000:1b0c:: with SMTP id
 f12mr18068227wrz.225.1627290406788; 
 Mon, 26 Jul 2021 02:06:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id c16sm9423611wru.82.2021.07.26.02.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:06:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:06:40 +0200
Message-Id: <20210726090641.1711732-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for modem-manager is added by the services/modemmanager module
in the SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/modem-manager/modem-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 7cd5be7ef1..368b8464a5 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -9,6 +9,7 @@ MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
+MODEM_MANAGER_SELINUX_MODULES = modemmanager
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
