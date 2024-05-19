Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA28C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 17:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D03402EC;
	Sun, 19 May 2024 17:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDqkyQAEVMHo; Sun, 19 May 2024 17:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C50B94032F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C50B94032F;
	Sun, 19 May 2024 17:30:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C53311C40D6
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 17:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFD306064F
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 17:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZlbyo3UiuRc for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 17:30:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EE59605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EE59605E1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EE59605E1
 for <buildroot@buildroot.org>; Sun, 19 May 2024 17:30:02 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4200ee78f35so10570955e9.1
 for <buildroot@buildroot.org>; Sun, 19 May 2024 10:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716139799; x=1716744599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l00OoT0ji4pCD1J6NzW1HVdw3ruV2WrhiZIBBgw0Xw0=;
 b=dk72z35wOu06yjx9fTRp/+K1nuOYeyunc4qrE98fs68ng+6h5BBzIlozU2Q2z5ks/N
 33sFgnY5Rbg3un+OaSSyGL1s85c/N5Im/K5vRQAmQzmqZ3F09k6t/FvQRYnwwJGccoqZ
 MbRr+m2aNG8o+5rExJVGpfljEC24pVva8MRA74OaIuKkiq2ufvVSasPYMmaSRzLQn7Hk
 t2zI1zi1LjdMar0xiRRHwn44IBcXf/EwlwUQ5Essjkej3Vvipfhmujysvi4zHE+2tMqi
 zf+RM3jXjlTzQjbXfJap2R/fMrEq0p2F1jq0lE2m5XjLDJinukw/HkgUTPxG/ySJTnVB
 KIhg==
X-Gm-Message-State: AOJu0YySz2WvxTJnSALbc6ljFVCyurx56UnlSAJPahLCDxBbyCNatwRf
 8rLQFs73EKrfr4nFLENciRBBBOp54r9nKQLiw5pcfB0ZdE1xpkLI4DaREg==
X-Google-Smtp-Source: AGHT+IFiOoQpYX/numt+x/EVhv7YpAwdFHyhYcPVn7GjV6nQ9Us/gSK9tCC1FootjrHTk8u8XerYSQ==
X-Received: by 2002:a05:600c:474b:b0:41c:13f6:1eec with SMTP id
 5b1f17b1804b1-41fea931ffemr250223015e9.3.1716139799044; 
 Sun, 19 May 2024 10:29:59 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42028c7730dsm150056945e9.25.2024.05.19.10.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 10:29:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 May 2024 19:29:55 +0200
Message-ID: <20240519172955.457904-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716139799; x=1716744599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l00OoT0ji4pCD1J6NzW1HVdw3ruV2WrhiZIBBgw0Xw0=;
 b=a7ki9p7klhvTAZBLKI4z8mMXX63Tlu5k+S8IOXvwi15aoquqKg9ed+UWCWPfHgFBsu
 UvylXZtL7sQo1+peGvrCEqUdp8iLURbrdtneBq56RFV+8D7QVuI1/Ovfrw2itFDuiPIu
 rhoykArFx3ny7fFDEKfLrD6LqauzsD8X7+d+ZYKLC94/BHFdYH4phGHa/g3y7WxpX4o4
 STkZ8uFCQut482QQIsCnxW3MBpdMiEcjxFNxKlioM7HvH2jKA7G9MimQRbesbqbBoErK
 +7QkV5BWNgX+L9iXYAAss/m+VpsHWCR3ZMc+M9ST5Uv6w1+eY35VZUuAba4zvn8/vPB6
 zSKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a7ki9p7k
Subject: [Buildroot] [PATCH 1/1] package/ruby: security bump to version 3.3.1
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

This release includes security fixes:
 - CVE-2024-27282: Arbitrary memory address read vulnerability with
   Regex search
 - CVE-2024-27281: RCE vulnerability with .rdoc_options in RDoc
 - CVE-2024-27280: Buffer overread vulnerability in StringIO

https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-3-1-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index c729c59453..4ac6200bca 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/
-sha512  7959c5753bfa0bfc4d6d74060869aabbe9815c1c97930659da11b917ee0803ddbbd80e869e00c48b8694b4ba48709c3b6493fd045568e36e902616c35ababf01  ruby-3.3.0.tar.xz
+# https://www.ruby-lang.org/en/news/2024/04/23/ruby-3-3-1-released/
+sha512  c58e9be9b5ab48191fbf7d67e13f0ec42ee71ed338170e0f7b246708e9cfc617ce65098f5ce7ab32d4305e785642d3e44253462104d5b9c4abcb1a4113f48347  ruby-3.3.1.tar.xz
 
 # License files, Locally calculated
 sha256  e849b28d324423e636a3e6bc5d583cdaf4bd046c2b20872c53886b612d01a4a1  LEGAL
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 00fa0e0f65..fcc637c5ea 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.3
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
 RUBY_VERSION_EXT = 3.3.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
