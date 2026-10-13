Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60574CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C1C80E22;
	Tue, 13 Oct 2026 16:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRnid0Dl2z15; Tue, 13 Oct 2026 16:43:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3296F80E20
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909811;
	b=ICLhTLcEvSEURJrzh3k620OkZHbjjABezMZEpE5VKNKcgwydhEuI8iBIWZKZSSLvtUhy
	 xiGlZ65Qf04xG8/q3qxbJLCFXHssBlUZpsUqp0/PPQx8HXU1+dNdlfbPPPTex7IUGbnkB
	 UrXuBKqKfJ2XXWhdY3aENyLotADDY7CpQEjKLc7yeivSu7uTJDi6eKdxdJkc/GmjdJQZX
	 iSVA9svTr0D+91ukXCm91Qz0HNPkISmvOK4jRJ5Dyb5YUvS5l5JwHlRML5NwbxgPYzd77
	 VyjpfK9oV99Udvh3UQ0MRnlI3W/IHDhXBZTuY/Vwwx34sMaM3nV8TsUJ30ilZa5MZ2Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909811;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DbJ7QSnOzCmGtXQVSYU2X1xKi9dmRuZ+ztxx+xirQJA=;
	b=tSFKwW+EiohawWcQDdWqu5HVsDVEAffsjuy8NeikS/s5yW2OJfle0wQzZSZGoUmJbEsc
	 1Mftd2O+gZ/ARQqMEO4eMJG+1r0SoUMdCiCrfPp+VPtmF7YZqfa+Ygk/Cm4qLe8Xwu29E
	 tQ59ro+9smM5CPbgRWvr4XSkFCytyJCxtrBVFMPDAMX9wlpbG/XdE4ILJ28tY/ui4I+Zw
	 +L6poj/4ybVFVgWsw1Bw15z65hJnYrWjEMXqtFhCv5wyUenSJeVLS8EbwPSuDgeZwE9/j
	 RO+05A9oVCPGBHqNq/eJSErmX+Oi6c18c3bjWMlpzULPGXfCjB6/hDJ//l+xHIpcXVw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909811;
	bh=DbJ7QSnOzCmGtXQVSYU2X1xKi9dmRuZ+ztxx+xirQJA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gZ3AN+toVTbmxIzkNrG4J6FMBKVvB2tcx60/uRWeA8WmnJTbxOiEFyiQIxzfcXRCA
	 /GqSN4m5whrNjbLiQ0Z12Sc5++10vr0qiLeVzZzmkcRYnY1KvHqZagKV80OJMcdDr8
	 5KaJGf5eTfoa+RemnChcMJO76SEd3UYWAfcjHXuXWP3BMV+XlaOragxz0tpCPEJ5+l
	 gB6hqrZ5qr3uW+eR7GrDOKx3ralKUTf8hRCMjqB/Hu6Wi8LWsjJR8IK69cnDhqHhjv
	 T3puy2sktMMrQRFWq9JQETI6o6KMwoGvY/yXWSy99zjFl6E5O6Hog1aeysXNJFLFld
	 CQkDQq/11+abg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3296F80E20;
	Tue, 13 Oct 2026 16:43:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F6EEDE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 614D260791
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0mz8tw1i4jf for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 70675607C1
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::2f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909805;
 b=dfMSpXLCFJiXnFJ5VqFmU9s6Xhy3AQ03QZoT/s+JWS5GPxq6FAhAyD/6Krpa9tkX6t+i
 IfqWsFLmTORjEQaeOVF7V3QrGAxit6uYqV8JutnFzkzlK8JYG72uTim70R/BJ5PEhaNYb
 qn36AsdFAq+Egh6Ly7Gjq+VftbOYPL34xJZaCHabcsk0cZ08pj13LjyJGJBvqNZ8ClJIw
 Y7QOCpxSmYkMwOmV0ScXVF7CFd/GUYGAHDZcReSKUq2RSzrFjvILH6RYUfNd3uco3ogjM
 +EBymU+G2dKnozd8RvuiWVftaAxo7YKtallrL6jBf0Nd6l916KXYtMjCfXoTcWUxA4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909805;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=EWJA06LyBhYK7zYMC5KfmP9Zgc4HE4QZuEO0M3FEdUc=;
 b=MmBUKBfOIDBm4Q5ht2ytkl94j8JWITD5FfNeXC34lHYaFH35y72ADLlqBe8fJU2lwKmw
 337kwOgm+yLWifwcJjMajXRTcOL19RlOBsVt6MtsIMeUn7FyqjnOcwII/A39kLRQlrRvD
 njI+gEAnpJ34TSKaUviMKRP25JcdQ4A2uII67/W1fHalYMHu8dMStCjB8TT7M5Anh/Kat
 SHLrXpugplqx78DD389qEQ7M4mNz7UCQ73FaeJduBAwpDKUK1PTaUF4sY7LPMKjFBk2xO
 6kGGwXJTKtKtDe/1ojwINHVCgTiePUEkMqNXUSFZN9+rODxeMgJCcxgyAXkHKk6SERQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MLgS1Xm4; 
 arc=none smtp.remote-ip="2001:4860:4864:20::2f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MLgS1Xm4
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70675607C1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:25 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-47b47de8b4cso1932158fac.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909804; x=1792514604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EWJA06LyBhYK7zYMC5KfmP9Zgc4HE4QZuEO0M3FEdUc=;
 b=MLgS1Xm4GOpxIQpbP52mMq5SbAfzrN/KbDvOXkMi31/H+0qfRYRZ8ua0/iL4s2F0l/
 /pNVlL5kQpnh3OozpCpnDBSXudFlFy8Mbnr2ppZiGb958+GEqerxEMMFEYe3BDoy+gdc
 KXVqxywvRASCjcjUVdM+eS09TQ+c4oZsjuPLRq/pgVPw/E3sYuL72MRwRZNAuuXUMsHL
 ShlCTdNk+/r60zvZU+P/5Q0vf+Nc0RG8Godtrr8b3BGSPU039gorUHSdB3LM2OXGrBul
 eRNZAxFGogymwBC9KqZYMyYhxsFpTrDnqjoWRgJJX/csHTx2uoJI76sEqcypLv7+AuKX
 uupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909804; x=1792514604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EWJA06LyBhYK7zYMC5KfmP9Zgc4HE4QZuEO0M3FEdUc=;
 b=uFVoUTubD16fFW+53PEoFJR6wpvygBA9wgn7ANSfB4FHpGSSAGJ4cNdjhzh7DH8R7A
 mUoh+LcL2RgPVQ9d5OB1H+i1hpxOvoQKEfW8atonO+hngKTuWVa82lFtRVUJFu77xvaB
 cfJ3B1Byk2MB545FNjii2ga/F3RuxOzKw/W/jMobqab+DAOqtyQjaNf2SFze896Um1/G
 x7ZTU9HWxMd6sFRbe5d6xTG4Y2E8r6V1HbF96u8eJT6TL+3jLUuW3ZDvkrixnOEO9988
 7pld0G+x36BIFeK6Eez8xspRgyUNiEXTDrH5p3Tve/gLIYRtnfqKbTsdvI2bSY1nFdud
 C/9w==
