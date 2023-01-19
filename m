Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7621CC678D6
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 13:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF575418E5;
	Thu, 19 Jan 2023 13:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF575418E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qdu_71aS3q2; Thu, 19 Jan 2023 13:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8537F4196B;
	Thu, 19 Jan 2023 13:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8537F4196B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D07571BF2E5
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 13:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC9F060D58
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 13:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC9F060D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJeRnwUvY5m3 for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 13:29:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9337260A81
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9337260A81
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 13:29:33 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e3so1835845wru.13
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 05:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbY2rtMbzQ6Iv8L9fNxGu7dNtybB1abux/chuhPspxo=;
 b=RchbtoFfg25XoQeY8DVy47OReHxpj03siBTcWJT26IPJpY4FPsJ+ly3OZMZM/kwRQc
 QQkQwaKwK4pDWKAvkZ/mur+dqT4lFcY8leD2Dyi4DSeVYAzuel+DKzVSQ4JPddSrRanh
 npvcwWRw/QrT6TcdrQ55LZEiQPcb+AmWUant80MoCj4Diq2yhzX59amc6jcc64hmzwgW
 W30cOC+BOsMPeJMu4Ud1A0ZhrMr8b3TdrhuWMCpzOG7PzgwsLcgn3ZfWfSHzlAYs1Yuv
 RBN3g7gjCdPKuJgkmbBPldY0jGFrnKto9eT75br0sO5WYtYhUk7jwI0YEJ4q4B2NlRC/
 xmQw==
X-Gm-Message-State: AFqh2krolaVphhitaEepO6qo0qZj/PBba2R/lYWTvGPid8e/IaOpgTEQ
 92L7rGwJRimJtAuFFdAuZu6fH0+g6pEg9g==
X-Google-Smtp-Source: AMrXdXsJrtmFz0bQZ+HLL8YXRS0JJAgiyUaDpF1Zdua6iR5j0PdIyu0/Zjim2kQa2jv4114bFX00mQ==
X-Received: by 2002:adf:fc86:0:b0:2bc:8360:885 with SMTP id
 g6-20020adffc86000000b002bc83600885mr9714618wrr.21.1674134972807; 
 Thu, 19 Jan 2023 05:29:32 -0800 (PST)
Received: from ncarrier.spectracom.local
 (2a02-8428-7321-aa01-1304-3364-4203-42ea.rev.sfr.net.
 [2a02:8428:7321:aa01:1304:3364:4203:42ea])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002bdc19f8e8asm22011320wru.79.2023.01.19.05.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:29:32 -0800 (PST)
From: carrier.nicolas0@gmail.com
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 14:28:56 +0100
Message-Id: <20230119132856.1801425-4-carrier.nicolas0@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
References: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbY2rtMbzQ6Iv8L9fNxGu7dNtybB1abux/chuhPspxo=;
 b=VLFyWtxTvBKKGTBM54paxv0reWXUjaiklTeOWNyXx5fScF5zxooUhho4f+T9y06bhl
 OwCh0e4JpadvLs1Q0TgbApCyCu3HjdZaBrWJs71xUo/99XjSXfYvsZO66yheHhITMdJ+
 iqfXYfMCqCUxkoXKGYg57Mb7rK/+1J2aJf0xoCU+xVnqzwTRdPy1IsRjW55Zdz1FKCvK
 XLJdKMpkAOH4VGtCL5Rcw7fU72uSmt62Aptq1lhn+rAEK6jC82OjPLZhK1z6AIKCheQ7
 Hp0Nk0KjRNem53QgKNicONn6Zth+aB2g0TyFNrnrwUEurpzZFMV8KtUQUb/Cr0pxxSkT
 u5+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VLFyWtxT
Subject: [Buildroot] [PATCH 3/3] package/composer: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Nicolas Carrier <carrier.nicolas0@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Nicolas Carrier <carrier.nicolas0@gmail.com>

composer describes itself as a dependency manager for PHP, it is used
by projects such as CakePHP.

Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
---
 package/composer/composer.hash |  3 +++
 package/composer/composer.mk   | 31 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 package/composer/composer.hash
 create mode 100644 package/composer/composer.mk

diff --git a/package/composer/composer.hash b/package/composer/composer.hash
new file mode 100644
index 0000000000..512f4399a8
--- /dev/null
+++ b/package/composer/composer.hash
@@ -0,0 +1,3 @@
+# Locally computed hashes, not provided by upstream
+sha256  2021f0d52b446e0efe3c548cc058ab5671fa38cdbcf814e7911c7e9d71d61538  composer-2.0.8.phar
+sha256  c8cce4b6b9729f264ffdf9296d505d63432497feeed1f586d1902b942197e024  LICENSE
diff --git a/package/composer/composer.mk b/package/composer/composer.mk
new file mode 100644
index 0000000000..5ff5644d29
--- /dev/null
+++ b/package/composer/composer.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# composer
+#
+################################################################################
+
+COMPOSER_VERSION = 2.0.8
+COMPOSER_SOURCE = composer-$(COMPOSER_VERSION).phar
+# Here, we pass a dummy URL parameter in order to control the name the file
+# will have once downloaded.
+# Otherwise, the names will clash ifever we update the version.
+BASE_SITE = https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar
+COMPOSER_SITE = $(BASE_SITE)?n=f/$(COMPOSER_SOURCE)
+COMPOSER_LICENSE = MIT
+COMPOSER_LICENSE_FILES = LICENSE
+
+HOST_COMPOSER_DEPENDENCIES = host-php
+
+define HOST_COMPOSER_EXTRACT_CMDS
+	cp $(HOST_COMPOSER_DL_DIR)/$(COMPOSER_SOURCE) $(@D)
+	cd $(@D); $(HOST_DIR)/bin/php <<< '<?php \
+		$$p = new Phar("$(COMPOSER_SOURCE)"); \
+		$$p->extractTo(".", "LICENSE");'
+endef
+
+define HOST_COMPOSER_INSTALL_CMDS
+	mv $(@D)/$(COMPOSER_SOURCE) $(HOST_DIR)/bin/composer
+	chmod +x $(HOST_DIR)/bin/composer
+endef
+
+$(eval $(host-generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
