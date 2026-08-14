Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF8EC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 442D380EB5;
	Fri, 14 Aug 2026 19:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7llwSURnal9Z; Fri, 14 Aug 2026 19:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B23B80E0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737558;
	bh=JVS29PducBz+CwbyNseWqTJstM/d95/1OPh1PG7eih4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HPU0jSbudlBLIb1C0q9YUlm4d8hGUDqrCoWuhNaEOVZY/xgjaQhKHI4eQM972qswq
	 HpmSLnGK/MIXhnPXLg6mfoopebFow9HKgpYiI/LDOzKzE2YFFVOZO/eAuLVffvWTLT
	 /kZn2802MTaZV9UXmqNu0fQ9UAmMyzsDG+zbg/hjn3k27BqHb0JWThDWDsoFN1CMDO
	 OdFzQB1deT1DiL9uOBwtWc3XadJE1+hfbUE4Fjjf52JHpCoEDHsHDxGC351uNs9bjl
	 XO3RIaEAgU+ZllnsIVVZqfNyjDfQIsNWULCxwWXemypJymqjNoUrZ1TdAqwWpKNy6e
	 iyWrFy3mqPaJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B23B80E0B;
	Fri, 14 Aug 2026 19:59:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 231073A0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 152FB6080C
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcToUu8To6E0 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A22BB606E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A22BB606E2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A22BB606E2
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvvJ-1xMK3Z09Qj-00jDZ7; Fri, 14
 Aug 2026 21:59:12 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:48 +0200
Message-ID: <20260814195856.3295644-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gNA6o2uCBAv3HiaO3VlPdV0ontnNdB9YPsYW1PeBr0O43GLS2nu
 f1xcS5Y0OHXUFdYYCGqPK3wXRxXaczhsrsdDnFXqvN55t4+wPB0nxCw82vJM8ddjRz1edy1
 RMMAC9OsUOh1Hnh4VhYGlkFoF+1beYazvox4I2SLYipeAvfMVqruDxJhViX+Dpla7haXXKn
 B6OohjUiVk5rEdFGVqfzg==
UI-OutboundReport: notjunk:1;M01:P0:pM06yaEoAOY=;clb3MIg6a1C6u2H6/pExZDzUYgR
 +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
Subject: [Buildroot] [PATCH 02/10] package/gvfs: update project URL
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/gvfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 720b8e6c20..0fd9535bd0 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_GVFS
 	  all applications using the gio API. It also supports exposing
 	  the gvfs mounts to non-gio applications using fuse.
 
-	  https://wiki.gnome.org/Projects/gvfs
+	  https://gitlab.gnome.org/GNOME/gvfs
 
 comment "gvfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
