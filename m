Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7067AD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4793E84528;
	Mon, 12 Jan 2026 08:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJJrvFCLeUsO; Mon, 12 Jan 2026 08:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F3884525
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206740;
	bh=HJ6aMCIQqCtAIuO2HuxdfBw2dVBXAGK0rD65F/yT2JA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5XdGKb98q6wLrdoS/moedkP1SmIFmFU3R5sj1fVD26cqm1woDhzx+WIieHWHM/ag
	 LpPQGyehw5TC1ONY4lTru4Xe4nCkvFBoq0Su7q5OT1iVuqDaSK5Cqc3rckysdWPpSf
	 9MXNkwYYaUlmPybUr3smDQzK771R1TY9IaF70ZuYE2rW21I32rSv0lIWLZjnrN0eZ0
	 J2acyc/rjMLOXbn0QOKT2FISnAMwn1WlANkgbGlur826mvrDHSUzc7fQkB27CVEhds
	 dob0nluX1BaUvb2TEcmKCp0tggoWZZ7Z9gTuBovTz8sLs/B898RfBFcKs4dVf/SeX2
	 qt7JxRpykM9Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F3884525;
	Mon, 12 Jan 2026 08:32:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A9151CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D32E41294
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljQIHssapwrZ for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:32:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B94041296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B94041296
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B94041296
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 43141A4C30A0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-25eH
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:33 +0100
Message-ID: <20260112082950.2528445-85-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206606;
 bh=g4xS0RrUKcZ3+bwiy1iRBNpMVjnSwgHwWYTzZ5hztU8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=BYqCCIwKmCVk9JbnhA2mN64Aq4wZ+l1LtMtF7fxlZovkVGjt6QpRfasYbrSvp7Vj7
 asRG7bnsdiXzAUW0VBtXgLIq638JGTsvrF7ECSWeNAqa3LPF0DoWIFV7FrJCSHRlQ2
 v5K2f/cb6SF6AL5SKZan3PfZfcbGCwzZKtmfR9w8pfiSeSqVdu2SnZyzDQIixxcl7k
 5wXKUkl+CmuN9rYDafVHn3dCfRfCu7kAYot6C9vns9MrKuV87k6Uhi/GJnFJSz/Zxd
 kO2YqRu8ANBOvQ8ZrGKrBOd9zsXK1y/euzBCU68GpXW4VaCEfI3GoWwM3jEbZhUzha
 XIl/V1akIMgQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BYqCCIwK
Subject: [Buildroot] [PATCH 085/102] package/x11r7/xlib_libXdmcp: bump
 version to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2024-March/003467.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash | 6 +++---
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
index 83609413fd..e11058dd08 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003260.html
-sha256  2dce5cc317f8f0b484ec347d87d81d552cdbebb178bd13c5d8193b6b7cd6ad00  libXdmcp-1.1.4.tar.xz
-sha512  83b384d43bfb034c395f83f97d1c6e73aa3d5faa8f8756b08e697c0b9c3c87189651b51e8213fbd1f5f9cbc2d8136cbf143627481744345d78cfe0ff2ad074a9  libXdmcp-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003467.html
+sha256  d8a5222828c3adab70adf69a5583f1d32eb5ece04304f7f8392b6a353aa2228c  libXdmcp-1.1.5.tar.xz
+sha512  d7a1d70a58b7d34ddd01a91d3ccbc086a36626b7081cfcbb150d24288c6adad612b042ba7ea63a218595afb2ee04384c0f8ba84ee3c6bd29913724b54e898d83  libXdmcp-1.1.5.tar.xz
 # Locally computed
 sha256  8a3c3f35b0dbcb60a4e242b9e4394a352a65bb27deb2938ea1e2e62a626e16e9  COPYING
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index a79e2615db..28b2f9eded 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXDMCP_VERSION = 1.1.4
+XLIB_LIBXDMCP_VERSION = 1.1.5
 XLIB_LIBXDMCP_SOURCE = libXdmcp-$(XLIB_LIBXDMCP_VERSION).tar.xz
 XLIB_LIBXDMCP_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXDMCP_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
