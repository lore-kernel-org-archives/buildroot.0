Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFB5D1266D
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 04:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77C3F614E4;
	Wed,  3 Dec 2025 04:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK1NyCWWJuJV; Wed,  3 Dec 2025 04:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7007361412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764736548;
	bh=pJJUkDlAuCBn+qssVHJjMOXGzxXUCYkIob0DO+5Gx1E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Imgez6GU/+9GYdLhTqBn+E5p2tTiKQRIb3AFQfA+zujn9SlHR2x4aILY8COxOXmbn
	 D+y2dYDnRLo1/evbfoBPxhofE0dTot1sI2S/RC105NFFz8hJWKuLpubb3haUvkE1Hr
	 YIrkRVAh8qf7SpnNKJold0UISb9PZa1Wl1NUZTPktg6oml7lx7r8c+XnMX/IVIl17X
	 25F8RpzFJUgvfKpltDl9svqHGLYQVgJJPKSHUa1YxUA0hBp5PA3cvKRs4OlILxVW77
	 bA0MdkNg8s+/wN1boAYjxbpdFILVkz14/Ko6R3e4ZmlhgwRzguLhH82okOynqbKQwN
	 4xpeEAt9kup1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7007361412;
	Wed,  3 Dec 2025 04:35:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5B18E4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 04:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC137400CE
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 04:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8t0vU6bcDqs for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 04:35:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB0C040079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB0C040079
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB0C040079
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 04:35:45 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7aad4823079so5607143b3a.0
 for <buildroot@buildroot.org>; Tue, 02 Dec 2025 20:35:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764736545; x=1765341345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IuYtyIVvx7PbiSqfl/H43tOgqVnRa/2BY5raGb+tvXA=;
 b=SyxDg9MkJNK/daA33iOPoebcDLe7Ylk+RPhBejsoSgEpbDhgZyjqtmecYpEheNK520
 MtEdRDLQZMaHfaaSoJARTLga1N8Pci/Du7SYSNiE6JkwCMGgDTt2YKBfU+sb6a5adVC7
 vmWoyFs26KGc1/btQoHhp89mmKR+39gbacySYwcghRmIoCxJZwqE0gdVDYS5Dq/5gogK
 LSe1qAsd2h+Aw+Ww22nNPJ8vdgzl6NT6Qx13etAOCmxSWscAKg2H05cnPuH7B1jUWJGX
 DcCKnaaCvi6CD6nP+267FDKYGJydYFbAd/SuqqgtsT9JbOPmgLQY39cVxjvKOv5DqXkq
 vFfA==
X-Gm-Message-State: AOJu0YwEy/BQJztOCo+AgpYSRX6+46jvM6EgfJmPn/xUtrLKxeYn93DG
 G8XKtlDBrVuq/SdpqYVc8Mm6dgr3YGfli9QT/AVC627gprCaG/WALRaAdEpC3Q==
X-Gm-Gg: ASbGnctTkylXbm4GKgAFoiqIadA0zHPlTJ+Qg0+ylZgq0AtADVqd4+NJS2+eCN+ApmD
 OdsA+sBLMj58xCNaFU2zqkoIaJUnF7+LFv41/9j8/UGBDQi13uxu5SlZKqfdpiBYds1xKFhNTDn
 YlVuiegm7kLET2dcaVDtOxxzMdaMx35AfbTviz8/kvYhIkWfkTts7NpZgc/lB30pcMoQDnyl0XB
 s1Zd/zGF7om43/HpJeiYSgf5CKtkFEOpdHHUKUIWL+EAzp2AUVC6+1fPvxSbkd7EP6zQ5uKTOQW
 fQWwcKkk8eftQernBpO6nHl/IpHMd9VhgElpjsX2oSwPWmaeZhxcg3wcu7Rb3rniAguOAiB+B+l
 +5Gh+03/kV/IITn0U4scMR/vAW2D6G3fey5HmygYwsa624qhnjkxg/Pi042y+NivFY64UC553dL
 0fIC0d1Ek7e3+YDzQ7AjBzMsApgC+bAY1bZ0CWD84EAwHA391shmVxm68qDjgv3WvriiIdSAlie
 F0IceTHVP6KF1Ub6xptrNVAniU20g==
X-Google-Smtp-Source: AGHT+IGxnB9u8/pMpMIbaKs8Clloa8Hg4T/XZ52oJGzXBBqekF1dmwRAKjpoLr7FMoELWPsA/0q7kA==
X-Received: by 2002:a05:7022:2493:b0:11a:2ec8:de1c with SMTP id
 a92af1059eb24-11df0c3d84bmr861842c88.36.1764736544737; 
 Tue, 02 Dec 2025 20:35:44 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11dcaed5fcasm93522504c88.2.2025.12.02.20.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 20:35:44 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue,  2 Dec 2025 20:35:35 -0800
Message-Id: <20251203043535.53886-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764736545; x=1765341345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IuYtyIVvx7PbiSqfl/H43tOgqVnRa/2BY5raGb+tvXA=;
 b=M1F7RnDUbcA39CtKtizfjFzrGAAiISCouhJ56MMLl4wpge6L2alGcBZGrez2mvuGbz
 JT+DtJsjSqHkn1sI1C4krmx1FwJ0TrSkFgEAjS1MROVKy/GHeuWauLtJUL5gXlXS7D8e
 cEIdZwNEMmsrBqiyn7LxRc/4mj8ApXQA4ZX2fNBZh25qcla15nSUQ/LsNbsRNVGkO8lH
 oH0896+kp2Cqv5oVmKbAzeGTtCjTUPMakIVkcAIQLexX9fZ93L5MznHUrYvbroVuicak
 M4OvPjFGYnPSVzpP1XEO6FMbXue1hEGb9lFPo+LYD6bL7gsRNk91sjI1a9aTr7tnRAQ9
 830A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M1F7RnDU
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.402
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

Release notes:
https://github.com/vcrhonek/hwdata/releases/tag/v0.402

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index b96c36648e..6a0b931aea 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  e9ff93b9807cc014ed8f7f5cb5dc2c31e714058c82ddc59b7355f5c57c9b759e  hwdata-0.401.tar.gz
+sha256  e390fe2f5f5ef7ed9ccbe62eb7cd40d4ee2b57389e7869c0dc96433c81812e7a  hwdata-0.402.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index f826faf94e..8a8e399c21 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.401
+HWDATA_VERSION = 0.402
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
