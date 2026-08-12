Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26007C5B572
	for <buildroot@archiver.kernel.org>; Wed, 12 Aug 2026 14:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98DBB60A79;
	Wed, 12 Aug 2026 14:32:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmAGKQt5nDLU; Wed, 12 Aug 2026 14:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FD4060A5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786545162;
	bh=8FCNcBXehMrqj7c7hpogt6Hm6mqGChapm9pCtYtL5OU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lE/1Ag8zgEH7Y0RKjpmpJEWOd774s7aUsb3i0FaDC3L9yPJoEx24e5y3uweuf4Nv+
	 4AkL1nGwKNvXXXrt1Pty+5OwqjwW1x9kai6Nuw/PTSTlcpvGZT3K995imsu5nt712n
	 pzd477r/VKe4LdlNp32xy/BrUHL511WfR+qt4mdQ3OLSzLsv0ltAFSocaTS4lkKydJ
	 ZzbYfvSGbd3fF5BXihrHANBLZDiRY77NXDYcLhqoyQBJQTQp8r8Y3OiZ9jHQOhChl7
	 eJdHlm8/61EuiyJxlgv2xF7oqRPMLFBAk5o7mLFZuxQW2+hkGhJZMrJPkt7y2+Rcte
	 7MqzYRMIiuPRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FD4060A5C;
	Wed, 12 Aug 2026 14:32:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 81EE7282
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 14:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73DDB403FC
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 14:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_5dvlYilnnl for <buildroot@buildroot.org>;
 Wed, 12 Aug 2026 14:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B98A403F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B98A403F2
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B98A403F2
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 14:32:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47fecbbafdaso318115f8f.0
 for <buildroot@buildroot.org>; Wed, 12 Aug 2026 07:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786545157; x=1787149957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+0+O2OLldCx+Gl5V6TltkdMbx82LGleyhs/7RzDWJiI=;
 b=k9MQxV3WZxdV7m4U4XL9lo4cHmk1ZYL2LpyQCvr2MYtXZA18ZVD+nFccvrdmYP73Fy
 m3XsnxUKRiuqK5P9OxLot/oxDuMI+kpJGo3gWaXh0nna2BZrzQiMEVhmQM7k7GB2I1/p
 74IAeIDaVEj7VYKAuCDBVS+rNmNv87dGGDeiWds66lLuDx7iCkrCUucybNIuFMWxk8gV
 5g45ZhtdtyqjAaUiooO1ISzNVv3/uxBk7p5Cav3dGDrBC52L1iBuTu3r6hwRfFKatF+f
 tHbPnAzAobv651AxMhmyiAapfkn9sIuCpwnB/f6ODuI/eAsjiQD/NJsVPtA2PuXL2eyt
 k78Q==
X-Gm-Message-State: AOJu0YwJ1ssLRzb2iTlvnhi+x+dAseyTyROmzwqE88q4GbhxwbUun7/0
 e8qKl1sYpbitpYK+kp1UaOxrz6UhgVS9d0K+1VFZj7M0pOVDW1COMxuy3Uv0VZzS2FJmOJLvCw6
 JcC3q
X-Gm-Gg: AR+sD11nn/y//ShRZX3Z4eOP2nQZWuAAG2mWeTCe0hStze7UPkhgYn0u+CLAxLCgw5e
 sBRB2Rkh+aG5hHcS4UbOuUfac54FZj6HInLTx25S4L/HJviYlq5DH/VGiOdFAYIOX1Bk8cuOzvA
 DJ2gWRSDdp/jBooQ5GB07+3iQ+JYUgDEh0j/Ajb8lJqgDCokBtgPmyqc1mObBUe7k0dfOaNtPvL
 WI7XPqIOZj9koVu+m/JZEjCLKeI5gO2dJ3OLLrewnQxgc+DkeMpCtWiVWZOdWvqKkCE/Lfg9PRc
 Zra/II9Wev1qld90M1MkXQpsSx5/EvhoF8wfMrRn2aKq+6yPi0J5mweDuiUTSpuHeovYKv99ncd
 6X0wbMuI9AUgG2dAfnv7TZY0kVB2D6DFoFC66897aw3JJBhHijWyMJ1I7Q9eY0FNXv3XvG8IT2P
 H0Z7N/y6Fkr4Wuc31pgRQjuqcDy53yas7naBi7RFaKSf3Yt3hLORqn
X-Received: by 2002:a05:6000:46cc:b0:481:511c:8d3a with SMTP id
 ffacd0b85a97d-481528bfe55mr5970717f8f.2.1786545156892; 
 Wed, 12 Aug 2026 07:32:36 -0700 (PDT)
Received: from arch ([213.211.149.70]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d4e400sm8409809f8f.21.2026.08.12.07.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 07:32:36 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 12 Aug 2026 16:32:35 +0200
Message-ID: <20260812143235.386341-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786545157; x=1787149957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+0+O2OLldCx+Gl5V6TltkdMbx82LGleyhs/7RzDWJiI=;
 b=SBB7aUkvyoqrO6Lc3m3PN7acvJsdUw/BecL3x6ZKrNwqJODIndgFg40XOMAAorZYqP
 sFkvhdopkawXtJmj8/GonlZ1A53YKiqq5DTliNrQhs7sjovb5pshSLdkZ08GjdFmFA0v
 Z5dF/czrQRvYT+gnzDP7e2bpwFXcfgXTCy+sIGEO1lQQpTkCzhf7QHEH5YRcp52JNMMc
 qKkg3x+NA1QD3ydC5KJika4bsUMrH3nD74HS/LL9//HQpczt6/v4qoUNAZB/P1Ksf0bZ
 pJZFwNordncP+ijhJtL1YTekB8I4h3pmMThJAeJaTFBNbUrbX6W18oSVxKAuToivqG4C
 MOHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SBB7aUkv
Subject: [Buildroot] [PATCH] package/vim: security bump to v9.2.0943
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

See the release announcement:

- https://www.vim.org/vim-9.2-released.php

It fixes the following vulnerabilities:

- CVE-2026-28417
- CVE-2026-28418
- CVE-2026-28419
- CVE-2026-28420
- CVE-2026-28421
- CVE-2026-28422
- CVE-2026-32249
- CVE-2026-33412
- CVE-2026-34714
- CVE-2026-34982
- CVE-2026-35177
- CVE-2026-39881
- CVE-2026-41411
- CVE-2026-42307
- CVE-2026-44656
- CVE-2026-45130
- CVE-2026-46483
- CVE-2026-47162
- CVE-2026-47167
- CVE-2026-52858
- CVE-2026-52859
- CVE-2026-52860
- CVE-2026-55693
- CVE-2026-55892
- CVE-2026-55895
- CVE-2026-57451
- CVE-2026-57452
- CVE-2026-57453
- CVE-2026-57455
- CVE-2026-57456
- CVE-2026-59856
- CVE-2026-59857
- CVE-2026-59858

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vim/vim.hash | 3 ++-
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index ecc41be702..57aa3dd49d 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,5 @@
 # Locally computed
-sha256  f9ec31df8f1a78e130dd06c395e6626c2a8a8ec2705d8e7b7667bd3ecd499c6b  vim-9.1.2148.tar.gz
+
+sha256  9b90b23241007b20ba89b7b00e6202008f4ff5b5278974d42aa199867c2eada5  vim-9.2.0943.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 9201587a8a..3b58ad47a5 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.2148
+VIM_VERSION = 9.2.0943
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
