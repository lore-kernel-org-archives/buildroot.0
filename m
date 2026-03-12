Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4470106ACCD
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 17:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EFA180780;
	Thu, 12 Mar 2026 17:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bhqx3st0_hr; Thu, 12 Mar 2026 17:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CE9B80782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773337042;
	bh=ol9fcG5h+bboAm6FEBnkz1qVJ27bWfxK0p8hz3IZUy8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YPkTvfwSTyVwgaDN49Jqv3jxn+VSVBr5XTnkZAGbrHLDsyBRXVT3dn9JgiSOGFClY
	 fPrPfFFy4wp3xa30Z6Iltszi+egZ9zQi7iC/5iVME+ekJa53g3gK4ET6fakSXYYCD4
	 Hip+kHr/XXwJo1cNw0rPgiKYe5UL85SwmyTShKeZ+2wpnC/BBjOutCGZBAN1cG3oiM
	 yr+FR5v+cLKy1rE0M40qQwDfUX2eDDS23Gmt1CoxJPrdEw4glvqXA8qjSUhA4o4VL9
	 kD1rZit7WpnvXggbc71EKVG/ieP2mCWRTnkpb9QB6WLG3ge8pmRjkoZVfhGQrNcsOl
	 B0CMuUyb629JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CE9B80782;
	Thu, 12 Mar 2026 17:37:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22D05282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 17:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 149CE4057B
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 17:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63gUReCiR4eZ for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 17:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com;
 envelope-from=william.sherrer1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EF5340563
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF5340563
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EF5340563
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 17:37:21 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-50934b8ab60so24013661cf.0
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 10:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773337040; x=1773941840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUxVHEhY+NINQ8vI3e5jvVlq9/lPzqytGhvCVCnI7ds=;
 b=XACoi4o5KFYn+pHWHjrkj0cQbFTqDX4WZ9cFgwKwwurptAmg0TXA3lU4wdIIvfYLhn
 P6lOikSmTxU2YfOjInVO2AaZF96XHIAIGAFit26LvL2Vxe6WLLBudiFEw++YaWL3WT0z
 VgvCaL8ZWHdBDQoEaw9yTEwMxWVpIVvTj4wTDzvjsllsgPMiHmGIbxLoyn61eQZtNPjk
 O2IFR5tapCOk/c4Hy8m6aiRwk2X/7Xplm6PRWegAJG5zgkpfjE8uhOQW+tANNckf2H9N
 79+1SznkQHY5AOs+YxMNqmNt6SNFbXQCfSpZSdtQG7QOoTfUMP/eQm43E0gbfa78dxFU
 5TlQ==
X-Gm-Message-State: AOJu0YzB1CoBvOyt3oKphyLpLm5iDFeTkoS1ueqbF8pBMRr8IeeZj9KH
 0/1sqae6uAyukDtwjSN80MDkks61F0qKn4xcfp3F1bn2FUq/j5n/uLW9qGbHljC92IE=
X-Gm-Gg: ATEYQzwsEEx56hshl5rHx4eM+JSguQuddq6/HnxincfCzFuhW5o7MtMJscNImFx8r97
 lZQfCNMVAbLGmP4SknDRHE3cgbg00RKn64JnHRP3jFfDrC1+SPny7hDhhhKvCWebkRyh69xPLCI
 IX7H6otYXd7Q5QbGQ4Oe8EbljYMNmLLAl/8xcZQGhaCRHaoGS86kdQ0O2hQ4gU6vu8bJ0V6rqeR
 yMUMfoUWFxBbvl6C5QAZl+a0+6t6EmLiPNLxNOAnhjw47WWLidH25mrXrDUf/uR1/IWLekS6LuG
 SstxAc4EyI2sf4/6YXoNjg5cqKb5qoZIZxaEpNN0yzcVwLhSdudTrbepWqHHRhbPUsK5HvhOWG6
 U8EFLIzdtHjH9yMTPH6RSTlVNnVOedy0briUWSy7fQDZZpn4YWF26YUXFaVilzCY2UsLSmDV4eN
 qdN08z1o0iYPPc0U3jn9NAvpYDKbLsCN2ugfdOYAPbyw==
