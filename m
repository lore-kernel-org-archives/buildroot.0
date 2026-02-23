Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76583EC111E
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 18:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C14AB61263;
	Mon, 23 Feb 2026 18:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qti-trY5MK-y; Mon, 23 Feb 2026 18:41:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 842A661256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771872108;
	bh=MLyyiDWnG95RrHOWiw/q3fo9sxKjf6+IVYheywvTZGw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a/RjFW8YMHBEl7rWxJVKfzlCX8ieb/ERwMIpsxsgZoTmdy3VITb3FSPC3E/iZKncY
	 VvmgZzFYrLtewlKnxqjY9rC/kfIQWPGNkFtXbl+vU+YPe5UzN4f13zUXyUJ8Qfue7d
	 CbD15FEziXN3n0ztVJutl5Dt0vJoegJitobHIenzDjM8SbfocbP7fTQo5iR8tNBGMo
	 YltbjVyeKHRTcxogNcgOsSchXAP4cykEGk6M9/8o8D/U//d+D7OejuRbecYPp7Kvik
	 mG6QjOZ/QB9IH5C8TLwLtcOtw1bIcDccp33CaRRUCzPYyLECmyJk6OBlWWLAD2+ECQ
	 PYBIVCyUuR31g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 842A661256;
	Mon, 23 Feb 2026 18:41:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5E2D1B8
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 18:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2ADC8436E
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 18:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7t54lW1EM_s for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 18:41:46 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 23 Feb 2026 18:41:45 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A82B84369
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A82B84369
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.130;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A82B84369
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 18:41:45 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from uxmal ([81.56.223.94]) by mrelayeu.kundenserver.de (mreue009
 [212.227.17.165]) with ESMTPSA (Nemesis) id 1McH1Q-1vHweu1ZGe-00h5B7; Mon, 23
 Feb 2026 19:36:36 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Cc: Pedro Aguilar <paguilar@paguilar.org>
Date: Mon, 23 Feb 2026 19:35:51 +0100
Message-ID: <20260223183551.25008-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:+mo2famWijHD3W1gDxtvmP2xdSi4B8wpt5LE0YCaXii3GZIGOWb
 Y3zWL3eY1Q//yx+NdHNT2IUnKOd4Z9r3mTYol8Wj4eABVzlUMuS1S3TL5E9gbggK3+HAxMv
 iYkCU/3h0qzi9gv5MHzu81nnX7gAqmOZg2mLcnyx+vABmFb2B71pssd7rYpWjpRQ65PWJD7
 mdpczQnPk1B8lL4dy1gpA==
