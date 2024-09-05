Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5DBCD4F5B
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 08:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E1CE405B7;
	Thu,  5 Sep 2024 08:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7euQXSfuCjX; Thu,  5 Sep 2024 08:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 188BF405F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 188BF405F9;
	Thu,  5 Sep 2024 08:57:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 469841BF980
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 318FF81433
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 08:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbD4iPhUSm1b for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 08:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E169381354
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E169381354
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E169381354
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 08:57:18 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2f3fe9c63a1so518651fa.3
 for <buildroot@buildroot.org>; Thu, 05 Sep 2024 01:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725526636; x=1726131436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9qgQYXYf9NWGVxmOYNzIyzX02zzPRnsixqbnwiBPng0=;
 b=iuVACwCt6PDjk1BqTxVDM1HxVKqiuHL3wOcVSSRI0i13U559b8vcubE51n2mezRcO9
 KHSJFiAQD+zH3igaT0ffmGxD3ddOZP2kvNBi2SE8BnrQoDHfyl4Ecb12WIggVIwloA84
 /OkdCpiQPimLQRHlAD5yDADN2v3xdwX03liw0pl2McsBc0mc8nCsZG6YZnwa4ROOa1H0
 cC87sQ0dddCGg34NCpVzvyV/00T8rDqYf8jq6VjeyOIhnUsrgp/iY8v1VN8/8Po0sjxR
 SX+XtigkvYEQRqOypFZlzTnJ0xvE/h8RiPnp3DtAjicYndX7Xcz9qjsPErdyhyjeilol
 rEFg==
X-Gm-Message-State: AOJu0YzlXpcmzURJktyVcVjVAlFpqLU2ogL4OPNM5ARBP+6Jz06yMFYM
 /JOsJwP78vZC1WUWyQc6cK1gGXjDOsslebZut4WjjN5CbSiCqxw7ghuIIHnW2ES8Bg7ahK8vT1s
 avhJuzTGR
X-Google-Smtp-Source: AGHT+IG4AtEqjoQdDYdlodmqcZpX/lR+Dix8DdYKpWugZ/sk+HPFeTPVDt1H+z/ixjq/UwviZ6gxHg==
X-Received: by 2002:a2e:be27:0:b0:2f0:1a95:7102 with SMTP id
 38308e7fff4ca-2f61e0aba23mr77190721fa.6.1725526635528; 
 Thu, 05 Sep 2024 01:57:15 -0700 (PDT)
Received: from adam-laptop.arnhem.chello.nl
 (2a02-a210-041f-3480-432d-2b48-7707-30d7.cable.dynamic.v6.ziggo.nl.
 [2a02:a210:41f:3480:432d:2b48:7707:30d7])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc699e68sm941429a12.62.2024.09.05.01.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 01:57:15 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  5 Sep 2024 10:57:10 +0200
Message-ID: <20240905085713.383116-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725526636; x=1726131436;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9qgQYXYf9NWGVxmOYNzIyzX02zzPRnsixqbnwiBPng0=;
 b=ZnGbRitkwPf0vcw++PvBVlN7hz5M1GHpKLh6pcvNhBTK6D7v7CGyr1gAUX4kzwf3h9
 2Wx2sq8laZfhknVsufIRhe1rAP7IfIFvYRjy9ubmjlKlcpfSyXdayco8lVECifa4MP4l
 yPdgzx4JeeZs0nPvT6v+Srhk3nh7o+0hJKW/4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZnGbRitk
Subject: [Buildroot] [PATCH 1/4] package/depot-tools: bump version to
 62fc3a1d244368a430ffd7a6b55377a6dfd5e348
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/depot-tools/depot-tools.hash | 2 +-
 package/depot-tools/depot-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
index 5e172a9a9a..1778b02494 100644
--- a/package/depot-tools/depot-tools.hash
+++ b/package/depot-tools/depot-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c085a4bc561c90555555461d5810dd406e723618313f24eb2161421f9306b498  depot-tools-75932421da2cd8b5807a4ac52ed2a6f46d7c2120-git4.tar.gz
+sha256  904c266a5c5a96c756a1979990159b86a9bd60916782202b3791d32788cbb881  depot-tools-62fc3a1d244368a430ffd7a6b55377a6dfd5e348-git4.tar.gz
 sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
index 0d7048b8eb..e0c3842cd4 100644
--- a/package/depot-tools/depot-tools.mk
+++ b/package/depot-tools/depot-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEPOT_TOOLS_VERSION = 75932421da2cd8b5807a4ac52ed2a6f46d7c2120
+DEPOT_TOOLS_VERSION = 62fc3a1d244368a430ffd7a6b55377a6dfd5e348
 DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
 DEPOT_TOOLS_SITE_METHOD = git
 DEPOT_TOOLS_LICENSE = BSD-3-Clause
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
