Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3245ACD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 17:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBCD4819C8;
	Tue, 26 May 2026 17:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CTJakztJoZXZ; Tue, 26 May 2026 17:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E04798196A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779817917;
	bh=ph0aCyVVFwGE++ihKIPTo2IR2J43rsO+lPH5mb3AWfM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HJbAt0nJUEm1YMCr3b/aAyJT2DO1aQcK5tCyrlMhF4pg3O7s6KrkqHJVBbEH7HMYW
	 1S1GNyhpMNHDIh4jknUUj3393XpurjsDcwdLv2cBpjHYhVAO8TCDAUaYqNvvjoYZ2f
	 FP0Ni60Wybh+PhM+klH1frEZantBwv4szFD2TcNFNxP1DMXQogq7BHASAtV+N4aKGI
	 BSuCklayz+JTbyZwzzRaotsHy1+5qt1gRprnze3GmwKXy4c71fIoiADF37SZfhoLJ4
	 PzR4JRToCRqjW9nOtdSnNm2/Waq+EwSKFzT8dUYCfxScJGfYgcYq1YBJGZjc9zSYEz
	 XpqXClTfdZo2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E04798196A;
	Tue, 26 May 2026 17:51:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CB8C421F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 17:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B457940653
 for <buildroot@buildroot.org>; Tue, 26 May 2026 17:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuQZzzaIDZAo for <buildroot@buildroot.org>;
 Tue, 26 May 2026 17:51:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A7C24059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A7C24059A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A7C24059A
 for <buildroot@buildroot.org>; Tue, 26 May 2026 17:51:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1BEB2A4C26F7
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:51:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35272)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wRvwT-000000002dy-1QRu
 for buildroot@buildroot.org; Tue, 26 May 2026 17:51:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 19:51:49 +0200
Message-ID: <20260526175149.1414751-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779817910;
 bh=OpdU7Weq+hF6lqF7XEjWBA3A7oD1tjEZJl3pdvGUc80=;
 h=From:To:Subject:Date:From;
 b=NB4VNtLGYCRfkxUihlPbMPB3X3xucyZ79gvKQg381Msj/ZA22spiSTRnJm1+7vmjx
 GNOWY+cHeZJtMDpW7lGJO6a2sRcAZMK7DgSFoxL13lnqiX3cT7R5s6UfADPF3SyO8/
 vPCEUPnOcDrYNnDiKnvWHX/C0qge6+S+xU0HL/LHc9eN1OHXmDZ185Fll8cqyBZU2u
 iGQ4TyTiMGsan0bRA6yrSABkAZwyXNiFYEaCU0WHj5zpVOYbXSkzEZX0OrfLjK+Gn/
 czOPOwgrNvZ7lP2xmR+OYbwpXd67u6r5cngVAWnAimaoFhj2fUM/kCHtTizdUtoD+L
 6sCpWHtRU9F7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=NB4VNtLG
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version to
 4.24.3
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

https://www.samba.org/samba/history/samba-4.24.3.html

Fixes CVE-2026-4408, CVE-2026-4480, CVE-2026-2340, CVE-2026-3012,
CVE-2026-3238 and CVE-2026-1933.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 765ccdad55..83e77f039b 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.24.2.tar.asc
-sha256  ac24583f271a82ac324f7c6fad7327f65b591ad3492e1dccfee988e2c1c81dd1  samba-4.24.2.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.24.3.tar.asc
+sha256  4a5e0ed1ea192b798c873d9957c50a5767c10c2767cccb00d56ecc427e94f8e9  samba-4.24.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 2a151f4f61..2d6bc80b9e 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.24.2
+SAMBA4_VERSION = 4.24.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
