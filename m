Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAC9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B6B34160A;
	Sun, 10 Apr 2022 15:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wehQKhVyhVe3; Sun, 10 Apr 2022 15:45:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA6B415A8;
	Sun, 10 Apr 2022 15:45:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C87131BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAF2C4059D
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5fWQmwUqftYr for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:45:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C06EE4053E
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:45:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k22so1018530wrd.2
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OmT2uffgTH8XWccT382RAY8/R5K9z2bPoe/l5EfON8A=;
 b=X2z0EL+oBrjpT0xAFRpoKvIRZU1BaqnpG3khh9/fDi2ZcpPyg3LT8ZExLnbNcB/zza
 hruzW7dAHQF8p7RpgS2RlHP6hzjito8+UsVgwQ4S0Dw2goe3Uxvl9/Z/W+HXH5UUXXy5
 if5/n8KR7KtE0GP5bKTXEibpIcSmfsZYQLxBEUfmvllUrSVWKC8aLMoHFtZkiHXEliPV
 Gc6mT7MuWR6xSD/3AdB6AQ/rNAw5N+bB4uGf4GQk56hw9dC6bJY00oqLw+h6iSZ+wcHi
 2h3C8nMjVfQOTUemR2hccWH9RW4pzV17cUtKwVvYRDGacFFDxdJRPktnyp3ASH3080a9
 hViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OmT2uffgTH8XWccT382RAY8/R5K9z2bPoe/l5EfON8A=;
 b=tudzESj8fviPeQ60R2G3p1syYfgiHxE0j52WCrOYpuR2H6A9ZmY9Eh6Zk2/xeQo3Vy
 WC9RH6F8nvSkEVdIVFmXvaN33FbVmttWCT9Q/BP5Heih2dCbBt9ESowToaOCLIx+f2z7
 5Uc/iX361S6HmYVACBweRlICU9U8OevpfPajvxbqg7c2x6TYyTIZth8mEtC3+TNQHv7m
 FQmwFI1ppTZR/O3CueZMtvv1XKzF8al0fOAdC0IfFjlBkTbDKshnuuQh0e9S1Kcbbe7z
 VJi63ZefG1iFTwdpoZIVjdHV2oB3ADia8G5TBD9W3AjViWPxoZO0dCLvYrzl37SPcSkv
 BtcA==
X-Gm-Message-State: AOAM533yF0fPpkq1N/4faa9gbr9HExarcK6S1Mg193aXSHYxg9kiNct2
 8AAYFMDrJ8+4lVlEzKwEsjIBwR0KHLM=
X-Google-Smtp-Source: ABdhPJwKz04YaySBg/tvtKo5b81cOydVI4+ePCK7nFMVXeUetVmvvwBIOAxBvcTOO8rbA+zSId0HdA==
X-Received: by 2002:a5d:59ad:0:b0:205:a66c:3c2a with SMTP id
 p13-20020a5d59ad000000b00205a66c3c2amr21543844wrr.289.1649605527673; 
 Sun, 10 Apr 2022 08:45:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056000186b00b0020799d3d416sm6445323wri.55.2022.04.10.08.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 08:45:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 17:43:29 +0200
Message-Id: <20220410154329.294878-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/trousers: fix build with libressl
 >= 2.7.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl >= 2.7.0:

crypto/openssl/rsa.c:43:1: error: static declaration of 'RSA_set0_key' follows non-static declaration
   43 | RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)
      | ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/607131255453da2dc0dab20a24264b3e74001525

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-Fix-build-with-LibreSSL-2-7.patch    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/trousers/0003-Fix-build-with-LibreSSL-2-7.patch

diff --git a/package/trousers/0003-Fix-build-with-LibreSSL-2-7.patch b/package/trousers/0003-Fix-build-with-LibreSSL-2-7.patch
new file mode 100644
index 0000000000..65da979f22
--- /dev/null
+++ b/package/trousers/0003-Fix-build-with-LibreSSL-2-7.patch
@@ -0,0 +1,24 @@
+Fix build with LibreSSL 2.7 
+
+LibreSSL 2.7 implemented OpenSSL 1.1 API
+
+See also: https://reviews.freebsd.org/D14849#change-KhYbRXBMIBod
+
+Cheers,
+Bernard Spil (brnrd@FreeBSD.org)
+
+[Retrieved (and backported) from:
+https://sourceforge.net/p/trousers/bugs/234]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+--- ./src/trspi/crypto/openssl/rsa.c.orig	2016-11-23 12:26:19 UTC
++++ ./src/trspi/crypto/openssl/rsa.c
+@@ -38,7 +38,7 @@
+ #define DEBUG_print_openssl_errors()
+ #endif
+ 
+-#if (OPENSSL_VERSION_NUMBER < 0x10100001L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100001L) || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
+ static int
+ RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)
+ {
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
