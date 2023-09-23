Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79FBCE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 07:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49E29402E7;
	Sat, 23 Sep 2023 07:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49E29402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpIEmzcKM20h; Sat, 23 Sep 2023 07:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 864964023D;
	Sat, 23 Sep 2023 07:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 864964023D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7D51BF3DF
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2505782140
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 07:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2505782140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGSCXz_bWyIB for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 07:21:51 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09FC9820C3
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 07:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09FC9820C3
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32001d16a14so3159210f8f.1
 for <buildroot@busybox.net>; Sat, 23 Sep 2023 00:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695453709; x=1696058509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zhz8gB8Spiy/xIQ6FoEhTVet2bbIRgQZjy4YTVAVCw0=;
 b=B4d4O2VGfcMz9KuJJddDE7eAqFwkMYqwDPuiAOr2YgDfceqp5qyzdij3ISD36YXqBS
 ImV1wSWc/pAY43npw3MCG7w2a4+cxzAtIgw2D4ne9rLjNKq2CWOlyQfqx1PhjB0lYCCP
 WtkJjMiTH3zgIeQ83saV2AmSlHIl8FQxTd//mdgCp1fRufdvVgQTuZmEqdlN4x946reB
 pkjzpwfnXA0lAvzOdgX44Cu7y9kWe4mNyKYlJqXjZVJu6u4dGYj8cWhrkQq6dI9V4WbM
 h19lQU/zX9bN3Acf0MYiWFwU+1kgQ8q5U9bjOkc4bRSlRJOjBlRO06mi6rN2VwdQ2Sf+
 GiXQ==
X-Gm-Message-State: AOJu0YwviXjXogmEdDqktIjfmunLOKHbCWj9JKaOAiPW5ObFeMNrd95r
 RQLTJw5ZqSeg0RfNmWtalsvH3kBRX0A=
X-Google-Smtp-Source: AGHT+IHWDXHYOsR8tGraPEnq3HWodT/4ZM1hpmvSgiNRclu0iGWkvzjVnkRrI30yNEU+L9T9TPqYPw==
X-Received: by 2002:adf:fa05:0:b0:31f:dcbb:f81c with SMTP id
 m5-20020adffa05000000b0031fdcbbf81cmr1535529wrr.10.1695453708725; 
 Sat, 23 Sep 2023 00:21:48 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 d4-20020adffd84000000b0031f34a395e7sm6156999wrr.45.2023.09.23.00.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 00:21:48 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Sep 2023 09:21:22 +0200
Message-Id: <20230923072133.3122644-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695453709; x=1696058509; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zhz8gB8Spiy/xIQ6FoEhTVet2bbIRgQZjy4YTVAVCw0=;
 b=ZRKBcWspxH133KVrW5fQFxG6NqztbNIGgXEV+lChWkl3EMmgzyVoAiyTu9ffhHdoPk
 kiPexmSgkxBRGbvFDunW0Rj5jUsg+J/jak/zW/L+TypNRuJ6MSL2Y4AYRoNn08qoheLE
 j/OqxdPk2NcFMerjzN2fnlootOaWyCZmtDnLyfhw/1KGbAEia4Ke2U1igaAqQm3TVbx9
 sptMRiilyQkr7aFtdne6/6Hn6bbjdJ2KMDuh8TSzxCQ7aO01br+A+BXt3EEMy8bHqUFd
 2sQkt6T97mmUFxiWPzn/BMDGiS3TnqAQCS2XYH8v1zYquuOMCVoaa0CufShhzO8HcEjw
 olQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZRKBcWsp
Subject: [Buildroot] [PATCH v2 01/12] package/perl-class-method-modifiers:
 bump to version 2.15
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

LICENSE: remove trailing spaces
see https://metacpan.org/release/ETHER/Class-Method-Modifiers-2.15/diff/ETHER/Class-Method-Modifiers-2.13#LICENSE

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-class-method-modifiers.hash                      | 8 ++++----
 .../perl-class-method-modifiers.mk                        | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
index ee0f5ec32..e3e88140b 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  b1398e3682aa2e075b913b9f9000b596  Class-Method-Modifiers-2.13.tar.gz
-sha256  ab5807f71018a842de6b7a4826d6c1f24b8d5b09fcce5005a3309cf6ea40fd63  Class-Method-Modifiers-2.13.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  1aea89d0f23c3537580cae549b5c5864  Class-Method-Modifiers-2.15.tar.gz
+sha256  65cd85bfe475d066e9186f7a8cc636070985b30b0ebb1cde8681cf062c2e15fc  Class-Method-Modifiers-2.15.tar.gz
 
 # computed by scancpan
-sha256  d17e5cba8d4039f6973d5873f73b0c8949c1cffb338fafe7a57e972767546561  LICENSE
+sha256  3a4d15d78daa7fbb8b9f90da1b8cb60a6cd5275c6a5fdb0fca5db2e74b522dee  LICENSE
diff --git a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
index ef688acf7..d4a7f11b8 100644
--- a/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
+++ b/package/perl-class-method-modifiers/perl-class-method-modifiers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.13
+PERL_CLASS_METHOD_MODIFIERS_VERSION = 2.15
 PERL_CLASS_METHOD_MODIFIERS_SOURCE = Class-Method-Modifiers-$(PERL_CLASS_METHOD_MODIFIERS_VERSION).tar.gz
 PERL_CLASS_METHOD_MODIFIERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_CLASS_METHOD_MODIFIERS_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
