Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4E8106ACD5
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 17:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD23A6060C;
	Thu, 12 Mar 2026 17:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dwxx2cmRuj7E; Thu, 12 Mar 2026 17:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF0D26061E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773337046;
	bh=zMHoc9pvE1XbYY7xM1smE8n54q8OV0HJCLpzcbx2v2M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eSKyzsL09r8sSkac/sX04ZWE3xHLwa5cLiFAq27HdjJosNCHOAd/C8t7DvP9MlIUN
	 7Y1bL0epP5FqUVvXbIw+VH/RfoHopzJWn4zC5C6Y6DQZujaQEM0fWR8ddHhEkXYcMY
	 y1vktZ5aL8vUuH7Hcf9BKp+sRRVQHtDI9serkjMB7bAdV3Yu2OO5APzgMH5d7wQkpc
	 Amd0w0JsIOasc4hZH71CJF5muh8S0yMgkgj1lYo9QuJHz+opMfn1Y6wSQegHHKLsZ/
	 QbDnQ1MdmKM9820nhxp1Qsagg1FOs6bEiMz9JnMXXyoG8cVF56jKlx1uooL6I9SUJn
	 WO5pYaXwY4XCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF0D26061E;
	Thu, 12 Mar 2026 17:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A651786
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 17:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C98940581
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 17:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFscRCrFUPCW for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 17:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=william.sherrer1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BEA54057D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BEA54057D
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BEA54057D
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 17:37:24 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-5090c7e9081so11822331cf.0
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 10:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773337043; x=1773941843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UG2XuMFf9PtDp20opDW5YTjjgqLv39tyJRpD406Kt/s=;
 b=fLwCr8JvaKnt/xScdxZ1ai0rzfaytleXNogrLsAsSyeBHz0yTZnKnhdA7c1VAEqIL9
 y0Q+sqRw1WuLlMUrSQVzpsWtCDIh5YsRnRqwxjSRGTy7aRhIJ2Q9dUuNGZgG+SiVvEne
 9dQOFmpylr8HJcDsJPsQ8GsdzcaP4y/gztitKeuVANlg3vh+TVWMtFMVph8TCoBcBUnJ
 uJvCgcx9wP1NuoFPpmbf3IscknvkDfepeKnYBjyi7krQRgrraaJ6YWK/EwKW3pK/hznd
 Gu5sABZ++cjBwjRlV+W1UDzDmMJJdk2u3ECh8akcz3g/zFwMew72JBYluata6zf1ptzk
 SQZw==
X-Gm-Message-State: AOJu0Yz/0HMXoG1T43ZgUV3JE6CQu1UuzMgabc8aAcB2j+XCkhgzAr0i
 Q/JVIBXnkXJXLx2/2toQEHemIbjNQM9S6CQ2Sl3RrzeE7IYk7Pi+/O2slJE3T2yNyWxFKg==
X-Gm-Gg: ATEYQzyaYSzuetU92ohOtAnXsba7xZYzlC+fSnJUVwzDG25y9IKUBpHS5Ln1owypR9B
 33DKVAE65usmpflUL3nfoxSjwI+ExU+bdivolEwC+NdqaaxTC553Zeh87DwDMjo//nvIBvCZ0iU
 3BVe5G1XXq8H/MyqB3MnqQZ8MLgRjWFoitVi14hn0VCOiQJpGA3J769o4qXE9OpkAnECsoOAWUm
 iZ+DECdcIvHKJtXALm8QsualNshxVNiyWAzZtLZM34t7QISXTOzaSCEk+vwiS5KnZ/Bwz6q9kFP
 JCF4shLjdSHzwyk9PEG74FSn1NJbE1E39u1spOKyVz9t3MPhcCnNjiE0ViqbvqS0plvLo4aMR9H
 J+3AgwS4Y5QVCfeEAHr1TAojl7X9lcUGFYSIfCxXZ1vgneEn6UGtdQKHc5NTrEQpl6V9FkQABzu
 3T578PuglrAhVC/Zrrs5/I0M7RLRKCGNM=
