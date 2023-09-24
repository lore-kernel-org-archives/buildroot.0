Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FA0CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 12:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB5760AC0;
	Sun, 24 Sep 2023 12:06:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB5760AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jkvXMbRTtYlz; Sun, 24 Sep 2023 12:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BFED607A4;
	Sun, 24 Sep 2023 12:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BFED607A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 298021BF3EC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:06:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02B9E81E87
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 12:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02B9E81E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fSrDDUkX4tqI for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 12:06:41 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEAC981E84
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 12:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEAC981E84
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40531812168so50225475e9.1
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 05:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695557198; x=1696161998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sefsAwHwzKQK9FLGaRSxdYqUOOvzmaecTBF3VcVIKi8=;
 b=YBa1DBlIlYQmHxcVHk9yxAPJwfEpuwiBdQTllpPP08ZRO/nfw8dSKtSK+zBbpE85VA
 LZe4LlPd7oBmszVEaecyz1TqIlDhLHOWdUozkjig0lm3NhW/6lhwD7y2xG1mgsRfJbuw
 2z+vzBPJ17sZ1hxTm0n/nazsYjux/VgNwG5TX+t1y6oKcWsnH2W52PBBlW59yQAvzRmD
 ewvDvRrBlauBPSM+qD052GBQASbu7dRUyH/xMQ79eI5BrmPa3ywc//A9bmu7Jzsbb8+J
 4JFCua7WwtkdG0MViXmFkv/80ANghpvh43iY0y9pcJ0WvmIAWzBQUYZL8XoCH07AdnhL
 U1Bg==
X-Gm-Message-State: AOJu0YzjA9sZF60FWG6xQI27SHCn983wc8YGKoLWK1Ow4xwkpkZYGBPE
 NQkc0QLUZdRyfALio+vtnLbsLfl86Cs=
X-Google-Smtp-Source: AGHT+IFME0+MEFV9+hTKhzD3zQixilp8u5oBXaPXTjxQeiidwqcud8ZZVjR2zCYq4noSMtDaUGLoRg==
X-Received: by 2002:a1c:4b11:0:b0:405:37bb:d940 with SMTP id
 y17-20020a1c4b11000000b0040537bbd940mr3566656wma.0.1695557198162; 
 Sun, 24 Sep 2023 05:06:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003fe601a7d46sm12369970wmr.45.2023.09.24.05.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 05:06:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 14:06:36 +0200
Message-Id: <20230924120636.102258-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695557198; x=1696161998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sefsAwHwzKQK9FLGaRSxdYqUOOvzmaecTBF3VcVIKi8=;
 b=EaZeAWV92cCrB+FOumsCxlosp5OB9eCq1EiLZtKtrrYk1WvPcIXjFBicHtJWjjAPxd
 Ja9I7VevzCcpvZuJvBpPaxZ2mf05k/QoDCXHfzsMHRCB9uhtlM1UWyrTn5SExegKlnDA
 Hbi1ZGBZ1HrYQUixWfqTbBAARigz2qfacp6NkB+hs2muGJmCebkTTd247SRj9zs3EjbF
 wxUM6IS8ajnKtK/f73f26BjeycAL3EkwqcbVei6H6amv0UvGEHrW/nlWngUfRsIJJHiU
 19ScQNtUu/pLK8TkSOkQHsnhVcQZ5l2WqQ7C3okiDIFu+zVqChkLKFMq+B08yk99hZ3J
 BNCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EaZeAWV9
Subject: [Buildroot] [PATCH 1/1] package/omniorb: bump to version 4.3.1
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

https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.1/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/omniorb/omniorb.hash | 8 ++++----
 package/omniorb/omniorb.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
index f522c1ef67..36db67191d 100644
--- a/package/omniorb/omniorb.hash
+++ b/package/omniorb/omniorb.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.0/
-sha1  c3f12c2278f8c4603910c02c8fe892c1dde7217e  omniORB-4.3.0.tar.bz2
-md5  8889ab13b444b495ca2c2b48ea6a6bd7  omniORB-4.3.0.tar.bz2
+# From https://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.3.1/
+sha1  b6581c9b6a956c1d442c442767b5a58899a09513  omniORB-4.3.1.tar.bz2
+md5  dc3e4467ef3f457025fedcc6403f8f13  omniORB-4.3.1.tar.bz2
 
 # Locally generated
-sha256  976045a2341f4e9a85068b21f4bd928993292933eeecefea372db09e0219eadd  omniORB-4.3.0.tar.bz2
+sha256  0f42bc3eb737cae680dafa85b3ae3958e9f56a37912c5fb6b875933f8fb7390d  omniORB-4.3.1.tar.bz2
 sha256  126647a6ee062fe46f8f3766965dc62e031c0a31238a347e4bc07aab2ac1e2a7  COPYING
 sha256  eaf5b13ffd5355da7c0b83074e4b798152ff7086c95c4f3045122a06e2673eb9  COPYING.LIB
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index d6434735cf..8235fac797 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.3.0
+OMNIORB_VERSION = 4.3.1
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
