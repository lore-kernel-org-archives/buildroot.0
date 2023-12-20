Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AAAC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50C5940A74;
	Wed, 20 Dec 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50C5940A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 67BVdEbMZkL2; Wed, 20 Dec 2023 20:01:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0645341740;
	Wed, 20 Dec 2023 20:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0645341740
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A74271BF39C
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7284D82771
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7284D82771
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ny4cMoupukPw for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:01:21 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11421826F5
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11421826F5
Received: by mail.gandi.net (Postfix) with ESMTPA id 2B24D60006;
 Wed, 20 Dec 2023 20:01:19 +0000 (UTC)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, peter.verbrugge@technolution.nl
Date: Wed, 20 Dec 2023 21:01:09 +0100
Message-ID: <20231220200110.1819507-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
References: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703102479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qpfwym+LxDein8+efYrlxzLDfXhu0Vw+mTzwPR+FFJY=;
 b=Z/isTImksUAs4cbQs+amjWs5p5U1MQST4zDIjLZ0jzzP7H5QLpWqrP0yh/seRWXsERlJ1M
 a2pWf5rhjtO+BMZQVRlUw6qz+04iQKXTDjchn1lx0ELl2mYH+AilTyAxdOYjx8pamv+WyR
 l/SyBrryrSNT5VOIGLM25czDSYWc3jU3uddaS2ckPVv3PzDssq1sfKhc33LZLXvD6bWHSv
 Xde/9k6EmDuqoyrdO9H4hB9Kld12/tWLNLhsn0G7qQfoNHqbG1zS8Z+n2gGEBhE7iSftOh
 zOf8/tzau8qkccA7YW7DsQV2WjseiGDCdU0mZruK/lD+HaW3q0kVdP7ab5cwWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z/isTImk
Subject: [Buildroot] [PATCH 3/3] package/glibc: ignore CVE-2023-0687,
 disputed
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to the glibc maintainers, CVE-2023-0687 is not a security
issue, and they have sent a rejection request to MITRE, so let's
ignore it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
I have chosen to submit this one separately from the previous patch,
as it's a much newer one, so the Buildroot community may have a
different view on how we should handle this particular CVE.
---
 package/glibc/glibc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 29411c58e2..a485d40f8d 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -50,6 +50,11 @@ GLIBC_IGNORE_CVES += \
 	CVE-2019-1010024 \
 	CVE-2019-1010025
 
+# This CVE is disputed, and the glibc maintainers don't consider it to
+# be a security issue, see
+# https://sourceware.org/bugzilla/show_bug.cgi?id=29444
+GLIBC_IGNORE_CVES += CVE-2023-0687
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
