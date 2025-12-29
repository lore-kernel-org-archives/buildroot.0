Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A928D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17C8C80CA9;
	Mon, 29 Dec 2025 09:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNrPpljRN_dY; Mon, 29 Dec 2025 09:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B8F80CAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999253;
	bh=fP/dvGOwIYBc111xJYdhZ7pDutV2fO5OyByQhbyZ7C4=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ExXYJiqVaFRkfeTWnW08dugqg6sQ+QoQuTN4QCgiQLdjFkgwZG6EFNrbP/+URfRNH
	 46y8uWCS9PSm0UYzS8Xk4Dyh3tr9/z8xjFdym7uSfcEzX5rT9NOVt75Ar8iJZAjjL5
	 9xGxGQJNQ+jupuOwi9JalgCZlrJDZcAO73aLKemxXEDLHxWVL82uBsz1jA5yLRgStj
	 /ajbEC2gOTkPee8ALjTOFcs0q9fdrJTEZVm+gSC119y7S0ytOxyg2HHTFT52MxKiH7
	 k0gsvlehA7Zp9DJ1d7deVP++y0c8ujlkflh2xZpadFGiT+p/vzG7wSR4QkYYb9ApDW
	 TZCH1l1AlPXFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B8F80CAA;
	Mon, 29 Dec 2025 09:07:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0728B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B681860AD0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5CSmiv5LGKY for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A584360AC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A584360AC9
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A584360AC9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:28 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so64880095e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999246; x=1767604046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MbucxjDyUqm2MNsTo+silu5BLSszz3rI0cCO9Y8qmsk=;
 b=SGoi87ad1y07jpqXiYtohi5TS6VTrMjYzf7FWkkijanA1lWteXYrWmw+3xtXq4/zhx
 THG/uAOXfS2wB3weNuqZDnDJzDXkukkdCkZwPPJ3NGdVIYlKVsEigP2ARnn4oAsrMO95
 YVRTtgf00ht6HCL9gFJYJpBMHRQ8j4zRF+p4X4+epvCbXSknQ/Ij+dawx3XR2lS24/kd
 YRgMro2G02Mxchgyc+B5G+ubpETGysCbU/bGzgYLSgF7utG1H4YYvsppKYC9X3+cWzSK
 r8EHeNAoCVHQsBGErXFkl7uZ8IabD6rx6DB2ejUq5xLSbloQOxXJS0zVa9dr2qW3NSbh
 ORNA==
X-Gm-Message-State: AOJu0Yzrs8GGNpkvnlPCv0y2VcZO62nSwgmWv6ClKhaksgqgx44R+JIh
 Dk9LrqA0wckBEJNizeG0ebCjUzQ1RIjDaKNAE7IzLihjJsQATFSv9eTTUKNp5eNlGMB9hSv/oQN
 feUoWp5M=
X-Gm-Gg: AY/fxX7Bxl0sWBMDr2szFppnGCXEdagtB8P4TbqXu0SdiincCcRBKpp9a93ZZmI0mKu
 UgfRMxYXHvHy7Ge6C3Vd/Nm0OwNHHbrYgWv8B2fL3aJXAd7WThDiAjbSZ0SCmUr57oyfGx1hxdu
 evdhP6fY+dgXAowiV59a3ayZ6E+xbMfiwvqF1VWb3beyA9fpCOiJ+Lu21hBRNYhfwk8uj4MYPSo
 v6Tpe3Ux5fySaXDc3SvXrxr40vnlvLNqNT2yk+IpG5iGdw0N/W/100+0p31TVe12ordQiFEPnJY
 /Wt4r3SQvhwhtGMKkmJg3c9pG+7ph4q5QUOcNPDq+Az5yYyytLBTlIpzYj5eRWlTJiZ3nQflir+
 9gG9+R0I2HrfKYGIRx2diJCvSk7s5GO3jpIJ1HK3lpFbwPjIs1BtuN7qpC9P1OQ5HiFNOnT4xHX
 QE8gsOUAtNc119uUTCN99UwKNHPTFDgp4iz4OOzWKOOjxplUQDuPk/avA8od9z0b/UDrBjhp0R3
 A==
X-Google-Smtp-Source: AGHT+IEUI4DZN+zVO6H433e6m4rfudGfj1mNpmSav7Iz9i0zdE5z9PmaBMA7v6spYGjaYaLKg2/pGA==
X-Received: by 2002:a05:600c:198b:b0:477:9fcf:3fe3 with SMTP id
 5b1f17b1804b1-47d1df12f84mr330543545e9.0.1766999246470; 
 Mon, 29 Dec 2025 01:07:26 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:25 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:09 +0100
Message-ID: <20251229090719.13291-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999246; x=1767604046; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MbucxjDyUqm2MNsTo+silu5BLSszz3rI0cCO9Y8qmsk=;
 b=f2Ciw+pYDeHuptZj2u0QCoYVFplgtYnb6lu0UJPAtcpmrwTJCO2CZwj1aj/Vc1mYL1
 fjjW1B7vhRtDZVscekFf5t0qov9N1Env9OyZ+GrH4dHWU6BV8qFfgf7nQY5G7I9aKWv2
 ZzSm4oKzojl1ClPoyLMrPLLjS+YOggjO7/GgrEDAZQtZlnBfA4zjizmWwpSc0r9de43Z
 2Jy4KM7RCRPbPdrlGGN9L48gSKLipHHf9JpwpTj0X2gpGTTlN9+DHVYOC7JQLFvWTz+j
 AusMy72gJj6/GXVsNrjqmHjtSbrdr++tQWf9dcUv2XCUE2xlGfggJgWCKfTx78x0Pejj
 McZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f2Ciw+pY
Subject: [Buildroot] [PATCH 04/14] package/opusfile: add CVE trailer in patch
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Martin Kepplinger <martink@posteo.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
index 2ef08502ab..8e3be36cdf 100644
--- a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
+++ b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
@@ -15,6 +15,7 @@ Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
 Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
 Signed-off-by: Mark Harris <mark.hsj@gmail.com>
 
+CVE: CVE-2022-47021
 [Retrieved from:
 https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
