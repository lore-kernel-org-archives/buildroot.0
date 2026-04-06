Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFADF46C66
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E526B8105B;
	Mon,  6 Apr 2026 18:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKXN6eQe5AV8; Mon,  6 Apr 2026 18:23:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43ADC81045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499834;
	bh=SDOBqfTjP93D3Y6OweEFowQn+AHhio7dbZwb/0TfzFw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=feDV63e/rX8JvHtaw8kFvQ5xMQOOIk5t7B3GZBwy2WAVD3wRr9Tb11ZUnpgrqsxeX
	 T1ZtvUYKbUw6QZ6gfVPHY4y8mNng65uEIomvPBfR+trqPxhv98q2RykA4B/q86qmUi
	 RsVLAmXzuDGu/BLHmXv8J0k/ULBXFeAGd+GrsGNEmTXxMfqvNgjoMlmk4Kh8TiQ9sb
	 Q6gnZgz0TGBcNlnQt4r8CgjB24NwUonOU5I5rTeJxbhDAOBmGDyLTjyWaGobuEkioi
	 6uy5JlF133/AyS/r4U1Ti9u7Ljm7VRzoI6aGmeJ510IKXIPxe4CKTlxS4nwZwq7JfE
	 +1B0t0HUrr3Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43ADC81045;
	Mon,  6 Apr 2026 18:23:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FB8D2EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 513EE81045
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80PMPaBsRYde for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4868B81028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4868B81028
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4868B81028
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:23:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6546EA4C3960;
 Mon,  6 Apr 2026 20:23:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaX-000000001kA-1l1e;
 Mon, 06 Apr 2026 18:22:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:10 +0200
Message-ID: <20260406182217.1853895-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182217.1853895-1-bernd@kuhls.net>
References: <20260406182217.1853895-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499782;
 bh=ukFnVUbgnUDL+YxrCc48MexxqrAhEr8Mw7a8NIA4FTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tEvTvx5prvzYuWBmrjy2xQavff1/I8CHXl9ZdPbv6IOLpc2c0v18JNs9frSvZQ+xA
 b1ZZzdBv0phIPgZdG5hvdUzUlkmzx3VA9IMneS/UZhRPb7EMXUmSKCWzNxovRc8SWo
 GDgS/31Tz+nfOgdnoVDOzUgEg7AtVGjbbo7vV6XvNDzUajyvLoi4f5ULz/BuqTad2S
 OAwWUBPhDVk6Ohn7NpbA9vgb1o7+rJ5qjS1e6KpgADez0JPJC9q4yUUQB7xGttvUlg
 8edFOAYdEYZr3uGTSiFvmlTmCwzwEC1r7s57yd9e+66y+rZEdZSU9LiiYl7iKkpnnn
 3Wex1ZLXDaMlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tEvTvx5p
Subject: [Buildroot] [PATCH 06/11] package/pound: remove optional support
 for pcre, keep pcre2
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pound/pound.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index 6ed2fc656d..6d00776752 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -19,9 +19,6 @@ POUND_CONF_OPTS += --enable-pcre=2
 POUND_CONF_ENV += \
 	ac_cv_path_PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
 POUND_DEPENDENCIES += pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-POUND_CONF_OPTS += --enable-pcre=1
-POUND_DEPENDENCIES += pcre
 else
 POUND_CONF_OPTS += --disable-pcre
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
