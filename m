Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCF4C433FE
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFE5402C9;
	Mon, 24 Jan 2022 17:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IdaLUL6AK3B; Mon, 24 Jan 2022 17:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E668D4026E;
	Mon, 24 Jan 2022 17:41:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92FAA1BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80E3D82735
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="ctDKothk";
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="RgStQwdo"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZS98oYiTpJon for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:41:17 +0000 (UTC)
X-Greylist: delayed 00:05:51 by SQLgrey-1.8.0
Received: from fx405.security-mail.net (smtpout140.security-mail.net
 [85.31.212.145])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9789A8261C
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id B6D9B3237A7
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 18:35:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1643045725;
 bh=Vj6qIhiRWd6htrMOXnBIVUKdGUFlKwMVk7z46JTx/YE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ctDKothkIPW7VCvFvA9UPKEXL+PAD/S7hvm6A50YvHWvk+PzkQDQm7wydzwCBwcVl
 2/4Z0MCj0wwl/5nDtXBnB10Ls8pmi5rd/EFpQoQ+iQOl61/r6XQuazYBSEiV1j2J5Z
 +UQza0VmNVFkmMyv4rpboLREkJmIhkVjP3MCNmQQ=
Received: from fx405 (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 3E3933237B7
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 18:35:25 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <16e4c.61eee35c.d53ce.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx405.security-mail.net (Postfix) with ESMTPS id D68E33237CD
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 18:35:24 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id B632127E03F4;
 Mon, 24 Jan 2022 18:35:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id A0DA127E03ED;
 Mon, 24 Jan 2022 18:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu A0DA127E03ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1643045724;
 bh=NSbIXZn/V6QgB2wtA3Kb2GPRVIJLSpGzg+9A/FVBYug=;
 h=From:To:Date:Message-Id;
 b=RgStQwdoIAnyIPOQKmrcWWvjCeaSz8+uxUVr0lWhHPi+6mre3VDlrRXXgdIG5j8Sg
 3mH1aKycP8x3V6xjlm9dujSsJfcGJ0grmObQ+2m7yqoF4dqvUjbAVLHOWaJm3iAjXa
 YuIDp1SqkxJInB88fWflBTeLNM6I2vVrbSTPJDjU=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3W9JSfHb21lh; Mon, 24 Jan 2022 18:35:24 +0100 (CET)
Received: from ws2021071901.lin.mbt.kalray.eu (unknown [192.168.37.66])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 820C427E034A;
 Mon, 24 Jan 2022 18:35:24 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:35:21 +0100
Message-Id: <20220124173521.2236-2-jborne@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124173521.2236-1-jborne@kalray.eu>
References: <20220124173521.2236-1-jborne@kalray.eu>
X-Virus-Scanned: by Secumail
Subject: [Buildroot] [RFC PATCH 1/1] Fix binutils/libiberty target install
 directory.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Jonathan Borne via buildroot <buildroot@buildroot.org>
Reply-To: Jonathan Borne <jborne@kalray.eu>
Cc: Jonathan Borne <jborne@kalray.eu>, jmaselbas@kalray.eu,
 ysionneaux@kalray.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change libiberty target installation directory to $(TARGET_DIR).

Signed-off-by: Jonathan Borne <jborne@kalray.eu>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 13f61be035..d2119e67cc 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -106,7 +106,7 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(TARGET_DIR) install
 endef
 endif
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
