Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB7BF33A92
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 14:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8BB6107A;
	Fri,  6 Mar 2026 14:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIrvXGADAn2C; Fri,  6 Mar 2026 14:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB516070B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772807024;
	bh=+Xliplw2GVSmIB5H308F+mAqAAPQDpMkNwcq8uv4g+E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=DiDE2A06+EjjIPI1+nc4Wrp9edlo93bpqB0REmypxa8s+WQMQeQv/EsNVPVDnjNMW
	 60bKoUktVC2y9Ixva0O0yXxbJiVgeW0u6nsa9W65USJWiKsIMjlnE42Cr/HOwRIxAv
	 500Ot50bLnRQEV9rVy7Xy2x9yE7ll0/Q1GWizC+zL5cM6d4t0QoB09AbAT937z85fP
	 rmw9QNphmf814GenSvjje926RhrH83hNsnH7qQgofUv77XpWyJt3BAJYOCW3cEMsP2
	 p58hynrmYkx+sMpFIFm/1Z+RWPP2nhbMPFAT+tPm6ObH4RlxBgrRaKdXcF5w153RDE
	 3wQr07fh/wbqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BB516070B;
	Fri,  6 Mar 2026 14:23:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC20F25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D195741226
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvBwB73xhsWr for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 14:23:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A443E40042
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A443E40042
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A443E40042
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 14:23:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48529c325f0so2228505e9.0
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 06:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772807019; x=1773411819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZ3M6Pi3/Z7A99HJdiiV8+B3Q++RJgUmA4Ez4W5qV7A=;
 b=w1kFRQrbgXh+7BgnOzWyaVVk4L/ruAyzYQPCThHg30QBwbzQRrA4kVcCuPE5aeSzaE
 FYP3S4AO3kbCsTv7DKnvdhdyV5s1c/k9LZcQgpiwLf5CxemBEEEbryRHkV8FydOMMcK+
 2aNIl/NBKW8iMZlRpGGzRDUrTyy0R717213bBU2n1b45vT/Y1yW/Lws5hwPHhG4dbZ/N
 Hu8HvxgDLjczOIsBkTqxyPaQrfp9E3x5i1/LNxHw1Cpd258+JyUL2XR8yNzJT9Y7VCZV
 uGcsxDvS9Jrp7BJKrIBaG8dDNynWt21Eg1Mz1VERApEPnP0ucuUGwcfkngIWn1UgvIkq
 iPnA==
X-Gm-Message-State: AOJu0YyDqalGFyXTOhvk1Y5APfsHcGrDj98c3PAtuZP9zLIIOyQ8l8+A
 tUIiUbxngcXQjbXUe69dgsmwFSDRsrD/qLl1MH1Hnm5qoQfsbsMPqcop0o07RhcuZHwEkqZQvUJ
 dWFEqieA=
X-Gm-Gg: ATEYQzx+3D73dIQWhvxwLWkFvCt8KfVRD4D4FqPJXoyvWkGIEWcAgLP+4/dmu7g6qKL
 Tw4E0UIAyqcJPUE+FiJCVgbxaMSFSgM7XECM4VKYzz/tV8nV1IvtJAjvCQkxPnMiLXHj7jbuj4C
 +co/ZuJgSrHzNo6ITHJl+rZNZNjfe/hLZZqx3VNApuoVl8Q8de7xUcizvMDe2vB8b6qi0Yx68ra
 rMoDw0Y5P8//fzvxgF5g1kEwyv/Il4QaaNJlYNQdGgpzgKRBIroA3TiEvubyveHgQMZ/e3Bv6G+
 rSW4AkEcZXY8Mygymg21+nWUwxjeEJ5d8OABTVhzdGxdrn1BBxkqWT5flX6kJ3XsVIqRI63miiS
 ppOTLY+nWj2qkxPotCtTZCK4vOR39nuDAAPEEpcKiMCXRNH7U82KCk5u391CLC9gtbg+Txqd7rN
 4vhlQfGliFWXmMGpDqi0BmUf6BHdqpUzsY+xVPWa6HRuOKCQ4r5J+SPZEwcHN7QgjSqiWYwcydD
 fSEwY4Sm5bZFgKrWpe6BN60DKV9q+A=
X-Received: by 2002:a05:600c:c088:b0:483:79a6:e7e1 with SMTP id
 5b1f17b1804b1-48526919935mr33900625e9.7.1772807019082; 
 Fri, 06 Mar 2026 06:23:39 -0800 (PST)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8d968sm3994694f8f.6.2026.03.06.06.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 06:23:38 -0800 (PST)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri,  6 Mar 2026 15:23:29 +0100
Message-ID: <20260306142329.1010724-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772807019; x=1773411819; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CZ3M6Pi3/Z7A99HJdiiV8+B3Q++RJgUmA4Ez4W5qV7A=;
 b=1jEOCrLJnRynzI8U8Ihfr0CrOfqCJPEweU6Fx9o7d3X1QRtwnMnYxXHLgGolucS6FL
 L5kvxjLr55NzLQgglWY7fsIoolxaH2+B4gvYxRLjvt0OqlbRK6Izi95AG5IqjbGXB04f
 UzczoLgECuXalyPAFuSdckKU++GXuQs2oTqgU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=1jEOCrLJ
Subject: [Buildroot] [PATCH v1 1/1] support/testing/infra: update artifacts
 URL to https and .org domain
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The artifacts URL has been moved to https and domain to .org to
improve security and avoid redirection issues. This ensures that
downloads of kernels and rootfs images during runtime tests are
encrypted and verified.

The change has been tested by running a runtime test, confirming the
correct download and renaming of artifacts from the new URL:

    Downloading to .../tmpyotq8uor
    Renaming from .../tmpyotq8uor to .../kernel-versatile-5.10.202

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/infra/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index be61d8cc4f..98215e02ab 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -6,7 +6,7 @@ import subprocess
 from urllib.request import urlopen
 from urllib.error import HTTPError, URLError
 
-ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
+ARTIFACTS_URL = "https://autobuild.buildroot.org/artefacts/"
 BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))
 
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
