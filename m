Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE77CD4F24
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 14:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78BEB40F6E;
	Tue, 12 May 2026 14:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsp9QzdCyJ5E; Tue, 12 May 2026 14:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A48B540F70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778597571;
	bh=HiTJd2C76k6brS2u/XCgZzZ+s/SL/SkiaqH3Wz/RnmI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mTxPT6hgveDJgN8sRNv1gpHmUo7Zqv0fpZo9slTgqSZWBIUEvlEmuZ0lOVVD6Db+H
	 NhjyfxrDYkWKyNUfyKmbWAATEVudMME58B0xYBBA135li1Vv1kfA8PQqN9QnGGyeRD
	 +/nKpFzKsYeEG+pwLMld+qA8q0hlO0CHhCgnqMCb7wZsPOwKkyBTBDzawbfmJ83AZM
	 w7wBKEU10d0V18jJ882ukRVG3uvRNRBpKWbtS05CpwPGs6AT2+sf8GiRQJ0HZ07fQ6
	 bxnDxfs4yqELBk3wenn4U8QKzuajrOVhrFU+vdJ3SoELRNX8iaasGcMKD9w4d7XYY0
	 9SjJeoulxidHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A48B540F70;
	Tue, 12 May 2026 14:52:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 447C015F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AB6940F6E
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aPYjrkm7PW0S for <buildroot@buildroot.org>;
 Tue, 12 May 2026 14:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 221A540C47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 221A540C47
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 221A540C47
 for <buildroot@buildroot.org>; Tue, 12 May 2026 14:52:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9EFF7A4C09A5;
 Tue, 12 May 2026 16:52:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45106)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMoSj-000000004ON-1EEE;
 Tue, 12 May 2026 14:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 12 May 2026 16:51:52 +0200
Message-ID: <20260512145156.320992-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512145156.320992-1-bernd@kuhls.net>
References: <20260512145156.320992-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778597521;
 bh=lU5Zi16PVF1WueA7uCFPRXPLb30wlSzC0Z5ru2/1UUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sKVOkA1B8cmH7xisC7Csg+jpcxNd9h0VT7qIj5BVXZ+gnaCBbK+gh4rq2OzZkRPPS
 WJhi/JPJRNE+tU0SYeNtRL12Tu3MSfKa/u7yL3G+jjA0zGFd04t5tvJoaZhiPIQKt3
 UsRwn9QZ8GITwTZVOYIICCX3e7utIxtv0JohFiftmYL0kyCzCHTLdcl8gRjJDf2s9z
 xDa8WsBNbSNj7x7ywEpa0nHZ///rm0EtX88vOVtJL0/wwlpCxSt1+0+BzfrTX8woBI
 kU4sJCH/CeqQrIh0yEcQneEY/Er4My9L1wNAHqXeZ4zb5kyWo+h9uxlHYtFoUd0WJr
 0k+7JLVjdv2CA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=sKVOkA1B
Subject: [Buildroot] [PATCH/next 4/8] package/libsepol: bump version to 3.10
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

https://github.com/SELinuxProject/selinux/releases/download/3.10/RELEASE-3.10.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libsepol/libsepol.hash | 2 +-
 package/libsepol/libsepol.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 08a1bf0cc2..9c0be9c902 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  ba630b59e50c5fbf9e9dd45eb3734f373cf78d689d8c10c537114c9bd769fa2e  libsepol-3.9.tar.gz
+sha256  d555586797fa9f38344496d2a7ec1147b6caaf3fcc44c42d8d5173edd7a79a71  libsepol-3.10.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 3e1a275808..52f07b4df7 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.9
+LIBSEPOL_VERSION = 3.10
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
