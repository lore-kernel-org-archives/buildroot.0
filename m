Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F38BE83EF9
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6270A60A99;
	Wed,  4 Feb 2026 09:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9nLpv_ROPvs; Wed,  4 Feb 2026 09:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B3260A83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770196935;
	bh=SyD8y5jO97aKv1vPk2SqxET767+m64upMPtPVg4tGSw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TZ7Bj5KvMR2wEVRjC+PZH6FXc88/+Cot9PQ0dPKWjuSrhcXXX79Q46/pEexKNia/M
	 c+oJHnY0B5NNr3PhIGUl4mpG1cCs2tc23f0VXDlBtN+9JOzZgovRWYcJ8Q9SHtbNlP
	 d7EXtra9DtpqsCMTm8sf+kBxTloYixNSEw0uxGqEq3CV3DZ49mGJMp577RIp3dXw3/
	 d+qwEkFxKIxRWaa9hfwdurw1gr1MNtMZwg8gTA5qyEpzqG7RGFxB/UeNiERm2j14eh
	 BP8pcxvHX5o5UIAk/TmVQfRLAPmPbtof8mDcLqc9KDxWtOMJNHR6/R/mtYxoCa1Qu3
	 ZcpalqOXaETbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B3260A83;
	Wed,  4 Feb 2026 09:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB54EF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B52034078F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YAXHuYSU3cVo for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:22:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AB6740759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AB6740759
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AB6740759
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:22:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id nZ5NvEJTm5StenZ5NvqmLT; Wed, 04 Feb 2026 10:22:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  4 Feb 2026 10:22:06 +0100
Message-ID: <20260204092207.3009275-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87ldhahxqv.fsf@dell.be.48ers.dk>
References: <87ldhahxqv.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOMcsLkZ9wdIhbz0SImyqjYk/y0ADVcBs3SstcjWNO+7Ypf5dUNTtdNMWP4XeFkqMsdF0nQ39X2GYCkvWea5GHEEkdsCo2fuhmTDnBwurcfbHTSRSuBB
 BJmC0TiuDFp3QdM4cbmcayefbnQo8Y4TgbaFArpaGTUg/yt7IfHIg2sIAstXI1smSyu6CrcdaITaz8kyiNYKjT2NZ26huF4PNEdS8BKGmnLghneao8SvkDRf
 TyAWvLNV9tDeVS8LnZV03aKExy7/FqDnfu4Bn+pRwDne+afa9d6KR+AXjufjIGue1NPSXhr9XLhK+9T2hetDBQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770196929; bh=anesJW+xi8ywrnqW9kvChk2T27LMnQ/9Lpod97wfvTE=;
 h=From:To:Subject:Date:MIME-Version;
 b=H7ZmKNvMVTeqNHgIduSQIhBR1HODMRo3moAESX5hbqJM4GNTgFXfs2bWI3DX+BoYs
 LwhxI4nrnAiht9iucyRjFQVU3ebgzAXVEtIg9aZV3Gv/8DaIiE5CcDrYd9XKPu1wyo
 DJ/gkEOA+hOkV3ANYNkjQ/8mvmrxGJ3lGhjyY/zqrtG0OVHQAri34XvMbDJbS8+Y1F
 M6LsqnTwAFEAnJU0SWW1218OXnDj7HDS1ilK6KfbgJnpMSUkwDzWqNOsrEcJqAJJkn
 5y0DwWt3crPi4PmsoHGORcTlEuLbaS6bakBPCA09lHo2EdECdmsvO2LnByUa+UK/kY
 g9DSixtTadQ3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=H7ZmKNvM
Subject: [Buildroot] [PATCH] package/bind: security bump version to 9.18.44
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
https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.44/doc/arm/html/changelog.html

Fixes CVE-2025-13878.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index d601e87b75..aaf3519ced 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.41/bind-9.18.41.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.44/bind-9.18.44.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d  bind-9.18.41.tar.xz
+sha256  81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d  bind-9.18.44.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 8b336ab781..041541b037 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.41
+BIND_VERSION = 9.18.44
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
