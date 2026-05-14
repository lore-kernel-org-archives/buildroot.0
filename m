Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E05CD4F3D
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 21:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B000835EF;
	Thu, 14 May 2026 21:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6oXOmDX-_HV; Thu, 14 May 2026 21:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D42483595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778795042;
	bh=lzt4YK3t+vhkr8xsqgBf5V0ljQl4QHFFBJM2qrQYJDY=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eUWqj05HeCwTcDE9VIvTz6hnrkddv4ModghUIJrKQuPiSkJ5qtjNKwuFq7JJcMZp8
	 LsT62FLbGegV1B0LBSOJIGCFSjH3jSR9/AXknknVcmMs+8tU0v0qejq6jtvCoGDEGq
	 gk4UjC9tW/8pVFAtVW1oce+qLGtTcYoQKuFRPD+cUVtk0YnQFZB0jtgZ/kQs0I0Ei8
	 LlVsF53cADQgDGqcc46yipYa8M81le+0fntIGv8EeJ95DhEqbWkDvD8uqSp2oze5ii
	 Qipq24H6gFxrMalDLjKJCJHsp1biEwp8iIOuN+3HKWY36SuyGSrTVtGkvpR5mKh5rt
	 SG5Hgb5GfqgZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D42483595;
	Thu, 14 May 2026 21:44:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDA3437F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A36AC834F1
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBN4csJYc9II for <buildroot@buildroot.org>;
 Thu, 14 May 2026 21:43:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=joseph@anodize.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E4AA8338B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E4AA8338B
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E4AA8338B
 for <buildroot@buildroot.org>; Thu, 14 May 2026 21:43:57 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-365e20fe3b8so5130527a91.3
 for <buildroot@buildroot.org>; Thu, 14 May 2026 14:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778795037; x=1779399837;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JjF70Tl1QIAH/u/pnkL+mRbqNy8m4A9InQC7+QBfbpE=;
 b=IAyu4Y2kR0u4yXr0RUSmhem1A7uGgVgMjXK+Fl0ao65H6+879nRMndKjqnY6YOFPJe
 rofB1T4PC4FGoQZ5jwhpWiXORo4zDwK12rJbZ4Hngm+0TC8y5LdCpmQJgBMdxRMYlG4G
 5z8hmYRwge5Xny9uPqDHMwyPP3Lw10/EPN7eg+22DMGNK8oVhe3tQi8WH7+7UTwh8Cs2
 7Z8GmZFImkCmhqsGnPXjhMXoX5qe1f3bv2oH0UHww3lzlqMBX5acBvD4MCEsmLazeL8z
 IkIHXGEi2TTR+TkFZVplUuhw2J3X6ZEjuVFDjz64rCEyAET81rlQgp6II0hfh6KPYrf+
 SSDQ==
X-Gm-Message-State: AOJu0YwbbLa6/Sj4c93nKeOssQBWTQ8zliukURUdHekUYLBvrX7B7poq
 vSoWgZZbbwTtfnE4QafvcP9GJ9XRiBUYaQShD2eM698zNlr0+/Cx62YmNLdpzvDoby4=
X-Gm-Gg: Acq92OEaJ4DIayrL/vIFDj06QZU/NVtIlXsVw0dIOQA//QOkR1aXGECDeJiIfEI2K+U
 D891UCsTxTk9i0Si0YCX6OLc8cj5DLDMjh2HCPG40AEiRu0JdlVOK+3OKIYyGZEylEH8O3AnMmW
 19hj+tHe1fMN5jZmmjcKHwsj/8dS2tmioCPz+VizktF5f0P2WfkqjYAJpgWSywapAkiZsOkxB97
 Wby0iR5ldgD7OUUbB/ZPC35yGFTUyt2AAvtd/7W6Hd/f53QUBv6ITIpPPoSIxEzR5A3mdg/bX/G
 AuV0K5fP6IzjL3NRcb5SBtTBDQ1NPcN+RjXFP3qTlMcxNI4fp4oMtAiZllX7qxJxoseM1TxaO2w
 HISUk0AcA3dgXQacdKAubTYB3ZiNTnG+UIuQCQKljmv50WTx1uzp3RtGq+X0XpiQCJW4xTtwvJv
 rHItxjgu4RUmtT3RqPoMQ=
X-Received: by 2002:a17:90a:d648:b0:368:95e1:8d45 with SMTP id
 98e67ed59e1d1-36951cb7706mr955476a91.26.1778795037137; 
 Thu, 14 May 2026 14:43:57 -0700 (PDT)
Received: from wash-3.local ([50.120.90.9]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5c05f287sm49907305ad.24.2026.05.14.14.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 14:43:56 -0700 (PDT)
From: Joseph Kogut <joseph@anodize.com>
Date: Thu, 14 May 2026 14:43:40 -0700
MIME-Version: 1.0
Message-Id: <20260514-mesa3d-amdgpu-virtio-v3-4-dd75eca7fa50@anodize.com>
References: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
In-Reply-To: <20260514-mesa3d-amdgpu-virtio-v3-0-dd75eca7fa50@anodize.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, Joseph Kogut <joseph@anodize.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778795031; l=590;
 i=joseph@anodize.com; s=20251022; h=from:subject:message-id;
 bh=d9sW/DmM7y0pYr3x+5Odhj2RZXUhG5FnU06tlA6XonM=;
 b=5rTKvF1v3vFTAwh8XTKJdltxsjYILhlsEOlP4xlke6P9jFIhPyonsE0Cor5ZmzaFXMr1uiLaz
 BsNqvIj0JRPBbiEPVDSyZ2hOsA+Evso8ZOKuWi6920f/Ha9Lhslp5q1
X-Developer-Key: i=joseph@anodize.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anodize.com; s=google; t=1778795037; x=1779399837; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JjF70Tl1QIAH/u/pnkL+mRbqNy8m4A9InQC7+QBfbpE=;
 b=U+fpIsfHjqvob0wBMf6hBOGX/V+6fxqcEksvRwhGh0JpZbcENOQYJihkzsq4K60Hvc
 aPFdXrVr64ueR0Co3Ui/EsHlbiL0Ri5ppFwvAFUE38cE6Z4EdRFu802OZ5JkMxkJYvPn
 zRTzmu9cTXJ+133eiXvakLEFmA7wU57ggVV/8CKvSEXzFPPj3eyWXluav2eOLcPprhu9
 NDsY7IVOU7v22v1xJtPJhhUuHiE5Dq62XMPxr0Qpajaiy4gWH0t8QQulWptCVKIMxFNg
 xiPjMDx2MI2SI5P1I8N2N+yNZBVnpZB3xit27lHTnVwQ8c/rHLeVAUJG9c0XBL5oTCOn
 1iQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=anodize.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=anodize.com header.i=@anodize.com
 header.a=rsa-sha256 header.s=google header.b=U+fpIsfH
Subject: [Buildroot] [PATCH v3 4/4] DEVELOPERS: add package/mesa3d for
 Joseph Kogut
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

From: Joseph Kogut <joseph.kogut@gmail.com>

Add mesa3d package to the list of files I maintain.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d849fa828a..25a047cb3e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1754,6 +1754,7 @@ F:	package/llama-cpp/
 F:	package/llvm-project/clang/
 F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
+F:	package/mesa3d/
 F:	package/python-cython/
 F:	package/python-pycups/
 F:	package/python-raven/

-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