X-Gm-Message-State: AFq9FYK/XC+FOESwhQkfoZknW78wF+k7Qa8xhtuW9o3EP6qoUUq0AR1Y
 3n5MrJ9SaPRFHaDXrs6HnVYBhHpEfvygp+XQKbCHlU993PZJDWnCeJdkcNBypg==
X-Gm-Gg: AYBFou36geij5eC8G02W9hV3fyQ+4FxCuQeuqJgZ4Ixl8LVsnpKCx1oBH3iw/ly8Vq3
 Sp+10RvW/IuF/brVpTb/iPfJGaLXrS6/S5BF0v+1+ssE5GR6C9tiNUX1k2VtCQvVRCU7kEGyAZa
 7coWqshpLUXgoT7sj1kV6EfV8uTU/ApAZCyfOr8pegTB3Jk+hVfo7J2eUPYipFjR7QjqXrnvSl8
 CWspRGSvsz+++faKOtFOUMVzvdDi9S6ttIHwoXzlPaZdtr9OYa5p7SwIUpoTrKy9sqcU1bSKli6
 anTp2ZVOsqLRwMbpzRKYim3uQDTaxecZUPpeNRtLA9namXBcFPA9RUh31NMFvoHcEckgFNJLNnk
 r9wIgTQV6TB75Lt+YxnWEpOj5xDxoclyQveVuhSdbPosGiKB8Og3fDxERoIRdyVmKU1HH462B5O
 ymmsCwDdkI3AxGUkq3cyWS4D6EmRz/51gQX9ZC1dVGGHO6R3hYSeWQr9Obah4yuIxgLQZThQXk2
 86OM8T3BV7re09hs1K0PxSs7nXYVzcVqRZMt9alf59gBvNfFE+BgXrRYX5O/fZUfADsBOG1igLN
 rF1lfKuMwGRbFWQmBbmxOoLBDlDAhqQJOoD/+OWMH7jC922tTLtqdcab4WizHWiM3twYbgsRLX1
 sRNjzQ3BVxFzTmG3ITbyATigBKoTjxVEJMiUVfMjLXYc=
