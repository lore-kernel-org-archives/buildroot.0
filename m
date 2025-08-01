Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A10C87FCA
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 16:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33FBA4128F;
	Fri,  1 Aug 2025 16:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZvSZMQhxFrz; Fri,  1 Aug 2025 16:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5991A4126E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5991A4126E;
	Fri,  1 Aug 2025 16:00:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AC83CC8
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 16:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 934DB40A26
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 16:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhGucJnACiQG for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 16:00:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A63FB40A96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A63FB40A96
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A63FB40A96
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 16:00:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so15644195e9.1
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 09:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754064025; x=1754668825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YJgMuefaXxIR5FvqZyM/o6CWz8bKGyihrxZENxYgngQ=;
 b=VR67sVdwUL3ilvnFCrvXl3ViGftK23IKM5E6fXOBHaaon2OI3TLLi06Yh6V8BzZ2zi
 WevvWqZoOLWI0KVQ+9mpS8oNHwMkd4WO7u3/C5R+Yu9qpEM2k/ee9R5Y0AALNyHBjRnx
 n6Yjo7JZ7gIYGOKAGMd2wTIUQF5i403U50xVCpDsoEmDyDvuiy6jr1H2NH0KpWx57CWZ
 0YMJ3vl/CRwlYiKTWuJVSVbEZDomB+ZXTqO/zKIStBck+3B1DNWTlTa1EFJgRkkXTsUo
 ITcDRLG1F98saVh97viaQakX/8TZSPZDMuvatb9/rLKMguNO+gOOxiD4J6UtYJjBPazQ
 nHKQ==
X-Gm-Message-State: AOJu0Yzp8nqCi4OoI0u+aGmvLfAybY69VUmCshLjYcqdsTacSjkdUwFA
 QrLLbfJ3MeQ7jIXMNbXa7DRM3F5KoHg+QgnEWUnXIzk7vErLj81WH+BpVKBt2jS9J3r2tejZZAg
 qR6Dt
X-Gm-Gg: ASbGncsbcjW0C+fT3reUmmyMQDOohB4YgQDgP9lWaAo6SNBNo833Pa0kWykFQWnCClZ
 RnZVIcf4lPmZdgujv0Fof7anzsXnS2ZqTvyrhrbAF1FILcZUsarzgDg/dtnhuSPSwzkVMVXjsEA
 Ur/ysxGRSnAbemHyh1c4MKXwZ93eCTgI6WoKz/vJipNSsk6PeN+9D3rjpBcps4OTzo7qLFX3ydn
 Axn0xRhIT6ws2c/Jcmmjme8XvAIOeMgdGiL505Nn4bvLt9tBbv8GAPazKzZDRb+Zc9N3tFkQQmE
 Kq4unYU5mco9TW5+YUWYTkoIH87uJ+Ik3S2HDKsNS2JsCzdJ538+XFd0uMTU3jECZETynyD2xGQ
 okOIU+/Cbgn//7yp/JOD2ZqU0
X-Google-Smtp-Source: AGHT+IFRoAz8WS3OAnNGVCYIW31C4pj6USiz/Kb7i4G5kCNFYBCymhxB8ZZaveqoo/wfwn91pB1AMw==
X-Received: by 2002:a05:600c:3b93:b0:453:1058:f8c1 with SMTP id
 5b1f17b1804b1-458a965ae8dmr37072395e9.3.1754064025037; 
 Fri, 01 Aug 2025 09:00:25 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953f887asm111103225e9.29.2025.08.01.09.00.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 09:00:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  1 Aug 2025 18:00:24 +0200
Message-ID: <20250801160024.2130333-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754064025; x=1754668825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=YJgMuefaXxIR5FvqZyM/o6CWz8bKGyihrxZENxYgngQ=;
 b=IQKCGBYSfS4KxZFAMNtLJTrKlbRIeb/jsZB4m6dd7M+yBt6JaB/kqQ8ZVuqSqM7Pp+
 CT96jW3LFmOQdEPn+mJDnlATEK3MhNrC6vFRtqBfr5XPSERkzM3KXOoo8uXTbVFsCHob
 mTm4YYapLpVk+pJ4iQpOdcE6K/V+8OKPf5oW3yJWyYNJZplXUzlsm9yX24OokL649G5I
 +9a5CetHXs7HM2pb2PvkbtJdTh2xm8KtjNTYNKY6ztXi3YpKBP8JMujc2KpLcdCF4XcL
 CqVwnLcoUyIAKLEZfc9jDmChzzo2ecCXnbUoV/aCHrfb/uKqtmS2Iwz3dsDbQmv8qcRJ
 54xA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IQKCGBYS
Subject: [Buildroot] [2025.02.x PATCH] package/libopenssl: bump to v3.4.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information, see:
 - https://github.com/openssl/openssl/releases/tag/openssl-3.4.2
 - https://github.com/openssl/openssl/compare/openssl-3.4.1...openssl-3.4.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 5924c5d46a..a3c4099b0e 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.4.1/openssl-3.4.1.tar.gz.sha256
-sha256  002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3  openssl-3.4.1.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.4.2/openssl-3.4.2.tar.gz.sha256
+sha256  17b02459fc28be415470cccaae7434f3496cac1306b86b52c83886580e82834c  openssl-3.4.2.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index c1c5b818d7..a861fa597f 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.4.1
+LIBOPENSSL_VERSION = 3.4.2
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
