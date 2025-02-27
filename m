Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC23C19F2E
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 16:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB7F60A43;
	Thu, 27 Feb 2025 16:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlsjKSh4a6Tl; Thu, 27 Feb 2025 16:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C778C6129C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C778C6129C;
	Thu, 27 Feb 2025 16:01:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C85B0711
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 16:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F99640020
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 16:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1-P5SBj2GLK for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 16:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 598214170E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 598214170E
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 598214170E
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 16:01:26 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so151406666b.2
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 08:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740672084; x=1741276884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4y9Sq8/hecTQiZctGnCJEgK3xcdQwyq/d48qEG7uDQ=;
 b=u/6AutzxbuvqCjmhcNe1ohr99vak5fXJWAKwZuF4CtWcTRz5vduAqeJgxzZW7101SU
 Tk9fUf2wWwD0hVtskHnki5aGkU9J1SqPcsXXQttLnRQFRMf9VXGn9/SwKpW+Lc/jyjO5
 y6SIMlCUS5meIo8daTeHKbyuLvPr31bQo0p/ldZV9ddvKutNmoh93+Ku1GnATUiIEZV6
 z8Ymsw3XIH06B8KIU9yJnLSJ79q9uJ3aamsrOdMspCrGJURg6iq4KXdX1Ola2z42G2QQ
 p0Zgvjqu12VFok8Zcxs4yoe2oEi2UP0jiCuIx3ZzYQDX2HI0PdSV2aPtiqQjUSYrp7A8
 5aUw==
X-Gm-Message-State: AOJu0Yz1kLiaTYrfI6c87V2mfPNqqTEUQYPccH6p0oj1EkLoWPRnfXRy
 xP7uRPhR7B6LnTtIp0tvQHpWr6xHgewxWFj3pI0NTGkdgV7b0gLZJCKGoA==
X-Gm-Gg: ASbGncsY7Dw5EjQ8p7YPU84+SGXnYMPlF03jZryYnERZ3prn9FHmzqCSsX4C6Um2+MX
 icKcspqBR7wkDOHAlCpNOY2pWUO3b5M8fcsQim1Sg4hzn/K/+QoBxOk49WDOQIJZYIpxj3Ve0zt
 QDbSd9Rq0X8/VVODg2iTdLlfeCmXONupi/SdFJPGPEuPGKk5vbbLjvvYfFefpy3IdwHuibB3oo6
 qSqK/WNB2jqHD+0ba5kkZvtIjh+B4f3NrHM/ghTQuN6uj85t5NPA8PPglrj5TZeYuLvpBs5o5jm
 ch+O+N+eNN8F5Sech82qM1yqM2CY+6Tc
X-Google-Smtp-Source: AGHT+IELe7KrFB72lMLX23594m9rORp0/BKQ660Q7OaH59mNsCwNNQqeY16vt67juUBSMfjF7TuxJg==
X-Received: by 2002:a17:907:7759:b0:ab7:5cc9:66fc with SMTP id
 a640c23a62f3a-abeeef701eemr1011549066b.50.1740672083769; 
 Thu, 27 Feb 2025 08:01:23 -0800 (PST)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::478])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c7bf82fsm141402866b.173.2025.02.27.08.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 08:01:23 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Thu, 27 Feb 2025 17:01:03 +0000
Message-ID: <20250227170103.902346-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740672084; x=1741276884; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4y9Sq8/hecTQiZctGnCJEgK3xcdQwyq/d48qEG7uDQ=;
 b=hA69BmstKjlI1Yc2CNd3DCP+67OkYXqnVDs5APDw5SjGxIKdWbpunCOLRxJoj+car/
 abM9TGu74UgdV6XSAIv74JZ1mlxtP5a6SzOdcXsyNiwdI6jvxe6BaGvcB2TakONRxnjC
 MHoV+fc2ecHYE3ZS/YYSyQpYeeod57NBCjlG86X0lIVnN6coHvqU6RZYh+Mvp3yay75u
 tYvk1OFHHct+0IiUNbsQcN9CSuqmmG47VRRHZ5F1iQdViZ+ROyROIw+7gvTsWIV2UOXz
 Dsm0R6dHtOMy1JDW2DP0freWf6s4TyWHVGj2fbNmMMOY+46XR73EsOylNErhbEuKQ2La
 WiLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hA69Bmst
Subject: [Buildroot] [PATCH 1/1] package/slirp4netns: bump to version 1.3.2
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

Changelog: [1].

[1]: https://github.com/rootless-containers/slirp4netns/releases/tag/v1.3.2

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/slirp4netns/slirp4netns.hash | 2 +-
 package/slirp4netns/slirp4netns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
index 1a6a657066..1751566185 100644
--- a/package/slirp4netns/slirp4netns.hash
+++ b/package/slirp4netns/slirp4netns.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a3b7c7b593b279c46d25a48b583371ab762968e98b6a46457d8d52a755852eb9  slirp4netns-1.3.1.tar.gz
+sha256  c98ef2679c7b8c96eed95409138a22904a0550494d191385637e953534d15c75  slirp4netns-1.3.2.tar.gz
 sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
index ce8ea34f2e..ffcd334ab6 100644
--- a/package/slirp4netns/slirp4netns.mk
+++ b/package/slirp4netns/slirp4netns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLIRP4NETNS_VERSION = 1.3.1
+SLIRP4NETNS_VERSION = 1.3.2
 SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
 SLIRP4NETNS_LICENSE = GPL-2.0
 SLIRP4NETNS_LICENSE_FILES = COPYING
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
