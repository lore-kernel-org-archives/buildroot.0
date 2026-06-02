Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7687ECD6E60
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 12:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A05960BF9;
	Tue,  2 Jun 2026 12:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ovWrFMg6jPQ; Tue,  2 Jun 2026 12:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF91B60BF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780404016;
	bh=54PLkw4rniMH9njKPj2lVW993x4LMJQDY4NOabsmyVw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZVk26lTpaof6sK/DviKG0LbgHjacJ5ZyK99zam/UAQNdf4eYEs74dd1dLU5G1e7oA
	 DgayzOlvpT1RhyJtC+dyOPDUp2VgPt9d9CqKDV14OHA+EhfjqlwNfZSkIAxDDj01Uc
	 02dLK+uFeFHYB/hYBzJniWBA07HQAQkHYM/QlYnd9y0XYsOP/Mq2TYK4StMEdW1Osq
	 tf5nGIhGMsyd6L8iK6NKSrW6vRIBArwXWpqsLeVFJ0UhZaurcBlpWAPV6uDAezHsUi
	 cIUNjVPXjoxr589gnFnBOWpzRuFpQmcLR2hicKOfHo8wjDzXyX1dC3knk5v6B6kzXb
	 QeDnW2sqJ1Kxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF91B60BF7;
	Tue,  2 Jun 2026 12:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E714F4
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5001160BF7
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ke1XviV2b_6d for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 12:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3848F60BAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3848F60BAC
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3848F60BAC
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:12 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso60674635e9.0
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 05:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780404011; x=1781008811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9W3LgB53fh4P9sATuptMUkOt4hO/o/NRQ69rWczUbs=;
 b=q9VwYwiDSq9ceXwY6n/BZyoGAcxxbJHeQmMdgjdaBd2Dq3t+K6PozXOEkMeHVXGsqF
 SAgyqcZ4y8mVKGed0lHj5TIW0xSPpDQe0xUujQ5QTJ+RzqQYUkTyCV6Cj1FZTY9gKLDk
 HVUD+XXmd1dPJCR2nxAVprnukraVNs532XapCphO2iJ7RGQFw4qQoz7932o31PUHSQEs
 PNRvnBjx3prFR9xJ/wPFATn5+LYbeAdOYBt+x14YQIW46N1nRZSfxLCwpiUoxThS/nIL
 lzSJCLkRMs20GSGvuUTAMt4EkFr1UABd81I0/UK8e0tfN4hCV49JF/KWuDMLZcF56PLK
 8q2g==
X-Gm-Message-State: AOJu0YzdS9u4c0fNOapX4Pcb0b+2GDPbcJJKhIZEnNkCc37KIwUUKss4
 kaOo6dTbbqhFmLY4ft6juMrn3oaAoUNd+i9ExejpdN9E9kg+ulL6kdS/bYv0JrpNbXdE3k9jq4k
 A8AIC
X-Gm-Gg: Acq92OHrqC0Uu97TpevXnvBgyadXZJnm4KTBtuXa40FZyjEw+RdzrZNALzQg+CwtX3l
 qsjE2cVmU1+me0lhsX3JC6CxBiEYyPy0PMdeqa66mCJB8ika8Ad8hRZKobEjwidoBuomuaZcB7m
 Eo6SKPof8QpIuWHyeqyEAn342OI5W9cYDkw7lbA3QDZNKDUnjNRkVJ5cdCJtgoBEjTBQ0wd9Kgs
 M3/1b+825oMMZFcRppwdlyMvpUKdEHCF1/XhCbBROw0IQ/p46Vo9yy9ZOzTrxvIriHsuOzrXPkP
 4rBBFS5KDvykkzYzcqW9cLX+j6ckSQW6lzBYoba6VmKB3DlknL16qaEkeikV7SdU4LLlxnFM33g
 K6F8mNxqGV/N5VafcxfCFzJxaIfLnBmjZSxB+p3o1/N99CA9m9DQGxBXnM4Flr5AL14VAcEIwDV
 p0RZEq31MBapM8LORm/dQ/1gDQ10zEfwF813OkxnySYCmw7Q6Rcq/TaJq4gA==
X-Received: by 2002:a05:600c:1c06:b0:490:a298:3859 with SMTP id
 5b1f17b1804b1-490a29838b6mr317123575e9.24.1780404010605; 
 Tue, 02 Jun 2026 05:40:10 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e13f91sm84811025e9.3.2026.06.02.05.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 05:40:10 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Sam Lancia <sam@gpsm.co.uk>
Date: Tue,  2 Jun 2026 14:40:09 +0200
Message-ID: <20260602124009.287330-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780404011; x=1781008811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V9W3LgB53fh4P9sATuptMUkOt4hO/o/NRQ69rWczUbs=;
 b=G1wVXumd5N65Eg8W1xXyV59KLjaHcUEQIbtvXH0TjdTy/3wVjpqhMX5eOnt05igivW
 tQVeGP+mzoTzmqmTmGdvtFkk8qunOG++3ZDURNt8d2/EXO1n7mEAazx1PBKi6SGbCTW1
 SJTURbOb0McfIcZSvp01ON2Lk2CWb2g70fyuFBBP0lJWqHXmc1kd+yGS7JXxuKN8Xk4K
 /0VMM8POmwmST6lXspQuAExlpuCmiy6siW+aVkOPu4TjmjjniumpRhoiHezmXZ99gdz3
 P/V0ug2/tzFeMIQXdzDrLWjBSYBjqwb4NKwIUq6ww+tDgZyOr9XejVZW6ZEBG+ar6gcu
 QwDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=G1wVXumd
Subject: [Buildroot] [PATCH] package/lrzip: update CPE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE long_range_zip_project:long_range_zip hasn't been used since
2023. While ckolivas:lrzip got 3 CVEs that affect the current Buildroot
version [1][2][3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-9396
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-15570
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-15571

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
A follow-up series to fix those CVE will probably come.
---
 package/lrzip/lrzip.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 0375696414..03ad36c58b 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -9,8 +9,7 @@ LRZIP_SOURCE = lrzip-$(LRZIP_VERSION).tar.xz
 LRZIP_SITE = http://ck.kolivas.org/apps/lrzip
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
-LRZIP_CPE_ID_VENDOR = long_range_zip_project
-LRZIP_CPE_ID_PRODUCT = long_range_zip
+LRZIP_CPE_ID_VENDOR = ckolivas
 LRZIP_DEPENDENCIES = zlib lz4 lzo bzip2
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
