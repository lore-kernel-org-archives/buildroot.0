Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FDDC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37C3A84231;
	Sun,  2 Jun 2024 20:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Tv1fMpKdGyd; Sun,  2 Jun 2024 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4B5883AFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4B5883AFD;
	Sun,  2 Jun 2024 20:40:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BED7B1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3D86402EA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MHRFQJc9SVB for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:40:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92464402C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92464402C4
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92464402C4
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:39:59 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-35dbfe31905so3729006f8f.2
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360798; x=1717965598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aW0KPdXqg31QOR1NgVyCotG7b7qyuH9mpNJstlewNSI=;
 b=IQESnmSA8HwOuDtoS0XWiJvNyxdcQnKBOG2aHA8Yg5g3QuyneabnpZ2NLLtEWxHV/J
 mIqjHELNzqLBhILyrOmfHMP7ug/QppVm2or9fdwyN91EMgfG/yzbbUdDR/cVvrSSk5Zj
 TI+szpSSk6w0o7ttldQc/gIshv5N/gSFw4qt9zF7lfSGedOYZ/fsSeNK96G8u8nrnoTh
 V5uTPKii96Dke3Z3vjQvVNtKXVqF9dlCjQKYfQZiV8ENPkQCSpBTLQ3U1puPZpcx41Kx
 KOit1EN5MyDIFZJdGEzhYLdbob4YMCqxICzy/hdOaVkW12FeRN+T9mrAgT2EgR/1Zo6H
 IgFQ==
X-Gm-Message-State: AOJu0Yxcr3FR5qRiPL3pQvrN5ABJtRLXZVr3UtH1BuVRiwWa49kV8Q3D
 ric3rNLyIGHmEPWq4KOPWd55bMbSLAXIIEvqZ+YSm1UqgMqkC9DRPqQF2A==
X-Google-Smtp-Source: AGHT+IGWB1cThvTgjl2M2yXrCaH1/00WNvwcoVEWUV3GCNhjcmzUEQGvCfIAJPwGa5Wcg09ptn+XDQ==
X-Received: by 2002:adf:f3ce:0:b0:34e:2814:875d with SMTP id
 ffacd0b85a97d-35e0f271892mr4858617f8f.26.1717360797918; 
 Sun, 02 Jun 2024 13:39:57 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:57 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:48 +0200
Message-ID: <403df6fa646ea7aeeb21fe3d76dabdc0bbb45091.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360798; x=1717965598; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aW0KPdXqg31QOR1NgVyCotG7b7qyuH9mpNJstlewNSI=;
 b=U2KfdUxLoO1B2baNUaqeKEGFjhUDeBeLW66eWu80uKMdDZn8Y9eVg6SkiRpELV/vAY
 MO/zI1Mup4LnPDg9yT7MnZTEyMiKpz/nt+F++O3u2L9ZpIZT3AzETyquLwX1QeZRb9sm
 +WLj3IVn3BuFC5jCvZ31ZVMz75RbKPahLB+qy36qnfMKYwYfm1b9VOCAD/ZdLDGVzU5V
 xzBm1m92GHjTtJYIZYcyFc9K9rwI9HRfO11AIq6Rfa+mBRSUJd1QrNt4BtGDyrYueo0E
 Emegs/o+tIIT+q/zpyBV42FJOBNpiSfq4aFeiDuxrOgeqJqX/AtMWI4ZuAlOvGnJD5K6
 FC2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U2KfdUxL
Subject: [Buildroot] [PATCH 12/16] support/download: no longer support
 BR_CARGO_MANIFEST_PATH in cargo post-process
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
 support/download/cargo-post-process | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index a9fbced466..12198051a4 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -5,7 +5,12 @@ set -e
 # shellcheck source=helpers source-path=SCRIPTDIR
 . "${0%/*}/helpers"
 
-manifest="${BR_CARGO_MANIFEST_PATH-Cargo.toml}"
+if [ "${BR_CARGO_MANIFEST_PATH}" ]; then
+    printf 'Setting BR_CARGO_MANIFEST_PATH is no longer supported; use post-process options.\n' >&2
+    exit 1
+fi
+
+manifest=Cargo.toml
 while getopts "n:o:m:" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
