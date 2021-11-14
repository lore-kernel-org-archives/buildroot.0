Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D7CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 16:11:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B43160FC2
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 16:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B43160FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F15944017D;
	Sun, 14 Nov 2021 16:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUWu2vbU1COa; Sun, 14 Nov 2021 16:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE18340105;
	Sun, 14 Nov 2021 16:11:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 745EA1BF30F
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 16:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6332E4028A
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 16:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wm_tKuSCS3rl for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 16:11:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C6F240205
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 16:11:51 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso13817259wml.1
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 08:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wivvx+3/XG+p73bEtEpeHu+OQ+gq6XSbaSSDs8K577c=;
 b=Xs6Feo1hMQgR2Bmq+SVWcJQOj+EB0EZxhAa61WQYkVR3waEEbnr9pk7hXdkpVzi7ZZ
 wBv07dhZc1UcGpj2tNLP9zehabg9ET0KMIpg5MFpskEC87VWymsL79pfUi5BUbtYZ6F4
 v7Oub+ZtasC9/9b+gHkNTb9dIEBN5wkGK0MUjMSuU5YGHSgiT2GxjVUbxRR6n11ixMZ3
 0wWrL9efvWi4GUwz+94a9Dyg8ZK5pgL86x4/k9yyndowFYnfoyJnAQsz/M0t3gpFKQoL
 d/YePhd+IzMlN8rFOu4aL6ZEOPbHdOkaTnW4jiF8AnBFFdTnpSoKMz35PopK2TCtaMtE
 uQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wivvx+3/XG+p73bEtEpeHu+OQ+gq6XSbaSSDs8K577c=;
 b=Ax6BWcQn3DE/MsTFloYxFVIDHxhm9yRILODasUky52nqU2Vikq1oiQ2Wtn1heNtqmn
 ShwQN2sVxe4O6KTHN5r+6oyxHCH0wWUeVJZseC6voq1LjXToZetLab3rp+3qa/l/mUJY
 nlyAhu9qz2oMkhAbzcReyfldOUjqS64Smysug+zSdMOMmXtiAhsK5JNbchH6vT+ygyn2
 U2QzNzIaf3IoQ+K6Nl+5SmdZuG56PmXCnfXxciDaDCvWwhHXLXA9tGR9g8RHDUgP9Fp/
 hgwEaBtEZwQCfhMqD96fdCUcLLLtfJedhMNgIghe6gQRJH6xKGytb2D1yjFJVWbR6zk4
 fdCQ==
X-Gm-Message-State: AOAM530FmVPICGAtKAW9+dmmvBAm/CxBr2BEthfTFAERcu8cmXIEYN5U
 hH268gUlfpKWru8kb5Jm+zLqhudLTjs=
X-Google-Smtp-Source: ABdhPJy28aLJJK1+rf7CHsrLHXj91yUUlfuVKX1nUTVE9ubK0h20u1PeCcEfaPpns1Usz1cdz7yMdQ==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr35346116wms.192.1636906309237; 
 Sun, 14 Nov 2021 08:11:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id f7sm19467827wmg.6.2021.11.14.08.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 08:11:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 17:09:35 +0100
Message-Id: <20211114160935.2429065-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/oracle-mysql: add mysql_config to
 ORACLE_MYSQL_CONFIG_SCRIPTS
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

Add mysql_config to ORACLE_MYSQL_CONFIG_SCRIPTS so the per-package fix
added by commit a18c828bed99d7e0db5128224ffcda4897cd8e80 will be applied
to this file which will avoid the following build failures with
libodb-mysql, open2300 or rsyslog:

configure:3286: /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/powerpc-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -rdynamic -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/mysql -lmysqlclient -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/oracle-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -lz -lnsl -lm >&5
/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/libc.so.1
/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /usr/lib/uclibc_nonshared.a
/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/ld-uClibc.so.1

Fixes:
 - http://autobuild.buildroot.org/results/9e3c09dd3d9bd55de14fc89a1d17ba9c008b195b
 - http://autobuild.buildroot.org/results/b42c8c86e9574ba9f2c04daa3476206270241a66
 - http://autobuild.buildroot.org/results/08156c934e9b4d946c354dbaf78ea5d9ae9a4701

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oracle-mysql/oracle-mysql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 6607486d4d..8a6bdc0097 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -15,6 +15,7 @@ ORACLE_MYSQL_LICENSE = GPL-2.0
 ORACLE_MYSQL_LICENSE_FILES = README COPYING
 ORACLE_MYSQL_SELINUX_MODULES = mysql
 ORACLE_MYSQL_PROVIDES = mysql
+ORACLE_MYSQL_CONFIG_SCRIPTS = mysql_config
 
 # Unix socket. This variable can also be consulted by other buildroot packages
 MYSQL_SOCKET = /run/mysql/mysql.sock
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
