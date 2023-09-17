Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE8BCD13CF
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 16:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000ED81E27;
	Sun, 17 Sep 2023 16:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 000ED81E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crlEVnRPOskB; Sun, 17 Sep 2023 16:32:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44AC081E1E;
	Sun, 17 Sep 2023 16:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44AC081E1E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE9E1BF4E2
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 16:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54F37416DD
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 16:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F37416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25OUPiLWB_uK for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 16:32:04 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ACA9413D3
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 16:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ACA9413D3
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-404573e6c8fso37106855e9.1
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 09:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694968321; x=1695573121;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oob3TXUhs/GjuxbQJuVItd+Hrdday0ZhOqNCFhAJ5FU=;
 b=eJ7xkj10o82aNIQodeBmHgyn9C4SYkPTLzAipQuO/nEyLx7zmw89PEPSzHu/lloRU7
 hzf5IcdgKfO1LdgTw/5B27Ui9BocGs8kkn9ljln/ev5l2C91+QsvfQbfqxhuZ7F7vKhm
 9QrlARUf3KQw8dRuCI0qhvcXFii2JbcJSrBH9xaaPqxodIpmZcDsnHzn3hdqBVxSD9Ei
 cS64W1OreEWJW6+TcrUnCjN2dU5kjxjfPpmZa/Jq0hS2x4ChOeWj8RKo3A+/AgyKt6FB
 q/nCAwP+w8EctcxlP8amexW9OM+f2MlYtBww/HEt4qtmvbtMtGKdo0im7GmBTXCzW9nZ
 /lfA==
X-Gm-Message-State: AOJu0Ywzp7Pf1bM/WX8vzKCA7kYroVxaIllrvep8bCT3LfWBkehNQNu9
 OWHsuPK1QShGdZ24IRZI1EY7uNsiRg8=
X-Google-Smtp-Source: AGHT+IHZ8g9PqGZGzPkft+CpfDBIHG3aPyTcFMJeRVfrY0gK1IUKpUjquPv9sQ1awd0EQy/0RM8ruA==
X-Received: by 2002:a1c:7914:0:b0:404:6ed9:98d1 with SMTP id
 l20-20020a1c7914000000b004046ed998d1mr6473762wme.41.1694968321335; 
 Sun, 17 Sep 2023 09:32:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003fee6e170f9sm10022468wmj.45.2023.09.17.09.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 09:32:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 18:31:57 +0200
Message-Id: <20230917163157.700211-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694968321; x=1695573121; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oob3TXUhs/GjuxbQJuVItd+Hrdday0ZhOqNCFhAJ5FU=;
 b=VFpkgD+8w1HbFYsbMM46WA8+eO7ARrxDAn+wNDY79s4x0XBKuOERwl7cXYo5r5kHKB
 lwwM2+A4mdsDxS1tFugtQjFsTfe9PYYASRnokISgjiQDKRO+puSYUK1z85+cTLtV3anP
 bz1p/rghieVt+wmWgya/lxVEGYDPbx17Pn5Lb5ODaBGZuc0DOkg1EUL5j/PotTDqWq7j
 uam/qSNPus5d+8wEBQo7FNqdszFWDIodb4nHwvGKwiElXe/qpYrLuqGEmz8R7TME3MsZ
 S/cizxdgAB8XL32uGHKXQXJ3aq2LgTw5sxc2IQrEkYqRXd6P5CRey6ba3RJNEdXauuE6
 ZrGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VFpkgD+8
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 4.0.8
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

Fix CVE-2023-3648 and CVE-2023-3649

https://www.wireshark.org/security/wnpa-sec-2023-21
https://www.wireshark.org/security/wnpa-sec-2023-22
https://www.wireshark.org/security/wnpa-sec-2023-23
https://www.wireshark.org/security/wnpa-sec-2023-24
https://www.wireshark.org/security/wnpa-sec-2023-25
https://www.wireshark.org/security/wnpa-sec-2023-26
https://www.wireshark.org/docs/relnotes/wireshark-4.0.7.html
https://www.wireshark.org/docs/relnotes/wireshark-4.0.8.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 6598f51f53..f044f99483 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.6.txt
-sha1  a60b6f8063df2a711932ba869ae86e6476087cf0  wireshark-4.0.6.tar.xz
-sha256  0079097a1b17ebc7250a73563f984c13327dac5016b7d53165810fbcca4bd884  wireshark-4.0.6.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.8.txt
+sha1  8ca1cc4471d0cb835cd5216833c393fa23bc154f  wireshark-4.0.8.tar.xz
+sha256  16663585c0ffefd5593a6628d4a20cc8241b9703b11283cfe71ead2b750888c8  wireshark-4.0.8.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 80a986cfa3..500bdbb77a 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.6
+WIRESHARK_VERSION = 4.0.8
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
