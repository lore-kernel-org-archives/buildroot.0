Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2FCC6FA8E
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 17:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AECD960ABF;
	Sat, 25 Feb 2023 17:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AECD960ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2l-NtN1L8Hw; Sat, 25 Feb 2023 17:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3BAF60A92;
	Sat, 25 Feb 2023 17:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3BAF60A92
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793451BF3FD
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 17:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6019E60A92
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 17:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6019E60A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hWDa9YJ20Kgi for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 17:28:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 209EF608F5
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 209EF608F5
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 17:28:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id p26so1733697wmc.4
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/junB87D3niReBKfhM0c3o45R6kD7w5uhBkhDVWVkJw=;
 b=Cg4fkk2CkkzoUBriegDyyXgBcwhXLzsHzK84YorwOY3mI3uHAPqGNHIvpQ5H33xR6q
 1dQG5UsxWYW+5+/jSgzQWmvpvmQwNIQLIhvLdY7GprrxTV/Do1qfs0gMNlURjbr1weqv
 XilDTNBypVepEz3JcqJ/HAmxWiiKIdJWSVS3rBXA7KQUZi5P8gskGGCWkg2+asRZbqpH
 9qEJLQaFANj8AAHpKRKS0FTLSOM6d9tHm9ccaVhB9eslmgMGmkoaNlV0+qe4EjzHgQ4Y
 iDm1gA95Cl3GL8iMPioxHT1L7E+AV1eXQSPHY+FoldV9BFj98cxQoJeNconN2jYAIvHW
 n3Zg==
X-Gm-Message-State: AO0yUKW6N4C/FF5PeRATlg54sB8tE9xBCcg+sZh9GlbF44S/RKHR4xrt
 6DAfwdDwaZXR1zQZ5FHeCehIy2EkOIk=
X-Google-Smtp-Source: AK7set+TdAuIaCs4zK68NIgp6jh+PGDV4fLHPM2qqlC2DxlIlQpcGRWj1AAoZbr1ykQom6eyf3sQHg==
X-Received: by 2002:a05:600c:a694:b0:3dc:18de:b20d with SMTP id
 ip20-20020a05600ca69400b003dc18deb20dmr16711973wmb.33.1677346089957; 
 Sat, 25 Feb 2023 09:28:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q8-20020a1ce908000000b003e70a7c1b73sm3184952wmc.16.2023.02.25.09.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 09:28:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 18:28:06 +0100
Message-Id: <20230225172806.9444-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/junB87D3niReBKfhM0c3o45R6kD7w5uhBkhDVWVkJw=;
 b=QqSit/6U0OcjMokpL47wZuBrHkMVj8/4T27QtpozJgLtHCdFJn7gO7PlHC2rRzAC20
 DOxnEJfDNP36J4pY951qsfrCOiXiUOEjk/Ny36EOLqTYWxByLuN0IoAOnps7T5z36ZMw
 NXZyLmZTZsuNqXAVEYm3xvZnDzT3YCmFWY9DdyPpwPfoxiAVx8+uw+ie+yHfjeh0VTzG
 R4yjypZxfAD0jqt2wTmeJ3l0yEy1JSNEGGa+LxdR2nt5h/LNqPxpGssRnuMajJst4h7V
 zti/In51iNqH3d+fgza12eOqkdFmGsOh4SXsOI0pJK/WE4Ypi2orKxmC8mH1b+8DJ05w
 CenQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QqSit/6U
Subject: [Buildroot] [PATCH 1/1] package/pistache: fix libressl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following libressl build failure which is probably raised since
the addition of the package in commit
65d891efc2fb069f9cf707f47302776f7076b80c:

../src/server/listener.cc: In member function 'void Pistache::Tcp::Listener::setupSSLAuth(const std::string&, const std::string&, int (*)(int, void*))':
../src/server/listener.cc:582:29: error: 'SSL_verify_cb' was not declared in this scope; did you mean 'RSA_verify'?
  582 |                            (SSL_verify_cb)cb
      |                             ^~~~~~~~~~~~~
      |                             RSA_verify

Fixes:
 - http://autobuild.buildroot.org/results/066fc078980e5216f38411eee455088e15fa1101

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...erver-listener.cc-fix-libressl-build.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch

diff --git a/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch b/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch
new file mode 100644
index 0000000000..f2fe2183ae
--- /dev/null
+++ b/package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch
@@ -0,0 +1,38 @@
+From 656bff21c1d20b25058da9dbc27d28ad2ac7ae6e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 25 Feb 2023 18:09:39 +0100
+Subject: [PATCH] src/server/listener.cc: fix libressl build
+
+Fix the following libressl build failure:
+
+../src/server/listener.cc: In member function 'void Pistache::Tcp::Listener::setupSSLAuth(const std::string&, const std::string&, int (*)(int, void*))':
+../src/server/listener.cc:582:29: error: 'SSL_verify_cb' was not declared in this scope; did you mean 'RSA_verify'?
+  582 |                            (SSL_verify_cb)cb
+      |                             ^~~~~~~~~~~~~
+      |                             RSA_verify
+
+Fixes:
+ - http://autobuild.buildroot.org/results/066fc078980e5216f38411eee455088e15fa1101
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/pistacheio/pistache/pull/1124]
+---
+ src/server/listener.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/server/listener.cc b/src/server/listener.cc
+index 38d2661..c09cb36 100644
+--- a/src/server/listener.cc
++++ b/src/server/listener.cc
+@@ -609,7 +609,7 @@ namespace Pistache::Tcp
+         SSL_CTX_set_verify(GetSSLContext(ssl_ctx_),
+                            SSL_VERIFY_PEER | SSL_VERIFY_FAIL_IF_NO_PEER_CERT | SSL_VERIFY_CLIENT_ONCE,
+ /* Callback type did change in 1.0.1 */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+                            (int (*)(int, X509_STORE_CTX*))cb
+ #else
+                            (SSL_verify_cb)cb
+-- 
+2.39.1
+
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
