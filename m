Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44764FF885A
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9F8A420B0;
	Fri,  1 May 2026 06:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPyfVvN7aFT5; Fri,  1 May 2026 06:23:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AB904234B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616638;
	bh=9t+yySNyyd1dpvaP133fHysRIn+73g14gUk9wmVHYD8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ayCy1OAZKIu+qq2iXrlO6XoDpJF5pniTyaKzyKRC6a0S7+WBGFLN9ryLnvi1XWD/1
	 KghlErAkw1DZEYxhW+6NqtD/nYF4LqlMNnjFRnIcEOmg1QGMsoRyKWYvPUmofsJ1BT
	 VwKlkYS9iXGGf59JkVCez5NsSyAHv4YoN3h1mMN9V/5Z5QbsLsCoaMBEbiq3AGFdVl
	 /MvnfBjjRuJv17flgxUDkDU9NWAs4qeTZT3b4z1MjPHWenbBrn2844ls2U/WfxD2b4
	 Vo6SxgPjLdTogAmFQX2B1W4yGY2E1fr1PmcnU8lx0UaI8l/0AcN/hTzEt23ADMQ9eW
	 hXG2wtARPhKWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB904234B;
	Fri,  1 May 2026 06:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B23F293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D4714234B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBQAur1WZC_U for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:23:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 743AF42064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743AF42064
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 743AF42064
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:23:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E3DCA4C272A;
 Fri,  1 May 2026 08:23:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHS-000000007tD-3Hf9;
 Fri, 01 May 2026 06:23:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:23:03 +0200
Message-ID: <20260501062316.1942112-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616606;
 bh=e9KDXK8anmpLujO8VnrQGj2PbeSVZHKZrLg/NljXl+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EWbEFg2pbpkfz5VD81GMstVMWUw2NnFM6tWKu60V44pZ+CP+JwC0gYS3FSEmmRasc
 Th1h7GG1fAzMxLXFyvfxBW/oDra9RmwmtcoxrgL8SLGeQ58H3If0u/zDjscWBfnEF9
 nheiVRCEcbTjo8FYhZHOje4RAJtIHXdzUzLY2TTVDG0VST48OWjQXa4e0o+UZ0gMgb
 KYlPX25oo5/8M2sVF+YIGoLUJbljDhD6ObvC9IGhfnpKgo0UgfQuP48Rcql9Yu3cNm
 B9TI/VhEpPJVQ7/oY3p+XbxFuGUsgNsOkAdz2CLQqn2gyD6Yczw+XhTJAJRTqDBhdj
 4uY6ywri5jVjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EWbEFg2p
Subject: [Buildroot] [PATCH v3 10/21] package/cups-filters: Fix build with
 gcc 16.x
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cups-filters/cups-filters.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index eaad301c6d..2c682b92f3 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -12,6 +12,7 @@ CUPS_FILTERS_CPE_ID_VENDOR = linuxfoundation
 
 # 0003-libcupsfilters-Fixed-building-with-QPDF-11.x.patch
 # 0004-Updated-code-to-be-built-with-QPDF-12.x.patch
+# ax_cxx_compile_stdcxx.m4 needs to be updated for gcc 16.x (C++20)
 CUPS_FILTERS_AUTORECONF = YES
 
 # 0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
