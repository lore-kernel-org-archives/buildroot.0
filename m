Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A2AE77188
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 01:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D02CE60596;
	Thu,  9 Jan 2025 01:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcBajeNZIzLN; Thu,  9 Jan 2025 01:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A3F7605C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A3F7605C3;
	Thu,  9 Jan 2025 01:07:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34CB47AA
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AF6D60596
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrrQGhZXX28g for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 01:07:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60ED2606A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60ED2606A7
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60ED2606A7
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 01:07:28 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2f43d17b0e3so721053a91.0
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 17:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736384847; x=1736989647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KY5vIyJSGeXHn39PzhD6gOssLYsUMVBq2IcLEPET6c8=;
 b=knm3B3AXIuRFMMKEWJrzlk6N3NxnZoyvjxjpaiKx/BUkIj8qWHrXdqO5uDD8vj0TxZ
 OliaXK+Z8bBIZc1rXMm7v+kGvN3soEKoRZ9T1KBzcowgau8SX5hVBbqBJbuVNw3FGwOF
 JA/sSt/V++0O2CBBxWJEbvxJBlM48rjToRHng4IMPqD37YH3HMfKEfF6S7SXavwu741u
 nqVYjDj73ZgcuYXxX6guNV2zLtrQbypxoUJ9lLDD/n/a/FzlYfwkVqdvOiFZI58srA/W
 1UlBlyRWTjsR8XE+jyFvMWzPOYyMYlmzEYxd/H+cBNejoOnmh61Rv2HDQ0F0fV+fwocK
 x20w==
X-Gm-Message-State: AOJu0YzTNDa+NvdU49Jr538bCS5hC11K/RYogaqKo0+wC1njGxH6dzoE
 x4CgCune8uUMFc+sLXR7wclXvhqRHf1pxeFsfxJ/KOd5q0GkslpaS2gXow==
X-Gm-Gg: ASbGncumSD0+MChScrdQjT6f3qOebYi+PxcKkljiypnDy8dpHuBniW/gRMWTPZNNrvD
 8dn8BaGIiTTUus1FWzVqPftoPFz2+6SifhReAIz/CYJPzbvR5XHcce1cVkzugvkmI+d9hbFoMLG
 svu4hRqtvtMVcgR8vti9zpChp1IKsZq7MdYeXk1808TSTVP9VaxVd111dB8Bke1AYtJMpmxembS
 sviKp/FwK6Wj2MbIDts+LguWULis5tOBAFi3otrsh7q/E/Onc6t6rjMrb2BIDOTHRbocuC9aSQQ
 8ylpr48rHk7zRv1oQ/cc8WYcykjDo2uSbdoH59/S
X-Google-Smtp-Source: AGHT+IHAvgSa8BShd1WlzcBdtqvSj4Km/nT1KVsVEfl3w6gbG/u125DPGoXOUX6N++zud8RGs0wE8w==
X-Received: by 2002:a05:6a00:3996:b0:725:ffe:4dae with SMTP id
 d2e1a72fcca58-72d21f63618mr6721960b3a.10.1736384846566; 
 Wed, 08 Jan 2025 17:07:26 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8dd1a8sm37190268b3a.106.2025.01.08.17.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 17:07:25 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Wed,  8 Jan 2025 17:07:21 -0800
Message-Id: <20250109010721.25290-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736384847; x=1736989647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KY5vIyJSGeXHn39PzhD6gOssLYsUMVBq2IcLEPET6c8=;
 b=GC9p2W8Q+xN+g0csk3ZPn7p59XYlY3W7v9a3jMtopYKsDWdcAYjOhGh3URm55e/GBR
 xsXKo0lt77U39/CegPTU/n6abvglQe00Ayl0pDDscLNqIcehCvJmMdE16l7Wh5aa9IeD
 0aQVg81EmwX5jTFmx5HLCPU0t+7mxtA9wy96V8kV4XIo9xQrEMnRqwODQs3TJlTX6GxQ
 B6kiq0FhMaMkpKYWUEuCWZtRAFXEftq8PNa+Sm9lNLhLSNkgiyaRQVEQPOgTTz+Q55Qj
 QYVRV1DBjX2g/+3w5PikJRdFCsqzBWMVKRDZWSoIOdv43v+m6TzJigEMOUat8CNc2X2X
 0w/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GC9p2W8Q
Subject: [Buildroot] [PATCH 1/1] package/smartmontools: bump version to 7.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.smartmontools.org/browser/tags/RELEASE_7_4/smartmontools/NEWS

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/smartmontools/smartmontools.hash | 8 ++++----
 package/smartmontools/smartmontools.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index e48e955d01..a61aeb9381 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.3/
-md5  7a71d388124e3cd43abf6586a43cb1ff  smartmontools-7.3.tar.gz
-sha1  5ce7adb606119148d725b91a00652d427ca0adc2  smartmontools-7.3.tar.gz
+# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.4/
+md5  178d31a6ff5256c093227ab45a3f52aa  smartmontools-7.4.tar.gz
 
 # Locally computed
-sha256  a544f8808d0c58cfb0e7424ca1841cb858a974922b035d505d4e4c248be3a22b  smartmontools-7.3.tar.gz
+sha1  b0d7c9ca80768059607b92bf4e373e2822300d3f  smartmontools-7.4.tar.gz
+sha256  e9a61f641ff96ca95319edfb17948cd297d0cd3342736b2c49c99d4716fb993d  smartmontools-7.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index d24f008df4..18a1417681 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 7.3
+SMARTMONTOOLS_VERSION = 7.4
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
