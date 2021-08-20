Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C39C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 10:05:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6BD3610D2
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 10:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6BD3610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C0E8403ED;
	Fri, 20 Aug 2021 10:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-fOtvR4jsPr; Fri, 20 Aug 2021 10:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE43840257;
	Fri, 20 Aug 2021 10:04:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95E9B1BF39D
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 10:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8503280E51
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 10:04:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PaGlBFj-5frJ for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 10:04:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 669CB80E37
 for <buildroot@busybox.net>; Fri, 20 Aug 2021 10:04:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso8692933wmg.4
 for <buildroot@busybox.net>; Fri, 20 Aug 2021 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ytGZcN3FYr1Hq8hbv6zum5Fw4dOMDwn1GYqWa8JsLAE=;
 b=qXhgEU4xp/oXEizSbB8qlw/i5xUnxRn9n0OcfAiACFsf9M3I8NueUgiCxO7eo90zBm
 Pw8yB41+2uQpIedXfYenRTiYhwaFwP9OkeFk5RdA5TqrYpzPn1fTFqWz4lz0m+peBVFX
 GE5o1zZQINxe1NeD9Mp55GzetRo/O7JrFhjLufNQ0xfJwoHiBhE7aV78cmLf1hpspnyM
 xS48ZTIpVweSiYc7VBsqXsgI/5Q6lMd8K7fXrydjIC03F60kSr4+cYRyqZm1vzwel+qZ
 /z4zEbDGgiraMKChQL+eX0JGqk7dhw15biNqfbgTTM0P3hLkU4AH2nUhQeSqzUn7hW7u
 zzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ytGZcN3FYr1Hq8hbv6zum5Fw4dOMDwn1GYqWa8JsLAE=;
 b=euyOe2gR0NitWPle32lf+q5MJnYyoC0WFdtsIOrqgQLsj542Spybv+DwBgyYsSp2C7
 fCfx6S2vVHTYbT7pLywA4N+e5e9IkFki5bznLbYH0HZxnMjl598jdjc9p4Vl4jsBdv/i
 lF0G4UuZqdHtlQOE/iefr17oilm4pU0hT5sCzYsUp8gSGKxgBJBML7mTC1p69FXU3Kq7
 Qhbo+hgFYJn9zOL37CS4hcgQJFrAMntPLBm/FmWd87RaM7/YOsPKWvqdGudiGtas3tK3
 tJs4bad1tIuFq5M/p2FrwsygZnahMsYC0ravOuZ12zDRnQgKGNLAW3hr/uSsSxygkeVL
 1dPQ==
X-Gm-Message-State: AOAM532pBw/+cizrs4iepU1jyaQIQq8xh8J2hu6zMe3fRXvdDMoV383G
 Wq8FKzEDlis2vCVPX8EchJSWJB9aFUk=
X-Google-Smtp-Source: ABdhPJwc2nNMlQH32Wq10GIjypzcAEflzn3qgbYfx64ZLewyrI+i8+WbpxL7F0D5djK8xPDRd54aeQ==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr2957557wmq.43.1629453888703; 
 Fri, 20 Aug 2021 03:04:48 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t8sm6375168wrx.27.2021.08.20.03.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:04:48 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 20 Aug 2021 12:04:39 +0200
Message-Id: <20210820100439.273885-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libressl: always expose
 SSL_OP_NO_TLSv1_3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes the build of vsftpd 3.0.4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch

diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
new file mode 100644
index 000000000..f34ae8583
--- /dev/null
+++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
@@ -0,0 +1,37 @@
+always expose SSL_OP_NO_TLSv1_3
+
+like in OpenSSL, see https://github.com/openssl/openssl/blob/master/include/openssl/ssl.h.in#L399
+
+like SSL_OP_NO_DTLSv1_2, see commit "Expose various DTLSv1.2 specific functions and defines"
+
+this change fixes the compilation of vsftpd 3.0.4 & 3.0.5, which fails with the following error:
+```
+ssl.c: In function 'ssl_init':
+ssl.c:98:18: error: 'SSL_OP_NO_TLSv1_3' undeclared (first use in this function); did you mean 'SSL_OP_NO_TLSv1_1'?
+```
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Fetched from: https://github.com/libressl-portable/openbsd/pull/124
+---
+ include/openssl/ssl.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
+index 46f24b2ea..4048a6e63 100644
+--- a/include/openssl/ssl.h
++++ b/include/openssl/ssl.h
+@@ -516,11 +516,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
+ #define SSL_OP_NO_TLSv1					0x04000000L
+ #define SSL_OP_NO_TLSv1_2				0x08000000L
+ #define SSL_OP_NO_TLSv1_1				0x10000000L
+-
+-#if defined(LIBRESSL_HAS_TLS1_3) || defined(LIBRESSL_INTERNAL)
+ #define SSL_OP_NO_TLSv1_3				0x20000000L
+-#endif
+-
+ #define SSL_OP_NO_DTLSv1				0x40000000L
+ #define SSL_OP_NO_DTLSv1_2				0x80000000L
+ 
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
