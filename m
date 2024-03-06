Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94278C54798
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 00:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28324600CD;
	Wed,  6 Mar 2024 00:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_-y9FyXozgf; Wed,  6 Mar 2024 00:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2648F605F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2648F605F5;
	Wed,  6 Mar 2024 00:35:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 926AF1BF3EF
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 00:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 800FC40441
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 00:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5YJW7ufrj_V for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 00:34:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96ABF40156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96ABF40156
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96ABF40156
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 00:34:59 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-29a940614easo4229683a91.3
 for <buildroot@buildroot.org>; Tue, 05 Mar 2024 16:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709685298; x=1710290098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lwfAhpkyjyijS38OghrrZMEZoWYSIJ4IQ2JMMcBQvqU=;
 b=MZJs+ObHY5Um7L3vUSNPeUgLZdIlfPWwoseenpNmxgQ9iQLs1B9Ps9caFyT6yfbCt5
 hLr59mvO1v7YWUhVoQVENiYoOqYnEKKALjPvJeKcJax1wzp4bbobAmIubmYjfTQDB4mx
 1g1RLmAdClK1prraEdbSzO26vs3SzdfmyN5B9dEGY8zGjOKthU+Ltb9EDcxMtjoWTDo+
 ykfFZiuq3/G4+dLxIRHEw1vnefo7oQx9dDmsRUQ463Ii2XrqXhI2Sj/Sp6O/xOBWc733
 tbPhVMMnzqYKqB6g8ZgvA09mHo1OWvug8kaXQTZEWEITOhrq4Ei1BzY3F7/c0ED5/doM
 sY9g==
X-Gm-Message-State: AOJu0YzaUoxsuKyYzGkTXN/yS8KG8M8fT0Yon+oXmmqkKe7ip7d6U/8Q
 mzxmm9dq+6hVWzs2uFkU+rOtZ53UpxM5AxQH2ZBqA235X3VyOu3GtHx28tfjzCbzWTUvmKr6vHJ
 c
X-Google-Smtp-Source: AGHT+IETh0HusYrhye1MjkSQvv6Eo6ORSoaXdabh1cvdTbb3tx3Tvb48BgpEBanzQYoKbLlnHNOwIg==
X-Received: by 2002:a17:90b:4b8d:b0:29b:7386:91b4 with SMTP id
 lr13-20020a17090b4b8d00b0029b738691b4mr735242pjb.5.1709685297827; 
 Tue, 05 Mar 2024 16:34:57 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 qd4-20020a17090b3cc400b00296a7ac8b5fsm12422313pjb.6.2024.03.05.16.34.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Mar 2024 16:34:57 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 16:34:54 -0800
Message-ID: <20240306003454.13352-1-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1709685298; x=1710290098; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lwfAhpkyjyijS38OghrrZMEZoWYSIJ4IQ2JMMcBQvqU=;
 b=fYgpWDnwExDFBXy99Zza9pn3oy2KYaIQ5x/5oXIwJon2cwKUmHGHgVL6LmEUCUthCC
 8L+2cTnWwoELZnNdkYJE00jQrxKAzUvbMU4PZO1X9aldJeQwMu9PL97pCq+hou+zKyoN
 keYD8d/t16TpmKmv7urIwR1/3YAUBUlUNuC+HbA7P5RKZxrc2UQoOZO+w73iZ+1nio9w
 PQZjnsJ59sNBXJZDXyqcNBJriWJfUu5k4woA7KSDrTBLMCndL7o3OOtRRVotYXFVCqP4
 0xe3s5PwuZemNXHD7oFUz7Oonebj2IVWqFuSArkneZT+Th/7RxX2SNzSj8yeSikHIdKN
 VIJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=fYgpWDnw
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to go1.21.8
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following CVEs:

CVE-2024-24783: crypto/x509: Verify panics on certificates with an unknown public key algorithm
CVE-2023-45290: net/http: memory exhaustion in Request.ParseMultipartForm
CVE-2023-45289: net/http, net/http/cookiejar: incorrect forwarding of sensitive headers and cookies on HTTP redirect
CVE-2024-24785: html/template: errors returned from MarshalJSON methods may break template escaping
CVE-2024-24784: net/mail: comments in display names are incorrectly handled

https://go.dev/doc/devel/release#go1.21.8

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index d008019e94..b1aed10c7c 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  00197ab20f33813832bff62fd93cca1c42a08cc689a32a6672ca49591959bff6  go1.21.7.src.tar.gz
+sha256  dc806cf75a87e1414b5b4c3dcb9dd3e9cc98f4cfccec42b7af617d5a658a3c43  go1.21.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 9efd4a3123..3ca055b25d 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.7
+GO_VERSION = 1.21.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
