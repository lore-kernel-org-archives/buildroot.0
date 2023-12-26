Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078DCC46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 15:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C15C40289;
	Tue, 26 Dec 2023 15:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C15C40289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ighO6SbMTDRP; Tue, 26 Dec 2023 15:14:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B35FB40386;
	Tue, 26 Dec 2023 15:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B35FB40386
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D8BD1BF5A7
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E92CA40386
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 15:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E92CA40386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_r9JysaqugH for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 15:14:49 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B680540289
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 15:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B680540289
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d5a41143fso5279135e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 07:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703603686; x=1704208486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YwlxgaKWYt94snm1HOLzzyK9df/9YhdRj46JRhaN/pY=;
 b=teGvyr6gvjMX+3nludJcUFXpNpfO9lpkmB49nS2W8Je/5ZtbVBqL7qzgarRkFur1/Z
 pN+A1/wLiMWqdjUZOZ5KJkb2bvks830gTub44b7KkDecfGB4fH6GQNZDQTWSsNNhCSuB
 X0aNV5NZ075RYPSZut4k4dlEsedo+Bth/3Dn4cSfYcVCuceHTkGXhDMYyW/XA5G9et9u
 n8sT6XodhYdMxEW4iy3Hqw5NKMJ6unOF1Em7rthjesOWExHxJbdHaEoj5QhvBm0enHHu
 lhitoiV511P9ZRTk2mvMzKgnA8D3PN8nlkEyyQm91TlEeLZoP4etfKboj0t68w/DEjFr
 TxAA==
X-Gm-Message-State: AOJu0YwVbXTvk6oXIc1DDzplH/IJPHHyuF/MFwgo1vlDLGyN3OFZlpWM
 /RrMUGWq1ZD4Hl8ZciXFegOcpH2OaLQ=
X-Google-Smtp-Source: AGHT+IF85E3p8i/o2o6FMEs7nOGp0SuzTXa0Ndk8/X6Qc1cmsIYtcW/h4LlnWqOPyJHaEcM8GdAmug==
X-Received: by 2002:a05:600c:5011:b0:40c:348a:1f8 with SMTP id
 n17-20020a05600c501100b0040c348a01f8mr4091258wmr.17.1703603685629; 
 Tue, 26 Dec 2023 07:14:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b0040d5c58c41dsm635537wmq.24.2023.12.26.07.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 07:14:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 16:14:42 +0100
Message-ID: <20231226151442.445276-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703603686; x=1704208486; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YwlxgaKWYt94snm1HOLzzyK9df/9YhdRj46JRhaN/pY=;
 b=R+55YvRZGlueDupFuBym+9eBDztySprp/IaOuyijjuXI54MbXI3MJuT0pesJGjjofq
 UDjDbjZCRQW8WGesnHa0eD+GXKwOtfUfNTdH8mRf2EPXFNKvvAqzof3Mitg2n4Vov2YM
 YcIh1UEgDIruXP/qV+niDNZV0VzLIZbeojM6WyTs5FWr7pT9GBYcYuQhaVWhtRK7VGF4
 s7TMMCPVuRdJbK3y0Npc+1x+RZd2lhyUrCoOsFGiu6m0JS7wo0sQcpAxvu/KYdQrrp1h
 7bf62TKB07yLEk8iuF2EMlgjH+dYY3W0uAfJ8hbhnfQWQYj1Yl3n30kEYV35hifgBfCn
 WrPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R+55YvRZ
Subject: [Buildroot] [PATCH 1/1] package/onevpl-intel-gpu: add CPE variables
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:intel:onevpl_gpu_runtime is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/7F7056CA-A41D-4AB5-B9CC-9DE24A27B8BA

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/onevpl-intel-gpu/onevpl-intel-gpu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
index 0a62ebbb6a..da6da2ad61 100644
--- a/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
+++ b/package/onevpl-intel-gpu/onevpl-intel-gpu.mk
@@ -8,6 +8,8 @@ ONEVPL_INTEL_GPU_VERSION = 23.4.3
 ONEVPL_INTEL_GPU_SITE = $(call github,oneapi-src,oneVPL-intel-gpu,intel-onevpl-$(ONEVPL_INTEL_GPU_VERSION))
 ONEVPL_INTEL_GPU_LICENSE = MIT
 ONEVPL_INTEL_GPU_LICENSE_FILES = LICENSE
+ONEVPL_INTEL_GPU_CPE_ID_VENDOR = intel
+ONEVPL_INTEL_GPU_CPE_ID_PRODUCT = onevpl_gpu_runtime
 ONEVPL_INTEL_GPU_DEPENDENCIES = libva libvpl
 
 $(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
