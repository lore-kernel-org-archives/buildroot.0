Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC995E98FDF
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 06:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C62B817F2;
	Fri, 10 Apr 2026 06:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Ww5EIoIoKWi; Fri, 10 Apr 2026 06:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F1281778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775804120;
	bh=gaH1PiN7yIC7+o8znUBEM5loKwCGvKqq3NRuZb6e5TA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HtqGUM413D1Ag9yjgSrmqBdhkoNBAfMwhqsHiuqGdYXZRFADSWMEOrEk8CZUY+p7A
	 ybR6GERG1c3EtHui7uPblQOfdDhHK2TpIhWMNDsVL7ZBwYnN3KEjN9Txw4epzMwg1J
	 DmYAFU68iQ1Eq82u3ljppH5q5lo6QfUJG2Qnww095bMImaOZeGXkK1Ph6AOGy+pjST
	 7cULJORXcFjYfeEu9kJNW2xNT5yD9Kziv7jRN4awjuOGbXc10AEyj2xwONrd6l9lVs
	 LOVdS0lqIKecMBQuWEGbGjzoef451hBfO7p+YyfjW7yvApA0+uWqhxKii4npIeltkQ
	 BXMLuGHbqBmQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1F1281778;
	Fri, 10 Apr 2026 06:55:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 082E7194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05B1D4025E
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_r5PLhANzHU for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 06:55:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F208940070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F208940070
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F208940070
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:55:17 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43cf8d550bdso1631288f8f.0
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 23:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775804115; x=1776408915;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NxwE/M2/5KP7BtH+WZE1LiVxstSvW/SgoPa5FYcX3Gc=;
 b=DdsGC2co2iXXl26tFmdQ/4qBdzAPtcQJB1d+pGzx3WpnoWqaHfDepSVfyLyCUHAZYF
 YZRfh7pDL6uvZm+LbOMaibEU+PZ+lqnj3UGyN0P0FsOj3vBgPH0ffqo+3hTYeqdh3xCd
 3Cqv91iks40VvknnE/Ek+8zFfkNa+0JTgMqJgWd72adWdHgVhtjOHDA0ko7zPq5NmBBY
 bqKy+UHXKIKzMwWgCKbp0Nz3Zu48kxFYcEQws/2xqw5CHABNOIgSMxgJK7Y+9aBgm1h0
 UG7Ydwg8AdMca18lizd8bMCRdW1UFam7hRkzxQk04fO0wa9BaScwAcyeY67c7g4AUSmi
 Y0xQ==
X-Gm-Message-State: AOJu0Yz7RUC939sdpR7e0MIwJTgjd4FPPJ3XFH5d2ntkCNx2odJp1VTO
 g9g6SGucrYAPix2nqy+QclxTYuN4UUuviqikblANp1/YNKqdZr5nygHPDfpuPbu2i3IZTO8mWq5
 Fy2TU
X-Gm-Gg: AeBDiesV2nrK3MEYKbruFzIyinecS9x4Q7xvdbUbjrigVR41l7NEOFlJQ0+jmqdHDri
 MKNVIUHaA+v1OUViVUSr9ZkO3sk6v2UluEQG2Xh9qrlSpZV/NMq+VijUbkDDMygbBdV0iUqJ2DL
 erJWXzSYM1Zu2SGBF7Lno1Qtvu9d2gCc3UOqI82rnuqnOmfgbkvGDTJNls0LX2lGWrG2G7k6Uw0
 3phpa0FCkiXkKIUpe1mKAQMUBHUazn0wcpnqqWxxT5RTEpzqJzgmUQWjYHyEqGQCXNg5HSdxrON
 ilvyzr96h9WZRiTcjb4uizN3kh+9VVSwuaK4Ygy3rFQQ+KptLLqy1Csdal6najvvuVkIIbLgTXg
 goqzftQ92Tzd+4FXS34ReH727dWGzPbHSsSrhi6AYIr+j7UAhGxEOZ53mNruVlC6SDJ/V/LT9wk
 Db0/QqGD1fckpN+9gZRqb7rYj5b/cNJEIF2GwpNOJVlXCW/GO1Lh8Vw3lb4mEH
X-Received: by 2002:a05:6000:1ac5:b0:43b:3d02:7806 with SMTP id
 ffacd0b85a97d-43d642c852cmr2471699f8f.28.1775804115436; 
 Thu, 09 Apr 2026 23:55:15 -0700 (PDT)
Received: from dragon (ptr-94-109-198-162.dyn.orange.be. [94.109.198.162])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50289sm5248418f8f.28.2026.04.09.23.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 23:55:15 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Date: Fri, 10 Apr 2026 08:54:58 +0200
Message-ID: <20260410065458.1768122-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775804115; x=1776408915; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NxwE/M2/5KP7BtH+WZE1LiVxstSvW/SgoPa5FYcX3Gc=;
 b=hwxHsIsoCbiArjjkb02bs/pfslDtbG2fBQclAEJzPjjT3nKQ8l+sJtGI/EZxIVj1Qz
 CGli8lpugjt1xIo1q80N7TMKP+AcDW/8xP+QfezrVpac555XG/EmU0c70y6xIqRdEPzz
 tlK3kJKDUNHUNAvzXSDIfCciMrjm9Whn10jfc9EWqD3l4ILLZch/5E9TdyHNznEgNwlM
 0uHqlXljHZuwpX8p6vzY0UPTa2jxhrMYJXDjChLnlwOk7xyNDKWByXBvc3N49iCQs9n5
 ieR9kzcf276hNHOximnl/Vsswc/S1vo/sGtV6CJdg6I2SxDFPJa+PyMuw+gICntdY+8i
 7dDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hwxHsIso
Subject: [Buildroot] [PATCH] package/cpp-httplib: bump to v0.41.0
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

See the release notes:
https://github.com/yhirose/cpp-httplib/releases/tag/v0.41.0

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index eb2b77bcd8..be9967f1e2 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b52ecaebf0f94086c8b3305650412359d920c5267f6d9ce87f883198783af678  cpp-httplib-0.40.0.tar.gz
+sha256  6d38a6b74ea33ac3133b8352f2b55b557c1d42f36e1ed0c01f852e3218329d39  cpp-httplib-0.41.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 5cc60565c6..c4a77b869d 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.40.0
+CPP_HTTPLIB_VERSION = 0.41.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
