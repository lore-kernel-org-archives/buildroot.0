Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5201BCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 15:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E49B3426CE;
	Thu,  4 Sep 2025 15:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGN4nPX0FCvN; Thu,  4 Sep 2025 15:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179F8426C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 179F8426C6;
	Thu,  4 Sep 2025 15:10:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D56C5111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D279542587
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGbjMtz7-Z-m for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 15:10:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ABB5142565
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABB5142565
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABB5142565
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 15:10:04 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55f6b0049fbso1348426e87.0
 for <buildroot@buildroot.org>; Thu, 04 Sep 2025 08:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756998602; x=1757603402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wXDFGg0pA8pAdFxv8AB0jiK4Nmaaql1Bq01LQptUF1Y=;
 b=bk6PYS5yhL5VjjcsWiJo32NAUGFqwBrZR8B0gvBIla7AyHBcSlpkP7FZcxelxVxTbX
 oQO3na3mwcVviO5shfIsc0ByCD5RiO/0eNk0ULfnq6PZbZzlYc81CroPhEv1cFIx33dv
 TyvME+n4uMiclF3lKO14g0KWiOYSq9y2jhim7TkflPChHhfC91PpGksbtxUiMC7HnOX5
 eFBVdVSOqMzD04vuzoI9GQsFUXmtJN1bW8OMrjN2u97jwSHFFcALg4zZra4GMSLNUZA3
 hRw6Cx4QUHMkF8pSFWxgwJlTKyTePkhS6h2L3Knfl57JZln6hb90fBfRc58YdFsQfv/u
 Ihag==
X-Gm-Message-State: AOJu0Ywqpy+02R/VwPXL9YiKauVV98mj0JLx8idY0QS+kfv4KFfAljPR
 VfzI59frJc5BC2+895tj+UiH8e9oqdwaLOI146aWsbhcf1cCZhA4midp6RHeXoOR/FoxUSOVEfY
 nD8gB
X-Gm-Gg: ASbGncvL1mSOrwvHRLGQhzZKvpcLuPQTVlwZhQbb32Z3FW1iiSV9beVJ0hNWrrirEa+
 FNnFHREPqP+h30UYE0lTTqjSoLUkSDz7Qf8V+35Yyn5afbYDQidG8Su+nTJWIxT4PcqvoaoIUx5
 59+6xZh8tVEKtjsjbrA3uOjVxzUtN51/xmduB9IX3TDNQ+4cJ9jYIsiwwF20Sor2lgYW2CdBZAM
 FA6FlAo94htc/BiK5W4qZMSl5inAofZ62EXlsHkth4cMtUDISgwj6Bk5sD00PCrqA/hyQWykm0E
 6jV00A0mtMulNdHJDRUw+wxvRcJSNpQ016W3lqJfcu347Y940Jg/gciSCL+lcoGFAR9MwpFe/7E
 Z8Di91ocwY3F3N41+sL7n/JGsqSBUjboESzISMzTjbMzFTzF+bMhAtPimWWtPdzc4WrpJNr8Liq
 he6rm+ZkFJewtY9eZqTRBB6AiUNvc=
X-Google-Smtp-Source: AGHT+IHsgDtibVLIjpm1b40jBHogNRZzcNI8khwuukt5zeeyIdgJzfH4SgKlY+jiyyEVtjv11GCljA==
X-Received: by 2002:a05:6512:3e15:b0:55f:6db5:748d with SMTP id
 2adb3069b0e04-55f7089c530mr6563839e87.4.1756998601819; 
 Thu, 04 Sep 2025 08:10:01 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad25e15sm1261085e87.126.2025.09.04.08.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 08:10:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Thu,  4 Sep 2025 17:09:41 +0200
Message-ID: <20250904150941.427455-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756998602; x=1757603402; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wXDFGg0pA8pAdFxv8AB0jiK4Nmaaql1Bq01LQptUF1Y=;
 b=xauvwLRpWmOm52pIpIFEegtH0DUAcSbJMRmTJ8qYZ5qha/ZL5yNUZJDALYq3fHgGrG
 /qCE+1+/xpSZOhsEPzVuSNzNl4cknnxW8emMRIyKbe84skywH3GjM+w/kN/gQx0Hd9dm
 dFLufrJvdul/lCmL2npFkZ3iPstQopMNkFjyU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xauvwLRp
Subject: [Buildroot] [PATCH v2 1/1] package/bat: fix build with GCC 15
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bat pulls in the onig crate (version 6.4.0) through syntect with the
default "regex-onig" feature. This crate depends on the Oniguruma C
library (via onig_sys), which fails to build with GCC 15 due to C23
keyword conflicts. Newer versions of onig fix this issue, but bat
cannot directly update the onig version because it is pinned by syntect.

To resolve the build failure, apply a patch that replaces the
"regex-onig" feature with "regex-fancy" in bat's minimal-application
feature set. This switches bat to use the pure-Rust fancy-regex engine
instead of Oniguruma, avoiding the problematic onig_sys dependency.

Fixes:

  https://autobuild.buildroot.net/results/ecc/ecc3b0c83e691e9a8ed5c7ff9d0a92ee06409f20

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 ...ig-by-regex-fancy-in-minimal-applica.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch

diff --git a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
new file mode 100644
index 0000000000..de6a3fc70c
--- /dev/null
+++ b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
@@ -0,0 +1,47 @@
+From 9b6727df25e45222b3863dbe5f5bc58237b68ab9 Mon Sep 17 00:00:00 2001
+From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
+Date: Tue, 2 Sep 2025 14:02:11 +0200
+Subject: [PATCH] Replace regex-onig by regex-fancy in minimal-application
+
+The default "application" feature enables "minimal-application", which
+in turn pulls in the "regex-onig" feature of syntect. This brings in the
+onig crate (version 6.4.0) and its dependency onig_sys, which fail to
+build with GCC 15 due to C23 keyword conflicts.
+
+It is not possible to simply update the onig crate from bat itself,
+since its version is pinned indirectly by syntect. To avoid this
+dependency and fix the build, replace "regex-onig" with "regex-fancy" in
+"minimal-application". This makes bat use the pure-Rust fancy-regex
+engine instead of Oniguruma, removing the need for onig_sys and allowing
+the package to build with GCC 15.
+
+There is an an ongoing discussion about removing Oniguruma from bat
+since Oniguruma has been declared archived:
+
+see https://github.com/sharkdp/bat/issues/3285
+
+The Upstream project for now is refusing to use fancy-regex as default.
+
+Upstream: not submitted
+
+Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
+---
+ Cargo.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index 80d19321..93a07a1d 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -29,7 +29,7 @@ minimal-application = [
+     "clap",
+     "etcetera",
+     "paging",
+-    "regex-onig",
++    "regex-fancy",
+     "wild",
+ ]
+ git = ["git2"] # Support indicating git modifications
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
