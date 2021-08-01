Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFC9C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:44:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713C26108D
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 713C26108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F7E4607D4;
	Sun,  1 Aug 2021 08:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1pcUNmDADA5; Sun,  1 Aug 2021 08:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99CE3607A3;
	Sun,  1 Aug 2021 08:44:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FAF11BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ECCC6079E
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AziIAnT1J86c for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:44:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 703D0607A3
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:44:03 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m12so12825973wru.12
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOeOPQUSfdXGKVe8Gn63eeDSd+1SuuLLS4yu2ZGjEiM=;
 b=LwK3PegC6COh6IZMbBvs6nwQMgfaC2JiVVaouqOxA9iZniuJwECja4BM5T2h4PCDAN
 YTU+PbLQBdg40MGtInt2aZG9FM51EN2zJYx951xPEYpGdEiId1YiNeZ9UvshedJuuPZ+
 RBYQQLRpG8i0trBzdFuGh3hrPg8kG/hys1D8LqJFdUtkKiIcPPu6G31eYCb2vBUdjnHm
 rsT4KV0qVQXsn23k3CCj5GRNeKtXWj+O4jTUM+E4ibHygno25rHKBkYwwlSfyTot1CVa
 vDSIGIj7W7fq0MHw/eOTC86mN9jhQOgjskbHJILLXl3WhczDJB0VfzMyCi9HnxIAqM9p
 M3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOeOPQUSfdXGKVe8Gn63eeDSd+1SuuLLS4yu2ZGjEiM=;
 b=WKjMKz78rYrr76JfPQC7NcOT6p3yYPf0sLrvXiu035ZidyttxCNo0UPyg6Uo/j9pRh
 owsPhY/0TqdGE5zCes5+nyQIECBs/B4bMb64dhMnby6QxlqPgidgkxqeqWAhRB8gr7pO
 7jkLfCOds5ocwUcJTgO2M9zdgDQq7w7qy5O6i/zESyiF0zf5yML2cyGkw/WeuQ5UQSHb
 8HRM722hSi7Z/ZUoYO01VvYcmXaZtZYgtc9f+ZspktQXO9eTi6crVkHICMZXfI9fQ4iI
 1NZRmPqCftCsT4GXFLo4R+D0WgUJcxuhJQrFwj3UrZw87uhgqz+SBhWPy+oGLTIG3zJN
 oCfw==
X-Gm-Message-State: AOAM530kmsBuTMjJXvJBDctYSwOOrqDNK4DlyNv+EjgF4QwOdf3oc/Zh
 kiGsqOLf5VlZHczy6CaSa2R86KKEnybqcQ==
X-Google-Smtp-Source: ABdhPJyJ1wedVFHn/tCxTf+NCcLKd7KGFvpMlRml+xa4HRJrM5AtxJxKDQQ90grGdkT0mF9hwdQncQ==
X-Received: by 2002:a5d:490b:: with SMTP id x11mr11682668wrq.322.1627807441415; 
 Sun, 01 Aug 2021 01:44:01 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id v15sm7335187wmj.39.2021.08.01.01.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:44:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:43:53 +0200
Message-Id: <20210801084353.2762292-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/radvd: add SELinux module
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

Support for radvd is added by the services/radvd module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/radvd/radvd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index bed6367841..7a3b0a36ac 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -14,6 +14,7 @@ RADVD_CONF_ENV = \
 	ac_cv_header_linux_if_arp_h=no
 RADVD_LICENSE = BSD-4-Clause-like
 RADVD_LICENSE_FILES = COPYRIGHT
+RADVD_SELINUX_MODULES = radvd
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
 RADVD_CONF_OPTS += --with-stack-protector
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
