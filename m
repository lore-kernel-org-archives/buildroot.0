Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FA1CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E651561255;
	Sun,  3 May 2026 14:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYw_YD7Klp9m; Sun,  3 May 2026 14:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FB37605A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819794;
	bh=iYJBrLr7vh+X+zDuO9+CGc/IslrKbUIflvFCXFiQL4A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iBm1aCnOFZV4Em65ELxtN6CkazwzKcM2F8VTf/V42iPwfeBd8PPd/RM7fu3E1y8i+
	 1J3H+liIYHa95/+RthHGOEhPKu+sz+OH4fkjIOmJLr73wtpfUM1acxrbSfEksmG0gS
	 nr4TrPDFVu//YEL74PkJ8C8W3jfeih2DFTT71V8X1Vx9izIAPQkfmT0ecJNyU5N95G
	 d56h2kCtT0FK7UDVdET3/QpsItV5KKFCwm+IaLtWDzS4jvvVguE8jfgKRvOkW36lEg
	 93kyrZ3xjkV0jMyg/i/KCtgR+dxOIHGYDCfi0v/63PRzRiTMBMYaNT4Bhwx7Mj+7SG
	 oFJGd+VROg60Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB37605A3;
	Sun,  3 May 2026 14:49:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3C6A127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C625381E41
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awekTuISxMjf for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:49:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CFBB8142A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CFBB8142A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CFBB8142A
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:49:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D6B9A4C0BE1
 for <buildroot@buildroot.org>; Sun,  3 May 2026 16:49:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40976)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wJY86-000000001nT-0Z5B
 for buildroot@buildroot.org; Sun, 03 May 2026 14:49:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  3 May 2026 16:49:08 +0200
Message-ID: <20260503144908.2807535-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260503144908.2807535-1-bernd@kuhls.net>
References: <20260503144908.2807535-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777819750;
 bh=NAUorU8w3/STbUCfeWdqoOdnPTsG/rnKhY+ER0180So=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=nHkEJCbwnsHBr0ubAasjd+CQ5CpRT/YSzjYN4Xd/BroiqSGZPP/htSfjfQeanWhrB
 S/7p9kNGvHMQUxx+fGorLdjGZxodF8qCEbb0flURi2BUHN+9t7q8Nm3IyJQ3iUdssV
 KP+tKL4xJTQTyyop7nbSr1rGSc3LEyHrzsPQxJqOa4VOUV58H2v2+E497RyGl4U4K/
 nurIi0tiOXtsTLysVVtX9VXVbVr57GlEDxvE9XYFK0Bl0uGxVUi8se+PZfjmGzIp1Y
 +2DT8UEV+z2MgeBWfZPq+YG0vjUJS1E/Ovlpp/frCmyHi2nHX7tBlntxl1wkKgDAW9
 XbtodwJiEhHYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=nHkEJCbw
Subject: [Buildroot] [PATCH 4/4] package/gdb: hide version choice for 14.x
 for gcc/host-gcc >= 10
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

We need to keep GDB 14.x for setups which use gcc <= 9.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gdb/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index fe639a4019..172446c70a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -52,6 +52,7 @@ config BR2_GDB_VERSION_ARC
 
 config BR2_GDB_VERSION_14
 	bool "gdb 14.x"
+	depends on !BR2_HOST_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_GDB_VERSION_15
 	bool "gdb 15.x"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
