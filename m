Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE85CCD184
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 03:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5307982295;
	Mon, 13 Oct 2025 03:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQPX-6Wqv_lB; Mon, 13 Oct 2025 03:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53C958229E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53C958229E;
	Mon, 13 Oct 2025 03:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D517412B
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C712C40A9F
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDLTtX0chF-P for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 03:17:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECBE140A85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECBE140A85
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECBE140A85
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:17 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3307de086d8so3077280a91.2
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760325437; x=1760930237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O8RFiPipaif3lIGJVfo46Cp2Duq5uTUrn7svWLQhKig=;
 b=XjrTyL2vc1QsS/fToBw12uIdRH72egOttRX6H++20Xjg8RcJxGqN4T1S8QtelmVn7v
 TOBZYNregz2JNMLzI7s4dbIW+jeTfNQvwZ/Z6Z3E10Aq8WeX1o3IBMD8kuIXeWEkYf2q
 cJnVkCn2HKzoIkNKho0McpEscrq9v4NbvfUykeQf108RKSG2zfW+u7JsmkeZwnT00INS
 9R6yPP+Nyu+9TM131ucuykgikoJBaN2a5zQIJLzFqUH+sKJv3ngz8pYlr7E0n9MjieNa
 Ux3ABtkfgDBdHrE9TJpFzg7Qh42Csi93CLGU8XlC4OP+XmAsXmkLoQRdpGsY4kHwIa3I
 zn/g==
X-Gm-Message-State: AOJu0YwMdBHCLmsHWwUgVj+azW1UOJEYztMAfGMqqHzrSoGfmwie6a3S
 QEj3CWwSvl9tOvqFyh7kg0ic8CF7372qKUpfSBTIs2aWpKyUxktv/0o2cKzAoXw5
X-Gm-Gg: ASbGncux/mLmbuW8WjHEHUTeRoMryXiVGDKEzdMBUpEc2h9INAmNqrdeMpJz0U48kft
 iSn3SQhfQsg5rDvdKrAcI5n7kBwfYpL+qpXno5eWrP9xrM++EIjGwNqlv2kuVYaMOnLvRKUJoEM
 LpyidVrNlWn1obpuG8zryqYbMj6dAX8rK7mRf+Y95SnEmw1G7SFQmr8uTLWA7ywyaBquPyFRvuC
 njWlU/HWFbb5/jMvIhCxFI5YlVmLS4y3N+zTC5tEJ0GNuWXX/szA5I8iSUYPxdu/sT6qIzCVh0c
 znS1v9b9+rXmETqnX3jUYkSnlRlYfCBi++JmkxvhqcaCIckfTB+i4dvDI/qdbA9dRBXOYfmuwpJ
 bOe/XqiA0M94wLvlCugxpEUG9pUUTxf0eKcxzwNTo4mpp3sEiEwNyaipvjAFTWKHSURRqjDDn2A
 QJajsP7Yy6sXfYonDVg24XLjJAUK3zNjYVmsPnZkXbQr+E5okjOG64m/Ps
X-Google-Smtp-Source: AGHT+IHI1i1kH2W6qcy1O7OmmMXCCT+w9oxfI78LCnJ1mbSsAhn8QzjM5rZuci8ADjgh10GmLK5IrQ==
X-Received: by 2002:a17:90b:3ecb:b0:335:228c:6f24 with SMTP id
 98e67ed59e1d1-33b5139a113mr25831168a91.25.1760325436964; 
 Sun, 12 Oct 2025 20:17:16 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac8d7fsm10195647a91.21.2025.10.12.20.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 20:17:16 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:14:53 -0700
Message-Id: <20251013031453.566526-9-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013031453.566526-1-nemaakhilesh@gmail.com>
References: <20251013031453.566526-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760325437; x=1760930237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O8RFiPipaif3lIGJVfo46Cp2Duq5uTUrn7svWLQhKig=;
 b=kUSNv4T8fTLwvl5ZTmVRQY/ZoQhSootcT4zNEG2K7vdhqgO6c+QQMocczGs9iX2HJ3
 DtUGYxB0K2IAAMzGt3iEtaMqc3PTDeiuSMWYqhCdQmYgSQVkO3vBaOiO40pEtZl1sX4Y
 A3IIkGE6WWdYdMhREdQ7sa3e9TV2Sq5aMoLZGO+ptwNbVUPYjQ1Pwx6Uv8xl7z7Ntclc
 oRU+9E2KKCg4Y+zDBN1JLym+ZLplcT/TvDNSsjbyW2Wf1cjEvWOA2B0ib4+W5NHKdETS
 VYFyoLFYE8EwB01N9a3rpixdu/broQLayHoa/PSBl4QuniTFXLvoWzOwBZ5+4kwtQ77f
 eRzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kUSNv4T8
Subject: [Buildroot] [PATCH 9/9] package/fmc: bump version to
 lf-6.12.34-2.1.0
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
Cc: Vladimir Oltean <olteanv@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/fmc/fmc.hash | 2 +-
 package/fmc/fmc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmc/fmc.hash b/package/fmc/fmc.hash
index a096f00373..aad3d1ab11 100644
--- a/package/fmc/fmc.hash
+++ b/package/fmc/fmc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  690ecca4d36b678f028afe780fb6750cece540e621a1c3f50bd98f54fe97d15c  fmc-lf-6.12.20-2.0.0.tar.gz
+sha256  e3a9e2742bd68c5eb04f3d803b0b61926a163621058e3cc6a34f241683b5b153  fmc-lf-6.12.34-2.1.0.tar.gz
 sha256  f92862ceb95db5492f50a59d7c799c9395b714db88db92d11891dc0233e2ac42  LICENSE
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index bea7c5299a..d88fa9614d 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMC_VERSION = lf-6.12.20-2.0.0
+FMC_VERSION = lf-6.12.34-2.1.0
 FMC_SITE = $(call github,nxp-qoriq,fmc,$(FMC_VERSION))
 FMC_LICENSE = MIT
 FMC_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