UI-OutboundReport: notjunk:1;M01:P0:jmRjp7ektVo=;1kFv/DpS2p27fhFtT9Si/0bPiRR
 tRWUkBW4YJFgU6RAfhg+bH3CUhW1fHj2mI5/gZozHsYWB4Vfs7nxwgwQmD0RA+gv5B8oMuDIO
 mYluc9ug8YAgpKGN9joIKuNVE2BNkZLbt0BfbIt6usxztQSiXpZKEDrs6mrCPEITKXLLDRYnT
 8DdgcmlCPfVK+ycTnd5xHg7XhCbYgmmHTZGc/slfpWcMPkYuNP9LUc0aRHQSq22CfGRGf1nfn
 FIiIwRPxTFadCX4c3hTXN///5lxiQYGZOsQv+dqtPs50vPU5EqVjY1Qq1i0wtK5SVpWqaciR1
 OvQ7Gbb1tbxQzMoRUaYrul6oTlY2yBzKviQkpPrYfq7aAqmmI85hoSa9GcFm+82P0r2lbM/26
 yBTHqHjeGMY2Xhb1fsWJiC7cMT0szpWcYz4vPBqROsrpOV6kb/0xnEvvtYtHl0YXvSCKJ1zVG
 F1lv/NJWt0SwdpPPuXhig+pp1W5C5Jw44KuPWssu3XS6OASUxMAQTr/NunBNHVwj7j5g3+LeP
 ZZTqbUhzrVfWx5m3KnVfOitlPW1dhcEiHt8tGZ59kOQxxAHDxgoF1pCi0PaYYB9Mf53IbWvRJ
 tYhyCc4tB4b84eLu21z3n3ZGu+4oswh2tsPqDDwWOuQ6UD3fOfvgVwCD8UWx6bLuKVMnOp1+N
 RxVnu9D3b65LtqsC7cIuKF09we9jwb7KBkg1yTSAGDP8DQOOnDTj6cp55QQQFwmt+8McYRLZ7
 o9SIlV15Ie23Emdd8j8z6Xwt+fMfL9HqRaZM998VSC0D2IBFEcpZ5LUmiU4qRheuqUsJu4ag5
 N7ugEB5aXzMjRzgyEMHa3yTCIGOMXHd3vCSkRNamtraTEt+BcX0OIaLm1ZG2kzr8no4jb3cKT
 59vElRB8K6LizLP/bHF0DVWudGpysMeCNUZrhxzqtsZKID285SxqxjKDojVjAQXPE8IhXam21
 dzrw4jg8EqizI0eZa4fsxQeXK1AY2QfKcjktyFD1/M7hs8pcSz0eF4Z4pYE9VeOmafaMj6cyn
 6hAIDNlXuxeot3CCu3Dnv3lvWu81dfbolwuO9vPRS6Z6QGe3flhVbbQEPw0D2I53EUMUUWz8i
 XEUdAmBkJXD2qZDAyVtwPPex7Hgt87v5iH7KMOua8HDo5eaGcC0xkqsCsJbox52FL2cS/0MMS
 NUNhtl+ytlLeEPcPRDNbCHlV5MZBgASh4mmvA4uKBeKXK5blOfk4ZgwB7o+c5d8ph+vl/7Oir
 VN+NEgfodKfnTCFnZPDzsocoLXEKANP1AlBnS+PjhY3zqch/t4rQ+4VmzuX4v0SdRPQ/pl5n/
 XQ9yPqhnfnOA1LOU8VO/EqpbvcxgJhFgiRiD40riU9OY43IrFvbaLIrdU/VqPtHCHePDV9mLg
 +aKnznqzu7csLr79MF8sqhnTBHJpsjpbHm+YkjIt3o5VwqS6x2xXP9cKUf/GtHwJYBhUSAC2V
 0g0ubxZJp4wCqpbzjDFjiUCBW+CDL0pkDjG45YnfxX90laNpdjJTUpf7loffra6Kz2rmttYZQ
 mfeux7PNP3ZFvF/mgcnbwlzfIKbvWhIzHkFauoXSgKds4orjynduLM/qzBIkJRZr7x6ECdQ5Y
 9iAB1i+u5/h+u8ICGNxycD3F3qFAp4yB7eBJnkpPrO0OZ2qDUlh9Ex9SdgCvGs4tk+Uh96ZtS
 mlaWQENjMijP5roWGVKaCF9c4/sVPPRX/dfkMGtHREAoL1kpyLURbKCx5e6+7nnAO8EPp5XmP
 ZUCXoPTa27k/2YNsQhoJt72+hdMovSqzvMIOqGlkNN4WJNzyCfdXT6jSwgQDbS66D28im1fiT
 p8Rw/g+xecRknSvluwZ5GuyVvQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1771872103; x=1772476903; i=paguilar@paguilar.org;
 bh=t5ZTPsNgEW6tLNCFut6MviXbkDgYIKfZ+TWz4OPxP5E=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Nyo7crNEzgsmY6F5XGDU3bSc9nIdCz0ZyD1CGXvm1fuxWOuPpBwd0gC3m0CvNOsU
 K6iVokrIAXgiki/WkonkAA0vQpaWm9KYFAv//tGAtFPKQ/kDiX0gNu/EI3SLZ6LU6
 outfFLEWImigFMdznp/9KQlnXR2ic9x2cr+j5pVsCjdo3CidUUuALQzZoYG1l1FZQ
 bexSX9GrJ+MZxEgGFJobmPtFq5XIjfGbZ/4H21K8+WX8PWo7KSgbaUKjfchjyLKS/
 S0q6dgUtw+zyZttugqjKcAWSMMuOhGGRPE+uOsY9eiGO4Bn87IoxrtYFakDZlaRI9
 Jt1lrCNhfqV0cy2nUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=Nyo7crNE
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: bump version to 8.2.12
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

Changelog: https://github.com/bdwgc/bdwgc/releases/tag/v8.2.12

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/bdwgc/bdwgc.hash | 4 ++--
 package/bdwgc/bdwgc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
index d38b2bb1b5..dca7e61771 100644
--- a/package/bdwgc/bdwgc.hash
+++ b/package/bdwgc/bdwgc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  832cf4f7cf676b59582ed3b1bbd90a8d0e0ddbc3b11cb3b2096c5177ce39cc47  gc-8.2.10.tar.gz
-sha256  a9b077aeb4e9e1aaf9742119d8023ef26f52f445cdc3f60d390bf59e1647f54a  README.QUICK
+sha256  42e5194ad06ab6ffb806c83eb99c03462b495d979cda782f3c72c08af833cd4e  gc-8.2.12.tar.gz
+sha256  46cf78d79f08ec7295e1c767213582c60eccba2c5bcb07b1b29fd7ddb138fbdc  README.QUICK
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 0700ee7bf5..77040df2a4 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BDWGC_VERSION = 8.2.10
+BDWGC_VERSION = 8.2.12
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = https://github.com/ivmai/bdwgc/releases/download/v$(BDWGC_VERSION)
 BDWGC_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
