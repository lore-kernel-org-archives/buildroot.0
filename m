Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B593CD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 16:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1519F60A8D;
	Tue, 12 May 2026 16:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EISbZxWjq4A9; Tue, 12 May 2026 16:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3606460DBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778602955;
	bh=g+pwpYC6DkKat1WAfBDrjcNXxHLDb1FW81gScqa/EdU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SfJGb7n/si5lKJG/I1lebstUosFaQFu+q8euVhXNytjPedWnBlTGiXaS2KjNEOc62
	 mznWJS5k7a16ps/tkgcjGlcytWSkRRaYc7PKWtHYBPdIIXCo0b2W+im9v4EnEo+y7/
	 R8UiLQ6yA6WbS+64oNQtNwhujw7i8QnbZwDM+bUaeGaOvaJJCMHvGowAK9e5D1jmRx
	 mGDZ+YWDDcp/nlSbvk0Q0UhWmB+Ine9YLn7zPyGiojMYCmNkgFX9QxkUh8kg6FIeQf
	 7JPAih8SV7MTDgGB6o0flvzs1XNtxFtTFycSmfnpbM1YT7bU9A4hFKJAGaAsAkiBuj
	 wJw76shdNI8nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3606460DBF;
	Tue, 12 May 2026 16:22:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C705398
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0294A40F22
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPZHaq1EWHoJ for <buildroot@buildroot.org>;
 Tue, 12 May 2026 16:22:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E367E40B4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E367E40B4A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E367E40B4A
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:22:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03472A4C0A37
 for <buildroot@buildroot.org>; Tue, 12 May 2026 18:22:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34872)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMpsM-000000003JD-2pyu
 for buildroot@buildroot.org; Tue, 12 May 2026 16:22:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 18:22:30 +0200
Message-ID: <20260512162230.3068267-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778602951;
 bh=IeXYl+55ZdCJvhTZ0ArQVuqbyA/eq4nU8E0Md28j0mw=;
 h=From:To:Subject:Date:From;
 b=hH06FzlgIyPpDq0ro3wG9/EOXtSwVIOZt77EnQ0dJUaieagjniXSk4XfiasRU9GT+
 RGCw4oywCrvr16lv32LfZNBDB9snithh04LKRn/pfAjBq7Pnn8Bc8/Yhmj2qS2QR+p
 iqt67nqDiDMtjxB5e01qAvv/9ywT+uuXBChr6lhgyQnY+HrBu5zAyz2L7IgOWlDKVq
 JcQFKEOfLiXvQCdijlHmFpmqDKDSAGY2BtLlMTxPI++GYF2FLlWGpXmZXSIG7fuF1h
 fLgwCUy2DDALo0u7Pbkx5QYodNWATQI91diqNcYvPy9OvxN0lhHOFeAzxAYg2nuUfq
 Lfqdi3Yxg9akw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hH06Fzlg
Subject: [Buildroot] [PATCH/next 1/1] package/libdecor: bump version to 0.2.5
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

https://gitlab.freedesktop.org/libdecor/libdecor/-/commits/0.2.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdecor/libdecor.hash | 4 ++--
 package/libdecor/libdecor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdecor/libdecor.hash b/package/libdecor/libdecor.hash
index 69163f3227..d2b74878f9 100644
--- a/package/libdecor/libdecor.hash
+++ b/package/libdecor/libdecor.hash
@@ -1,4 +1,4 @@
-# From https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/0.2.4/downloads/libdecor-0.2.4.tar.xz.sha256sum
-sha256  b17cf420e8dcb526bf82da5d36f8443a91fad0777083fa4ec5c1df8ee877416f  libdecor-0.2.4.tar.xz
+# From https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/0.2.5/downloads/libdecor-0.2.5.tar.xz.sha256sum
+sha256  7fd50f780a4fee90a03f7b2c09055033e488654cbaff4a0c4bbae616bac9cd1c  libdecor-0.2.5.tar.xz
 # Locally calculated
 sha256  508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1  LICENSE
diff --git a/package/libdecor/libdecor.mk b/package/libdecor/libdecor.mk
index 26f4be40a6..e92c8a8040 100644
--- a/package/libdecor/libdecor.mk
+++ b/package/libdecor/libdecor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDECOR_VERSION = 0.2.4
+LIBDECOR_VERSION = 0.2.5
 LIBDECOR_SOURCE = libdecor-$(LIBDECOR_VERSION).tar.xz
 LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/$(LIBDECOR_VERSION)/downloads
 LIBDECOR_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
