Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622D8CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 13:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F35684332;
	Tue,  2 Sep 2025 13:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fTSr16fZiLZ; Tue,  2 Sep 2025 13:43:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A79E84331
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A79E84331;
	Tue,  2 Sep 2025 13:43:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F800439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 13:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0067960C21
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 13:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GAAZIo25G3uT for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 13:43:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF60F60DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF60F60DE6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF60F60DE6
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 13:43:14 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b7d87b90fso37034955e9.0
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 06:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756820593; x=1757425393;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QLpStLPGQRoGIGl9LUqwEL1aRVv4fen9zVDNx12WW8Y=;
 b=nwkXSrbFqApZwt/aWmVz2Pr6nefUrWDhAwg0SrXtuz2JPNZdZGvDUAAjYvcoFW1m62
 sLR81V3KMwMCTHOeovQP9Efa/0YLs1HvL/1S/VfkmTFlkahwvFqeS8mWY62tX6MbR2oO
 93BZRiw020IOFUJXN+g7XT7XC9IAeJ3bdpNUve2CFbiuhxiykVeYp6G7V/PDGVj3S7mW
 IgPrpqsY2yYAqIrjS8rWwXNwAI0hYmETYFIxbAsLK/oXOTJ+MB2MmeS8OoEGiieJ7PYw
 DO3BNQVXlrIoyh+zN9xJ9SEgAs5xWb/+nOHQuTIC42OHKwVT+X/qfhmm5o6vpFc0mvZn
 2deQ==
X-Gm-Message-State: AOJu0Yzd0PDRa0A5O45BAKmuHoBkG2yyfkGSV7rht6lMdqdx6Mq6i9LM
 xPxKLpX2MCbwkdp9E+cDo8nTsPt6r3RuH1Hq3WfHQGiToQBxa8KsQ7y2y9bSX1uhCt2nFVaV9dB
 Y4lWi
X-Gm-Gg: ASbGnctGd+tLYYAR2i6SwMQM1WrRIUM0Un1ED4IQEXyceEsUEh7m47txPbmK7Jwjp74
 YyMt6VmsNdpxG0LPXY/IuboeSMu9jDP6U4UoGbh1OL2IDjysqodD204xrHC4KIpI49guk+79HUd
 4yNguDlSqQwVl3vdGxJPrFW9IO0osjeOBY1KgMQFh9eDSWAKDXsctQbXZuHqgZOiJB6y5rFzrHt
 xnChNVJvhbJs8Pcp0j+Z5bJwVqHtLNEkJfRL7HgQx0DUyUQNg8eK2Gbc+DB8KrcfAUomUs+rA2i
 fiobmSIPzfopOHJVHLVylJidBEm26QKUkCwiCp1zQQr0sPI557QHmK/TBGzxT4KwbyYx2RDkCAd
 rNzjKzzZOx6eq73NsoR9syyz+zxjsaVxj3fcm067iYGO0CcctnlcosxJ7hOEfw3Ek6ofIe8y77J
 kOV9uhL1yvZaBpNkvb43tevOUIx+c=
X-Google-Smtp-Source: AGHT+IGrPBmMajOFuwbOq7aSlFFthffymn5SSeksbNlzSR0XOzloXWPOh0vt8sxWnqlKzESXYt+vkQ==
X-Received: by 2002:a05:600c:1389:b0:456:942:b162 with SMTP id
 5b1f17b1804b1-45b85589e58mr105196155e9.11.1756820592657; 
 Tue, 02 Sep 2025 06:43:12 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d2250115fdsm14321314f8f.40.2025.09.02.06.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 06:43:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Tue,  2 Sep 2025 15:42:50 +0200
Message-ID: <20250902134250.622347-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756820593; x=1757425393; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QLpStLPGQRoGIGl9LUqwEL1aRVv4fen9zVDNx12WW8Y=;
 b=npcc9vNMyxB2cIW11tHGbS6ZMbse6MRpCxlYtSJJ+9sHvGRBjhh01bQd6JWlmzM/AO
 VOe4oTmq64oGf+YTBzgDvfSr3V0z2RRybx6uyUWaRmbBOs0JlpQ+bWklNzEEUkyMWRt1
 8avALIXa7b0V9P1VIB7EFyi0mJDkmnSiHxM4w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=npcc9vNM
Subject: [Buildroot] [PATCH 1/1] package/bat: fix build with GCC 15
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

  https://autobuild.buildroot.net/?reason=bat-%

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 ...ig-by-regex-fancy-in-minimal-applica.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch

diff --git a/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
new file mode 100644
index 0000000000..6d13c406cc
--- /dev/null
+++ b/package/bat/0001-Replace-regex-onig-by-regex-fancy-in-minimal-applica.patch
@@ -0,0 +1,40 @@
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
