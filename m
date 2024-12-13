Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CB0E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 14:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE74540544;
	Fri, 13 Dec 2024 14:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_KGxF6A_BVo; Fri, 13 Dec 2024 14:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DC5D40537
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DC5D40537;
	Fri, 13 Dec 2024 14:08:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F2C475
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BEFE4053F
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfUX1FQ1lztP for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 14:08:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD1D34052B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1D34052B
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD1D34052B
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 14:08:14 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso1687502e87.2
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 06:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734098892; x=1734703692;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wh4qVXQO1v8oxGc+yDkYb+SHcwRrtvYli3rTaYpwBkc=;
 b=wyxv2Q4iC8iEhnRFqsvr1cPb7Sobc/txczvkHMC2h7bTrNPVvkMGhUDYxxTVMQz3W2
 Kz+B7fZUqQH2kBZxaudICU6th0Iu4as18SBToeFRDRNnJL/UmAMR2aMD6lUae+2ZSqu+
 cYK8eObQHP1qWQLs5ikCiAzx5RWkZXPDs3srs+TXT1O5felrHtLK2av6lFYVhXjOmkHt
 4bP9pE66aQa6bU7o9KdgpXKOfOGVVSc+3+7vFXhgkpHQOPcMB7J6tHIjWkr2avCIYrUw
 idWahUe9I+RQwyOzQq7x7ZCPenjRE6T/oBsJ/B5gfb7Pq92NRBuHyK4cW/Kd3Ljd5h7e
 R8nw==
X-Gm-Message-State: AOJu0YwSLTg2eVT4ztYnwxatBIfCjKHjUEWDO1uAdnO3NNhijTFews58
 A8oS1dVOeJqCyUJjpFo58NduG+sGdo/wwVrCEa8YTsz0RHoh6IVJGX9erg==
X-Gm-Gg: ASbGnctiLg9cAhaohOdjfuj4WepHRIrQnLIEjb97LrBBHfFPK6l5t/Fz2JDLkckEajf
 zH58QbTQ+6vPCuzr5Kj5UXb2BfbI2wduKkIk7Lz4qEgTjN691S7YCvcKJYKZnx0V/U3eIDnOWpl
 D/SW0Fws04E6oiNQEEyY/zwczPMLy2v3F82XBf5sRxrYFVtX2isWfUzIEnAuA7mr4HEE4+Pgeo6
 YoGg6OcLaLBIalREgioR0WC+8tFbiqYZyZH0gFQioLM8iJMZejE6ysUnCzQfFFJqyOKf/aitAUg
 eEWnvf0SWgN9Awc=
X-Google-Smtp-Source: AGHT+IESoVyCqIIFKajnWpffWFMCRHeXDfPABYNz+H4DcBSPuR/AOC7ftinufdoLq61ua3W0q6/MkQ==
X-Received: by 2002:a05:6512:ea4:b0:53e:3a22:7a2e with SMTP id
 2adb3069b0e04-54099b72a02mr918016e87.47.1734098892043; 
 Fri, 13 Dec 2024 06:08:12 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2297441esm2664284e87.61.2024.12.13.06.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 06:08:10 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 13 Dec 2024 15:08:05 +0100
Message-ID: <20241213140806.842644-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734098892; x=1734703692; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wh4qVXQO1v8oxGc+yDkYb+SHcwRrtvYli3rTaYpwBkc=;
 b=VDS1Vz6ZI9Wgd2+5R/zwzywn8W9eyTnqItePYeGs0AY6j/ZTX6gY2BxIXe0Fk5020a
 RNmoVcI+IQ9k9rW72meY8EWp2aPKvzFRt+ywIThAiRVBT92/+fr7N537hL3USrJ25ALQ
 x6H26H0znQM8/7iDmYc3mUjf2pZJDlHWVcmTqGMKWZyf7CwZlmcQ5lKS6H1JXPPy93Vo
 rxnz2SBkrQY1IdmRwRCDT+9I03D0QcoxqndlOFF8+ini2gctTq6C+z6v7xJklhdR5133
 48kiJL+bfTKhqwD+kTTqXt7sKC8ApQRRyg+NhomxNImMrnsj1L0qs4L0l8mKCO/Yh7T9
 lGiQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VDS1Vz6Z
Subject: [Buildroot] [PATCH v2] package/curlpp: fix build failure caused by
 invalid conversion
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

Fixes:
https://autobuild.buildroot.org/results/2d2db1d060ec779a4cc017bc583278a4ce2fdf14/

The build broke when we bumped libcurl to v8.10.0 in d68b999787a0e0838c3bb2d5966f11d8a349a49b.

