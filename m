Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A6FE668B3
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 17:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A875A406B3;
	Sat, 20 Dec 2025 17:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLchf5eOnt6C; Sat, 20 Dec 2025 17:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F67406C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766250399;
	bh=d0HO++qTVvpmCyDbKCph3voAUo3OZCBi5EaKN4zG2hc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NsuUv1lA9sICRfPk1zgPcXuoKz2+sPr2KXYt66UgZEq3DkIGw/OSV/vLHgz4O/jZ9
	 CYs1RONhuigVkeWgyJ7O/3Z/r47HapFjfNWbcR2o2Fj76B5to7RKG6VQIiYyJTztoV
	 c+SDxxtCMLCcikNjkqvLRFKzLKAnb14sr8dmJxcBDOZPfeEnId/BwyQxcuZhLrwyXg
	 ERnoCIhyKUJjNI2Pmp3uyAbGL2tcMlBj0DWyyMoC+/Z1DvCLv/FmJsILh9BIZqwrEi
	 Ef0Ktos+yFMdDR4SYl+tNd+nkVgXEw8tKPlsHIIHY0uOm498Gev2RB72PfqGZg8FKp
	 f8LpCSh1hgXBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7F67406C7;
	Sat, 20 Dec 2025 17:06:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA07A119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBAEA4035D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzXZLs9eDY5C for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 17:06:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D52EF4011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D52EF4011D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D52EF4011D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 17:06:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8970A4C4AA5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 18:06:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42440)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX0PP-000000004K3-2nJG
 for buildroot@buildroot.org; Sat, 20 Dec 2025 17:06:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 18:06:21 +0100
Message-ID: <20251220170623.155785-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220170623.155785-1-bernd@kuhls.net>
References: <20251220170623.155785-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766250383;
 bh=KI1rPRxEe1/trBRFu5EKJ4ymLlGggvN2UTNFR/YWTf8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=HJ0fX8jjhLhn6Gu2DOB0Ba5wCyFH+1VxpKlxkcVBYwNtzd6iqXgQEDFJYwp8vrlvp
 WpBsCZ4bbuju7s8eR/ighHCwl79ZnMqwKG8zzQBlkm3eINBPi7tlDPrIg4czx7s3BS
 pVKpXIIPv3G4p5bweaUjxDqmFcT5NItmo5tX023J/le5bwhFwtO6oAUewffRicIMVe
 T+SAhH62rkAFuxWtHAKFGNBryZ7iensyEiJvg1a8mc9uJV5GxW/XQPWhAUEe6glScM
 M0/lke6OU0QrxDvrIMn/0e8p0oI2dRteIrnkQOYk0WmYCWnoqtjTasla07RJnwTSfk
 qIdhWCbUrWqlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HJ0fX8jj
Subject: [Buildroot] [PATCH 2/4] package/util-linux: fix nommu build
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
index 8c98d80adf..40d948ec97 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -58,6 +58,11 @@ UTIL_LINUX_CONF_OPTS += \
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
