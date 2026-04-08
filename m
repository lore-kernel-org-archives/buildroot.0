Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F096710F9964
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 17:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D954101C;
	Wed,  8 Apr 2026 17:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGYhsVIScQaW; Wed,  8 Apr 2026 17:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1E841010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775668667;
	bh=swypJHudSUsnKiqYz094YMC0YMtXYHzg77/hDcOhTHE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UWK2L1mU99TPtmjeTNznoJ+d3dNfBjejITtCa+RbLOozmhlRYbsqk0CHvFMfMUqXW
	 fKavcjADb3irQoCED+MJR2K5GFxQT0ccu8dBzHkYwIoJefuTec2hXM2ZSsWyWkNmwr
	 vh0WRkwrjyxMqJf5Xu0ul2zkxmvPqKDiCRjwMJBOX+9odlWFp7PH2VzLdWjff/Nzvc
	 /+TLOrZlbjp+paccAUDoyNBeW0sbkaU+TzI5XpLHjmf5iP+b67398EeeKBRBoiN5xn
	 L4lHCcVlsIQASnpm4AxdkCnjlmWoLnD9Xo7MkisMJPhey6IaCwVwdz7+pLnEFc6RYo
	 XqiLsfUcGqBZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D1E841010;
	Wed,  8 Apr 2026 17:17:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E84D51F6
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 17:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA0EE817F2
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 17:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9tarTnMYF5o for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 17:17:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8EAAD817EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EAAD817EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EAAD817EB
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 17:17:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE3C0A4C3469
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 19:17:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54714)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAWX7-000000007Ly-1dob
 for buildroot@buildroot.org; Wed, 08 Apr 2026 17:17:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  8 Apr 2026 19:17:41 +0200
Message-ID: <20260408171741.3533520-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775668661;
 bh=hOObkODMf1mxo7MPD4dDih3b7AHmsBOs/gOvrAGMuJI=;
 h=From:To:Subject:Date:From;
 b=I62Q4IZX42UbPIA2CzhrbGTvRDiMsHtFfYubx9ddhTg9f12N0iOa0Fc5mFA9loCVg
 lDDNOPQnKd8hY7HO/AyymEpf+NJrrxfFQBOUwBiFTmRM7EqsFlgJ2O2g4KQqnObaI6
 fedvBlKJJjeSv6zErPwCYM2CH3JQLaZf+YuHWIjDlta5YWPKA8qw2rAvQNDYtWMEgl
 XBuW9Lq2B2UfBKeBX7OWOpT5IWqk25WRIg6zxCTIqqP8ILmfQqXlNAXvM1stj4O00A
 UCltpAA5g9Xm2YiWe0gayrrOfWYubF9cOMeaDETx5qEAOZkkHjqs8Q+7OiaShWEg+u
 HJS8CUDo+xcrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=I62Q4IZX
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.26.0
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

https://github.com/xmrig/xmrig/blob/v6.26.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 5aa1630b14..b06e5e7ba6 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  55e415792f2a4ef2430cb26829b0b7d96fc52f51c6274831e9fe76b8aef28593  xmrig-6.25.0.tar.gz
+sha256  5005144e78571f26586410c2b2ede2b0c72afe22f97f1708ea24cfb253c3939b  xmrig-6.26.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index bfd2a98e12..ec493c335a 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.25.0
+XMRIG_VERSION = 6.26.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
