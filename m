Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9074AC369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 10:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48BC840A03;
	Tue, 22 Apr 2025 10:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Mh7SSEPFPEa; Tue, 22 Apr 2025 10:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15D434060B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D434060B;
	Tue, 22 Apr 2025 10:00:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B433E68
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A38EE60BD6
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8CM6zoPktrY for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 10:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85CF960D52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85CF960D52
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85CF960D52
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 10:00:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so2954755f8f.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 03:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745316028; x=1745920828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zmgdqUzLu8/V4nelsGzGEDydlCH75yWNYaW8wIgv6G8=;
 b=o6f95eDbltzgUkm3fLzHTl0ARC/8kzZ+oU3flK6qoDnB4fso5Nojzg1tIZAMUqjGmO
 SMke/8nY/AxmZXnjXvHHmAmth9yJL86SpEFE0LoIaLisGozxHrSs6ZwQ9DmcCdQNBSqN
 /5b3FNu5HYDGKIHRUh4aWZ/fMQYO25cCQpTKEXeNoDamAz3t0zDcAzxUZQFI5TetvJiQ
 OJXaWagqMvOxpMRiHKG9+rGJWuncRy0fB/iKzRjCsw2mvvntISfjwcB5RaaxuursJKz0
 AIEhFEK/7eXzpvwgRHKCqOHG/zexXoepCvaOJLlbM4QL3lnSA62Day3odONwTbrkl/ts
 MSWA==
X-Gm-Message-State: AOJu0YxAjHQkSmSSHGp5nqPOBUsAhXA6RnJf/3aAsvFusPLL8kybtGOn
 hbvuvkwfV7pheE2vi3hQJrcjUPzprhFQ5DGCHpEcx5Y/aupons7yRlC1tWjnOgBm9RedOF6Muab
 SR0c=
X-Gm-Gg: ASbGncvTw5mzCe+403J3+ZeZcQ8/IGHRN2m8xRANIfhS4+r40p+pzWYsRWzHhbRv7gi
 dxhNIoAigReXHufs4LpIIfIHGUDx9BKpi8KKRto9BhvrKEqg5HUlz2bSgj4M4cS1DXTOjdzZv5g
 UdFnPFJPGypG06KWLBKTN+fKK/a5RqZgBZoaGDE+vARY8Sy9G8UoiyEURVzxjKB1Ht3M2jzn2xj
 GwUVKj4hjnRoIi+QKmaJonnMybhUf9/CXpe/fOtDCSaVj7h69Suq8KPCNn2lahe7P9TX+ZF57xZ
 ANxZYRPsNOewcZvzkdu8W0V6Z7QB+RRdn5RQyGMhwD5+iyTO/BlgfTp2oWQ1YGvY5rpOKR/dB/a
 SccmQnBqTpKYa0BB6+/eENGflniYy7OVZNf8=
X-Google-Smtp-Source: AGHT+IGVXTZQ9/MGOyHAam23PqtaUTkxqYNiazQ6e0hH4zIJOHALEjX5d2sryqcpZE9tVkBngK3Y/w==
X-Received: by 2002:a05:6000:4313:b0:391:ab2:9e71 with SMTP id
 ffacd0b85a97d-39efba3c6d9mr11797225f8f.20.1745316027878; 
 Tue, 22 Apr 2025 03:00:27 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa493145sm14549768f8f.71.2025.04.22.03.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 03:00:27 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Sam Voss <sam.voss@gmail.com>,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Tue, 22 Apr 2025 12:00:11 +0200
Message-ID: <20250422100011.962097-3-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422100011.962097-1-elmehdi.younes@smile.fr>
References: <20250422100011.962097-1-elmehdi.younes@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745316028; x=1745920828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmgdqUzLu8/V4nelsGzGEDydlCH75yWNYaW8wIgv6G8=;
 b=uqV6jlNEihc3FIz8m4npqOTsZUOyx+HdCnuV6QowdzsWE7GHL/ReiUuxspKzqunNnL
 c046+dR6RNYX7s/MtQYfK4WqaDDTEIH9PJr351CmmniOTr4AIp5KChi1uLRDReYxk/gD
 Zj3e2jOdd1o+MnlZ1AjGPe3zW0v5CDeL625tk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=uqV6jlNE
Subject: [Buildroot] [PATCH 2/2] package/ripgrep: bump to version 14.1.1
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
---
 package/ripgrep/ripgrep.hash | 2 +-
 package/ripgrep/ripgrep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index 39165770dc..eec532d240 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e1e66e2e9a7290a0a9445a82886a678ee8b2583b296fb851e1472c7403a681a  ripgrep-14.1.0-cargo2.tar.gz
+sha256  64e79c29ca21c9faf699f7241919f05bba89e5732ca5ec6d506fb4ddd1245d9e  ripgrep-14.1.1-cargo2.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 288c20ee95..fd5b3b882e 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RIPGREP_VERSION = 14.1.0
+RIPGREP_VERSION = 14.1.1
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