X-Received: by 2002:a05:622a:c1:b0:509:49cf:cb07 with SMTP id
 d75a77b69052e-50957d8da2bmr4344861cf.33.1773337043545; 
 Thu, 12 Mar 2026 10:37:23 -0700 (PDT)
Received: from scooby.. ([2600:1004:b268:c064:b975:8d38:3aef:46eb])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5093a0ea844sm44441761cf.17.2026.03.12.10.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 10:37:23 -0700 (PDT)
From: William Sherrer <william.sherrer1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 13:37:13 -0400
Message-ID: <20260312173714.1428063-2-william.sherrer1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312173714.1428063-1-william.sherrer1@gmail.com>
References: <20260312173714.1428063-1-william.sherrer1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773337043; x=1773941843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UG2XuMFf9PtDp20opDW5YTjjgqLv39tyJRpD406Kt/s=;
 b=mJfp1W59d3OybxClDGz9r9Bo8Ve/JR94ZrKvyI5OyIwj82sJfhtufUoN828QxXPAZ9
 GrMl8JD+QcqBp9foVRS8Tj+A2fCwzZ42P9Tq3RoZW4nNbYvml6UkfopcBU0clI039smU
 YH9Ih6DrFgPRcKH5LCtyHpsZlw+dEhjb5J3U171qPx220K70hnD7Ro1vIbS6A3dwLp7t
 N2RA7XGfjSIV2cNLNMxsTx2684esbOU0bKmo5QWr/fu6jL5KbIowgoiXUtvzx9vgkgeX
 QdQqrAYre6dreKE3YzNLMHg5cTdLdO/VfpqEyygKxsIcssYjHbvsjf1lzPvm9mExNJ1E
 LqXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mJfp1W59
Subject: [Buildroot] [PATCH 2/2] docs/manual/adding-packages-cargo.adoc: add
 instructions for offline vendoring
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

This commit adds documentation to the cargo package infrastructure for offline vendoring.
It provides an example config for a user for what config file they'll need and where to
install it if working in an offline airgapped environment.

Signed-off-by: William Sherrer <william.sherrer1@gmail.com>
---
 docs/manual/adding-packages-cargo.adoc | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.adoc b/docs/manual/adding-packages-cargo.adoc
index 4df758537b..f966a1497f 100644
--- a/docs/manual/adding-packages-cargo.adoc
+++ b/docs/manual/adding-packages-cargo.adoc
@@ -54,6 +54,25 @@ It is still possible to define custom build commands or install
 commands (i.e.  with FOO_BUILD_CMDS and FOO_INSTALL_TARGET_CMDS).
 Those will then replace the commands from the cargo infrastructure.
 
+When building custom cargo packages in an offline environment, Buildroot will
+attempt to download your dependencies from crates.io by default. Buildroot builds 
+the package tarball with everything needed to compile the package offline.
+However, to use an offline crates mirror or registry to download dependencies,
+add a +config.toml+ pointing cargo to the offline registry.
+This file should exist in the +output/build/.cargo/+ directory.
+
+Below is an example config using panamax as a mirror.
+
+----
+01: [source.my-mirror]
+02: registry = "http://panamax.internal/crates.io-index"
+03: 
+04: [source.crates-io]
+05: replace-with = "my-mirror"
+----
+
+This config will need to be installed as part of the build process.
+
 ==== +cargo-package+ reference
 
 The main macros for the Cargo package infrastructure are
@@ -96,6 +115,4 @@ the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
 the package's tarball doesn't only cover the source of the package
 itself, but also covers the sources of the dependencies. Thus, a change
 injected into one of the dependencies will also be discovered by the
-hash check. In addition,  this mechanism allows the build to be
-performed completely offline since cargo will not do any downloads
-during the build. This mechanism is called vendoring the dependencies.
+hash check. This mechanism is called vendoring the dependencies.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
