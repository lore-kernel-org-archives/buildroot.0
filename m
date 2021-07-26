Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EFBC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4816460C51
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4816460C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B43E6085F;
	Mon, 26 Jul 2021 09:19:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5snYuFvRVID5; Mon, 26 Jul 2021 09:19:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C0B76062E;
	Mon, 26 Jul 2021 09:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B1FD1BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A865402A0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joBZtkhy0fjv for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:19:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A82F8400D7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:19:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m38-20020a05600c3b26b02902161fccabf1so7695704wms.2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DE/49/XJWoIPreyTCbLEbCu3wrnXgooxGBHqmsFJwO8=;
 b=Zxyv95g2YkaIlRb1E7Qz9zDpAqD9gwhOGjYm4WL3oHhNlVS9py8eZZ37/NeGzSC7R2
 PNnRrUWvRY+L+jKxK2pe1Y1IlPM/AeA0wZd19Jabb40plQ16Dkx1UAOEXTYSAp5QXRoF
 kZXcFoAs7IewURj+eLQ+D4s0oYYBt+jqbaNhtwggdH43Jgw8mFi5mXceCAj1YIxdZrR/
 fKJpEiv76KOqbFSO7fW8R45Ou0iYPdShdsZGndE/n8WbeBdyGmCan0E+yyQy9bpy+y+z
 GG4E25M5f4EZLjn35D73QTd6NtOpERwijdyyCw2ZC0yBEgxP/rXE2TJrlaY1v8GUlMGC
 a3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DE/49/XJWoIPreyTCbLEbCu3wrnXgooxGBHqmsFJwO8=;
 b=PPiKMtlxJLH6MBn9Xli37ypX7doD9RM4f3S4aZgVQPkTX9jeFDURZW4z2M5JavRfC+
 jUjFXUKFZk9jH48eYPkfllR7m6CPkBSZoFLZEFg/OpphzgfkfKRnTdzSPF3TgjRe+L+p
 7tZ2XYO2GmnItMK6O1WuvaX72VyN1O2ynYYcEzq9PPW4cUmxf66FuGMfLyb+5hPFOrfg
 Jz0czLq4VdNA8cQwXKtol0TPruqNs0nJTa2+e8ymnFf6mYNgpMIBzOHVm8JdzObsA/Hr
 7UMtb0AotNntn7G7GvTNSZQt7thST5qvnwseglJAEjbX/nlVl/NVuhb4SOg7LXM2qZec
 r+0g==
X-Gm-Message-State: AOAM533YFopEu02GDMzg5M2EC58yk9hlPTV/pbhOy2VzVpTCcNMfRssX
 cLzIu1MqkjNfWWWHeFevRvCY3D4LaafYFA==
X-Google-Smtp-Source: ABdhPJxVSFpECopefPRZkMDcl+fLMoMoLTx9dxF1ycvlXLq54Z5lT9z9wYpqdWCDzvXgYUzLhCw+VQ==
X-Received: by 2002:a05:600c:3593:: with SMTP id
 p19mr15792932wmq.33.1627291144759; 
 Mon, 26 Jul 2021 02:19:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d203sm8227397wmd.38.2021.07.26.02.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:19:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:18:59 +0200
Message-Id: <20210726091859.1713102-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mariadb: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for mariadb is added by the services/mysql module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mariadb/mariadb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 374b3dc352..d08b768a2e 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -11,6 +11,7 @@ MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client lib
 # https://jira.mariadb.org/browse/MDEV-12297
 MARIADB_LICENSE_FILES = README.md COPYING
 MARIADB_CPE_ID_VENDOR = mariadb
+MARIADB_SELINUX_MODULES = mysql
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
