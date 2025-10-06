Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A47CCA471
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 15:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D3561253;
	Mon,  6 Oct 2025 15:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZsGx5v9FWsa; Mon,  6 Oct 2025 15:10:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB98661273
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB98661273;
	Mon,  6 Oct 2025 15:10:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61241272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 15:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44564822B5
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 15:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Gg_0I9lkdEp for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 15:10:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C90A08228B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C90A08228B
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C90A08228B
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 15:10:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3fa528f127fso3772649f8f.1
 for <buildroot@buildroot.org>; Mon, 06 Oct 2025 08:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759763399; x=1760368199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R2Gs1BmXpybJaRAGYh+dBLjNqqyFwaXv4VjzeELf70g=;
 b=wDV0QHPD/H1mX4bvK97URQQ/z+M0a6LRDIzUAcRhz3eLoLJOzN5unnfNXgZ+3rLT2f
 KlbeCoMUke7qfKZq2WMJr+cY+SD9H01F7eA9RqTv7nRsR584arcmMMdne1mMDBGSfYb1
 67oL9/Tw1a8Me1kwMmriTCTHo9L7HnMBzuDCvAFZz3Iu8GOTFVtJgGDjHVUo16OSxj92
 e1qxFjFitpCSz9r2IT4jkcfb3tGOcSYpz7GFhp1QOpcA4uSRgWD0M+Qdc9bN6620NDdu
 hOx01U01T0WnJeyzTQGpqvYD9u6M7SKYcFdq/fiIHZ9ACVezeIu/+KhtaxX/DKCqPMvD
 rV/A==
X-Gm-Message-State: AOJu0Yyo2J5QG355sSd2gbcehZCdMw/aBdroD7LLvsSCIfGEo4638AU5
 L9rZYtW6uybn19TNtbxZa1QIGYoaibSFonPpDPNqE2B5B2ZmXpfPkcb9GSLfCmJnii/nk2YuO+Q
 mDved
X-Gm-Gg: ASbGncs9ebBpKZlu2wB9H5bjnnQUyu9cnW4RL+5CRzRbdKpbBHBeCzvhxYOsjMrhdxT
 VC7a2G2VnW/U0yMegGDnaUZH9401A3EOg9nOesadeZcAZ60SJdoQGfRZQmIEeik6qYabyLS5qlh
 k2WObabTxac04WHiaQsFTNhQC+DKQ0SI02HTLrivrqAr+j0cPdvKSFocOn77JNpmLg/SEg8+TPy
 sfiZMvOksgszRielMzvUBG7+sEGsOoOZnNGKIHYc1bzh7JLMxYn1/PbGN7Jj+pYw3Bi4beHaP9n
 Ma7t/vTMKvky3fkHl0ecmVWO3pGG8iUsun6xrEFaxb+mElGYRQvnq1UV+o3KNcKpMhW2RlDzmkC
 l3IsrEV9RWdepd699pvOh3VpxqzaKadlmNM/yZDyJk+A8iYoScLHR82yQueOHDYKs+l7jc/XgKU
 PiOqcDzYJDtKBL0nLLa8bF76D7Bg7MW+T2FUYimFua
X-Google-Smtp-Source: AGHT+IETx+Rm5c6dRntY+z+7pP+fP3HqOSCYA4AryAqOKj5X0bE6ULvGo1SVb8xYBf7BAWgPhNGxiA==
X-Received: by 2002:a5d:584a:0:b0:425:58d0:483a with SMTP id
 ffacd0b85a97d-4255d294cb7mr11670199f8f.3.1759763398785; 
 Mon, 06 Oct 2025 08:09:58 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9762sm21353725f8f.38.2025.10.06.08.09.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 08:09:58 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  6 Oct 2025 17:09:49 +0200
Message-ID: <20251006150949.499972-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759763399; x=1760368199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=R2Gs1BmXpybJaRAGYh+dBLjNqqyFwaXv4VjzeELf70g=;
 b=hMYvlxnqV2+KrIFLZNrosBDzqhG5YsKXsCgqpJiIU1MzGnLdJt5UPrKw8YB0g7r3A4
 6sfUOEiB8+lrWm3vZA5Y8PmBpB0vLvi4TMWYEUSzfhwzf6QvwsfInEWA5j8lkZrJpaGu
 Q2HdnldWg6JS5c4itTjaWW9qEkUakak706sdvg7nQDP08msu+ToR4MtnTHTUWGhARFOR
 V6+RFhKkQvBtV6EJ0f1pmXZxTdfNIdaBLFOCcrbfElOT2mqKjQtIrD2dEbnPk4M8ClkA
 Lm+KHNGHmOP3C32RW8wBv2BvG2p1SHFaKAk7TiTg+ZfCLImJJOq21jcrSTGDn7d2z0F5
 Gphw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hMYvlxnq
Subject: [Buildroot] [PATCH] package/xerces: security bump to v3.3.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2024-23807:
    The Apache Xerces C++ XML parser on versions 3.0.0 before 3.2.5
    contains a use-after-free error triggered during the scanning of
    external DTDs.  Users are recommended to upgrade to version 3.2.5
    which fixes the issue, or mitigate the issue by disabling DTD
    processing. This can be accomplished via the DOM using a standard
    parser feature, or via SAX using the XERCES_DISABLE_DTD environment
    variable.  This issue has been disclosed before as CVE-2018-1311, but
    unfortunately that advisory incorrectly stated the issue would be
    fixed in version 3.2.3 or 3.2.4.
    https://www.cve.org/CVERecord?id=CVE-2024-23807

Also update the download location to use HTTPS. Unfortunately, v3.2.5 is
not available from the download site, so we bump to v3.3.0 instead.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/xerces/xerces.hash | 4 ++--
 package/xerces/xerces.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index e6b5b922d2..1bcc5422a3 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,5 +1,5 @@
-# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.4.tar.xz.sha256
-sha256  075bc57940da0f9be6dd183c550c8ce0b9833e4550dc382048377a1a5e3b2bd9  xerces-c-3.2.4.tar.xz
+# From https://downloads.apache.org/xerces/c/3/sources/xerces-c-3.3.0.tar.gz.sha256
+sha256  9555f1d06f82987fbb4658862705515740414fd34b4db6ad2ed76a2dc08d3bde  xerces-c-3.3.0.tar.gz
 
 # Hash for license file
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 08efa6fb5c..36191caf9d 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.2.4
-XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
-XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
+XERCES_VERSION = 3.3.0
+XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
+XERCES_SITE = https://downloads.apache.org/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_CPE_ID_VENDOR = apache
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
