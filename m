Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA264D44176
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 10:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B69A60A9A;
	Fri, 12 Dec 2025 10:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajKRITqeLihT; Fri, 12 Dec 2025 10:42:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975D960907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765536139;
	bh=wOHKmMJJfLcZ/cULXas0Y2B+3bcynZ4MKL9HvwCDysc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vi6FjgUeGG6n5QDwCp1aJHFhGyEeAnfM+B+p/HlTZ6qTnnudhFDUHMa0CJVNl3Jjy
	 ZJeQtwv7KuWdRDXfFxeg/qEbun/cVMUTzpZ/2CbIetlLnBSGQAFO8IVZogyyEeY7R+
	 FHIY0djZjod6i7Ls6DWVQnO84NZzSxs6wHkmjXv01ID+77cg+vI5XRKaWDjLRZaS90
	 PKDDl4ku3dZfy5jxQBBsDyt1DMqoS/HPIkqS8vD44RsACkX4T71klK0GAuYfkWgKFC
	 xEfwpJ7PuN9BXwS/Dsxmgr1CvI//hIsi3s/W88ntx8lx2FVtudDnPp+tHh6lSdmLwn
	 f2sntRJ+h+kLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 975D960907;
	Fri, 12 Dec 2025 10:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A88C7E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EEF24020B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfyOulfk0rla for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 10:42:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.72;
 helo=smtpcmd0872.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0003401C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0003401C9
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0003401C9
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 10:42:14 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id U0bEvkx34ZCONU0bEvtGMu; Fri, 12 Dec 2025 11:42:12 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 12 Dec 2025 11:42:11 +0100
Message-ID: <20251212104211.3810112-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOTp9swwfHZ/ubrnOkl4pvjY69ME2k4W6ij5KkarLh1RxlmIzKidl2Fe0xyXirj+Wlbh6V+AIXJ6wI5ozg76O6URNMRM12vJfCkWPQfbp0/CaQ1eIt0m
 xJ/6z1SaL1ybO/w2yCzW6iv0KwD6aQEL9BPwTThVh08BHfbKqiMar241RX0S48w3PUPU58A4HfeqjkTi5c9bR/ltSBusgPXdKXkgKwK2NF9NAhblzRfL2y0L
 F2g4RyLw+TfimV7Z6NnK4z16GdWvg/ay9xZYtH66gcuu3Hn5AjZnISlEdrieni3L1haL6FZXy4hP7dGO3FOdew==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765536132; bh=Ca1p/e9z6rEnoqU0ulR/xFRjmWW/niHS7uB0H7HQPlY=;
 h=From:To:Subject:Date:MIME-Version;
 b=VXf6Lt4JK5pu/SqGO+gFHJ+z1AxcHNb2h/q2x8tl/YyhSOdxZYKqeo6du9vJKax3c
 4NGijvwJlkykDWVJn3Q/5+zdjsXEr6R6bk+YDgr2WGo8rUcNg4yPXbYChfq3ZOh9SX
 ZJ8GiutN4d2KpAlmiEMEzbf6Tk0VVylUgFbG3XXBrkR5VYd3GVIwuWIpAMdQzNKABb
 spI6p2ZPaMJ2EJjiCS5dJnv0AKzdelDwJraDNPV/jJ+Rd9pxCAKvYi2q8wEu6Uw8bH
 ctR4sh51OHPrfptc7F4sf2/W6T0iQhoyCtuhH1jEeWyQfNAYm9P5p3rAN1P/T2qIQ1
 AKX5xT2kuIWQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=VXf6Lt4J
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.119.1
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

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_119_1.rst

For release 3.119.1 tarball change from nss-3.119.1.tar.gz to
nss-3_119_1.tar.gz so let's fix it accordingly.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 2 +-
 package/libnss/libnss.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1b15364a93..0581592c63 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_119_RTM/src/SHA256SUMS
-sha256  e8412db6c9d6f531e8adfe8a122ec33a8fae920681ff47231a1349bdd399f0e9  nss-3.119.tar.gz
+sha256  1387b8478e6c681c533b1f7b0f4d4ef7f58307c1f7e3a353622ddbf841328283  nss-3_119_1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0ac34321d8..82affc532a 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.119
-LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
+LIBNSS_VERSION = 3.119.1
+LIBNSS_SOURCE = nss-$(subst .,_,$(LIBNSS_VERSION)).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
 LIBNSS_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
