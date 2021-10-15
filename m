Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31970C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 06:53:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65F086108B
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 06:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65F086108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6BA3401F4;
	Fri, 15 Oct 2021 06:53:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 822KAHGbqXo4; Fri, 15 Oct 2021 06:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD18440153;
	Fri, 15 Oct 2021 06:53:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF6751BF3F6
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 06:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE31640153
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 06:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqyPakJ5-X2f for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 06:53:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E7AE40012
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 06:53:38 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id v127so1609698wme.5
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 23:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUjR7+LTZQRjtpTpYVdEYhgTi033+h15JqjfMTiHJ1M=;
 b=FHdkUJOhpieILXw+/1f9tuPplRSQohTM/tzGf07DoqPwmZ20N+7tk/FTq4qXb0AKOQ
 yWTeu25rE8ZXiztclMXwON1kWkqfBh4Li05PGdIZcayLV3FNo6WeNu0Ckj77qyhqy1wn
 7NnIXVac6LVJRDxUFcUviMNNsRP6rXyHcOFq5UuO8LzYT7rLIqqv1B4nqT598BGWgRZh
 m6bmcYTooOMEX8e3S7KX/aeFo3pfPgjq1AOtgm2BgeTdV2ngvTv7DzehyGbYot1H0LUS
 nZ1nvmHagkFQLlwDOzfqd/CMzuLIAjSmlWAWotG185uLwlWu81KcCz4rxR+hk/3z76IO
 1OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EUjR7+LTZQRjtpTpYVdEYhgTi033+h15JqjfMTiHJ1M=;
 b=djK7UfcwHvNuj4ovtHdJkhMQSSL5qMauxRK4w5y38OHi4mgcAB3Lmv2sSSRdunz78S
 e8JLkbJnXIGKpa51QZIppQqQyNrW3FeG7HKUyc6wUaPMCJJvKbJNC0FnJt6ZpA1wj7Za
 c5eAeY8dnWVO/b7w6b+j89ORKEC4oAhsnqnRHxvXO/myyX0hWMmTK3Ijqu9+jeXiOqA/
 f4SwtF0Ft14EKefjD6bI4VvIg7Q8qwH2YlC4CRPNZEvbqDsUG0Ogd6yMwRZVAvsNgTTb
 eChsaFJgxwYct9w7uPmoCYHtNsz653oBk6+sz/TOu8bxmh0/rSF8pYvknI4VfDNSQOIs
 KRrQ==
X-Gm-Message-State: AOAM530Moq3UsQ6/mSXQNY5I2l8UrjgxMAV2SSXsTRe1pT5pUCYPQ5Lu
 uIMBzvk9R9kpkyNqKxJi51bcxS0yeLk=
X-Google-Smtp-Source: ABdhPJxiN7LXtidoY1XGmXhyTB9dH/psuuPmTgmi85MDaiSrsndhb2k46rTP2aDfAxXTCjpdJ7wgww==
X-Received: by 2002:a7b:c057:: with SMTP id u23mr19398982wmc.3.1634280816220; 
 Thu, 14 Oct 2021 23:53:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id a2sm4566107wrq.9.2021.10.14.23.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:53:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 08:52:21 +0200
Message-Id: <20211015065221.446510-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libpam-nfc: fix build with automake
 >= 1.16.4
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of automake to version
1.16.4 in commit fe90272b5128987ee7492fff950660e05324838d:

make[1]: Entering directory '/home/giuliobenetti/autobuild/run/instance-2/output-1/build/libpam-nfc-bb762e0e649195110e015ffb605c4375e927c437'
  CC       pam-nfc-add.o
  CCLD     pam-nfc-add
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: cannot find -lnfcauth

Fixes:
 - http://autobuild.buildroot.org/results/4f6018cb44770ea8fb9a9eb24c161239c2d04c27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...le.am-fix-build-with-latest-automake.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/libpam-nfc/0001-Makefile.am-fix-build-with-latest-automake.patch

diff --git a/package/libpam-nfc/0001-Makefile.am-fix-build-with-latest-automake.patch b/package/libpam-nfc/0001-Makefile.am-fix-build-with-latest-automake.patch
new file mode 100644
index 0000000000..edf530f1b8
--- /dev/null
+++ b/package/libpam-nfc/0001-Makefile.am-fix-build-with-latest-automake.patch
@@ -0,0 +1,37 @@
+From 1b3d33c23f77c6f2a244f04f00f9140f8fa28155 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 15 Oct 2021 08:42:13 +0200
+Subject: [PATCH] Makefile.am: fix build with latest automake
+
+Fix the following build failure with latest automake (at least version
+1.16.4):
+
+make[1]: Entering directory '/home/giuliobenetti/autobuild/run/instance-2/output-1/build/libpam-nfc-bb762e0e649195110e015ffb605c4375e927c437'
+  CC       pam-nfc-add.o
+  CCLD     pam-nfc-add
+/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: cannot find -lnfcauth
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4f6018cb44770ea8fb9a9eb24c161239c2d04c27
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/nfc-tools/pam_nfc/pull/3]
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8ef5db5..8e3cd0e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -32,6 +32,6 @@ pam_nfc_add_SOURCES = \
+         pam-nfc-add.c
+     
+ pam_nfc_add_LDADD = \
+-	-lnfcauth
++	libnfcauth.la
+ 
+ EXTRA_DIST = nfcauth.h
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
