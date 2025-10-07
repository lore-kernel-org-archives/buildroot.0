Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C982CAC5B0
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 07:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4086D41A2E;
	Tue,  7 Oct 2025 07:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h37Pl8ftr6Tg; Tue,  7 Oct 2025 07:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A1241AEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A1241AEB;
	Tue,  7 Oct 2025 07:05:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 230539DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 07:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09546841EB
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 07:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_nzTWtk1K3h for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 07:05:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94D52826E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94D52826E5
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94D52826E5
 for <buildroot@busybox.net>; Tue,  7 Oct 2025 07:05:36 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b3b27b50090so1087706766b.0
 for <buildroot@busybox.net>; Tue, 07 Oct 2025 00:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759820734; x=1760425534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ypu7aCeCW/rfX8KmX2uAMjqKJcdyoO4Fj42hHRTDxEQ=;
 b=OwXoM+pGD6WLdxtSHXkanGLBBX5tsKUG5aOVfu/H88YnT2mxLQtqUDpkXi2g7salzR
 uZPtJG/8nbWaZqiCteoy/+QIQ/xhPWotKQAGFXwdK5Oc7J7FdDIDDHS0ilbxnx/aORnG
 lXT1BUY5A13EDl/hEGvOrjw11OPBZ5rmUwv5UpdaodvCm2tVqGQg820gwXntVClbQuQv
 m/2zzXGsJhx75/MMzxp51rfE2YO+veQwoNopYNMzc0BtDN5KgSQUaFPy+hKDmgdLnWb8
 ri8tSeR1OYJuLEJoJ4nHhMtEvEJ84e3CtFXs3YS13qi1biAA7nLSXsoGmfXjAA7L8Wxj
 3FrA==
X-Gm-Message-State: AOJu0YyIfv/afzqzblBSA/cG+MMvmfconZ5H3rrVzQ7fje4KOc/4RLLQ
 PoOE7xRi/g1BQ3bfTVQYkT/AXFGjHbIQoNr1ihHYTXAChJ8eC7h5VYae0Ru7lJ4qw47Z7LX/CX3
 DRjRZbg==
X-Gm-Gg: ASbGnctN7TKUGTMGzmpc3D+wC1Hb64DFGtt03CiDpcuIkWNP1TTl/T19MjPCVZNBLIk
 k2edeIpdPYUQ/4/BODv7fIQ5QFxXN8TyWZCusCM24aMr9miFl46F1b3oodXip0TzDtVECd2yiQd
 NrAGgBtZXePpSxhnDyLtnVnlQ0wltBb3D9A7GzpqzFlFQxGgzQOF6+ZJDqxvTokC6Xle7Zh8APu
 3nH7pbenAyOFyE1aqtbHFjY1c5Y210wvIcu+ouMJzfQ/w2z1+95ujBt/jWh7Usumcc2YmFfybDm
 /o/b2TtYwIrUyXQ/05dJblQyeE/3RED2EQeMEq/JA0GpcGtr24a1Ffa/CIHYRNWfbNqHGTUVlTh
 ZnjJ9rwRmcPHdIC8NP1QYGXiHEb0eTznIbs50VswplpTCKrd7qc0meSvmFrt3N9+uJH8DkW2YyZ
 s2XbSqsLXtpfDCyws=
X-Google-Smtp-Source: AGHT+IF3UVDSZc9DlMmzrBmeWd7GhDeG1JQQ2avPJDuocFmiJ4BLMh3i9SUm6WqaJtZGVmncZKq0tA==
X-Received: by 2002:a17:907:988:b0:b32:2b60:f0e with SMTP id
 a640c23a62f3a-b49c2052fe8mr2025788066b.17.1759820733715; 
 Tue, 07 Oct 2025 00:05:33 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b2basm1319891366b.51.2025.10.07.00.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 00:05:33 -0700 (PDT)
To: buildroot@busybox.net
Date: Tue,  7 Oct 2025 09:05:26 +0200
Message-ID: <20251007070527.335465-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1759820734; x=1760425534; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ypu7aCeCW/rfX8KmX2uAMjqKJcdyoO4Fj42hHRTDxEQ=;
 b=gqZCicwHJ/+cEEhM5eSTL240Zjh1a6opMlvMlQpaW1h4qMOuNeZyHR1yBoOD8qMo6k
 ng26oWEsxHoi+RtGsqtlJaBdYh4fi/iCnFhaCeO2XgYPBtuAeUuLCBZi173eAK2qZJTM
 ZPUO0AhhI1UoalCItFHThg03ZQqjdzA/Rl/bBW+Vrujjw/lwWwIAriZ1lj+XHEZe2Vbt
 jieG5cWbGSjjiMnQlu66lF7/9jlJVS9T6kg3AtrCMWUH5kC48a75bQgx8xPLJuB6gbW3
 3lQPy68z4aeeLfZUOV6DBVHaqLa/6IxqHjerZyYabd7OXlMZOF3Zh/18dQH8+fHmJnTV
 RgFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=gqZCicwH
Subject: [Buildroot] [PATCH 1/2] package/4th: switch to https
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/4th/4th.mk    | 2 +-
 package/4th/Config.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 276423b25..08b3dbdeb 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -6,7 +6,7 @@
 
 4TH_VERSION = 3.64.1
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
-4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
+4TH_SITE = https://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
 # The COPYING file only contains the text of the LGPL-3.0, but the
 # source code really contains parts under GPL-3.0+.
diff --git a/package/4th/Config.in b/package/4th/Config.in
index 4554664ab..0463a4a08 100644
--- a/package/4th/Config.in
+++ b/package/4th/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_4TH
 	  C-embeddable bytecode, standalone executables, but also
 	  works fine as a scripting language
 
-	  http://thebeez.home.xs4all.nl/4tH/
+	  https://thebeez.home.xs4all.nl/4tH/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
