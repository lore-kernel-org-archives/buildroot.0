Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AFFE94109
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 08:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8549F81339;
	Tue, 30 Dec 2025 08:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HSQqqn0ArMdm; Tue, 30 Dec 2025 08:19:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A5D381335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767082773;
	bh=ppCsXpA66VKYVci18MatcD0+24c96SrJsNXG5Jk+nR4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=p5hGS7os2EjC/3TZVEu3x9SDjW9j0SXn2KNwsgb3JqjzUo2ctSqJhEP9l2GfibB3P
	 R82CvpO0EqCP1pmoM494DvDP81Rh4NhgltNOweemlazsdvM1rqBnm33WvOCj5rjrrQ
	 11MuvA3hQxeOQtBvw/kmv/yfwZDCN4WR1u5OG/XdPApfRwVV81A5lD+OspsWjhAgux
	 Jf+Dz6LHdHTw7c4t7z4lbIGT3XfiQYOwy+8tqNy+gMMJLfwI6vwhHvjuy6/tQOteB/
	 B9C8BCWfsHMUP0ZSudYCK900HAgQvzyqBhEYj+1ixPGHOX/3RhTFAI2nTO2fSLWPLB
	 NHD7RlM/L7WyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5D381335;
	Tue, 30 Dec 2025 08:19:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 822A0177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 710D160868
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mdhpKQ9zn3v for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 08:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42B0B60791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B0B60791
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42B0B60791
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 08:19:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so59403085e9.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 00:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767082765; x=1767687565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=d/bFg3driysLUQVhr+XwGzX+qJLSPYXGCbmSlRuAuq0=;
 b=mk6du+JeXjlwh61F5QJt08GMvmLWdKALiLkgRatnNJtsv3jO4u1GnBro+PDC5T1DhI
 7UdZAASRpNjj0R79P8+ELe3RqC4BVZPZRApzqomu5vLNZEAnhAgURjwbxR2FU4ofqfuE
 UuqR6V44MNQMJD76tq/OP/JG7Rgoq7gru1juOdyB0CNP1qUEgYX9mzBVTw97me6Ck1mg
 2jW81J0VkROl3k/mQyYS03YT1uYroJzOBVPhsmD5taTeWzJwKJfQREP6Ej/GnjS3iGZ0
 qLs6nzW54xbOSdvo6bp7KSd2HmgQ/kyMu3OuRQqnd6xNK+17yIijavEkOKSghuzHwhi5
 fo3w==
X-Gm-Message-State: AOJu0YyImMC1XGLmv5k7I2CRBPe3n0pgDq5pUCChI/AGhI3VYAKSAjz9
 8n/NTOMLq9oYLtOfscbuCdk2CQb7A56W7WBbx1ofQtzUqqg98P3tiwf4skX0t43i49Q3CPO+8WX
 rmjYvyDI=
X-Gm-Gg: AY/fxX5fEIjzOUNBOW+z8V3tL1ONwTMznkBkBLe8iY75PwiYe4FwDQO6lAkkEIq0UXQ
 bS4decm74gEScxFKQ+blGT5PKt1ACs7fO6AQN4ZHmrNLcJln3hz2DTZlifFsP62uus8ONBLjE6s
 0dEb633bHowJXdKHWuXA8Yp7MBs1q5Dpzp879ADNojIPL51rv6IpYtjoFqzG4aloLgn49CnunOn
 oqVciX2zeeuxMxgFKpKn3vzyvaW768/lnJnT17HxRv8fImI5n+AFQxHpTbz2jACcAmPafldKlA3
 6lq6DOaW2/fgHbZkkW4p2lo/HBW6gGo2weQjj+da6+SnQ6HBxDbwZ1SV8dB9O9uXE7Y2CRGx0aO
 yxLMkPYqPD0oNSb6yUAoZibcXzKPF5C2g5CfPfJG2ZvGFH0F3S7IC07uY9D+MOGSYfhwYnR5AXT
 ViN8E=
X-Google-Smtp-Source: AGHT+IGbXDamtdLM7tSNDVeEGIAULoQHdPoat1mLZJIlRGjyNIwMSyUhFkLG0WU8rdIKVmhAt3mngA==
X-Received: by 2002:a05:600c:1d1d:b0:477:a21c:2066 with SMTP id
 5b1f17b1804b1-47d19532f48mr337997785e9.5.1767082765078; 
 Tue, 30 Dec 2025 00:19:25 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2ebfsm66328773f8f.40.2025.12.30.00.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 00:19:24 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 09:19:07 +0100
Message-ID: <20251230081917.18676-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-1-thomas.perale@mind.be>
References: <20251230081917.18676-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767082765; x=1767687565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/bFg3driysLUQVhr+XwGzX+qJLSPYXGCbmSlRuAuq0=;
 b=CKr9ESkLa/Q4MUMRrKBql00NVKnmMfU3lxyoQdvY4b3WTFQ2Vp3TuK+17cKJPEiAyH
 Upa8nD9Q0KwdprwWKwzksljKet8rAtvuxts9QNMpwQlNnJ4YeMgeSbTA4EyKVXhS+ZQ9
 7+iFYXnF8K0bZldSS9fw/G2MhQVnW53h19118MCeAsy1GFZL76U7Z9ojffFU2c5RBHKI
 xwX8mCn9lPDenPypYtqXsqeedMl9C6ILBkXvo6prk3oC5Rc9s2UBDxvNoDRe5ti2vjib
 zPoHhAIehwDp1rcCFphtcOuidV9U0QbEHNpTp1X/Xlbd327synn0bAnU10KfOfxL1VaC
 siSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CKr9ESkL
Subject: [Buildroot] [PATCH v2 05/15] package/rsyslog: remove stale
 IGNORE_CVES
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
