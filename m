Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D087C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 09:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3C806072B;
	Sun,  9 Feb 2025 09:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L6NFDx5S66HM; Sun,  9 Feb 2025 09:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC9A060841
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC9A060841;
	Sun,  9 Feb 2025 09:15:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9211E6C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 09:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7712B4015F
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 09:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEcmXhMc4W7q for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 09:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=friedtj@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 862E14013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 862E14013C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 862E14013C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 09:15:57 +0000 (UTC)
Received: from zimbra-e1-03.priv.proxad.net (unknown [172.20.243.151])
 by smtp2-g21.free.fr (Postfix) with ESMTP id 7971B2003EE;
 Sun,  9 Feb 2025 10:15:53 +0100 (CET)
Date: Sun, 9 Feb 2025 10:15:53 +0100 (CET)
From: friedtj@free.fr
To: buildroot@buildroot.org
Message-ID: <1051448772.78531592.1739092553405.JavaMail.zimbra@free.fr>
MIME-Version: 1.0
X-Originating-IP: [92.184.105.29]
X-Mailer: Zimbra 9.0.0_GA_1337 (ZimbraWebClient - FF134 (Linux)/9.0.0_GA_1337)
Thread-Index: vqYIXLZo+Av17O3YGnMYkyedoQsf6A==
Thread-Topic: package/python-numpy: fix compilation failure if lapack is
 selected
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739092553;
 bh=0im0fPyjY66+d5FLJykimhTlwSUF6ziKsEHk3XF7qOE=;
 h=Date:From:To:Cc:Subject:From;
 b=DA6q2wvUMz62h+yYlCcGgAycyFJa8GuyOzLAZBR5GEdVZzHZYiTguVsAoZ/++fxyR
 HFM6KrSl2BU4WDOQ7vDqzUb7ePErcoQW57G9cE9Kz/vX3SCKopiqPAatrHWRrhwP5Z
 U2f8SDV7EW15aMtYdOlTRKW1Vik1nWzMKlHy9A+R2LMKxGHP4lgmRfLbdpI18XjrFt
 Wu/ReaBkHT5g1J9764eD+JamcgnR7XUIGqz61/CG5ITOV7MZnZrlIo+ABRzVUxKT1W
 aN2Hbq6shAUuao28SnVh1gWs5ntnR6qVgB23nVzytWv8+xJK9Uk8r3WMgQB2XRhMRQ
 yaVxFuJLRAGqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DA6q2wvU
Subject: [Buildroot] package/python-numpy: fix compilation failure if lapack
 is selected
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
Cc: james.hilliard1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-numpy compilation fails if the lapack package has been selected:

Signed-off-by: Jean-Michel Friedt <jmfriedt@femto-st.fr>
---
 package/python-numpy/python-numpy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 200fac20a1..86ea9ea566 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -26,7 +26,7 @@ PYTHON_NUMPY_CONF_ENV += \
 
 ifeq ($(BR2_PACKAGE_LAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += lapack
-PYTHON_NUMPY_CONF_OPTS += -Dlapack=lapack
+PYTHON_NUMPY_CONF_OPTS += -Dlapack=""
 else
 PYTHON_NUMPY_CONF_OPTS += -Dlapack=""
 endif
-- 
2.45.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
