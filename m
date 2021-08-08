Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BC4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 08:40:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1F460EE7
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 08:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE1F460EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ED3B60745;
	Sun,  8 Aug 2021 08:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwmVBRknj1D6; Sun,  8 Aug 2021 08:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B14716060B;
	Sun,  8 Aug 2021 08:39:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7841BF580
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 08:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 278AB401CB
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 08:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaAa0Mjfn8Bd for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 08:39:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E02224016F
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 08:39:55 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b13so17118336wrs.3
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kj3Fpz6Dh3bZqAIOie+9Q+DDFdSjeuFGqJACjG/w0Fw=;
 b=CcyZgwJjR73d6z1zlS08Bx15bkuURDf3+l/Y4+lSqkYly+xRFU/JV2YCNKQyXi3r64
 foxEMlNuPDg1ft5sr6a2NENLkkLQIzMCQqgzJK60JJ+2QT9YYYIpL9BIw4PysszMfRBH
 30jLTyJNzLzXU9iMMwP3JXnB+2Jbqr5FS9R21FAJaPHuDz0bzccybKrppNMQo4TXzmaP
 uUIIeQzBU5hn4PnHVRTYobl8n5zoDujIRdmOcV/Ni1jJjAY69wkV5JLiE4WKUVNq7avr
 LNLVZ168EQo6WxVVOa09MNUsV+K/4kRuyBw23PCT3ODKAwzxXnVbdEGekn7aafsdGz/C
 WDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kj3Fpz6Dh3bZqAIOie+9Q+DDFdSjeuFGqJACjG/w0Fw=;
 b=CTai7iKWk3VNWlDWfHhoDCyC5sjViu0WX7DB2QLfZ/S2+4Epv7FTjZe6QVrWrdfS98
 ckAAvLs5lV/4CwVpl/SgYAA32QxyIn+rqDhc6/C+3W0f17ji1DMtwoASj75RqE3q4Z4A
 bZbeIVu+EM5ytPN7d2umE7SytlSTpj/PY181VPxJ5cpXosZELJR62f3YWCEKiyCqf4Ss
 4USMjPWAdyTLAKZFV0ug3cFlvWeXqU2pbcO63oMOFU0AV3MJg8QTMAkZaa2UzovVsX6U
 PGC7SXnIToNq43Cs/BmflkH6SBNXYW3x/DjR15aJwWkGWy627+z/N1OSpk0h5DNMk0AF
 EOMw==
X-Gm-Message-State: AOAM5323D1+Wo4aSZxOm4j9ZDDfFvDuNIQIxgUGb63KZACfV9yBVYn72
 phffeGNZuAQAHxUJiejZmnAVfNCeNTMuAA==
X-Google-Smtp-Source: ABdhPJyoQg09n4Oh25DiZ4J/N2onvLt4IWPXH8xux9QEqsWoWvjH2E9Q35jxQlNjsVi8U2v8ciGu0g==
X-Received: by 2002:adf:ef85:: with SMTP id d5mr18861344wro.372.1628411993988; 
 Sun, 08 Aug 2021 01:39:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id g6sm3918885wmq.42.2021.08.08.01.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 01:39:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 10:39:42 +0200
Message-Id: <20210808083942.3113801-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/network-manager: needs headers >=
 4.6
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

network-manager uncondtionally uses ETHTOOL_GLINKSETTINGS since version
1.31.3 and
https://github.com/NetworkManager/NetworkManager/commit/4a81fe13ae18cb6d157d7cb3eec300f3061263fe
which is only available since kernel 4.6 and
https://github.com/torvalds/linux/commit/3f1ac7a700d039c61d8d8b99f28d605d489a60cf
resulting in the following build failure since commit
360d1aad84449c6a1993d8c7e469dc0cd35339a2:

In file included from ./src/libnm-glib-aux/nm-default-glib.h:69:0,
                 from ./src/libnm-glib-aux/nm-default-glib-i18n-lib.h:13,
                 from src/libnm-platform/nm-platform-utils.c:6:
src/libnm-platform/nm-platform-utils.c: In function '_ethtool_cmd_to_string':
src/libnm-platform/nm-platform-utils.c:280:51: error: 'ETHTOOL_GLINKSETTINGS' undeclared (first use in this function)
                                 NM_UTILS_ENUM2STR(ETHTOOL_GLINKSETTINGS, "ETHTOOL_GLINKSETTINGS"),
                                                   ^

Fixes:
 - http://autobuild.buildroot.org/results/10b9b68ab6987b99b3e8dfb2d651808008ad0bb7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/network-manager/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 38ab43740f..43987451b6 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	# Tested with 3.2, but may even work with earlier versions
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6
 	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
@@ -62,10 +62,10 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads, gcc >= 4.9"
+comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 4.6, dynamic library, wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_6 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
