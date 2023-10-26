Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82706C25B6B
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2931441759;
	Thu, 26 Oct 2023 09:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2931441759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVQhGhYEXjbL; Thu, 26 Oct 2023 09:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7C81417E6;
	Thu, 26 Oct 2023 09:31:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C81417E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6151BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5292641773
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5292641773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8JMnxz5DwRB for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:25 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B05641780
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B05641780
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9b9faf05f51so97478766b.2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312442; x=1698917242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0enXpB6fUn1eoynUhTRg72LITeIP3UzPL/U0dx+RazE=;
 b=tqYpegMFnhvrs+g1121S52KvKiMxqFrdA66IugBicQwIpnj0wY79wOWxpT9woKBdhK
 iYEqPPOC54c2u5rUJErsNbY/UcYE0JGuKtimUASZsRqA/WbwyHk0cTVoVcjBigjVKkRU
 zYQUQz1Q9zSda8ghEHzDejP3LNS8pqAxrS8qJi3nGoSLkRr9Ng0uwkl3AYsw/aLbfFQs
 Gn/0ZkniAn/551iycXM1rHzo3E4YZuz71M4akt/O04kHjPAkuBKbmBrofQmPV+WynhU3
 3rnRm9vuKqi/4+CAiygEehL9SJokHAeXt7ePOB2FO/RygjD90bh3qQ4fwd7pbbvRRf01
 ARqw==
X-Gm-Message-State: AOJu0YyTELn0DFTjaTHewHAmaEKFUu02Xjs8emneKUf4rEGyht4mwx8j
 QmxvTqLVY3OLzLvik9w7BfdbimZoFt1VZ2lN+5/o/jSpq3/h0Q==
X-Google-Smtp-Source: AGHT+IEEce7MJFR9XZAaSEaJUeSC3i91CySXNOsSL3UfOyN7qi3BiTZuIzSnKh6AAlIJxvM1tsw7Aw==
X-Received: by 2002:a17:907:988:b0:9c1:66cc:1d7d with SMTP id
 bf8-20020a170907098800b009c166cc1d7dmr10914341ejc.64.1698312442308; 
 Thu, 26 Oct 2023 02:27:22 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:21 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:50 +0200
Message-ID: <20231026092701.12345-20-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312442; x=1698917242;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0enXpB6fUn1eoynUhTRg72LITeIP3UzPL/U0dx+RazE=;
 b=r6Q33EoW8piAceGZQlnHtVjB3uJzDw//F4V3Hr63XzrwOmNlx76M+n8MqZFrdfgbhf
 nhlh8KKb94afjqCchBaIGniYB4cR8liWQC0zgRX5a/9igze71jpxVTUEeWxBXqDtldtZ
 SxxQQYo8yw9szt+QOMX6dffEu7v2yj10+vdAA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=r6Q33EoW
Subject: [Buildroot] [PATCH 19/30] package/libftdi: add patch to move from
 distutils to sysconfig
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In preperation of python 3.12.0, distutils has been removed completely.
This is a patch taken from the Fedora 39 RPM: libftdi-1.5-10.fc39.x86_64.

Upstream commit: abd19b721f7e9b4d514ed319ece173ebc7b1ea72

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...003-move-from-distutils-to-sysconfig.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libftdi/0003-move-from-distutils-to-sysconfig.patch

diff --git a/package/libftdi/0003-move-from-distutils-to-sysconfig.patch b/package/libftdi/0003-move-from-distutils-to-sysconfig.patch
new file mode 100644
index 0000000000..cb179c7cde
--- /dev/null
+++ b/package/libftdi/0003-move-from-distutils-to-sysconfig.patch
@@ -0,0 +1,32 @@
+From 872cd480990e6536d2cf48568627903ebf5acbeb Mon Sep 17 00:00:00 2001
+From: Dan Hor <dan@danny.cz>
+Date: Tue, 24 Oct 2023 10:36:09 +0200
+Subject: [PATCH] move from distutils to sysconfig
+
+The distutils module was deprecated in Python 3.10, thus switch to the
+sysconfig module instead.
+
+Upstream: committed abd19b721f7e9b4d514ed319ece173ebc7b1ea72
+
+Signed-off-by: Dan Hor <dan@danny.cz>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ python/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
+index 5b6f420..19ce500 100644
+--- a/python/CMakeLists.txt
++++ b/python/CMakeLists.txt
+@@ -42,7 +42,7 @@ endif ()
+ 
+ set_target_properties ( ${SWIG_MODULE_ftdi1_REAL_NAME} PROPERTIES NO_SONAME ON )
+ 
+-execute_process ( COMMAND ${PYTHON_EXECUTABLE} -c "from distutils import sysconfig; print( sysconfig.get_python_lib( plat_specific=True, prefix='${CMAKE_INSTALL_PREFIX}' ) )"
++execute_process ( COMMAND ${PYTHON_EXECUTABLE} -c "import sysconfig; print( sysconfig.get_path( 'platlib', vars={'platbase': '${CMAKE_INSTALL_PREFIX}'} ) )"
+                   OUTPUT_VARIABLE _ABS_PYTHON_MODULE_PATH
+                   OUTPUT_STRIP_TRAILING_WHITESPACE )
+ 
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
