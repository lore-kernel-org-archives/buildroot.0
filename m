Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E183CE6F091
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85FEE40570;
	Fri,  1 Nov 2024 21:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nb5oAFhAP2Rv; Fri,  1 Nov 2024 21:39:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 382D940327
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382D940327;
	Fri,  1 Nov 2024 21:39:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0181112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDD4A606BE
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwejmUHm_WcW for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:39:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5523C605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5523C605D8
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5523C605D8
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:38:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d462c91a9so1464972f8f.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 14:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730497138; x=1731101938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eNJ08VM+aV1eTNqhl5ctX4fRWG8zohIFQCoDnyMzTUY=;
 b=m2xBX/eZu/+0Ue4fGZfXa3ePOVwAanhqSIKvhHxctvAmAwNrp3zq092dgaPH4HVMPS
 Pz5Pnq1ia4hs7RDmJlxpXmo8Mxze/SOnXF3sLw1J00y2UkZ+AlNW/3ZQphiTkQEkNzND
 YEICubgopqK9E2PyyS3ahzDRGeBEp0KMhtRLrsFFk4fPJW2QXqb48ChYrh8zihXDSCuc
 tndPJjdUdyxUs51gUUG6IYKhdHPpr0BtOLP8HeAyog5Q9yqHGWqSn/Fu48nZN7ipG0hR
 yU5BllTOzwxPxJi+u1hi8VreK12E6+l2BSRhU3tEacZY4bTJ0zUtmsszG+DehCVrcKuP
 QeFA==
X-Gm-Message-State: AOJu0YyZg1PjsVqPPyP1chhHMx+Erk0VQP2PjT2qGTClwVjUlSdHv033
 k8SL3VNAiR5xk8vy1kGzgbFZ3D+CZbpafJUIeGsh7BkV8Zow1Ht7cqQsejFws1w23teQB01IhgC
 m
X-Google-Smtp-Source: AGHT+IFhzHJxouks6uhY8Ehsb81oK+Puh3iRAfZFWZkcIGOIZycq6l3+qmgpyYqchULUusMxGNnObQ==
X-Received: by 2002:adf:ee4d:0:b0:37d:45f0:b33 with SMTP id
 ffacd0b85a97d-381b7056d6amr9441106f8f.9.1730497138023; 
 Fri, 01 Nov 2024 14:38:58 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7e2dsm6225753f8f.11.2024.11.01.14.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 14:38:57 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri,  1 Nov 2024 22:38:55 +0100
Message-ID: <20241101213855.3427509-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730497138; x=1731101938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eNJ08VM+aV1eTNqhl5ctX4fRWG8zohIFQCoDnyMzTUY=;
 b=KQn/Vv/vpF3lqDzqOjXkVCtVIc5xGrMy2unszxHfDqPkYTNRo3Q9w78YfUSjfd57ty
 VMgrvmijknQdjFll/Z5KLTXtNbUUeGFj0Ia2Tk1xPWxb6SGV1xoHoW71zWOTZ/Ld4WM/
 nqROwTNqayZYOlVoklNCMs8aBCs3e3F/SYExI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=KQn/Vv/v
Subject: [Buildroot] [PATCH] package/rust/rust: remove Cargo.toml.orig fixup
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the rust package was added in Buildroot it was using
the 1.23.0 release [1]  where some vendored sources contained a
Cargo.toml.orig file that caused issues with
support/scripts/apply-patches.sh used by Buildroot package
infrastructure.

Since then, Buildroot is now using rust 1.74.1 (2024.02.x),
1.79.0 (2024.08.x) and 1.82.0 (master) where vendored
sources no longer contains any Cargo.toml.orig file.
So this post-extract hook is no longer needed.

Moreover, since Rust 1.81.0 are present in
src/tools/rustc-perf/collector/compile-benchmarks/<vendored pkg>
where there is no .cargo-checksum.json file.

Since then, the sed command fail and stop the build:

  sed: can't read [...]/host-rust-1.81.0/src/tools/rustc-perf/collector/compile-benchmarks/serde_derive-1.0.136/.cargo-checksum.json: No such file or directory

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8232367821

[1] b50522d838d8ddfef80bf8036e511319982da16e

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Note: Rust package was updated three times with this issue
(1.80.1, 1.81.0 and 1.82.0).
---
 package/rust/rust.mk | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 802aa0f413..29c03594d2 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -25,22 +25,6 @@ HOST_RUST_DEPENDENCIES = \
 
 HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
 
-# Some vendor crates contain Cargo.toml.orig files. The associated
-# .cargo-checksum.json file will contain a checksum for Cargo.toml.orig but
-# support/scripts/apply-patches.sh will delete them. This will cause the build
-# to fail, as Cargo will not be able to find the file and verify the checksum.
-# So, remove all Cargo.toml.orig entries from the affected .cargo-checksum.json
-# files
-define HOST_RUST_EXCLUDE_ORIG_FILES
-	for file in $$(find $(@D) -name '*.orig'); do \
-		crate=$$(dirname $${file}); \
-		fn=$${crate}/.cargo-checksum.json; \
-		sed -i -e 's/"Cargo.toml.orig":"[a-z0-9]\+",//g' $${fn}; \
-	done
-endef
-
-HOST_RUST_POST_EXTRACT_HOOKS += HOST_RUST_EXCLUDE_ORIG_FILES
-
 define HOST_RUST_CONFIGURE_CMDS
 	( \
 		echo '[build]'; \
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
