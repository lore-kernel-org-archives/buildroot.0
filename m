Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD58CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 11:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5633610DC;
	Sun, 17 Sep 2023 11:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5633610DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HG7lmtJG62dz; Sun, 17 Sep 2023 11:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37541610D7;
	Sun, 17 Sep 2023 11:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37541610D7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9D6C1BF38D
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 11:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 986874014E
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 11:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 986874014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvI33-C-83nE for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 11:58:32 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 728FB4010C
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 11:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 728FB4010C
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-402c46c49f4so38871275e9.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 04:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694951910; x=1695556710;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rq+pYiR3jZ6a0+xIovlDhYIdJfdvQxGVSmLWYkG0CcU=;
 b=T8Rnhif6SzW+MI407/e2thOdOpa7d3AQDOL3FRGv1gdgxviyNikRZjzWx+aaIzWnMZ
 LwmLz3rlMFlT/kO6NTL+uq4WbPEBSFKsPZ0i8ySzokrUDEFYMBRXOwq6eivsy3PrkuJ0
 UP2ZVAbk7gRuFxb2EZGQZct+s0uaoeJyZHhjk6KrOEhGevczsGEQnViqEqlR6jPeFxqO
 AC6wTuhPSFfotkEkxs8p8jC1wnZd+WGa6f6zxmINgADdV3/3Obplv9B46cszrQiGmO9Z
 w/GyxTO9JhBLv4w6zEOnQbUrDRs1WDMnMmWRDTHddS733wV/m1mJ2BZC0gg30O4TlSEO
 iQXw==
X-Gm-Message-State: AOJu0YzPYlMwTuc2cHmnfsGhp3SHxANREGn7PaWGJrtV0Ddnu4Q7RU3w
 f/sH6TWiNeA28CVXagM4H6nnwSyxSqA=
X-Google-Smtp-Source: AGHT+IHFLKJlHK+Pd+F494AcCuRVgng8DL803eqQB1mty77TP6fugwyLUhcz+R3K50Dw/XUV2dqUxA==
X-Received: by 2002:a05:600c:2614:b0:402:f517:9c07 with SMTP id
 h20-20020a05600c261400b00402f5179c07mr5603327wma.0.1694951909847; 
 Sun, 17 Sep 2023 04:58:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m10-20020a7bce0a000000b003fee53feab5sm9583518wmc.10.2023.09.17.04.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 04:58:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 13:58:23 +0200
Message-Id: <20230917115823.27662-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694951910; x=1695556710; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rq+pYiR3jZ6a0+xIovlDhYIdJfdvQxGVSmLWYkG0CcU=;
 b=NibMbKrEpYhnAV57StADhYddOWTqT1ChZzJK0RYLCbjWqmiCROgcP9fU6dFZcmhNJe
 q3R3ToSSyencBhtaQhIzMoBLtKlQrbWYmZgHA/orWDRb3zJ2t4OqlHVTxJJnyleDOmgZ
 FSI7Kx3DDE0D4U5ibC7FuZwuK15ld8sSGlerA5gxt3YKkExf4VBi0h6P8phL2Qbc9l9E
 koq+rlMlWrt6SYyrTWa4nYrj0C+VJwf1kBafzTzskssFdWP69LaC71Ieit0AQAqQoQ8b
 QYt+f74UhN86YmxdjxNbD6/MqOFjimOlQyQ2tGFy/rqMKh44HKf6OanHyiRBZ1W3NM2K
 Z7pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NibMbKrE
Subject: [Buildroot] [PATCH 1/1] package/haproxy: security bump to version
 2.6.15
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

Fix CVE-2023-40225: HAProxy through 2.0.32, 2.1.x and 2.2.x through
2.2.30, 2.3.x and 2.4.x through 2.4.23, 2.5.x and 2.6.x before 2.6.15,
2.7.x before 2.7.10, and 2.8.x before 2.8.2 forwards empty
Content-Length headers, violating RFC 9110 section 8.6. In uncommon
cases, an HTTP/1 server behind HAProxy may interpret the payload as an
extra request.

https://www.mail-archive.com/haproxy@formilux.org/msg43864.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 20048da7ec..74390c2ff5 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.14.tar.gz.sha256
-sha256  bd3dd9fa60391ca09e1225e1ac3163e45be83c3f54f2fd76a30af289cc6e4fd4  haproxy-2.6.14.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.15.tar.gz.sha256
+sha256  41f8e1695e92fafdffe39690a68993f1a0f5f7f06931a99e9a153f749ea39cfd  haproxy-2.6.15.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index dc59047fb5..8143572021 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).14
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
