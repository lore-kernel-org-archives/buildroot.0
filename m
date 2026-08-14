Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FEDC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF2BE60831;
	Fri, 14 Aug 2026 19:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrPzBWzlM4z9; Fri, 14 Aug 2026 19:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E6C260708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737562;
	bh=cuogb7aHCYO+leQ16zKCcyrAOUk5BySwq5w5OAUAXLI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RzzhO9oE/g+qKQU8anGCYpZv6fH8zY1hKYQlNImeu4F+JyEuchN1Z4Y56R2jOciE8
	 LXI/HMCSJ+1IFBiHbwknzTMJbznE0gRxmaWusbcGK9F4oJT/U04M3JTZFiyp52da3Z
	 nJXtLCX+dc/l4Cv5QTI7cSbMUWeYxcgY3RdQnceZQw9+izi0sch/TlVjOTI8U0W82r
	 KxLT6t3NAsdg0tHQEDenUiIDIYGNoHKE6KWobsmwDdwuYDjQOOfkBYupcQfRgBd7cG
	 OeyBZwDbA00we3qdmeq82AVjej/25bIe3TOhTP90zirYuQwTQmn/SbDLH1pqICb3Ex
	 YTXBH1heNd6uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E6C260708;
	Fri, 14 Aug 2026 19:59:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B45123F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D18640C1A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5BQ7_2BG12o for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07B7940C16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07B7940C16
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07B7940C16
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1wj7AQ0tsx-005ACJ; Fri, 14
 Aug 2026 21:59:13 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:49 +0200
Message-ID: <20260814195856.3295644-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:2I6Ibf9CzJ16n68Ein2ohgQrRT9aOqiatArYkeL2rd5NP6KiEF0
 wbFVpMkFEpInyripxabWFWm45zyVxUwN99OOz4BviVlSDe1D3dSFwj+Ib3awZ9Z7vVKI2cZ
 vky6TpMa1GAY+UF4kL702lJlLOVoDZo04P+OeRLrIqq8rPA/x1BTmpkQ2dsREsIXGDYjJw2
 6a2m5QhCHXywwhqMpAV5w==
UI-OutboundReport: notjunk:1;M01:P0:x15fJQGmT2c=;Jpi0q4IzmThWilj3/O44FmG4Oi0
 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
Subject: [Buildroot] [PATCH 03/10] package/libgee: update project URL
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
 package/libgee/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgee/Config.in b/package/libgee/Config.in
index cb33ec9ec2..b86a07d0fb 100644
--- a/package/libgee/Config.in
+++ b/package/libgee/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBGEE
 	  Libgee is an utility library providing GObject-based
 	  interfaces and classes for commonly used data structures.
 
-	  https://wiki.gnome.org/Projects/Libgee
+	  https://gitlab.gnome.org/GNOME/libgee
 
 comment "libgee needs a toolchain w/ wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
