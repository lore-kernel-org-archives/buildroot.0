Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C878EEE3698
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 16:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8833842BC;
	Thu, 12 Feb 2026 16:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHO7Nz5EigSF; Thu, 12 Feb 2026 16:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DB2842B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770914828;
	bh=cs6IabDOqbHiZh4pfa8iYo7imrOhEpQpbWzVxKugpeI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iu6tocLsDh2fsCyD+pURZrf77ChaGzaOOONuDFAHr7yHh6LY6FsUCvP0Led2GAxBI
	 5FlY/Wmr7CGONu1zSxNX2H3nTJfg9lKgO87aXgw4TpKiKK6flA06nA4jSQvmsH1g3t
	 Pkn21NLHIbDRtT/AjyU6OUFb1Z46wZ35rTmgmkexMra1rpGpkEwBcbRCc2R4HjDNjO
	 FO7hM0KftiFzoxVGzZ9lJ8+fJbxxDvwt+sIY+CaAJQvTBBG54yJnFS1qPSWLDfs3hh
	 3wJnVaCAEx+kiOER7FYlTd2B0/sxBVY9iUAlVTn8jgERnQsjgOzABgx+zOGKZU58P/
	 4xb1s1ZclMoVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07DB2842B5;
	Thu, 12 Feb 2026 16:47:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8382723D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 16:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80A74409CF
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 16:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fTCzrx2DA1G for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 16:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 429D7409CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429D7409CB
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 429D7409CB
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 16:47:02 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id qZqFvWOgeP2aDqZqFv6B7p; Thu, 12 Feb 2026 17:46:59 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Louis Aussedat <aussedat.louis@gmail.com>
Date: Thu, 12 Feb 2026 17:46:58 +0100
Message-ID: <20260212164658.2440528-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJsLwAaSDKNLgXnOcGg8NKfQ7DQit0PsKRhuAxBcKGVkzX2qNjHHqMDm2McWflG/NxNW3kSOXeMw2g6ljAEAx4QVQShnwMPsJam7uNLANAtM7spqVd00
 e8aTGUKiH3KDVMT3MuzMHi3dOwTQLytOPNYtNDDbUjpry92kFuZUvo5IMDv48IX5YRtiCNDY3sG9Djr2OZlWfmRhxsE10+hQLnwoZjv8orsPikAMDAGELInb
 NpivVS1jrLnh8jVde54F9GoY8IA1vc88SOn1yj/VPpWho9sQayzxTBMQgWbefFF3YhbPv2G1oq8tudpd3W7HcA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770914819; bh=4l6A0H4Kf4zaBm27vXblI2MsiHLXCXjHersc5YzT7jk=;
 h=From:To:Subject:Date:MIME-Version;
 b=NfCSb7qWMovvGb0d4Sl+CSMg2cYOaYBFKSw7DuMyarddjmYhsjiQQgJ2UOMETe++7
 ubSnS6JConXS8vlx+osa4WENBdO42O75MCzDNwfxMee3F3nMbxW5Iswz5tJPGAum79
 JpNuO9vXN+SEp5ofvsgl0Zg7ojWBEs1+2eBuVmJDQ+Yxm51L0/Ee3l/yi13lov9Unh
 aiVurMymHpjTzQAvjApZAt3OwRzFxj6VmOun23tD6Jz6eevwyWyg+aVNe5cM5CyGW9
 21KuboC9ZYPy7IO/WNedpbLtXwvXzkVp2O4X9HCgOA+Uv+INUoBTBTanFklZ4VX/Rm
 aJnYNQB+vfTJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NfCSb7qW
Subject: [Buildroot] [PATCH] package/rtl8189es: fix build failure for Xtensa
 with Linux 6.1.0 and gcc 13
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

Add local patch pending upstream to fix this build failure.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...r-Xtensa-with-Linux-6.1.0-and-gcc-13.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/rtl8189es/0001-Fix-building-for-Xtensa-with-Linux-6.1.0-and-gcc-13.patch

diff --git a/package/rtl8189es/0001-Fix-building-for-Xtensa-with-Linux-6.1.0-and-gcc-13.patch b/package/rtl8189es/0001-Fix-building-for-Xtensa-with-Linux-6.1.0-and-gcc-13.patch
new file mode 100644
index 0000000000..375b70b02e
--- /dev/null
+++ b/package/rtl8189es/0001-Fix-building-for-Xtensa-with-Linux-6.1.0-and-gcc-13.patch
@@ -0,0 +1,33 @@
+From 08dd621491963afd226ff32112c5d117b89512c1 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 12 Feb 2026 17:41:27 +0100
+Subject: [PATCH] Fix building for Xtensa with Linux < 6.1.0 and gcc 13
+
+Only with commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8939c58d68f97ce530f02d46c9f2b56c3ec88399
+__umulsidi3 ha been defined, that is required by gcc 13. So let's
+workaround with a local defined __umulsidi3() if Linux version < 6.1.0
+
+Upstream: https://github.com/jwrdegoede/rtl8189ES_linux/pull/133
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ os_dep/osdep_service.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/os_dep/osdep_service.c b/os_dep/osdep_service.c
+index d6d326a..7666bbb 100644
+--- a/os_dep/osdep_service.c
++++ b/os_dep/osdep_service.c
+@@ -3218,3 +3218,9 @@ int hexstr2bin(const char *hex, u8 *buf, size_t len)
+ 	return 0;
+ }
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 1, 0))
++unsigned long long __umulsidi3(unsigned int a, unsigned int b) {
++	return (unsigned long long)a * b;
++}
++EXPORT_SYMBOL(__umulsidi3);
++#endif
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
