Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9C0ECDFA1
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 15:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49197402B1;
	Tue, 25 Oct 2022 15:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49197402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PtqqS-PZP_w3; Tue, 25 Oct 2022 15:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20AB5402BD;
	Tue, 25 Oct 2022 15:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20AB5402BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7951BF976
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 15:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA6FD81253
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 15:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA6FD81253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGdqQMKJoKlc for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 15:00:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0E9E8124F
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0E9E8124F
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 15:00:52 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id s27so1001429ioa.10
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 08:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=60NJYdQo0yHpZSG2OmYb2+Z49H/mjOYQ1tVJCmzydvk=;
 b=SzM3iOTiMJf2LOnKPR2GZMPRHFb59iard+tytHnllReabKnWnh/I5ulHCq7aFGW9iZ
 qEjz07vcw28vUaQekvraqWCfChDLjZmY6pmZcV1PlSjL8fMvsR7YI8cDY8YVyjivtMH5
 E7bX4ryFST1MuDpOdWkTgf9uJ6MPbwOTDYCxqNCsStDZlsxYK5rYX69s2Rra75knc6Jg
 9K8475Mx6MktuzNAe8YfZDLhX9+u5pGvfZ/+Z2IjQgnPUphePZEUNl1Uqz+9g8XHqu+I
 ivcvQz/vKnKPekHph5ya/+qGUXFaj3kEXFH0RocIXlBBXjf3ILR0ElwebttOqcnbzbKp
 23Fg==
X-Gm-Message-State: ACrzQf26TgLUgSas0RovcMn1NpiZ6hEwTNHtf+pP/99RNZPrvd/752Yo
 Mgsk/0EcF3zaWokLKJQQRDQe/GV68SbwvA==
X-Google-Smtp-Source: AMsMyM7G0dgVYugkd3l3mEYn6aKHWdF6Usgm5iyGU558M0FF9uRasgLKEINHGQAvaq94ecVUgHLu5w==
X-Received: by 2002:a5d:8913:0:b0:6a4:71b5:8036 with SMTP id
 b19-20020a5d8913000000b006a471b58036mr21753246ion.171.1666710051702; 
 Tue, 25 Oct 2022 08:00:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 e90-20020a028663000000b00363fe31cf55sm1001038jai.40.2022.10.25.08.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 08:00:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 09:00:48 -0600
Message-Id: <20221025150048.3640674-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=60NJYdQo0yHpZSG2OmYb2+Z49H/mjOYQ1tVJCmzydvk=;
 b=pNQ+pmh9sUbXt8K6MrhTCkjNJi9P34KF1bt/UyLsXsI7x4sVxPiTXdX4Gx9Eldke4/
 u+7wMS0/TJw/AUnPRVUVhtbtaFCnW8Z8cluhCDxWQ9UZCrtIkxgOCV2Ny4ZnQ2einuTG
 1hXsGeM1KaPawn3erpntQjiOvqpOEsIptN+tI6fKVfB5ta8shmfNQV4NYh6dPJKeCXj2
 GDr699kx64WcSSvJPyvGiKLte8mMr+3QOGL8LdeezF+P+K6Ag+cvYFqoN1JWK6d5WNBQ
 3jpLLM+sWoz+r1hAE+vM/BWI4fvV9MXVmm10Vr8AlZQxA0BmUOS/vsD1v1Zr/QZooGjE
 CXCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pNQ+pmh9
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: add new host-pkgconf
 dependency
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

After updating to version 0.17 we need host-pkgconf.

Fixes:
 - http://autobuild.buildroot.net/results/d41/d41509feaa889979668fa5105ca1defca71567a6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libpciaccess/libpciaccess.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
index 68d46b7f50..525a3bcd02 100644
--- a/package/libpciaccess/libpciaccess.mk
+++ b/package/libpciaccess/libpciaccess.mk
@@ -10,6 +10,7 @@ LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 LIBPCIACCESS_LICENSE = MIT
 LIBPCIACCESS_LICENSE_FILES = COPYING
 LIBPCIACCESS_INSTALL_STAGING = YES
+LIBPCIACCESS_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBPCIACCESS_CONF_OPTS += --with-zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
