Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30121C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:45:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E86C6103C
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 22:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E86C6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FE3280D25;
	Mon, 25 Oct 2021 22:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b43OnaTl0v1N; Mon, 25 Oct 2021 22:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D738B80CFB;
	Mon, 25 Oct 2021 22:45:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B86321BF97C
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4675403EB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 22:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nAFKDeDB8wT0 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 22:44:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB1F740374
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 22:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=eJt8KdB8E7NzGn2baKV0bWmfoycA7nKvwTfGvgxND9w=; 
 b=LW5vmSA0ipHwqtcqkMMPscOmOdAocusYiC4fjvFoDRN7R/wFGQEv2va0dakSkjPQyeywxdFcHirAtQVdE+sdFQe0dh4cXrEtfWyBgtjx6gHiJAgWU+dV4sdlqvthfnnnJxM8EGEFpOcieqEc/9KrGLAfF1m6M6E/U0AxqIGVtVuwu8MucO17DKoCO3rvg2SU+zN5DPJ4XI3r51pNZybNtyKwYYNCrhzjaoxsSnUbDn1WnFE9vqzholqsFCPL/v64mR5Cx5UZaIuZb4z9FCT5Kb6VJurlqT3V6iBiLWVJuh3HVA9hLum42JvowDkh51QFi2BY9Dei+yUguGgRErb4FQ==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mf8hd-00031C-UJ; Tue, 26 Oct 2021 00:44:26 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id f408682e;
 Mon, 25 Oct 2021 22:44:04 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 01:44:03 +0300
Message-Id: <20211025224403.979315-5-aperez@igalia.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224403.979315-1-aperez@igalia.com>
References: <20211025224403.979315-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/wpewebkit: use lcms2 for if
 available
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make wpewebkit support color management if the lcms2 package
has been selected.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/wpewebkit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 606a1531c0..ab45d4a67c 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -67,6 +67,13 @@ else
 WPEWEBKIT_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=ON
+WPEWEBKIT_DEPENDENCIES += lcms2
+else
+WPEWEBKIT_CONF_OPTS += -DUSE_LCMS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_WOFF2),y)
 WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=ON
 WPEWEBKIT_DEPENDENCIES += woff2
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
