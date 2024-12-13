Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C596E7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 13:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A835441878;
	Fri, 13 Dec 2024 13:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obANZRe_8jxc; Fri, 13 Dec 2024 13:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 197B141868
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197B141868;
	Fri, 13 Dec 2024 13:55:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6DD21146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 13:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A78FB417EB
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 13:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdtCsWeSz9_J for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 13:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E837141868
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E837141868
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E837141868
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 13:55:54 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30037784fceso16298781fa.2
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 05:55:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734098152; x=1734702952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QDglI8rGZSh77UlbFaVmFn7gwaKlPqmhdcabW+q33kk=;
 b=IZ4WIXYUGs+aJebkC+zaKKAzZKydk36sEsU2ql+u3uQ79mbZLiCXEuEAgefp47tgIu
 jBUUgvC9HVfPgNQLqBoCv5EtHj2zjjXU0CiA3id3Ga2cj+Zv7vNkpGDGJwIB0diqOhQp
 qvoMXm73Jh3xcGlCFACL4g40/ogVToYZUKLU8h+FpinJMpLyWLDrLk/C55A1PKmorVDh
 zAJQ6w3WwFfvgzxP37w/K6HIpO0CN3hzpZ/iFyCk25MWZrOHuZMZ/AQ4KgLSXLDNtdY+
 SEhf+wt7MXMFsxdWBz0yx0z2HZpBnXWDWwO0InVkoQTXBqHd0mHYllCi5/RS5JYjYcuh
 dqBQ==
X-Gm-Message-State: AOJu0Yz+t32PUXBQFguqp2rPod8ZpSZAnmOJHj21mlCbqfBF9zAr2jT7
 OL2sobHZFPhd8xaDk5ucLymIy6DpUhDQqQld3fuSwgHoAr+2JL/aQpLkmw==
X-Gm-Gg: ASbGncvG1aSyBXioBMvacMLtOIw/p3e1spL3MLaPIupy0LdTxMm7S5iDGUhgIdwOUTI
 N7/v6A3Dr8pIJdB93gOMHOfME8cC6sk5vaugvxuLiJvRXflpSKElJHK0Ski/sIIQDyKuVEHNtrt
 fn4fFOwUdecyfq1U6ogIIvLc6geaYSwNqmv8DByuwZsqsP2rFi4o41BIMtwbgglfbfM/kkzNsBd
 eRTUdbTkp7db9YQBmTr9nQeF+lQI6A4yGI7vHJnO22QHvluIIxfwaEus36n9EkBQmbwcQGMErKo
 9BC1arYiA2irYZA=
X-Google-Smtp-Source: AGHT+IFF5NoBVJNnoB9SWIMINwjoz/g7cc01MREzP8OBg4GQgo2MN57yV1rOKibPU1u3mL4zfyinaA==
X-Received: by 2002:a05:6512:3c85:b0:540:20b8:7325 with SMTP id
 2adb3069b0e04-5408fac7aeemr674416e87.2.1734098152213; 
 Fri, 13 Dec 2024 05:55:52 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e22975009sm2679346e87.63.2024.12.13.05.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 05:55:50 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 13 Dec 2024 14:55:43 +0100
Message-ID: <20241213135545.828931-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734098152; x=1734702952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QDglI8rGZSh77UlbFaVmFn7gwaKlPqmhdcabW+q33kk=;
 b=MvfRImtEX2GXSbCgn5FNq8FXRmLUMZx72UmqxaIBBQScZ5dr1/ezmZbVIldMMsbl2U
 gP4hesnr4bmPmtBzo/9U3DvWFDN/iMeb7k7/0XoS10DwRTr4hE8UrdCNqeqBzC273JUx
 9fnVralbVdJS7G+nNEH0Ao4IFM3+4/+cCk9syo9PGdbRAyn1einwsTHhaihbo92/btwS
 nAHopV+lTy2QnfQ3umPdemQ3kTh/2pk42FF4WeIo1qvTOObUUwoPXJcpkkJXNHRb5pSZ
 /j4p2/RYut5rRITrQviM0VKCpmGJ++b7mQIX6qHt7LDDe4e9lw5SKKRWe04AsZ/uhv3a
 Rszg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MvfRImtE
Subject: [Buildroot] [PATCH 1/1] package/curlpp: fix build failure caused by
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
 ...-to-build-with-CUL_NO_OLDIES-defined.patch | 90 +++++++++++++++++++
 ...emove-deprecated-CURLOPT_CLOSEPOLICY.patch | 45 ++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 package/curlpp/0001-Allow-to-build-with-CUL_NO_OLDIES-defined.patch
 create mode 100644 package/curlpp/0002-remove-deprecated-CURLOPT_CLOSEPOLICY.patch

diff --git a/package/curlpp/0001-Allow-to-build-with-CUL_NO_OLDIES-defined.patch b/package/curlpp/0001-Allow-to-build-with-CUL_NO_OLDIES-defined.patch
new file mode 100644
index 0000000000..0f329ecc73
--- /dev/null
+++ b/package/curlpp/0001-Allow-to-build-with-CUL_NO_OLDIES-defined.patch
@@ -0,0 +1,90 @@
+From def3ec44802266ce783a822ad9f5f33f36256d5e Mon Sep 17 00:00:00 2001
+From: Bruno de Lacheisserie <bruno.de.lacheisserie@gmail.com>
+Date: Tue, 10 Sep 2024 21:57:29 +0200
+Subject: [PATCH 1/2] Allow to build with `CUL_NO_OLDIES` defined
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
index 0000000000..6e033a2c6c
--- /dev/null
+++ b/package/curlpp/0002-remove-deprecated-CURLOPT_CLOSEPOLICY.patch
@@ -0,0 +1,45 @@
+From c630eeace3e514d8f72942bbbcd40d0e95572c82 Mon Sep 17 00:00:00 2001
+From: Bruno de Lacheisserie <bruno.de.lacheisserie@gmail.com>
+Date: Tue, 10 Sep 2024 22:02:24 +0200
+Subject: [PATCH 2/2] remove deprecated `CURLOPT_CLOSEPOLICY`
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
