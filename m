Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DBEEC01C0
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 10:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4938C82377;
	Mon, 23 Mar 2026 10:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tS41FIrEznKU; Mon, 23 Mar 2026 10:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA03C8236F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774261482;
	bh=TCbpkB/v5dGZ923zSHQiDHE5uCbolt3tdkIqG4jEzVI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X1gKKpA76OzA5C2qPLnt52JbDKjMXuxua0HdoEm9wFpvRf2VyWL8Id/z9lJ6jRVSD
	 DPljrNvT87kkH8xYudVVF/lAchKb6fOY9OEFO+iBOM+bScnhUaF3K/1Xqjx+Icm/xg
	 17hjR5F4rsgnfK87Dfm8Ryu82Rlnd5v0nTTovr+PH3yOpsCIA1YJ/ChZA9QIAJy+a6
	 mr8e7Yga1+FOQriXrILwpz+elqGjttFeqI5f1p/lzLbTmRRYRMj7cLw55l5p6wtbOk
	 5DtDXbpRG9B1gIEoQJYPKti8B9mZnfGqkx24mEnheQW7ErV4ONtJXJ0RtKmKOmcd22
	 aKkbWiEKN25tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA03C8236F;
	Mon, 23 Mar 2026 10:24:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A91FC1D3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99F7E6076C
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZHUeFHc8IXx for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 10:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C19FF60769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C19FF60769
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C19FF60769
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 10:24:36 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 4cSWwH9ymP2aD4cSWw0ZQK; Mon, 23 Mar 2026 11:24:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 23 Mar 2026 11:24:31 +0100
Message-ID: <20260323102431.250660-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGlJN5c7IeLZiyCYlc+Xjp1ir9CC7/Tee5HfE4N+e5SwBwaUs9mwgpLedKmNIeKRVRq/q5GsCV8mzYNXNQxNAQVzQVzJY3f60UVjsndTA5tePGLPqiMH
 yiVziFwj+gSrBc5S0evvPN3mg0OKdGMnIiCe9UEKkKxK2Cks558jjNLqWX6gggzczX1WotjbR0xwIxKwWnxefRvsoVigKOjSxzWVUireN/qtPsiLpLkvI9mt
 TwgcEJzgpQo329aNy+vmc3NuuOo0h7ObUSE60ThFOlg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774261473; bh=4EgH4omMDMW9tsDVgGKVMX3u5mY4VQxP5Kl/H+qUwjo=;
 h=From:To:Subject:Date:MIME-Version;
 b=X0XGIE7yw+/WSYNQepzMyH0EIJmvyD4LB8HWlsijsIorFbjiZqaw5ZAqyQm2Quz1x
 xC4dQELe9/DxQFg0v3S+6VT1uHYU7esSLpa92ekC9qvC7odMRoKeKPJMwUmCX8pmZw
 AquAXdTT8TkZvHV32KV+ZPTHYES0D9lln2Cx6dhlPt+tp+YFLbQkSRoT1BHs76ycIk
 YC3TnyNzlZAfEixnLk1rz0R1Qpc8W+xGnUqALtmFCfSiuebILD18RBpvKLSRXn1XVA
 HBZ1JG/8NdnD7g+wTq4geXTcTGdGAxpr1Zd8/de8L3oVT2oplYlx9vnbCjxs6pkbNU
 F5DjLugwbNpKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=X0XGIE7y
Subject: [Buildroot] [PATCH] package/libfuse3: bump to version 3.18.2
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
https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index e80d39ac56..0274d179fb 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  adb6b7eed09331d72cbbe6d5ef3597024ab46a1d61c6ca7cdd495e51600f8957  libfuse3-3.18.1.tar.gz
+sha256  55a97cfd8661a9b42ff0123b44af52cac49feaec36987f4d968c046f93b42e1d  libfuse3-3.18.2.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 6418c5798b..5492d997c3 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.18.1
+LIBFUSE3_VERSION = 3.18.2
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
