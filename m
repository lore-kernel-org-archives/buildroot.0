Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3081DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 03:29:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45E8061168
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 03:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45E8061168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4D0840476;
	Fri, 15 Oct 2021 03:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60KIUylt1cn0; Fri, 15 Oct 2021 03:29:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0FB74039A;
	Fri, 15 Oct 2021 03:29:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 165B01BF592
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 03:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 060FE8188A
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 03:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmmhAmwVBSFn for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 03:29:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2E9480E90
 for <buildroot@busybox.net>; Fri, 15 Oct 2021 03:29:09 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id d3so32388827edp.3
 for <buildroot@busybox.net>; Thu, 14 Oct 2021 20:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEN3P9aps+0wazf+Nd/nh8OLQguoAbegBkl4LmWFeCw=;
 b=KmYzb5xT1UxVVTGQOgvqyDcsb+ANUz3ATh/EIdFH1RQwA/Id3ihCZWednUecqyqRuB
 jXDLIZ3gyO7EsBg8QONyBjDe5wirSi3RF9mapTQWir5D0UegVMnrkAA6gN9njkv31NqD
 xffo8foikjce0VIvJDPaFHe2VijEhXIpsppRmu2+GfTUcb+luzDpdfQi5iEB9aw7CugB
 BlegGKXIUWAK9wlKxX4feD4J9K4SHYpTmc9gP09o1y9gqQpyhXS5pAEwALjGswy8eMx7
 tLVhCl7fQgANC8AfJk0BxBRD5s08hTD1sQcm/Uy/keNhMY0iHrAHtcLiXmguJ20husXy
 K2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEN3P9aps+0wazf+Nd/nh8OLQguoAbegBkl4LmWFeCw=;
 b=SdV6TRuEegui/ZQlmd9dm8RCVDrBBMxhO2IWsfRV2nAG4AXb0OCDjC8HP1AgPWmJ6i
 gcUbDSwzBZdsOs5V/OgeT0lHAqh2B8xcgRW7VlJgUEreEB/XcHHJ4FWZHPrDd6wRJ9PX
 s7l6KWP9LNbir8lP2If9H4JY903uv0oZS7qnzTMlTRakfpm6d4A1Y8kO59X1iCkaOhUG
 bvJOjlQlMtQNqcP/8C0CC5FakTufyQfxv7RQ5OYeAbv8HpAklJhT6D7zqT0By5jKXDWe
 XZsUxP3rgfTLpssBg2QTEW2jsSem67Jj31fOvanQ0alFyFX7Km6NfJkS7K3/fa/p+CeH
 i+LQ==
X-Gm-Message-State: AOAM533pat7VeHhhGoRdqAIXOB0EzgzZ//cBD7+lRzUR5a4x3N9wuFKN
 mPn9Er393vJH1kmnqR4GVKvM0yhFD3s=
X-Google-Smtp-Source: ABdhPJxmtuR3vY39psUl/PyYYqdCh/SPH1U2GUN4p7MflEacDsIiQv35TGm+kE6ollU+zBz+f1VlPQ==
X-Received: by 2002:a05:6402:152:: with SMTP id
 s18mr14619627edu.356.1634268547634; 
 Thu, 14 Oct 2021 20:29:07 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id ke24sm3039633ejc.73.2021.10.14.20.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 20:29:07 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 15 Oct 2021 05:28:53 +0200
Message-Id: <20211015032853.566202-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.4.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 2 +-
 package/libressl/libressl.hash                              | 2 +-
 package/libressl/libressl.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
index f34ae8583..98fe250f6 100644
--- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
+++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
@@ -20,7 +20,7 @@ diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
 index 46f24b2ea..4048a6e63 100644
 --- a/include/openssl/ssl.h
 +++ b/include/openssl/ssl.h
-@@ -516,11 +516,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
+@@ -411,11 +411,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
  #define SSL_OP_NO_TLSv1					0x04000000L
  #define SSL_OP_NO_TLSv1_2				0x08000000L
  #define SSL_OP_NO_TLSv1_1				0x10000000L
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index d046e8951..dbe353182 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  0a51393f0df1cf27e070054a2788a4d073339f363d79cd594076a1b4c48be9a5  libressl-3.3.5.tar.gz
+sha256  107ceae6ca800e81cb563584c16afa36d6c7138fade94a2b3e9da65456f7c61c  libressl-3.4.1.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 268ded69a..0ddc832db 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.3.5
+LIBRESSL_VERSION = 3.4.1
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
