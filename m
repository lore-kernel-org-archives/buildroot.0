Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC0CF47CDA
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7665482FD5;
	Thu,  5 Mar 2026 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVBVlV_ccskh; Thu,  5 Mar 2026 21:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F249B82F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772745033;
	bh=s+wIFR5hGVmMBPQwRuznekK7ivnUMa+bdLmiLsbemTg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cRbYjuTY0KeG257JVCPFwy1jmkrcyi3sJyAu5MerG5vvg/ZyrB3G8DwuWpZjCjthV
	 jkuWwSa40CFtOt3QuO+w46kDTJO2b0Wgy/B02Djwr6lfpZnlwM0IRjOMujMP52vph5
	 LLCu2qPKvCJeJT9dWVuEVNxQ+vTJhIgyVJstp167xVvBCnpUjkLesAGS8N+hc4IEsO
	 TiTtdcetoVZ8LbPTIjLpkDrmoe+jVyXBayX4k4VxatAQCtm2CxkQjMyA3sCucbQrM0
	 7zIzcbRcbkZwUBjL1lHGgjQt3fqWHaw+3drN3nUF0QrfNuIoz0fudoSt6Xn2gAhXXy
	 pXjpXd7YCAauQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F249B82F03;
	Thu,  5 Mar 2026 21:10:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C12C223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5123F82F03
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hymPrQgQhKE for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:10:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4109C82DD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4109C82DD9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4109C82DD9
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:10:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E44C4A4C372E;
 Thu,  5 Mar 2026 22:09:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFx9-000000003FD-28B6;
 Thu, 05 Mar 2026 21:09:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:38 +0100
Message-ID: <20260305210950.3471974-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305210950.3471974-1-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744991;
 bh=BKRqNKbUs1+t05q1DsBZYgTES1NEKoZw7EAa17m1Xfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=b06ZfyJdxY0u8W169peAXKnKqmkkuVGoX9cHrs3H2VLh9jbxOaE16L3RwnuWaYWsm
 3Ru+LhdXotbmZ1/nviDhHYNz6lhTLIs8pd8PVrYlZnm2UMT0gesjwuIvLJRm1iqWcy
 ahKBNqKt2QQlg/Su9287g129c5HkjUhiJjTtjTCKOhKQQ/x+B0+0QER/Pzy0Jn1xWE
 sm4cks7s9iIyytgv+mvNScEJJGjM1KP5wvHoTzvmpfhtOKiJ9fkyXFo5J5zUg+xJQP
 lcSdE5vxKZlHHnzKqn5NBG5TOHwUB5BlzrtzGdaFrf9HMnr84Jiw5fR5lfiROnBQEs
 i2av20mbfdG8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=b06ZfyJd
Subject: [Buildroot] [PATCH v2 03/14] package/foot: bump version to 1.26.0
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://codeberg.org/dnkl/foot/src/tag/1.26.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/foot/foot.hash | 2 +-
 package/foot/foot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index fe058c05be..a95da3e6b8 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6fb18d482e2ac6a1d8ec293bbdd144e4f7f3bbd0302e9a8b60141cdb02b1aa6f  foot-1.24.0-git4.tar.gz
+sha256  043fc0d4ad609c1585837e0341dc2127f4077000589dea6a32aa8ab069946862  foot-1.26.0-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index 055adf8bce..3e37d41557 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FOOT_VERSION = 1.24.0
+FOOT_VERSION = 1.26.0
 FOOT_SITE = https://codeberg.org/dnkl/foot.git
 FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
