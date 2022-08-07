Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B65C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 09:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A931760757;
	Sun,  7 Aug 2022 09:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A931760757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Z5Apbe_FMsT; Sun,  7 Aug 2022 09:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C4660746;
	Sun,  7 Aug 2022 09:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75C4660746
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57B261BF83B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 09:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F98881A73
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 09:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F98881A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bV3OP4YNzdnY for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 09:56:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDEBA81A64
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDEBA81A64
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 09:56:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z12so7841383wrs.9
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 02:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=NZjYVqVoXtLUlpZ9/NBRwXIifs+FojDxoOdqnH/zi14=;
 b=0+kMApj/B19oqvI4efv1ZeRQ0h2aLXViUuoprGYEImUydw4dizAjrOUSamR/mr/Bn4
 90OGM/5jLgcloof/6RopwdIlSO5Ny8sNz3LqTYfBiKAIsfQsOpbN9ItMrmCdy1wzVb3w
 SzCtXczaN5GaQ1VNRLSBwBfihOKMjf17C0J4m3ldkbHgZLqhhnAWnaxZEO04aZb8F3o/
 DQlawz6ehTWWMSsbkMFFs6F1T4gC1+brC3oKFMlukcX2WDYlZ3uam/1psp8cQMqs2E3o
 +NigLihbtQrXXyGJ8QvlTEKny9JvhdhMYR+pmTyxD6OZRirEpLMKgXtDHIHz1wQo0JnI
 318w==
X-Gm-Message-State: ACgBeo0U1UPQIx8E/pDORpzm05r9eYqQFKLBmBNVVfhR9wMQX3KvuGcL
 p0joMqe09nxIcS0VA5DgyedbsD636Po=
X-Google-Smtp-Source: AA6agR4tKL+zCKDRLNs9JnAnmunkANHS62+AJDBUdWQTtq+F/9inwW95uOLkqvfkzCi+YFzd1799Kg==
X-Received: by 2002:adf:f804:0:b0:21e:de03:b64f with SMTP id
 s4-20020adff804000000b0021ede03b64fmr8189716wrp.543.1659866167910; 
 Sun, 07 Aug 2022 02:56:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adff904000000b0021e9fafa601sm8582294wrr.22.2022.08.07.02.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 02:56:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 11:55:53 +0200
Message-Id: <20220807095553.3186454-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=NZjYVqVoXtLUlpZ9/NBRwXIifs+FojDxoOdqnH/zi14=;
 b=crBsA0ofF/rYO8HCrpEjhVR/DZw+7tcdrcdKDXnfjwL03ry29UA66ySB2mupk8foCr
 QkQzVn3/QAzt1jzeLBUazBQY9G57Cyb6VuG1En0pP0djA0wArmO1NDOCXIBe9j59Fzbs
 jHmdhc51iXGgufM7FPQG76w8KJhIHxiVWUVJ4+K2EDX6TmyhjQzeAa6FlYWKEXjL8A4K
 Ks1O4Ni5ePAm6WtMX6Rqbci6oLGx67RDh5ynW5oWsAF4AVKbYCjbeJvfdlLXpb3KpkV9
 d7Gb6MuHYPMaUmITncofQ+KqImNtbudAUjBtQPryok2SbXm7KEqzfbHxi12/WIXh5ZlQ
 SlMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=crBsA0of
Subject: [Buildroot] [PATCH 1/1] package/dump1090: fix dependencies
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

dump1090 needs threads and gcc >= 4.9 since bump to version 7.2 in
commit e80c99e1519dafc2cf88ab4672eecda88359ecb1 to avoid the following
build failures:

In file included from dump1090.c:50:
dump1090.h:69:10: fatal error: pthread.h: No such file or directory
   69 | #include <pthread.h>
      |          ^~~~~~~~~~~

In file included from dump1090.c:50:0:
dump1090.h:68:23: fatal error: stdatomic.h: No such file or directory
 #include <stdatomic.h>
                       ^

Fixes:
 - http://autobuild.buildroot.org/results/a8993d9a09c79231358f50d2c1eb2e08cf7d5fd6
 - http://autobuild.buildroot.org/results/7367abae7dc8187e4a2aae5397618c6e1b7aa521

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dump1090/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/dump1090/Config.in b/package/dump1090/Config.in
index 897ad46679..ca3165dc74 100644
--- a/package/dump1090/Config.in
+++ b/package/dump1090/Config.in
@@ -1,7 +1,13 @@
 config BR2_PACKAGE_DUMP1090
 	bool "dump1090"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_NCURSES
 	help
 	  Dump1090 is a simple Mode S decoder for RTLSDR devices
 
 	  https://github.com/flightaware/dump1090
+
+comment "dump1090 needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
