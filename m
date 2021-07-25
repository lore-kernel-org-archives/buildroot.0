Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6744AC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:45:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F139C60F43
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F139C60F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2BC060613;
	Sun, 25 Jul 2021 15:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eWN2MweJAdsq; Sun, 25 Jul 2021 15:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D821605C5;
	Sun, 25 Jul 2021 15:44:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88EC21BF41F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77BAA8284B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bzyZ-naJvddl for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 15:44:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 918B4827A5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 15:44:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so532213wmd.3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QMdoe4pMY0HGHrjI3XxdEOKVJkd/qBGHTA+GrY3si+I=;
 b=NpuEg0RHqmKUbWx7jInVutKShU9dQXrUTXUaF6XZG7E0zCPsjJlMWozyXniciTMQh3
 AFxZOGjhCPB1tIHntSJppdQAcA+85l0siMoqyGjp2hBNv1UiYIru/HN2yyTU8gE4AMlL
 jDLX1qNLdgWYR4y+XZhdXKmGMnoiuaxIz/xFXI5lU+mINEnV4v0Vtiks6sJbw+lrmzw4
 TnuMLo4pHlnWgynofV/arc1M8Tp4zaWchqTjXo0/m4UPuL7Tz8eLW4/FEIyLnAlY+B+V
 Ec6zP2ErCZpRtmj9AeEOYk5dnABNuVXUfwGikvTmBdJ4Ph2icZ9eYxylQxCIjHR7m7nY
 2xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QMdoe4pMY0HGHrjI3XxdEOKVJkd/qBGHTA+GrY3si+I=;
 b=GwLyvLepZX8I9NIXD9NEbvDOpLsFYa3lXuo+cF8F+1dDce+HkK2KN3ogEj5m0Mkci/
 YNgKIXJK2MDsPChML/xN1YKUNgGv2aj9K8oJb+3k2I1cyzE9zAtxMdAO/F4c2scnnPsl
 2TgyxtAOskZWJBZiS8qlrYCVN3GTxfeFGYh6O6U4MYCeQPYMf8WPVmajS3HKJHlK+7v4
 jb07VyCDc31e3uuBpsvhRzxHpjX9TqK0paNL08fqLCpev/Z06BNJQWyfbepjJnYYnqQd
 KEomKc3Oz2LceUDoUk/XS95kxMqj0FY5XvhtMUB4bcCeiB88GiyG1IwDhk9NLpYbcUMT
 PIug==
X-Gm-Message-State: AOAM530YBLgBl4pmS14IQ7N179hrIiJN7dASuBoCpAMGONcZla/D7yih
 wZGX1UMvCNoc6y8plcuz0POt+4dL6/VODw==
X-Google-Smtp-Source: ABdhPJz/zWC5NqV4kjrjTpwe21JtSFUvkPpFhtykqeDtmLXEnQxBGdTnjHlIz225DfETTQ86/BVOLA==
X-Received: by 2002:a05:600c:1c08:: with SMTP id
 j8mr13347954wms.50.1627227895315; 
 Sun, 25 Jul 2021 08:44:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id 140sm33917776wmb.43.2021.07.25.08.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 08:44:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 17:44:46 +0200
Message-Id: <20210725154446.902201-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/snort: add SELinux module
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for snort is added by the services/snort module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snort/snort.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 3df2941179..e073a59a70 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -9,6 +9,7 @@ SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
 SNORT_CPE_ID_VENDOR = snort
+SNORT_SELINUX_MODULES = snort
 
 SNORT_DEPENDENCIES = libpcap libdnet daq pcre zlib host-pkgconf
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
