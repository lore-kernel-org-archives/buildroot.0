Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F591C6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0371416DC;
	Wed,  3 Apr 2024 08:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTpz1wCOumy7; Wed,  3 Apr 2024 08:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BB2B416D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BB2B416D7;
	Wed,  3 Apr 2024 08:37:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2A711BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FE1E82027
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1tlt6-JHzdF for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:37:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 181F982022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 181F982022
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 181F982022
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:37:04 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56df1dbb15dso1847949a12.3
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133422; x=1712738222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UTKGby57RP1yOeVoT0lp0EZ3ukjKMUmneWo8F2GCWB0=;
 b=hgSyt3pJR1edUoLC9ByRHxG2ELyykbX3jeXqIulZVsaUb8rRpufpsU8hLB5ZzgzVp5
 zZUQZa9xXmIkxl9eofBeMYiKimwzNWcPoTEqcrZhURkEOk0tcCK9LKLSG/+TfWgQCtnC
 Br2l9eGiFGcKT8HDzDXSUEkRxMXm27pBPeDdh1HIPSehkPeb/VZ0mxk7pLU0NEBKmn9U
 +qqfy38KW09HhffZJ7bgxGBve3GWd2a7eX/dET1UFKlNmK5T2Z/KMMOPcmvP2QCSnq9Y
 atBXrdrhQjcIaL8/DgNQ2KSS0QqtcbrUEKueMlIgRQyfqdY56brtT+Fq/nYa2aqt2Suu
 sVSA==
X-Gm-Message-State: AOJu0YwKlahQJOULjuHInuUWyNzZ5TKGHT+XgRbjvGtbytXf0DY351MX
 1lzPdPbT1gkbKGXGZ5YYaXASiDQYjxOJ7cbKo3m8GPp32EJ7Hxii7f5nkqnZZBzMklbADE6/pLA
 =
X-Google-Smtp-Source: AGHT+IGeSZfGDWvYksZ/ASwIIjDGlC6gyo9cCvmrR5tUKevIVUfmeoqjdGR1PUf8C+EYQHSWQ6cH1w==
X-Received: by 2002:a17:906:c2ce:b0:a46:4d76:106b with SMTP id
 ch14-20020a170906c2ce00b00a464d76106bmr9922610ejb.34.1712133422388; 
 Wed, 03 Apr 2024 01:37:02 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 l13-20020a1709065a8d00b00a4df251a601sm7537259ejq.77.2024.04.03.01.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:37:02 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:36:55 +0200
Message-Id: <20240403083655.512238-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712133422; x=1712738222; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UTKGby57RP1yOeVoT0lp0EZ3ukjKMUmneWo8F2GCWB0=;
 b=I+aVpDq6ENZp5nc4D0kmz9fIABWbPFW4fSbkUWPn93clCmK5oypJFRJgp91osXyFnf
 tnTRCzjfn7+kPij9NqY+Ae12RVHRHxA58PFpCQ7Zj6UBysPipdXvfHxRYXLwGamzAEXT
 mhpCGy81l5PQmf7JtVECjfBaNaaRnBNDZ0RwFQjaw737YA69k93h62EPlTLQ+gEumbZP
 9KNRD1yWaE+21abFs9R8j+WMAnxJFfyOR7j7RDX9JN/r6w+zY3DINcM9g5+ItM5USgCV
 f295d/AigU3aAh3tntCMFeLz0wVBuSHdQzxS1eFn7RpnqQMl3Ed3mXDB6kp12oAaj/9K
 j1/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=I+aVpDq6
Subject: [Buildroot] [PATCH] package/fakeroot: bump to version 1.34
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
 package/fakeroot/fakeroot.hash | 5 +++--
 package/fakeroot/fakeroot.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 5e7b6af94..a148de676 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,4 +1,5 @@
-# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.32.1-1.dsc
-sha256  c072b0f65bafc4cc5b6112f7c61185f5170ce4cb0c410d1681c1af4a183e94e6  fakeroot_1.32.1.orig.tar.gz
+# From https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.34-1.dsc
+sha1  aaa6bf0158d886e0093effc0e9422717d5c60eee  fakeroot_1.34.orig.tar.gz
+sha256  5727f16d8903792588efa7a9f8ef8ce71f8756e746b62e45162e7735662e56bb  fakeroot_1.34.orig.tar.gz
 # License files, locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 1a0ad70c1..1a0996ca1 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.32.1
+FAKEROOT_VERSION = 1.34
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
-FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20230724T160429Z/pool/main/f/fakeroot
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20240401T084438Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
