Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168ADC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 22:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FD31401B1;
	Mon, 27 Dec 2021 22:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o0iqgOpvWrqN; Mon, 27 Dec 2021 22:05:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB9664016D;
	Mon, 27 Dec 2021 22:05:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A18D1BF2B7
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 22:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 473A3813E8
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 22:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCak65LHeGYh for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 22:05:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B63E813E7
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 22:05:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j18so34667486wrd.2
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2Gk52HS6ePDZa6g1CBcqyKqE1rrVyabslQwk3Dr/ZY=;
 b=VPGCyJUmUZpkYIwqZPWaFGoCWYKQeI0ZBzqpoXvV0urDAMVOuI96VKf5FXaIYu7bCv
 1Xg7VCbo0N8qYEwqtLCh2PlKFDg8A67gyD27++5o4MdR0TRFhBN2DyJuft8C0i9gOIjL
 4QudM2ekbazDr/ych3EqgkNoKeACcMobZDXmJIt3U48I7IiHp+MFfzTHPQc0ysWRH0tv
 RTc46mFMUS+hm98nQwAU4ZzP5UXgwI4S1CwBoC8ItCvCsExkAYJho+t6ZPkBQ1NSPEoQ
 bPOZsT09+eI92JlDflPx9kvbjSqFbA0NxyydV/DjeV5JIWIr4B9OiyZL6anfRdupbp6o
 Scsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2Gk52HS6ePDZa6g1CBcqyKqE1rrVyabslQwk3Dr/ZY=;
 b=SBvxN4OC5RskSJiYes/m1A+FZo682IJWF8Ed2J1OkNp7WTiuBhq6oWed0KXo5ar1NI
 mzWw2iqVnSTaZn6IuGdFgVcq8o+tp10Bb7RzwcKW+J0aoPSEakvKO+hDZdpMHwPl3r7i
 JjVNxVeOxvlfWUYRV/LVMipss8pm/Nce7lotEdEeWqSk4G0vSKVbWUIOLYV1dLQTQvjA
 +zdC+FZeOi0r1paEU8DLlHt01d2GPcstq3NJowqwNRELeWYYQ8pxQc/ghK9nDXxSPDOH
 opFBZsK79A/pxyRVHGFN/MZz22Emcv6P+bYUX4iJ3WLhcDeopfDAtePosFaDCAPRSBAr
 vmpw==
X-Gm-Message-State: AOAM532MN9J1xqTLptb1BlOynV339RrooOm5Cfk+ds/t/jMiw52Da6Ny
 AggCowg0BOI6gGKgifvzHZ4MwyTw9vLiOg==
X-Google-Smtp-Source: ABdhPJysfs2eM+9N/t5AaR2LIWVsUjTjsVvg4PHL+1O3i9zBUUETTCVtmctNCUx4/9eTKH1rofv4AQ==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr13984562wry.246.1640642709598; 
 Mon, 27 Dec 2021 14:05:09 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id u3sm21070199wrs.0.2021.12.27.14.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 14:05:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 23:04:23 +0100
Message-Id: <20211227220423.3121507-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211227220423.3121507-1-fontaine.fabrice@gmail.com>
References: <20211227220423.3121507-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/snort3: bump to version 3.1.18.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/snort3/snort3/blob/3.1.18.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index c31e258ef2..0ba4505a83 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  4f7852898eaac48a7cfaff61c79a3c3a5a86a54db9d2a7d5b758297bf52f1f12  snort3-3.1.6.0.tar.gz
+sha256  6e45c16b1815d832b5d6edcd2b705e7838e25c76bfd54b3e86c55ecba6de420a  snort3-3.1.18.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 7495ab9b0f..6f15ce3c92 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.1.6.0
+SNORT3_VERSION = 3.1.18.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