X-Received: by 2002:ac8:5a4e:0:b0:509:1f53:f557 with SMTP id
 d75a77b69052e-509572783famr7476271cf.21.1773337039628; 
 Thu, 12 Mar 2026 10:37:19 -0700 (PDT)
Received: from scooby.. ([2600:1004:b268:c064:b975:8d38:3aef:46eb])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5093a0ea844sm44441761cf.17.2026.03.12.10.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 10:37:17 -0700 (PDT)
From: William Sherrer <william.sherrer1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 13:37:12 -0400
Message-ID: <20260312173714.1428063-1-william.sherrer1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773337040; x=1773941840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JUxVHEhY+NINQ8vI3e5jvVlq9/lPzqytGhvCVCnI7ds=;
 b=dQgdHZTcMs57YWiq+y2WmOjUMNobqt7GkHwMpbuZfJoEI1vcGFxYY5PveJK3mi1tja
 9knj/Nb5sPfQLsMYIr8UpWotmK7ghdRLm0VX0vDF/G4ALou4KizmW8dsgv8qf+vBrcwc
 xzkm7z5B5hy/tUS9bHurm8U8TM7UO620mQBLMvtGElclXw5WgaXOPI4uE8KvvJaPOAV1
 65E/k2djhqedO9JX+q27zjMoU2xLv8fQG7tm9WxHukI1T5GgtLj4mu0gVcenzIgdht0Z
 EeNgEnAXlUqoJRKQdqkr8+EIkbYc5euKZ9Tc98j3YYnuiGuowgQWSxnuYqz3J8OPgcq1
 xa2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dQgdHZTc
Subject: [Buildroot] [PATCH 1/2] package/pkg-cargo.mk: add option to vendor
 crates offline
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

Buildroot packages cargo-packages in a way the allows for offline builds.
However, vendoring the package dependencies requires internet access since
`cargo vendor` defaults to crates.io.

This commit adds the `--respect-source-config` flag to vendor command in
offline builds. This gives the developer the option of adding a custom
.cargo/config.toml in the build directory which points to an offline crates
mirror or registry.

This is particularly useful in airgapped environments where the full build
and/or package development process takes place.

Signed-off-by: William Sherrer <william.sherrer1@gmail.com>
---
 package/pkg-cargo.mk                | 7 +++++++
 support/download/cargo-post-process | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 47a6353f25..8cf8fe49cf 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -195,6 +195,13 @@ ifneq ($$($(2)_SUBDIR),)
 $(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_SUBDIR)/Cargo.toml
 endif
 
+# If building offline, and the package needs to vendor offline, 
+# use the -r flag in the post_process_opts to use --respect-source-config.
+# This ensures custom registeries or offline crate mirrors are used.
+ifeq ($(ONLINE),n)
+$(2)_DOWNLOAD_POST_PROCESS_OPTS += -r
+endif
+
 # Because we append vendored info, we can't rely on the values being empty
 # once we eventually get into the generic-package infra. So, we duplicate
 # the heuristics here
diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index b0e59ad74d..7047e8e881 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -11,11 +11,13 @@ if [ "${BR_CARGO_MANIFEST_PATH}" ]; then
 fi
 
 manifest=Cargo.toml
-while getopts "n:o:m:" OPT; do
+respect_source=""
+while getopts "n:o:m:r" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
     m)  manifest="${OPTARG}";;
+    r)  respect_source="--respect-source-config";;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -36,6 +38,7 @@ mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
+    "${respect_source}" \
     --manifest-path "${manifest}" \
     --locked VENDOR \
     > .cargo/config.toml
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
