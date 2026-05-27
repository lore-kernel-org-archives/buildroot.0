Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1977CD5BDE
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 08:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5CF41FB8;
	Wed, 27 May 2026 08:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6s6eRpv0Yrd6; Wed, 27 May 2026 08:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52DE041FAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779870268;
	bh=VxuFrl3UWSGDLoeEkOcOGwL8qCtLUZrGR11rgoCZr6U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KkIlNkjy149ewlStSQhA5jy6u8aEAbjN2l5UIUJ+dU301MVIpWHm+c502+0NacP+N
	 qihJXO9bNKD34ZX81pvZPE7FthR9z/baFXqCqfODySBzjpE7fFw+H1iO0lVdsZqLod
	 XPTEy0zOwP98YkpmRv31ENMUsm41EiRuG3H1XHQ3PJFtXK+yy7Vt2ovAvgTRV48r+V
	 sPPO8RH1rh+GraKsaLtXriI56zBn9Z1fqQ/TBJb1UB6e9or5OD07K2mVNUkNHN/fxs
	 B9GOU3Q7W/zDsaZJHCxWOIBvwJ/L0LCrdonlOoIHXzCi5SPWGayVGQiC3cvI/RvOzx
	 VoJjvqruXuMeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52DE041FAE;
	Wed, 27 May 2026 08:24:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5A4C21F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C28BF41E7F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1R07BKbOifcP for <buildroot@buildroot.org>;
 Wed, 27 May 2026 08:24:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D2F741E74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D2F741E74
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D2F741E74
 for <buildroot@buildroot.org>; Wed, 27 May 2026 08:24:23 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso72477665e9.1
 for <buildroot@buildroot.org>; Wed, 27 May 2026 01:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779870261; x=1780475061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HoyRij2TDlEGScVyjW4AEnBr85jHRyxsRL3zJDs/6yk=;
 b=SzXSpu6zJTQQa7HpcWQiwnn7w2nFyhB1HrGsVTxaKqgDKkJeFY/SLjG3w3Q4v0wfnE
 Xlm9EiSwR6T50AmXG+ffmTxxtylDsWHhMrnUflUTh9trUE8eeLApwHh+C5tNErlMrRiV
 wDiCIvjmI8CVr7zsvD8j3FEPBqfdnDWVrdCQolCGnWBnwEZyf5amh12UGilvBoIX6NvO
 RfLnKSpJFUzOGGPkbZoy5ty+3XkO9jR+adHeMBAyeSnFd5+Xkoy/TM1hfYao4z+sEqxj
 hx3LQ9rZPtB40txhRSdQmCQ41lWvWnvN/s0DiKwFBbkwNd85hnZlxBZ9Zk9Ie6iDKYqz
 G83g==
X-Gm-Message-State: AOJu0Yxbz2ZJNSwNBfw7hlf3AIQwoqeG2GLqcAf/vf9Ipkd4P2bwSPht
 JfVcCQttwwNEOeKREGKz7R7Iz8RgqOws3Xaxxw5IE22Dg8g/uo8Ae3oAX0sHgxhwiosNLjCglbi
 31k59
X-Gm-Gg: Acq92OFuypeXMGTYRNf2+mG5KgH4LePGtPE8SWeNaY8o9m3vijofsCFHjb2yBTBUPih
 ghTLnWKCZZceVCJYcEn0iC2ZXRkAkTic+TGUFNDmWlEATHM3GVLW7H7lxzOGaPFAl+j0pLQVo1t
 mKcPiwmbjElTIqW6h6Or46ru51wjcCLUG43Sh5vm9N4nM1jYMZT1g0Oprllm8y1LlgfYBUjj8lf
 ZfwfSQUohVCjtkrzywKZYKo/rVtz3jctzkZhgvTvGQ7B/s3bsVxv65Pu3pjoa6waQn8akclgmiU
 d8O+xyRYIMWOR8KOI8jD4kGSZCzwv+z4TjcO6ZGhwPKGlNHodgbuiaMIhrwkJkUhfK1ZoScdWWy
 pZuR7WvGVrd9qKTLvrBujbuSzlTmY7kxRPIT4NrgZdCYeGABW4EVKTFDEAu2AchjDbz5sdoz7wN
 CSXeJ7nqaC3ZFeyc3xv68q4/g4rfZKUW4U+RZx1W7TZ48kuaI=
X-Received: by 2002:a05:600c:8b86:b0:490:58f4:ba2f with SMTP id
 5b1f17b1804b1-49058f4bb2fmr268061485e9.23.1779870261280; 
 Wed, 27 May 2026 01:24:21 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904561a160sm437803495e9.9.2026.05.27.01.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 01:24:21 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Date: Wed, 27 May 2026 10:24:14 +0200
