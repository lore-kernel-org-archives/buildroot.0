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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75464C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:06:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3542961059
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 08:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3542961059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E10E83CA7;
	Sun,  1 Aug 2021 08:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJHFncsOot0x; Sun,  1 Aug 2021 08:06:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BBFA83C9E;
	Sun,  1 Aug 2021 08:06:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0761A1BF42D
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB29F605D9
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 08:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHQUAXkhly7Q for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 08:06:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B13D4605C5
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:06:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso9114286wmp.1
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aQ5NRdSn5BED2GEu3HW0PAXlKefmUEiWqPBUppRi2kU=;
 b=Rmi7ptX2dAmyqq9s/SrDyoo8XDvcrY85sPAq+7zerv90qsCi/5fgoT8mfs8zSPXYaK
 330MpGCyltv8x4Vve9JQC/8NjqN2QPd0tLfbExEKtPh/lxTR3ZbE3+MIS3nHBppGLCtN
 JJd92kW90u5j8OuYIEJ3tTidI5FYwkDQjw010QPwm5dS4il4MTSrjEYdSjV4A4UbtMAr
 EGQOy9TxcDHza+RxiMpDnaShZIiPEs1vO8OTlj9rf8uBMvdazOvoJtxbNx9kcp1amkHK
 LKvI6OdLyvwoL4ARZsZ0YuRG2DmB6hky9XxEZuh/LKO6m7vVWYKrI8MLxUuCQzf6A/gl
 FT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aQ5NRdSn5BED2GEu3HW0PAXlKefmUEiWqPBUppRi2kU=;
 b=G1Rby2/nBn6qo2vOyQiFQakY5ftuuTk0+WIUVMiF7ryHM3D5ntnG6IRPoYC/qXDTnw
 Jd4yAIhEf/hilTTvxL+4QAa21DUyOTJMAFqC5Itlpv/NzPoTtulEL+OLkLRQPHIq+Wkm
 N02UK8jAypwAwBuvtJP74NW3WKYfRx1eL1gIp3Nvw2MLEbgRkHTL7aeZhKAbrsdyWtDz
 V+QZOHX/rXmsXUvs9d/qxPwHfJHEM6eW0dOBS1zNEHpOaWhi+3exeR3SEWq1ay7Z10z0
 B8Qv5Z23WfSauGmPj6byOq+PcotfpMWo9w8ymK4YVZtMstjVgZVGjZR+dAfvs8tZvwZG
 +mdQ==
X-Gm-Message-State: AOAM530WHWJrkkAgo8+M7mAjzvIVXWRsy9awWnnIWeCqxjcgcWKEqEED
 gSYx79p64coPk+d+xt3BVueajODiOByBqQ==
X-Google-Smtp-Source: ABdhPJyiAkGhGSPCTKf0tClBUPriLN5OCtEwK6hqqamC9S9Gpfy92/W+ih8LyQt2NiVoOrkFrYL8Og==
X-Received: by 2002:a1c:2282:: with SMTP id
 i124mr11302679wmi.166.1627805192508; 
 Sun, 01 Aug 2021 01:06:32 -0700 (PDT)
Received: from kali.home (pop.92-184-116-243.mobile.abo.orange.fr.
 [92.184.116.243])
 by smtp.gmail.com with ESMTPSA id b15sm7458847wrx.73.2021.08.01.01.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 01:06:32 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 10:06:20 +0200
Message-Id: <20210801080620.2619988-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rabbitmq-server: add SELinux module
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

Support for rabbitmq-server is added by the services/rabbitmq module in
the SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rabbitmq-server/rabbitmq-server.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index dcdf5c0269..ca769e13cc 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -33,6 +33,7 @@ RABBITMQ_SERVER_LICENSE_FILES = \
 	LICENSE-rabbitmq_aws
 RABBITMQ_SERVER_CPE_ID_VENDOR = pivotal_software
 RABBITMQ_SERVER_CPE_ID_PRODUCT = rabbitmq
+RABBITMQ_SERVER_SELINUX_MODULES = rabbitmq
 
 RABBITMQ_SERVER_DEPENDENCIES = host-elixir host-libxslt host-zip erlang libxslt
 RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
