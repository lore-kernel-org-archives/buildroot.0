Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F0BC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5971640AFF;
	Sun, 12 Jul 2026 11:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqs2iMoMskTB; Sun, 12 Jul 2026 11:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D824B409EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783855899;
	bh=bzzij+gL+sddYU1tl0ZquhLk8cjopzdqmr5uOTOXqlE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r/AhA3exraZaCxpQsNJ2Mgqg3AOFl9GgdkmkdwDgjt5P4HfcKS/yCH71K+r1MvOOH
	 f4uyv6CGCLjo2fP0W1dKYsfIAedl7tDZuRwclAFr9AsNi/iTESqE0YJbJ1PUnpTGH9
	 z10/XiBAf2okOAXlUmuUXLKuDv//8YAuzsfZq4vAJlfkeWvkfPfmc26Qyq7M0u2/T/
	 jSVzfa1nDLPB5BSeWTje1Tfrb8t06fX3I6R/wxonTDHJUHHPtT1hOcsnxPczYXSKtv
	 D34HkjVBnrjgu1a4/PKkFiphg7t3f/45yK7ETyicUXJndAmT6/3c6gb30FOvS8vSUC
	 pjsVjGD2WbUrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D824B409EE;
	Sun, 12 Jul 2026 11:31:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC7C82EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9E0680DFC
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXvjy5baMXkJ for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C628080DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C628080DF9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C628080DF9
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B85C4A4C209B;
 Sun, 12 Jul 2026 13:31:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35390)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wisOg-000000002jy-2qUM;
 Sun, 12 Jul 2026 11:30:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sun, 12 Jul 2026 13:30:58 +0200
Message-ID: <20260712113058.1579954-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712113058.1579954-1-bernd@kuhls.net>
References: <20260712113058.1579954-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783855861;
 bh=ScGMCRM1Xso5lzQFkruzPnOKa4fe7miPyEpdKShpjBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bh+kSsjD8vyKGS/5XGyaXuZIigKPxsdLDpahane8lO6wszgXcwyabEiw15OXugNcB
 jDwSOnVmqFt8VmxHa3xn2K8V44YSPuutX6dh4rXHs+Irn/Rhio5S72j1SBeKYmaYRp
 oDoFYOR9sVGDCVpdS+8WyOHIT23iPqNZXr6qNz7iWrhkaa5Ux+iJdltmY9dUP/JBkW
 dDwuVA0fnCqnk/zL3WoCi5QnFoSgV95wFf4/JRduL/14ytEyyrMB2CZt2ekDaH1ysX
 P1/dIlDNzSvasIXZpRkIyN3YGI/F2GTDi732CslzSo99yA+cBa8YzZbZLaFdj42w2J
 on5jSo1QPFugw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bh+kSsjD
Subject: [Buildroot] [PATCH 4/4] package/x11r7/xlib_libXfont2: security bump
 version to 2.0.8
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

https://lists.x.org/archives/xorg-announce/2026-July/003715.html
https://lists.x.org/archives/xorg-announce/2026-July/003714.html

Fixes
- CVE-2026-56001: BitmapScaleBitmaps Integer Overflow Heap Buffer Overflow
- CVE-2026-56002: PCF Font Parsing Heap Buffer Overflow
- CVE-2026-56003: computeProps Property Buffer Heap Buffer Overflow

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ac5c6561894d41b86a43af13c4a5af16612c9195
https://gitlab.com/bkuhls/buildroot/-/commits/9c78a853c88fa85f7a31404b4ab324370cf049f6

 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 4f50b2dbd2..86e972a0e8 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-August/003523.html
-sha256  8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb  libXfont2-2.0.7.tar.xz
-sha512  f703127df5d5b1093c9b73e019153ed7799523573d52e61d344209f0acfd4df42e11be12bdd1880479c47c2b70de581a4f2ef74e199e9b1ac438f426593d56b0  libXfont2-2.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-July/003715.html
+sha256  f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5  libXfont2-2.0.8.tar.xz
+sha512  e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531  libXfont2-2.0.8.tar.xz
 # Locally calculated
 sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index c95f6c6395..a881a4c55b 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.7
+XLIB_LIBXFONT2_VERSION = 2.0.8
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
 XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
