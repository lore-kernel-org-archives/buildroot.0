Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AC7C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A88428BA;
	Fri,  7 Jun 2024 17:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnFwwcRsZcUB; Fri,  7 Jun 2024 17:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41B5D42830
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B5D42830;
	Fri,  7 Jun 2024 17:07:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D14D71BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5ED084C2F
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCkpBXqsrQZr for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E88E084C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88E084C87
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E88E084C87
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:08 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52b87e8ba1eso3182860e87.3
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779967; x=1718384767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C84M+3JQced14KoZJRrr/p2t+lgR4PQVqdRFeupsGd4=;
 b=K30FN1nnPG5eoB5V7JTn1bp5sOD3WGmEI/3VC9c3W+b5L7c7b1SlF2+cVQlwyRrsQR
 mDxat2ZfMRmN+TspBSpGznIzCJ5mwT+ENwX1JB+/j+r6g1LrLFG8aB7n9AJGuTPXCAoB
 ADxkHKAcalogJcvK/sAwUIFfINilJrSrgaKWMMO0ljzYHoxSQiUDdkqt7qdw8iMQgl7p
 8Cd1XJtMMcwOWnjAzzbrth5XiVTsK6sHjTyiyIXeveQcOdcp+N6wtr1vqTx4D3m7c8dS
 ygja2KgHFLsEgddh5kAAYniowDc9H3hYSgdZVz1PCt31USCYjNnlq+8GRjcLP5ejszIR
 9fjw==
X-Gm-Message-State: AOJu0YzOL+OziAaSheFcc8avxbBIz1Hq6g2qaC7H6m9vuNL7zw64u6km
 fU41gvgeZAXUR3YnnePOvMvxmCCrQJbj2jBWtvTuZCV4rKwVDeR2IfLGnA==
X-Google-Smtp-Source: AGHT+IHFYmkRJfOQ28LxOrfNtoP+45L01pOi1ZVqvtQpn+ZtV/sI2EAuT27wYTRvNVkvWfbgZ4D1BQ==
X-Received: by 2002:a19:6b0d:0:b0:52b:bbdf:bfab with SMTP id
 2adb3069b0e04-52bbbdfc083mr1819850e87.65.1717779966584; 
 Fri, 07 Jun 2024 10:06:06 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:05 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:50 +0200
Message-ID: <988e6677f7328c33638a5e4b1063e17f5260b01c.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779967; x=1718384767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C84M+3JQced14KoZJRrr/p2t+lgR4PQVqdRFeupsGd4=;
 b=fuS8+26fQFsGtPGYNX2Dl+GE1FFFNYuOtQs2UrWQTzG1YOgTw/tyv+5rPB78JUuqae
 GaOrD0akajL/eFCqM4biL39jif3ElzK03ytHIrk+jpHTRnVv1s2dFVZn/P3AS+P2jBJF
 Pv1xOGiHXmvdQcRZlMYJT+S4TNhsHgz7aZiP+ESKAzrtUTFe9luVRojkCXvRhCQOz++x
 JA30bs+l4HVVA5GLIZSdDj6iqJlF9QjSXcgEzpXmxbbv0AI+FXaDc+MkJc5wRp09alAY
 9anyG2n1yyTcT/kOqeMkwx5i3AimEelYXt+kotvaqHWxehLK7i+CmpOjXGkmmDowpJfQ
 RTJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fuS8+26f
Subject: [Buildroot] [PATCH 09/20 v2] support/download: accept manifest path
 as a post-process option
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/cargo-post-process | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index b94b160315..a9fbced466 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -5,10 +5,12 @@ set -e
 # shellcheck source=helpers source-path=SCRIPTDIR
 . "${0%/*}/helpers"
 
-while getopts "n:o:" OPT; do
+manifest="${BR_CARGO_MANIFEST_PATH-Cargo.toml}"
+while getopts "n:o:m:" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
+    m)  manifest="${OPTARG}";;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -29,7 +31,7 @@ mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
-    --manifest-path "${BR_CARGO_MANIFEST_PATH-Cargo.toml}" \
+    --manifest-path "${manifest}" \
     --locked VENDOR \
     > .cargo/config
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
