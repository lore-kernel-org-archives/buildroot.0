Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587FEC4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 20:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE4281EB2;
	Tue, 28 Nov 2023 20:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDE4281EB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f00e4AAnknYj; Tue, 28 Nov 2023 20:24:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D59381EAE;
	Tue, 28 Nov 2023 20:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D59381EAE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 080331BF38E
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4D3A4175C
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 20:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D3A4175C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQ8HdUpL2bBR for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 20:23:57 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17E5041759
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 20:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17E5041759
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso1090715e9.0
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 12:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701203035; x=1701807835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7aECA75wMRLAc77Z+P5GZvFnBv+y8pdT2kGwRMY4hnI=;
 b=o8F8LLZpbzxdNjwZteujBm9x3aAHtcSid3M/dIXYQZZCtaU20wvnXCW5yn0A88+ZeV
 3zU60WozcRnspR9yunEgP9LNq3GHWOGRmCFEZ9OV+gUE1rU6nHJDqq5Z4amI1oxTOiP/
 icqYJGd+uKjL29ke0qjr0mVDHbHZfbXjNFntaU4hTjpY7fJyL4tW1wEz8rp6+Yutkw61
 B6MSKGfRuluiTv0uKYLoAzrAY3xLMK0D+CeyYWrGgRjmJfa7N1/DzuOi3xoJrYFiaA1F
 QbQ/BDGPPuzZ5f+V5DOBDXGJRmZrLnSZvzLwVD6SHY5nWh9Q9HovaqTQZD4i8ez/o0HO
 hVbQ==
X-Gm-Message-State: AOJu0Ywg+b1Sv6V4ctd6yyyptoxnnSru4cy1Pyp06iChw8VVhhaVT7C9
 0/EikZlFfHn2O6BXaa1BQbikHm9y6Fw=
X-Google-Smtp-Source: AGHT+IGu9/QH3tMC3p8PdG0uDlG5kzfaMyUyzrQPTNZhb/PsWbeRycSqlGjOTxvz5z1zI9MKFm9reA==
X-Received: by 2002:a05:600c:1da5:b0:40b:50bf:e6df with SMTP id
 p37-20020a05600c1da500b0040b50bfe6dfmr745689wms.10.1701203034651; 
 Tue, 28 Nov 2023 12:23:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 24-20020a05600c231800b0040b36050f1bsm18236096wmo.44.2023.11.28.12.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 12:23:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Nov 2023 21:23:52 +0100
Message-ID: <20231128202352.499855-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701203035; x=1701807835; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7aECA75wMRLAc77Z+P5GZvFnBv+y8pdT2kGwRMY4hnI=;
 b=h6/7tAMfEr6ARD7QjwZqueZHlyPUo0P341I0WAyzZddf537gHZh4+iNQaS0uO4Zikw
 vjCOfY/QBp+Jsxylkr3Ue+jEOJvPRC3Lvorxe3fxyW3RL3H5soBpSX7ObBVF+e6/6JjY
 qhEoCWKC6mWU+LxvofJ74hdbBdzM4wc5Mq9NqOqQscfvSaYDzbwP4KhXdoyf4Wg0k2kx
 MA/t4TFAnzpXhcJ+VHwLY2ESHJzPBnziNjvkRJSrynACEFKhTwrQmGbBzPQSZifeEC/R
 dayudCVzXvH/ypVmn6prxrw9vNgeR6e0Pu0HjeCc+HczIHmArWd+JsKBrp5TqRlInco7
 T1rA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h6/7tAMf
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.2136
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-46246, CVE-2023-48231, CVE-2023-48232, CVE-2023-48233,
CVE-2023-48234, CVE-2023-48235, CVE-2023-48236 and CVE-2023-48237

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 8fdb6998c9..4ff64bada2 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  29d0e5212daedbff1b781edba1b66f549b1a226020271f20aa9884abfdf39fc7  vim-9.0.2053.tar.gz
+sha256  d826682fb839c0b99f80b9189af549d46dc087ef2cfc617ce161609ba5da4dc7  vim-9.0.2136.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  b475d5d3f8c855dc1a84813bbe45c44054d7f7aee20c800950bf89d5958873de  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 37684e0aa3..b0b4ffe344 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.2053
+VIM_VERSION = 9.0.2136
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
