Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87257CEFCFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56E8D40924;
	Tue,  6 Jan 2026 20:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSHmBLQ7Lm5T; Tue,  6 Jan 2026 20:04:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3536408F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767729871;
	bh=jku9e7Bvf7XllbLWzSdsq8mnIMUyit0fyXFLy2HUdOk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JPVFdarKiiPzDJjHrI87/aTq7Dg0EDJE6ghzc9M6S7AOyJLXSzY3szAg1SwkRkQ/P
	 EVsihy5V5wqJKWzuvQwMcweVYEAmPeBYrGEUoFgxrgiCitnoRUzXJeNg5WFwojrlOu
	 CJfApOGN1bxFwkSklsq1mIeGQPF3tRWPYFqqhn8rtv4Fc1DpeDsKqtrImejLgm00v8
	 8Rd3CVY5fRjt+i75HuAPIVc62/7VMlrSWR+gpXj15My89BRxv/9ybJk5YpOBzNhsm4
	 fojWvBI4BQJ3KUAhU7OnCki4uyHSM/KbbCNpHXn9rxE/X3xCnEeswb3hSp4SNN/u1i
	 BEHW7scOq0gjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3536408F2;
	Tue,  6 Jan 2026 20:04:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDE87249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEB7481B35
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYd_5DzGhavh for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:04:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3835781911
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3835781911
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3835781911
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 588BFA4C3998
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:01:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdDF1-000000002Vv-0qUI
 for buildroot@buildroot.org; Tue, 06 Jan 2026 20:01:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Jan 2026 21:01:12 +0100
Message-ID: <20260106200115.1985522-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106200115.1985522-1-bernd@kuhls.net>
References: <20260106200115.1985522-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767729685;
 bh=0dQW2e2o/p5xXYezxJdnAzgmtdjebRWAWPuEgtmPp0U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=d/Ciw8lZg2VFYjTUK4I6RNZzqlhl+HSaGq/P7afnlFKFixBGOlQRXfWkhMLWLL5ni
 wTtCm95ggvYFM8rVujnpQrw8Vd/f/0qKHwbMmWfnBRcTRtSywbZ5AwT7FLk3Y59h8C
 KLAYKFLxMsgmUQSrLUiG05wo4yfSh231iFiQsuUlO7T4LKKqr6SwVB7EWeov1Hm/5v
 INPUOAM/SeVJ6ZrulfOzLXzUgNZa5FHxMvaYkytqd3u42sjRuStgLTx45Hud7jnqdj
 +0Zvjn/ffHY6k7fgLFYmZ27H6uKEmMG7FAiQ9gD8TkPvI/OA4mx+2bImDrqPILuHQE
 SQFxwB1M1EkXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=d/Ciw8lZ
Subject: [Buildroot] [PATCH v2 7/9] package/libcec: remove optional
 dependency to lockdev
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

Buildroot commit bf1c9828f2c7ef37a0af4da5532472fb7e03ba67 bumped libcec
to version 4.0.2 that includes upstream commit
https://github.com/Pulse-Eight/libcec/commit/ff86c07a16a6a05be936b27e3f390b61f2ba4d2b
which removes the optional dependency to lockdev:
https://github.com/Pulse-Eight/libcec/blob/libcec-3.1.0/debian/changelog.in#L19

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcec/libcec.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 1c2bc075bd..5e6d84ebbd 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -12,10 +12,6 @@ LIBCEC_LICENSE_FILES = LICENSE.md
 LIBCEC_INSTALL_STAGING = YES
 LIBCEC_DEPENDENCIES = host-pkgconf libplatform
 
-ifeq ($(BR2_PACKAGE_LOCKDEV),y)
-LIBCEC_DEPENDENCIES += lockdev
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCEC_DEPENDENCIES += udev
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
