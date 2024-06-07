Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A16DC27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67591427F8;
	Fri,  7 Jun 2024 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIH6Xu3qpNvG; Fri,  7 Jun 2024 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A736427D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A736427D0;
	Fri,  7 Jun 2024 17:06:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0870E1BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 000FD84C2D
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tA8TFjMXGYoR for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4568684C2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4568684C2F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4568684C2F
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:07 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35dcc681f70so1560864f8f.0
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779965; x=1718384765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EipLOogFWAsXjG6lewbyN/qiz7lO7LwdNwJSurRPF8M=;
 b=D0bwkY54FSf2Plrw902oNRcYRLnD0WEW5Pe06y/RFEJHgaQaBWh/2dp9WHQWgFbxSk
 PRFL0QiVC2Cr70CSKMDviNXM7fP5xsbA4s/HnLS2XnuLlWni3i58BDZFsWYU4TDJQ7VW
 BMh3fnnaXl23VL+xoJPNnP6h4jbuhub6FZLKm47K/MMUH8MJdX8b+rbr1H0e5Nl0M7dB
 sD5yKDhUQP2qFHa7bJ7sQx938d10NXq3dHrq9HfOFKziIbAXfGWQPWBPjGh4wYEmGTRN
 aD7cW9Xx2nsQLDpgZz2XnBhcjRMK3yj5++uCvV/qvKZQv5Bs9lUEQCVaNncdiX7rD6sZ
 5aqg==
X-Gm-Message-State: AOJu0Ywvey5CwMOJTb8G6zy7gX18VMx9hq0SSlgbR6RSizhkKr1/6KSH
 vurD8EWpFDYCtpN5ULl0Fj4k0gZezzgovFoha+psga9+/iL0qpeMqCj/OQ==
X-Google-Smtp-Source: AGHT+IFn+T7exFM4aITVwnQ3mUABz9QusiYjkpF7g/JpQ0Lq0mfwfinoUjeEKygv7939ZYNlHyiHzg==
X-Received: by 2002:adf:ffc7:0:b0:35e:83f4:3e71 with SMTP id
 ffacd0b85a97d-35efee1669cmr2341439f8f.70.1717779965278; 
 Fri, 07 Jun 2024 10:06:05 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:05 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:48 +0200
Message-ID: <5aafa76fbd12004df34d3e46bf302166f7b31ac7.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779965; x=1718384765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EipLOogFWAsXjG6lewbyN/qiz7lO7LwdNwJSurRPF8M=;
 b=BLM4u8vYrI+wL9KLPevKDu4p79z/yK/jULS9twYnE9Knk8l/K6T20LRqiKEwO7Yd3a
 XhCL/+Uhq/ppKnWP64eDDe44htZPDpPZ7LoPhVuBkHDW7B2oYHQkb35h1EUwHPsqTjRl
 H59Ndp//pSHELR4vkWdF7lRGSHA+68emX/dxXelkIbu2jMsuXMW+iXf6wIDnhKN74/ld
 40VG9r8fEaogzZfTcNlOe1ucTw/Pzb9uTUpCJ4vLloz0jPHXKma0w5AqADCOAdiPRmCE
 TNeGkUBj4PJWQ0kjaEZ8s1I8tPrjoD3cjZSKaGGaaSiVzyDGMg66f9p6qpP7VYzuTRGG
 AsEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BLM4u8vY
Subject: [Buildroot] [PATCH 07/20 v2] support/download: move tracing
 functions to helpers
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

errorN() was unused, drop it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/dl-wrapper | 8 +++-----
 support/download/helpers    | 4 ++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 67a9718d9d..713ce668ac 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -17,6 +17,9 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
+# shellcheck source=helpers source-path=SCRIPTDIR
+. "${0%/*}/helpers"
+
 export BR_BACKEND_DL_GETOPTS=":hc:d:o:n:N:H:lru:qf:e"
 
 main() {
@@ -232,10 +235,5 @@ main() {
     return ${rc}
 }
 
-trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
-warn()   { trace "${@}" >&2; }
-errorN() { local ret="${1}"; shift; warn "${@}"; exit "${ret}"; }
-error()  { errorN 1 "${@}"; }
-
 my_name="${0##*/}"
 main "${@}"
diff --git a/support/download/helpers b/support/download/helpers
index 5ed9078287..f4102e3b06 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -94,5 +94,9 @@ post_process_repack() {
     mk_tar_gz "${in_dir}/${base_dir}" "${base_dir}" "${date}" "${out}"
 }
 
+trace() { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
+warn()  { trace "${@}" >&2; }
+error() { warn "${@}"; exit 1; }
+
 # Keep this line and the following as last lines in this file.
 # vim: ft=bash
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
