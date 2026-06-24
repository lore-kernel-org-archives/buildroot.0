Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BF1CDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6944760D84;
	Wed, 24 Jun 2026 14:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hjqb24knU-CP; Wed, 24 Jun 2026 14:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BC0460D59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310032;
	bh=prSfc8FtDTbVEzQy0d3sLjhxErVTD0Nw1XtK6tPW4Kg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YhxJC9wcaJAy4UmyA+CxPeqspjO6kQMUw0abW73aU8RJPKxmAZrZloW4/eP7+qn7T
	 nURaJ0nOYMrAXx8q6/xPyvBvnuyin6WjhMOftWSBmNZ6qTnrvGe9UXgvsVyf5B4ViN
	 P0XLWJ1X/4kdGfg3k2yNHvqo6QLZ1zKdSWhQtlw56b+IkmiUWv/2TXRDtSKmd1MepS
	 cyHbLkDuburgrEW9ORjVc5LliMRQOJ2MrKTe5vO59sfGApvmx02Y8LDIcNmcsSJaQW
	 L2ijXl5BGBKCnertn5TaxjCVKIKFmMoT0e1Km5rI1wO4ge5GuV8xnQtGvUtRHhdrlC
	 hiFX5HmqkvYAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC0460D59;
	Wed, 24 Jun 2026 14:07:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80CFE793
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ACEA401CC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4FO_gE6F-Sk for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B48E40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B48E40120
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B48E40120
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4633193af19so872145f8f.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310015; x=1782914815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VWFmZnxToD3cUrCr6+Vs02ykIDlvm0KHi2S+Cr4e1p0=;
 b=OeSvD7kgXRGpyPM8wsIUBgHE/b1kLJTya/8rNS+1pqPUT3sn/boDULsFbdm3I2WV0I
 LHI1pfalg+lDz59xnlmAU3xoB8U1EGmFp7oA7wWmvO4oM7gVzI/hGslJOi7dSyr6hXhF
 5YsKmlGq5NezKN+mLEQPuJC+mk6EeuJTHlFthdEUGK1yCHAZsjCGbLGjimVPXzR69i4K
 feTA5S/0mwwLVt/juRL00Hiog2ioMQhTQBstdZgDIGxnRcy1tmavRm/m0CXYVjH+0oLA
 pKxqdQ9Rt6kNfJi2+sqOBpXg7pCGCnRoa91w/zfR4EBeix2D1OyI3FC3HcKFIB3bYA0t
 g3IQ==
X-Gm-Message-State: AOJu0YyYd5+mFybw0BWs6C+kAdLol+FHjfFMizZvuK1KjwpY7Zjc0UdN
 sOhOH+J5M12mEtRfsTKzRP5pTdxYtdCip1nP1XOgVRQuj+zjfYtyLO495P9jWHqNGhQERojQxXk
 hDM/W
X-Gm-Gg: AfdE7ckvZIeehE8CinfBVK+FUAIdY2HSzos0L2ylduioi5+VU3DE8/nzEE+foF1Z9/i
 3QWhY5CLQUARyMPVjaaNJktugalTF8O6sy6h0zHIIdURqiHuEAN4kkZNcFKmL99+L2Jeu4pTWGc
 dWCcLmIt9VLf8JhOGEZ/FFsd2XAeXzVcflSTItqVjxyZ4IFL3C13CzBy1G3F5ynQhrZpbQ6R6hZ
 3xU0NGcoLqf4NTTd5Xwd8Rb9J266zuV0atIkMmd+1/P2o/hdKTTb5tDGOtOTiq1vSTUpy4wC5fr
 xbVvQ/RkPfOGBWJkenkyKQMPpSqj+emy+td8vglCqxA+CM4Otmlxx9+KgaNBu7+WdyTwUir/h+5
 VLhjjkM1tiRWtGR0i7gt8Rn3dgoYnTg5+qZGL/HhC1s2XwU4dGCnJ3GO0BNj9c2DupcQcYMPPaT
 JAN65v
X-Received: by 2002:a05:600c:4703:b0:490:ea8a:32d0 with SMTP id
 5b1f17b1804b1-492490a770fmr256792285e9.20.1782310014954; 
 Wed, 24 Jun 2026 07:06:54 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:43 +0200
Message-ID: <20260624140645.185318-13-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310015; x=1782914815; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWFmZnxToD3cUrCr6+Vs02ykIDlvm0KHi2S+Cr4e1p0=;
 b=gPPVhDvA+KVFcNl5+58vYlvcE/1Id4Olq6xmCYAiyajR06DT20ddi/vrWo4meSfCvM
 kxy4V6WT8qJZkXNdH8ALQ00zEbZXcHqBdXyT+ouSjoTe6BwjJLxzWMuoiiCipHs0+1YM
 QDKbMXYo9OoScJqooeTfrVxKfcGtHcJpEBVSIcF6/4SrLhaySQLsOZJwqXATJGSVB4pU
 Wc3I3bzHUQSCj038ol+vviBEQoUow9PSptbsNSi14SpBOwRkwqltDMn+1teHTF0+D8Bj
 Mb3NRwAz58WD8N2OBs7FqbYmxOcb6tV7rn0Awx1ypKhPu64p48enZSRH/Q0A418BBqYA
 qXdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gPPVhDvA
Subject: [Buildroot] [RFC PATCH 12/14] package/freeradius-server: add
 vulnerabilities details
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those vulnerabilities has already been addressed upstream but the NVD
entries are wrong.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freeradius-server/freeradius-server.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 80ace1c130..0ebaec8e73 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -15,12 +15,13 @@ FREERADIUS_SERVER_CPE_ID_PRODUCT = freeradius
 FREERADIUS_SERVER_DEPENDENCIES = libtalloc
 FREERADIUS_SERVER_AUTORECONF = YES
 
-# Mitigated upstream since version 0.5.0, NVD database entry not
-# up-to-date
 FREERADIUS_SERVER_IGNORE_CVES += CVE-2002-0318
+FREERADIUS_CVE-2002-0318_STATUS = fixed
+FREERADIUS_CVE-2002-0318_DETAIL = Mitigated upstream since version 0.5.0, NVD database entry not up-to-date
 
-# Fixed in 2.2.0, NVD database entry not up-to-date
 FREERADIUS_SERVER_IGNORE_CVES += CVE-2011-4966
+FREERADIUS_CVE-2011-4966_STATUS = fixed
+FREERADIUS_CVE-2011-4966_DETAIL = Fixed in 2.2.0, NVD database entry not up-to-date
 
 # We're patching src/modules/rlm_krb5/configure.ac
 define FREERADIUS_SERVER_RUN_KRB5_AUTORECONF
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
