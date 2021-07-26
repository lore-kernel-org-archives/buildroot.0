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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFCDC432BE
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:52:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2F2F604D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2F2F604D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A91094044A;
	Mon, 26 Jul 2021 08:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O90NYpAg2QhK; Mon, 26 Jul 2021 08:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD25240415;
	Mon, 26 Jul 2021 08:52:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1FAF1BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E14CE83112
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lcERGgrxXPmg for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:52:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E99AB830E2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:52:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id n11so4818909wmd.2
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7cmFKLuFPTL19620AYKUK1WgTJZATVuk/atRkZGqPBY=;
 b=at/n6zVeZaPwFvwAPDchsU/Yy7OmGkQqoYezzbOBkYWEgQTt1BoLjrHY5J25nc3upi
 ydnVQo8PSODWl+R0OqziZSSmZe/neuwDbRJJbR4EgnrcXhxzpnoPyAa0O+wjK+6WeQlI
 RDhoQOZN7TkGgtc5dlLD4VY8jdp0ciEhi8FaV6ovAeEPEabj5HmXJpN4/4RtasR2vMk1
 ye3JEW55BTh99rhct/x9U527IehTB9Ev8GTwBf0C+QaAMqnfu+3KBzM7sOfTfPPg+lAX
 qU2WAUEr+PQsmLcySRkApv+OovYufaiX/UGoHBaFaMuGHd0IvSrV1xe8FUfu7mkzgWFE
 SJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7cmFKLuFPTL19620AYKUK1WgTJZATVuk/atRkZGqPBY=;
 b=D0cDm8Vn8Vqsv8AnKk7CPdCT+MbIHygpmgBG227fUZy/91dga/zMgUrEAfimWtTMfP
 8JSYY8ISh6nzUUDZ8THMf1orJuHZGq76rhhScimIhozmVw3SSohU32s9z6o27z5SqAu6
 GZMBVkqwIBANRMlcqUOFwe9Hitu0fqphYLkiN9jbqFbEBNWHdQWHos/+0kZnGkwToouK
 hhlA5oCdyhwXUjoyGNDxe/v/nk7Stb8AJlS+02ZNnB/0VT/Jf4+HkbCHJ0+ddkG+HTLB
 lMs9HBj0/tEGKXro9ODEyUq1CpA4XQ/jqz9JKZGnMoho3vF1Ioa2WJYxQpG1WmbPp8ew
 yYRw==
X-Gm-Message-State: AOAM530/6oHnTFINNRFI4x3J/e7frpDVL0G+qAvqznWxrw8rubsfg7oJ
 t+PxOSe8tl6Qw3tw9wVoD7zRl4TabUwbdw==
X-Google-Smtp-Source: ABdhPJxbMmtUEsuuaGmgfEMmBUG4KOaQXx1032wbag45V5XXOWBiRbPNzqii4yl9lONgM/QlrRjNvA==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr25422010wml.140.1627289524977; 
 Mon, 26 Jul 2021 01:52:04 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d10sm41385750wro.43.2021.07.26.01.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:52:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:51:58 +0200
Message-Id: <20210726085158.1709907-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xl2tp: add SELinux module
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

Support for xl2tp is added by the services/l2tp module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xl2tp/xl2tp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 89ca65a7e4..ca404060a2 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -9,6 +9,7 @@ XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
 XL2TP_LICENSE_FILES = LICENSE
+XL2TP_SELINUX_MODULES = l2tp
 
 ifeq ($(BR2_STATIC_LIBS),y)
 XL2TP_LDLIBS = LDLIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
