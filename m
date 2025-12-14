Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E974DD5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 18:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60DCE605B1;
	Sun, 14 Dec 2025 18:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYybVsTwSedO; Sun, 14 Dec 2025 18:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D4060DAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765738677;
	bh=RaG3piVfVMjAO8oMNfjR8GW9FzBkudM/tYnlNT8QWD8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CFUlSdhD3QwE1WLuDU5gk2lufpC8E6mn/e6PMBPwU8tXyZpX8Yjp1rvW6FjgJWC/M
	 2YZ81+W2rW+pzkqu4yFs5B//i7LuZJiViU69YbbifmDBMG2/79G+sqWLypamkEfT1Q
	 d93+OFSypAFyHIQ0StnowmpTLwKJqT3jhF9eX4xXjk44Lbvt4geirMa7UfcGIzljA4
	 1muIMq2+qaS8NYG6cAJQQutGU1/E0pByvCgAU4RspmHsnjY1dVaKoMiH0nPnIgucMd
	 kAz/0SN0DBtgJLiQ39pRpq6s99spQSw3MFeTPJIHq9P3v01O23PQuIt7+fOCg+7uf8
	 pyiYkYwbjc5BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D4060DAA;
	Sun, 14 Dec 2025 18:57:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 260202C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 18:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C1C04033B
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 18:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9_NZf2qe05W for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 18:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA3E940169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA3E940169
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA3E940169
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 18:57:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 268FFA4C1FBD
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 19:57:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33444)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUrHy-000000004IT-2L3G
 for buildroot@buildroot.org; Sun, 14 Dec 2025 18:57:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 19:57:49 +0100
Message-ID: <20251214185750.2379322-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765738671;
 bh=DnjZg/KRyfaipb69IR6SLVCdwz9j6MS9bsTPrSqVzqk=;
 h=From:To:Subject:Date:From;
 b=GgUGSYVf6/hhiy5cq3nB/hwvjrPpP1aPqXEJroP6Nmwg0rlCrKXJQRUdZ/vCOa7V7
 DmfkQflFqppFXaA7qkzL9QAbeub5gAVuTi0zbpDjwGlfqGOcUj+pMRZD2x1Rbz785p
 DJ+8uDCasjUQs3VJ3DeE2e3xdKVS2KXtnDnjItyd6IykeIaJ9WI9VP8aN4OLF3glCW
 H4RFlYi1eGNnabaRBnRdpS2xZmCCkGW5XgY/BbRJC2EzaMJmKP7WEQcyHYXevFkGq+
 hB3wzPQKEY0fzdILXwhfMw/6JDlKA+aLIs7vs/Fp+5PYqobUbYE9kRt0ISG81j/G4j
 T2PoSLXCdKjFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=GgUGSYVf
Subject: [Buildroot] [PATCH 1/2] package/util-linux: fix nommu build
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

libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
libuuid/src/gen_uuid.c:629:17: error: implicit declaration of function 'pthread_atfork';
 did you mean 'pthread_join'? [-Wimplicit-function-declaration]
  629 |                 pthread_atfork(NULL, NULL, reset_uuidd_cache);

Fixes:
https://autobuild.buildroot.net/results/c3d/c3d098dd485bf52b3599e03d22da7b2cd7fb053a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/util-linux/util-linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 16d086f333..79e237a153 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -51,6 +51,11 @@ UTIL_LINUX_CONF_OPTS += \
 	--disable-makeinstall-chown \
 	--disable-year2038
 
+# pthread support uses pthread_atfork, which is not available on nommu
+ifneq ($(BR2_USE_MMU),y)
+UTIL_LINUX_CONF_ENV += ac_cv_lib_pthread_pthread_atfork=no
+endif
+
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
 
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