X-Received: by 2002:a05:6871:6908:b0:493:186e:b51 with SMTP id
 586e51a60fabf-4a2a87fefeemr11128163fac.20.1791909803975; 
 Tue, 13 Oct 2026 09:43:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:04 -0600
Message-ID: <20261013164254.1476592-18-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-opentelemetry-api: bump to
 version 1.45.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-opentelemetry-api/python-opentelemetry-api.hash    | 4 ++--
 package/python-opentelemetry-api/python-opentelemetry-api.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.hash b/package/python-opentelemetry-api/python-opentelemetry-api.hash
index 914a0f830d..934c47ffe0 100644
--- a/package/python-opentelemetry-api/python-opentelemetry-api.hash
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/opentelemetry-api/json
-md5  7ad5b73590259f0da66c9d9314f1af80  opentelemetry_api-1.45.0.tar.gz
-sha256  711ede81773c8025c2c03dac0450bc89f3d30aea6eabcc815c570d4e35a963f7  opentelemetry_api-1.45.0.tar.gz
+md5  54bb20b0cb8b4d0ef8a3389cebc4a81b  opentelemetry_api-1.45.1.tar.gz
+sha256  aa38ed19bcc084ba42782a73255b3582283eced7ad6dddbd6695189e69adfb75  opentelemetry_api-1.45.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-opentelemetry-api/python-opentelemetry-api.mk b/package/python-opentelemetry-api/python-opentelemetry-api.mk
index 84af11bfb8..46029d9f62 100644
--- a/package/python-opentelemetry-api/python-opentelemetry-api.mk
+++ b/package/python-opentelemetry-api/python-opentelemetry-api.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPENTELEMETRY_API_VERSION = 1.45.0
+PYTHON_OPENTELEMETRY_API_VERSION = 1.45.1
 PYTHON_OPENTELEMETRY_API_SOURCE = opentelemetry_api-$(PYTHON_OPENTELEMETRY_API_VERSION).tar.gz
-PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/1f/dc/e12c1fe1ed8a7b7149777127b1a0e12ce5bd5a81d97408bedc2128c260f5
+PYTHON_OPENTELEMETRY_API_SITE = https://files.pythonhosted.org/packages/2e/02/6e0ae9cc61bd3169d401077b507b3ebc344745171e1051ab430be012dcd9
 PYTHON_OPENTELEMETRY_API_SETUP_TYPE = hatch
 PYTHON_OPENTELEMETRY_API_LICENSE = Apache-2.0
 PYTHON_OPENTELEMETRY_API_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
