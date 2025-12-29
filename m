Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC62FE92FE0
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 789A280BC9;
	Mon, 29 Dec 2025 21:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8W57UriXbtRK; Mon, 29 Dec 2025 21:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9914180BF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043325;
	bh=ppCsXpA66VKYVci18MatcD0+24c96SrJsNXG5Jk+nR4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nwEzRtsHlQzml84zpr6HcDnc90sL2jXJNDpg7C4lbN4yuDMgn7AMV9FZMPwWPl9mb
	 OsqzHQfRp59R7RHPu+QizknJ08cKeHnh9Z1V+T0PUl06N+WH7Tx7wd+M3bAq65eMiq
	 /h2CKHpRTp7J/LfZ3BZ8urPc8GJRbFpiL/gXJjyTRYtUCKiKIB8KRFNSWBHkRU0HFW
	 hqVYE9Zofx4dMMzq/MDN49OWlWzGFXMKNCGMr7gq8oMbtRJuAdzmgBcBILGtIA1OIP
	 7k3s/g4Ur/cTX4pAl/pGlKSbzQ1cWODpsQNz7ItIDmayA9c238tNXsSIo61hFY6eIK
	 T0lnIOLby5VvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9914180BF7;
	Mon, 29 Dec 2025 21:22:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3D2B35B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F3B180BCE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtNStABiui63 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6DA1480BC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA1480BC5
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DA1480BC5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:01 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so57093655e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043319; x=1767648119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d/bFg3driysLUQVhr+XwGzX+qJLSPYXGCbmSlRuAuq0=;
 b=hYXlMCpUncVop00xGUTC+/Pe/Ic6VCfzvn4jptRVPY/qAz69f75Xr26LqwsDJbSY0Z
 FXkzfB0Oe/XU1TNUbmmU3CJc0sqHNJ0PpgOcJwtCNSe2OVXLF5QJYNLfPBKXVZGNW8bo
 v45qCu6Pid9TLpi0oGd3f7IDzIm3yiz8ZeGUnOx3ma3sx4mQgAg6QpSNNE/NfAbSa9cX
 WLXDNweJC/l1/zbGS6aC8TzgnA5cIHzrS25vMKfiMMVyib7TzWNClHd1Q6UalOnCnE1t
 W1Y/7qAs1pL9gmXZPasN4viBtyXpc2UHRlUC8hCMKXctvlCpBxYI1bM5CZm8YmUH0Vv4
 wlug==
X-Gm-Message-State: AOJu0YwDyE4bJEI45RZxoFEF/BssL1fgYdTJa4i+pLSmm+Ghl1ZEbSck
 rmMXCW4g1SzDxEiWDIondQju8ea9i2C2Oxev0Vfegy7bVXSXrJL72YK7t76UDdiH4lRRQSaRMB1
 Y5kWww4s=
X-Gm-Gg: AY/fxX4wt+ZKnllP8pRsDFblXBGKkgEHIhvpfmcPaTAzi3FLVrfHRE6HbHp4Sw/yVqn
 H7xnLS32x3PbuEs1fsewErJL8YXRVu8r3Ch/+deTexFOSzNwMzI6UG6qhjJ5aeStwraW936LMVW
 vW53Co73F2Us+lZdyczmuaJO7scyBMrhNgrYgnr+yJeDVF81MGMP1MUUqy723vaMjbQVLEOOgSi
 C1R/LpodjYiEl4DR0+Tj76C86x7Ge+kTZHyhA04PD16tOvkneml6cuyCIdr7RCMRXcQvKjCdISB
 0UjzrL6QFxf2AkjdUjKn7s242Net+s9IYcOUzf9b42t73n4A9z0NCXC29pfAFMgOz2HZp//0hK7
 6HvVX5nDjF7BBn3Xbj9rMBdr5DqrGAFOMMhnPpb9wIJs3CEh99jB9t2hnxHPb7jRn59IwPIKE0c
 GdqLqo70dnurbM5w==
X-Google-Smtp-Source: AGHT+IF4xD3mrQYg0D1UajDmxYtu2fuuauVGzGWTPHXaahT7HXY7nxQygd/tMVeUI9ozEzRVlwuEBg==
X-Received: by 2002:a05:600c:8209:b0:475:de12:d3b5 with SMTP id
 5b1f17b1804b1-47d2150caafmr336320295e9.34.1767043319244; 
 Mon, 29 Dec 2025 13:21:59 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:21:58 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:38 +0100
Message-ID: <20251229212149.167902-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043319; x=1767648119; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/bFg3driysLUQVhr+XwGzX+qJLSPYXGCbmSlRuAuq0=;
 b=bfqgEYOs04QVPVUJqzvWwnuqooGNwUxWXc2pRA1UMtBRfr3HTxEak64veOOWczJZs9
 SdiSB23NOkDcpuDVYX5ITX825NGBQS9Y/eWc4ZncO/k5svGTGA8o1tiuqlF9KxkQ4UBm
 Dl2BNMCiyf9suCEUwmP0oJ7e4pU40riG/R3v76CX8TTYqnaLQpfD3+tXa6J+v5+qs0ST
 7tsImtz58iDQ1EqJ7NIgjCfVV8wIsxtzcirtNwxix5wbA5wi9qT78r/sAqwccOuR/KRa
 XRM8mUQdYnDXtspnkdkLA09oHN/IaTyLWeqN5E1g6ODfdoWMGxOOLUGMmvJDYv8+/x49
 ZOeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bfqgEYOs
Subject: [Buildroot] [PATCH 05/15] package/rsyslog: remove stale IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2015-3243 is then no longer matched to the rsyslog package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rsyslog/rsyslog.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 69128afbac..dedecdc572 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -9,10 +9,6 @@ RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_CPE_ID_VENDOR = rsyslog
-# rsyslog uses weak permissions for generating log files.
-# Ignoring this CVE as Buildroot normally doesn't have local users and a build
-# could customize the rsyslog.conf to be more restrictive ($FileCreateMode 0640)
-RSYSLOG_IGNORE_CVES += CVE-2015-3243
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
