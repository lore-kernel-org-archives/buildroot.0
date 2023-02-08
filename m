Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8965C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 07:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B02540B8D;
	Wed,  8 Feb 2023 07:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B02540B8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tqr0mvc7BmLr; Wed,  8 Feb 2023 07:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F1A8408A7;
	Wed,  8 Feb 2023 07:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F1A8408A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8B61BF3BB
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D77F381F29
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 07:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D77F381F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-YMuRxhgUpu for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 07:53:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A05181F28
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A05181F28
 for <buildroot@busybox.net>; Wed,  8 Feb 2023 07:53:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so791363wms.1
 for <buildroot@busybox.net>; Tue, 07 Feb 2023 23:53:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DAoLo3mKPubIk58IK05SLbjbBzjL62mi+72JY+x8bzk=;
 b=3hhREmSv8y5R2Ic8FhiErHmjZJ5HlLe/EVpAQgL0HDI49l3L6Ch2qljvF37Fxcyzxa
 8ryoAaeSKEOiH4Gmhonv2DhCAiWywHkbY5YczKiw8wIh6d8CrB6mXMD1pI8C7oymOkmy
 45yy9mvg8Dt57kbUsCQYG1XyVZr48hyBRZUbvIHToH0ScIEIkprTcCkjaC6ZOjxC6cnM
 VlfZvuBA+fgfMdnRoDdsIsIwIUoN3oaIUs/J448m+s6QHcCm0OTEJ1W58fhK0GORwxXM
 Ujp/AgMxN4O0ptqMJYHsg8EhwoF+46epllJ8dFqAsjLsMoOnnzX2rip1e3dLelcNwK1a
 O8lQ==
X-Gm-Message-State: AO0yUKWMAHKHd/bFG+sXdV1QzKCsZhdqw7FYLgOLntKRPcTlc+LNoIym
 v2zcG9VvhchSvFiavpOn0lTeRd/S60g=
X-Google-Smtp-Source: AK7set9dR6I4pb6HkWy8ELOThubKC2pfT8vFdZcic+BihSEaP6glYumw0KwSoLXne/Y2jzElsY23WA==
X-Received: by 2002:a05:600c:4a8a:b0:3de:d9f:3025 with SMTP id
 b10-20020a05600c4a8a00b003de0d9f3025mr5796474wmp.0.1675842786210; 
 Tue, 07 Feb 2023 23:53:06 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c4fc700b003db0ad636d1sm1147789wmq.28.2023.02.07.23.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 23:53:05 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  8 Feb 2023 08:53:00 +0100
Message-Id: <20230208075300.15464-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DAoLo3mKPubIk58IK05SLbjbBzjL62mi+72JY+x8bzk=;
 b=QohJ82H5jtGXi6pbRuGQ6Yv1aJZykZR7HYayF6q2sjwdJQpWxcVZPd4mqudZ7HNMr3
 ugoibG1QRneMTluUiYYSbYEsFrTXuhMvzGULxWuol5asveemNhdYDgAjKRfMM/ONT9zW
 4NCezSwruE5GU5va6UddWCAQcL81/3vhpawzfoH0sS9gss2UBeFgcrINp98ip+p1BjEs
 NOnBr/YIRhnzFJBJw6fRCueg9VxUStfswQPflATL1uQ6R5/7lOpaUkmo955A9Q49DQgQ
 qARShxzJqj50gqypySlXEdAGUYItDLTQI0bBWKzt0cG1ziguJ4U90lsln3OOhy+9Bn/k
 Vb0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QohJ82H5
Subject: [Buildroot] [PATCH] package/libressl: security bump to version 3.6.2
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

security fix:
    A malicious certificate revocation list or timestamp response token
    would allow an attacker to read arbitrary memory.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 0988e6a36..907b9cdd0 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  acfac61316e93b919c28d62d53037ca734de85c46b4d703f19fd8395cf006774  libressl-3.6.1.tar.gz
+sha256  4be80fff073746cf50b4a8e5babe2795acae98c6b132a9e02519b445dfbfd033  libressl-3.6.2.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 8fd7bccbc..b5fae7e26 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.6.1
+LIBRESSL_VERSION = 3.6.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