Backport patches from https://github.com/jpbarrette/curlpp/pull/171 to v0.8.1

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v1 -> v2:
  - Fix formatting of the Subject field in the patches

 ...-to-build-with-CUL_NO_OLDIES-defined.patch | 90 +++++++++++++++++++
 ...emove-deprecated-CURLOPT_CLOSEPOLICY.patch | 45 ++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 package/curlpp/0001-Allow-to-build-with-CUL_NO_OLDIES-defined.patch
 create mode 100644 package/curlpp/0002-remove-deprecated-CURLOPT_CLOSEPOLICY.patch

diff --git a/package/curlpp/0001-Allow-to-build-with-CUL_NO_OLDIES-defined.patch b/package/curlpp/0001-Allow-to-build-with-CUL_NO_OLDIES-defined.patch
new file mode 100644
index 0000000000..f80887e577
--- /dev/null
+++ b/package/curlpp/0001-Allow-to-build-with-CUL_NO_OLDIES-defined.patch
@@ -0,0 +1,90 @@
+From def3ec44802266ce783a822ad9f5f33f36256d5e Mon Sep 17 00:00:00 2001
+From: Bruno de Lacheisserie <bruno.de.lacheisserie@gmail.com>
+Date: Tue, 10 Sep 2024 21:57:29 +0200
+Subject: [PATCH] Allow to build with `CUL_NO_OLDIES` defined
+
+Fixes:
+ - https://autobuild.buildroot.org/results/2d2db1d060ec779a4cc017bc583278a4ce2fdf14/
+
+Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+Upstream: https://github.com/jpbarrette/curlpp/pull/171
+---
+ include/curlpp/Options.hpp | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/include/curlpp/Options.hpp b/include/curlpp/Options.hpp
+index c705c9d..e02508a 100644
+--- a/include/curlpp/Options.hpp
++++ b/include/curlpp/Options.hpp
+@@ -209,7 +209,6 @@ namespace options
+ 	*/
+ 
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_AUTOREFERER> AutoReferer;
+-	typedef curlpp::OptionTrait<std::string, CURLOPT_ENCODING> Encoding;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FOLLOWLOCATION> FollowLocation;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_UNRESTRICTED_AUTH> UnrestrictedAuth;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_MAXREDIRS> MaxRedirs;
+@@ -240,13 +239,9 @@ namespace options
+ 	typedef curlpp::OptionTrait<std::list<std::string>, CURLOPT_QUOTE> Quote;
+ 	typedef curlpp::OptionTrait<std::list<std::string>, CURLOPT_POSTQUOTE> PostQuote;
+ 	typedef curlpp::OptionTrait<std::list<std::string>, CURLOPT_PREQUOTE> PreQuote;
+-	typedef curlpp::OptionTrait<bool, CURLOPT_FTPLISTONLY> FtpListOnly;
+-	typedef curlpp::OptionTrait<bool, CURLOPT_FTPAPPEND> FtpAppend;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FTP_USE_EPSV> FtpUseEpsv;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_FTP_FILEMETHOD> FtpFileMethod;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FTP_CREATE_MISSING_DIRS> FtpCreateMissingDirs;
+-	typedef curlpp::OptionTrait<bool, CURLOPT_FTP_RESPONSE_TIMEOUT> FtpResponseTimeout;
+-	typedef curlpp::OptionTrait<curl_ftpssl, CURLOPT_FTP_SSL> FtpSsl;
+ 	typedef curlpp::OptionTrait<curl_ftpauth, CURLOPT_FTPSSLAUTH> FtpSslAuth;
+ 
+ 
+@@ -278,7 +273,6 @@ namespace options
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_LIMIT> LowSpeedLimit;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_TIME> LowSpeedTime;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_MAXCONNECTS> MaxConnects;
+-	typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FRESH_CONNECT> FreshConnect;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FORBID_REUSE> ForbidReuse;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_CONNECTTIMEOUT> ConnectTimeout;
+@@ -291,10 +285,8 @@ namespace options
+ 
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLCERT> SslCert;
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLCERTTYPE> SslCertType;
+-	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLCERTPASSWD> SslCertPasswd;
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLKEY> SslKey;
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLKEYTYPE> SslKeyType;
+-	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLKEYPASSWD> SslKeyPasswd;
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLENGINE> SslEngine;
+ 	typedef curlpp::NoValueOptionTrait<CURLOPT_SSLENGINE_DEFAULT> SslEngineDefault;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_SSLVERSION> SslVersion;
+@@ -305,7 +297,6 @@ namespace options
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_EGDSOCKET> EgdSocket;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_SSL_VERIFYHOST> SslVerifyHost;
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_SSL_CIPHER_LIST> SslCipherList;
+-	typedef curlpp::OptionTrait<std::string, CURLOPT_KRB4LEVEL> Krb4Level;
+ 
+ 
+ 	/**
+@@ -313,8 +304,18 @@ namespace options
+ 	*/
+ 
+ 	typedef curlpp::OptionTrait<void *, CURLOPT_PRIVATE> Private;
+-	typedef curlpp::OptionTrait<std::string, CURLOPT_KRB4LEVEL> Krb4Level;
+ 
++#ifndef CURL_NO_OLDIES
++	typedef curlpp::OptionTrait<std::string, CURLOPT_KRB4LEVEL> Krb4Level;
++	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLKEYPASSWD> SslKeyPasswd;
++	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLCERTPASSWD> SslCertPasswd;
++	typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
++	typedef curlpp::OptionTrait<curl_ftpssl, CURLOPT_FTP_SSL> FtpSsl;
++	typedef curlpp::OptionTrait<long, CURLOPT_FTP_RESPONSE_TIMEOUT> FtpResponseTimeout;
++	typedef curlpp::OptionTrait<bool, CURLOPT_FTPAPPEND> FtpAppend;
++	typedef curlpp::OptionTrait<bool, CURLOPT_FTPLISTONLY> FtpListOnly;
++	typedef curlpp::OptionTrait<std::string, CURLOPT_ENCODING> Encoding;
++#endif
+ 
+ 	//Share;
+ 	//TelnetOptions
+-- 
+2.47.1
+
diff --git a/package/curlpp/0002-remove-deprecated-CURLOPT_CLOSEPOLICY.patch b/package/curlpp/0002-remove-deprecated-CURLOPT_CLOSEPOLICY.patch
new file mode 100644
index 0000000000..1e14d0dcb6
--- /dev/null
+++ b/package/curlpp/0002-remove-deprecated-CURLOPT_CLOSEPOLICY.patch
@@ -0,0 +1,45 @@
+From c630eeace3e514d8f72942bbbcd40d0e95572c82 Mon Sep 17 00:00:00 2001
+From: Bruno de Lacheisserie <bruno.de.lacheisserie@gmail.com>
+Date: Tue, 10 Sep 2024 22:02:24 +0200
+Subject: [PATCH] remove deprecated `CURLOPT_CLOSEPOLICY`
+
+accorded to curl commit https://github.com/curl/curl/commit/ae76ebe2d1202a09b009c9294f63c2a1bc228bd8, this flag could never be used.
+
+Fixes:
+ - https://autobuild.buildroot.org/results/2d2db1d060ec779a4cc017bc583278a4ce2fdf14/
+
+Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+Upstream: https://github.com/jpbarrette/curlpp/pull/171
+---
+ doc/guide.tex              | 2 --
+ include/curlpp/Options.hpp | 1 -
+ 2 files changed, 3 deletions(-)
+
+diff --git a/doc/guide.tex b/doc/guide.tex
+index 12165e7..76b5c59 100644
+--- a/doc/guide.tex
++++ b/doc/guide.tex
+@@ -623,8 +623,6 @@ see the ``how to enhance cURLpp'' section.
+         cURL::CURLOPT_LOW_SPEED_TIME > LowSpeedTime;
+       typedef cURLpp::OptionTrait< long, 
+         cURL::CURLOPT_MAXCONNECTS > MaxConnects;
+-      typedef cURLpp::OptionTrait< cURL::curl_closepolicy, 
+-        cURL::CURLOPT_CLOSEPOLICY > ClosePolicy;
+       typedef cURLpp::OptionTrait< bool, 
+         cURL::CURLOPT_FRESH_CONNECT > FreshConnect;
+       typedef cURLpp::OptionTrait< bool, 
+diff --git a/include/curlpp/Options.hpp b/include/curlpp/Options.hpp
+index e02508a..0407f29 100644
+--- a/include/curlpp/Options.hpp
++++ b/include/curlpp/Options.hpp
+@@ -309,7 +309,6 @@ namespace options
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_KRB4LEVEL> Krb4Level;
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLKEYPASSWD> SslKeyPasswd;
+ 	typedef curlpp::OptionTrait<std::string, CURLOPT_SSLCERTPASSWD> SslCertPasswd;
+-	typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
+ 	typedef curlpp::OptionTrait<curl_ftpssl, CURLOPT_FTP_SSL> FtpSsl;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_FTP_RESPONSE_TIMEOUT> FtpResponseTimeout;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FTPAPPEND> FtpAppend;
+-- 
+2.47.1
+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