Message-ID: <20260527082418.151980-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527082418.151980-1-thomas.perale@mind.be>
References: <20260527082418.151980-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779870261; x=1780475061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoyRij2TDlEGScVyjW4AEnBr85jHRyxsRL3zJDs/6yk=;
 b=EigQx4OhnU/jFQ4fq6xQvZulZUGaaCn/4WFDSbS/ypxYu/Nvp97nNCXyu+hfxGUHCP
 4/LpClPXohaFcXQJmf2dYmL72VJtmGH3m9HsuCuV7DyTHFFPSqbiGNc+CCCMELYq6oDG
 E2x1D+WslFxP0qWlxHiipvqLCQAqDWoQoYo+mjgeTNzDV1TJWWiKhY7nwHzhT2vpRJ0R
 DkcHqe4xh1ys/rpsH2wj5ZFNduTrWfyMjg8k2/wx3T6zdWOd0ngSEZ7Qoelfvxk/qgEb
 UM1pOkp6RzK7NDOAcNoy7aBeMPmaDTmH/NI6qVQuUac0IBFQuxp3SJgvuYk2DQqaVODj
 xosw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EigQx4Oh
Subject: [Buildroot] [PATCH 2025.02.x 5/9] package/go: security bump to
 version 1.25.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Korsgaard <peter@korsgaard.com>

Fixes the following vulnerabilities:

CVE-2025-61732: cmd/cgo: remove user-content from doc strings in cgo ASTs

A discrepancy between how Go and C/C++ comments were parsed allowed for code
smuggling into the resulting cgo binary.

To prevent this behavior, the cgo compiler will no longer parse
user-provided doc comments.

CVE-2025-68121: crypto/tls: unexpected session resumption when using
Config.GetConfigForClient

Config.GetConfigForClient is documented to use the original Config's session
ticket keys unless explicitly overridden.  This can cause unexpected
behavior if the returned Config modifies authentication parameters, like
ClientCAs: a connection initially established with the parent (or a sibling)
Config can be resumed, bypassing the modified authentication requirements.

If ClientAuth is VerifyClientCertIfGiven or RequireAndVerifyClientCert (on
the server) or InsecureSkipVerify is false (on the client), crypto/tls now
checks that the root of the previously-verified chain is still in
ClientCAs/RootCAs when resuming a connection.

Go 1.26 Release Candidate 2, Go 1.25.6, and Go 1.24.12 had fixed a similar
issue related to session ticket keys being implicitly shared by
Config.Clone.  Since this fix is broader, the Config.Clone behavior change
has been reverted.

Note that VerifyPeerCertificate still behaves as documented: it does not
apply to resumed connections.  Applications that use
Config.GetConfigForClient or Config.Clone and do not wish to blindly resume
connections established with the original Config must use VerifyConnection
instead (or SetSessionTicketKeys or SessionTicketsDisabled).

For more details, see the announcement:
https://groups.google.com/g/golang-announce/c/K09ubi9FQFk

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f56dc6b1221ed0792e94cad1a96c51cb75f60b0b)
Signed-off-by: Thomas Perale <perale.thomas@gmail.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 6134ec5f75..9a9a5a571a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059  go1.25.6.src.tar.gz
-sha256  59fe62eee3cca65332acef3ebe9b6ff3272467e0a08bf7f68f96334902bf23b9  go1.25.6.linux-386.tar.gz
-sha256  f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a  go1.25.6.linux-amd64.tar.gz
-sha256  738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5  go1.25.6.linux-arm64.tar.gz
-sha256  679f0e70b27c637116791e3c98afbf8c954deb2cd336364944d014f8e440e2ae  go1.25.6.linux-armv6l.tar.gz
-sha256  bee02dbe034b12b839ae7807a85a61c13bee09ee38f2eeba2074bd26c0c0ab73  go1.25.6.linux-ppc64le.tar.gz
-sha256  3d97cc5670a0da9cb177037782129f0bf499ecb47abc40488248548abd2c2c35  go1.25.6.linux-s390x.tar.gz
+sha256  178f2832820274b43e177d32f06a3ebb0129e427dd20a5e4c88df2c1763cf10a  go1.25.7.src.tar.gz
+sha256  2866517e9ca81e6a2e85a930e9b11bc8a05cfeb2fc6dc6cb2765e7fb3c14b715  go1.25.7.linux-386.tar.gz
+sha256  12e6d6a191091ae27dc31f6efc630e3a3b8ba409baf3573d955b196fdf086005  go1.25.7.linux-amd64.tar.gz
+sha256  ba611a53534135a81067240eff9508cd7e256c560edd5d8c2fef54f083c07129  go1.25.7.linux-arm64.tar.gz
+sha256  1ba07e0eb86b839e72467f4b5c7a5597d07f30bcf5563c951410454f7cda5266  go1.25.7.linux-armv6l.tar.gz
+sha256  42124c0edc92464e2b37b2d7fcd3658f0c47ebd6a098732415a522be8cb88e3f  go1.25.7.linux-ppc64le.tar.gz
+sha256  c6b77facf666dc68195ecab05dbf0ebb4e755b2a8b7734c759880557f1c29b0c  go1.25.7.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 91e5fbf347..a9c7d1ddc6 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.25.6
+GO_VERSION = 1.25.7
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
