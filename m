Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BC1E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 10:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF0740785;
	Mon, 29 Dec 2025 10:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loieAkzAMWnw; Mon, 29 Dec 2025 10:54:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A534078A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767005661;
	bh=v+IgqPJGQb5PgpQzZHSU0/q8NrANYq4hNYPKyLMlfjs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=a9wEdVG0+k5W82/DgfN0XaFUz/UiqSD3LpFqCuxaHVPs3F7+hvcY1HtLrfqRKjP1Y
	 sHs9HmZ+rF6U/9M0q+Eg83eVqBvnzaUuh0qM/hfNPjcoyTTvIKQqsZ6OszThYGoNdE
	 mDi/XkW9A2fJkwjT43MvcHwPablBjFNQCEA5XSWN4DahzEjWkPLhsM7SP3EKm43+QB
	 Zfaf1chRmYfKWHv19xhlDCIfqH5wLtV5QsToh50e9JQS+/+SrqeRPO9iO+1O6739NK
	 dE6dYPk2oyXJ0D+G37MFE+h5MjySQXwnnaYvyCD72xFoEeeEazFMHmYjrWrpGEVh2m
	 eU7+4WXS+C09A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44A534078A;
	Mon, 29 Dec 2025 10:54:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9DFED8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A78CC40261
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsBN8TtcFsNW for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 10:54:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 980D1400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 980D1400CE
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 980D1400CE
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 10:54:19 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-64d4d8b3ad7so9071814a12.2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 02:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767005657; x=1767610457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0wVSm5Ju5IFwSmOwFlLZXH7sj0Yq9jyDqVOqfK32go=;
 b=fzCxzKBWbMVp8WwDany7KrY3GB68lMdjK9OBaeuVbXRaDQmSIkK8YNjJm88ULhkL83
 jGhQZ/5dXGQH1H4u0U4Xq0YEsCmeyXPw4AFyhyWQcmhUFrSTaShYlaXDJi/LEPNU/hkV
 4PZsGdXkaV9RzDx6aZf1ONOeWfX9FwpROVnZ6Bs/iY1Q+I0QUawt2HQR/guphgCkwclt
 ybhQYceRZnxD2dtB27l8YpRZmqAjY0Jw/U4DXC3IwJ6azZgtiVvSTO02/E44TIIh17aA
 wwJS2m7nLYZ2AyDxvVYYl8qHotSYqe3CC5UaFKkm2uszyfLs0eRqnMBHdL/qZ+kI2UkR
 WKew==
X-Gm-Message-State: AOJu0YwrEdy4JAnHwFt87or82COpnIYJWOfrlLSZjPe302/TZVrC3Mv4
 uhBLVzcjCZwomJjzdekTZKF9VCRLbAfT0Hh3E8jH+13ZWqXZMBhe+y13q2Dlc6RbvatuKYMJCOy
 uzE8e
X-Gm-Gg: AY/fxX7qHKJmltSlLyVXbLOcdcFTlhBlLf9+oTsOF/3b6RGT42di+soyatzadp39AVn
 /ANpL3X6l1/13DWbCPObcyojQDekz9xulciO3hA/At/r3PwrdDBAqA3GBEeIKm6JyIwiqyzcxke
 LmakICy76rwmEbgudrU85J2Qn0U81DojncXkYVdjSJGRJz9tUeQfV5ASEftOgrz2RC7HDVnilZ3
 Uh++AIB5tsBUvVBmK2F/G0ewJog+/e1fJJX7bdv8RQBRb50GxV1T5D405gB2gTvqzP8OtqIkqzb
 NvXlfZfprHc3RLBQYCAP4yga0HqwDGauO8sAoIGO2uG4SXmy/VVo6h4Y61hoJeiyWaoRx32hjMb
 x5vLO7PFPwm+rKOPM0HN/0NPPG9m80Cppd39rp2GuXqYM1feh6v+0xbvHDaMRxLip8PMBq0Djlm
 q4qHM3b3cTejqftWQbAYJVApP0BfZxuw3SrZ+gnw4H3ibxsKZQNO+ZmI4jCSxUSPZgzmKdIo3ql
 qywRaO7G9U0QYFk7hsL5xcvHTuXjDW8RxUinrL/WrZs7ULCliCYuIQtNXbOXWMLf8th0x/IIDgx
 jz6BYFZ5KwIwL+/etGH8rg==
X-Google-Smtp-Source: AGHT+IFJuZ7veJ9zwSIA21xukbBu10iAMSlkCpD5RE59xRqjl/UlLcGonJLri312FBfuTApnZg/5kw==
X-Received: by 2002:a05:6402:1e96:b0:64c:7903:afe5 with SMTP id
 4fb4d7f45d1cf-64c7903b3b6mr25530914a12.26.1767005655283; 
 Mon, 29 Dec 2025 02:54:15 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b916b66e2sm32028835a12.34.2025.12.29.02.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 02:54:14 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 11:54:11 +0100
Message-ID: <20251229105411.47443-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767005657; x=1767610457;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c0wVSm5Ju5IFwSmOwFlLZXH7sj0Yq9jyDqVOqfK32go=;
 b=IU2wh4vMkPLH9nfOk0iN2G1ujqfElQP+6hK/zH/k1vSrPnvI/s7BlOnYPdKTFMuCC2
 n3ZZzFHx20uruGk8UETM2w6XS8uScS9fOflaaEm4v/f14FwtRaPPNiPNRI3T9tgoVaqH
 fKFVF548ktCLlakEOiIQu7C/3Unid/3rjpIjw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=IU2wh4vM
Subject: [Buildroot] [PATCH 1/1] package/cmocka: bump to version 2.0.1
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://gitlab.com/cmocka/cmocka/-/tags/cmocka-2.0.1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/cmocka/cmocka.hash | 4 ++--
 package/cmocka/cmocka.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index ff561f06b406..5061cf30d0a7 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking pgp signature from:
-# https://cmocka.org/files/2.0/cmocka-2.0.0.tar.xz.asc
-sha256  b5686c51ea92d142958d68e5dcb932f9bfc32cd3dd01c524f9d4aa863ebc3d9c  cmocka-2.0.0.tar.xz
+# https://cmocka.org/files/2.0/cmocka-2.0.1.tar.xz.asc
+sha256  3f3533382ba29ab3abf5c4f4b27b79d165f0df51ea587de749b11b68b4019180  cmocka-2.0.1.tar.xz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index b2d489b7f779..4dd78f39cc7f 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 2.0.0
+CMOCKA_VERSION = 2.0.1
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
 CMOCKA_SITE = https://cmocka.org/files/2.0
 CMOCKA_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
