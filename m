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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23622C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:08:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D13AE60249
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 09:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D13AE60249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AD47832BF;
	Mon, 26 Jul 2021 09:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKTgXLuLmEuJ; Mon, 26 Jul 2021 09:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E3C82F11;
	Mon, 26 Jul 2021 09:08:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77F1D1BF23F
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66FB8403E0
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 09:08:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHMJxHUY6Pn1 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 09:08:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4D394039A
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 09:08:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b7so10163027wri.8
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OA+s1me2SOBQSK6S62YvnqjtzP9zZ/qPxUFc8abi1EA=;
 b=i+nuxcqVcz1PtHq9FvPuhdZBS4wHrjcggVKXUUEeLltWMgZ6AMQgXwUsL9OsHpwfk5
 k1LDq5yLQTYasOjkG640/7ygktkImBWxvzDTNa7NN3YmGSc+WzLBf9tqoQLt2zmtM1fm
 DfEwyTnAj8olvpFCxjfz9L0kO/OtcjT66ffa95RDxjRJ6nwKRKHFv417H/d2rDqvHrR1
 zJlPn2jnIC6DFKwC5v1YAfCHNRlSla3GG3KdurXJQCecpdXOD50mfiOjhDXTKzLRsPz9
 50migBs7876ZDc8Q3PzaUi0Av7Qy/GrnxDX7xylHczT9DBNl+pSPMfRmg2LnotaCCmJZ
 8S0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OA+s1me2SOBQSK6S62YvnqjtzP9zZ/qPxUFc8abi1EA=;
 b=ZHK89ODxOf6sPKCx30qoPoD1oss86p0uhvG8SDGdOZMJViGaZdBXj1tb75iQ8nBTZ6
 kyfifR9IU5QUZ9jCx16JUfhUxf9ThnGYjNNL7v92UD5g9jMi0Jz548KL4E4idrwO5slc
 b+bt7wBAiQ/aD6k6DIpkS8drIpZGXot9u/oAcN8HfB9JLQX4xWjYepK8Ic5kuhb0LWQj
 zszOYafqxOfCv/Qb+cpNPvYgzXp1ZXMrGWekuqXJ8f1ecGC2SOmJIlo9WeleVJGWoVrC
 SEq9C3Byk6zijDxEEvKon6vNW5UUPLWe4w4A0Px9WfxDUbQyEWg5TBQ14HaGMJ1hMgxW
 DpIw==
X-Gm-Message-State: AOAM530k1BQTcM2owLNVGjuC+NsWMJ0k2yVHM+lLu4nSceOezhT4YC8Y
 SZwexA6NSRL8/DQZLOlRNr5RUVaRW/cZyQ==
X-Google-Smtp-Source: ABdhPJx3OdfQmUxywfEfSbAYLQvClbfuTLpKMKfBxSE/Uk4ta4q2KEdo2LnayIGMdfdIyD/arTb/TA==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr9257625wrp.144.1627290532679; 
 Mon, 26 Jul 2021 02:08:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id r4sm42410257wre.84.2021.07.26.02.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 02:08:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 11:08:40 +0200
Message-Id: <20210726090840.1712057-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mongodb: add SELinux module
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

Support for mongodb is added by the services/mongodb module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/mongodb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 377484a00b..6a22acd12a 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -12,6 +12,7 @@ MONGODB_LICENSE = Apache-2.0 (drivers), SSPL (database)
 MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
 
 MONGODB_CPE_ID_VENDOR = mongodb
+MONGODB_SELINUX_MODULES = mongodb
 
 MONGODB_DEPENDENCIES = \
 	boost \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
