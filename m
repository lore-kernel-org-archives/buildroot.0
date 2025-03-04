Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A54C021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 20:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A40A84083A;
	Tue,  4 Mar 2025 20:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONrgMtlKKXYW; Tue,  4 Mar 2025 20:56:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97F97408FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F97408FD;
	Tue,  4 Mar 2025 20:56:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6CEA944
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 20:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8FE7400D3
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 20:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLOiDbh7q_3W for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 20:56:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.devoogdt@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 77FD2400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77FD2400B8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77FD2400B8
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 20:56:40 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bbc8b7c65so30279555e9.0
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 12:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741121797; x=1741726597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtHE/FTy6n8vtMaNFagsSJPSMuctdGWTsifyGpAOWRo=;
 b=ro2MUTm/APxtIPVocoXVcme39yTI5mLM+6fobw8/Y1y0F60YQ6x6ztPJ36QINpUsZY
 DD53EAtkvTczb6Lz/kcDD6I4vb4cKjb740ovljg2XVZdglVz7+cT5AwVgKn/4YE7nvc3
 cz881ZijUQOX5uauJetINGuKAKHO0/0gvO68S1HXb18kpVvadl93sYWMPZ4C/jUSasXj
 GbqXQ6EmZEIJVdjw63aYpqjDdMY2nYG9Zv6f8t0kFhk8uSYYPYIvqY3YT9xCL53MsAcS
 39Ttz8BssYiI+nQr0Tt1dKfCjSueHVaHV5OkBHBt1/WnnIoeagotpPGagMIK9JUoJKAB
 FCvg==
X-Gm-Message-State: AOJu0Yy2sjB/lQtJjHOFrFdZd1PgWIYZ+iwVV/KhzKwl0jDvE3vADOY+
 VxWJeSVj9kuGiwL8UIQYiuEkM+a8NJYxfmkgFqrDlPvQ9qQ6Wq5JkmUEFw==
X-Gm-Gg: ASbGnct/qWQ35qmZ9abNm7yX+0wRuluFrHxzW7AROOYcaM8n0j88R1yIpWGJ4dO2k+M
 d8Se7zRW1bFwSITjLcNPC5oSoE6fzVFbSI18bMNy9FKqVKCXg7frnZZ6D5oNnn9ggsTX5grA/Np
 0aS1xscJrP3ZjZKIK2dADwTweL5pmzmP6+jAJCeJIq4J1M5K/FrBr9r9TLygHt6FAKXuPXTBbM5
 xF/zPstS6bplxXPMDKZEF33GGVOf8ri+o/nLGx9IWd3xXqASPFVk5EaUGgT5c8WHv3mxXOjTsGq
 rXP1iNyo56NdS/c10WqLxaz+j3aqCGeLfsHmSb3yeCPdUfXXVrQ87+48iO1eh3M69fekYgVYjVP
 u
X-Google-Smtp-Source: AGHT+IEkl9IGV9mpRnw+ACWm0wWS6pYkJqeGjrba2+KAPIhoubmyJlSQ8EFEfr6a6fHCEpULbYD19Q==
X-Received: by 2002:a05:6000:2cc:b0:391:13ef:1b35 with SMTP id
 ffacd0b85a97d-3911f757771mr194833f8f.29.1741121796952; 
 Tue, 04 Mar 2025 12:56:36 -0800 (PST)
Received: from thomas-Precision-7670.home
 ([2a02:a03f:eb68:2f00:e875:3c82:3d24:e3d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6d0asm18438075f8f.27.2025.03.04.12.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 12:56:36 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue,  4 Mar 2025 21:56:32 +0100
Message-ID: <20250304205633.397011-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741121797; x=1741726597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=GtHE/FTy6n8vtMaNFagsSJPSMuctdGWTsifyGpAOWRo=;
 b=lDE29eNVCNvodL/DBXoh6K8yg2JpXYIlzkUuAcIhfbvlg9OewHBj49pn3gkGW7MPKu
 67nwnDU8XsKh8k3z2rCx5CAiVhd4yQo37WMNSAx0hxkWG6JUd/E3HhSwKgVmUU3FQCcy
 Dqpk645JJTxMRHTb3GeYl4DLinYzvrw1VrI3cUIE8g6K8/zvnjTtEGZzsjxv4b14gUMm
 viFPhMJxHXYRfXplm9rRm9ciCyzDGqHZA03xrKafODdvHiICHvwGa0upzfYeohGhdlEx
 NpPhpq8pFO7mZwFX2Smc8Kymy+Qp+//FYfzXL2BVJva0zKEbc3c2LTySLcT2x194g1np
 ai/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lDE29eNV
Subject: [Buildroot] [PATCH 1/2] utils/generate-cyclonedx: fix wrong example
 usage
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

The real file is utils/generate-cyclonedx,
not utils/generate-cyclonedx.py.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 utils/generate-cyclonedx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 365c2b06eaf..39d59173d2e 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -5,7 +5,7 @@
 # to CycloneDX format.
 #
 # Example usage:
-# > make show-info | utils/generate-cyclonedx.py | jq '.'
+# > make show-info | utils/generate-cyclonedx | jq '.'
 
 
 import argparse
@@ -270,7 +270,7 @@ def br2_parse_deps_recursively(ref, show_info_dict, virtual=False, deps=[]):
 def main():
     parser = argparse.ArgumentParser(
             description='''Create a CycloneDX SBoM for the Buildroot configuration.
-                Example usage: make show-info | utils/generate-cyclonedx.py | jq > sbom.json
+                Example usage: make show-info | utils/generate-cyclonedx | jq > sbom.json
             '''
         )
     parser.add_argument("-i", "--in-file", nargs="?", type=argparse.FileType("r"),
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
