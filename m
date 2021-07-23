Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7251C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:08:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7175860F25
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 20:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7175860F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C4D5405FD;
	Fri, 23 Jul 2021 20:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qG-0Nde2nmED; Fri, 23 Jul 2021 20:08:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89EEC405A5;
	Fri, 23 Jul 2021 20:08:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFE601BF3FF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F7F3606BF
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 20:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTMv4Ui7XEKs for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 20:08:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B852F605B1
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 20:08:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q3so3623897wrx.0
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e46hG1vhJ8AQToLh+7KaZOcsXbHbs8cBuPkNFXyrhaA=;
 b=s5O+PuZjauSATPnJ4QVyhyfbvxvl8i/3VCpAfZneJN9p6K/CPiRp4OMQQ/MS+zXrto
 p/bq0fRGQBIWNlpkJ+1gBJhS8rHZi5Fi0D2zSZcMS5opMewGSIw0ODHvQQFHu1w9OLjQ
 GnDtrLWUHfC9rragueUZriH9uXAQiAkGPUtst0u/lfBjp2AJeSdFLG2JiwgjzKaDomfe
 jkkWxX13kqdelHgwFyuadTTBN/9YSQA266Pq+bnzEwi+5mCpgP9nKRiWXvoUu3tp8BnX
 pjVDEQNOo5xqbtl+wvON/LqrLC3uTG7Ajjktl3/xayLCkLk2Qxfu0j7SKXZg7P2jWC6T
 VjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e46hG1vhJ8AQToLh+7KaZOcsXbHbs8cBuPkNFXyrhaA=;
 b=h/VFQppCxHWXnzyXAOW7pWNF/4mXWXBUvz6r+LusTaGYrbqWnRa3CmPkXDlJQ53Yu4
 6RVfiRqEwolzfYeuvN7g3hMvt+0Nx0yWmNy/90aSIT5/PHDW0dVDqq94A4+ClX42yD+n
 YsZJYYEnfGUkvAP2rsXpGB1IiZGdi59zjFevhEWqwuDY56mfV3bnOJOZW8McmdWt8rJu
 zBrtR4gQLKAn644U/U89HAe0e69/HIt4iZQAlQMroLl0kpIah729TOOkNv7z6dw2Yub6
 ty63mWT20P/wrS90zwI9W+y6CmRPiF9vKTNueaKht/RcS76CIbLmFPT9PGCjaj4UTA9r
 exZw==
X-Gm-Message-State: AOAM5315+oKcItcCQMrWjj1j/sQDRyBY9mvFNUlFYm2boQgjs6WtdAh8
 7g9jCar67f07IaJPVU6jiqYIp0qNch56kw==
X-Google-Smtp-Source: ABdhPJyLyyKeTrWGb44SozFhS0CvbqOAXa9swrRGpRj9IXWPThmM8b/ni4ulP016bcfBVLXppwz/cA==
X-Received: by 2002:adf:e0d1:: with SMTP id m17mr6850691wri.233.1627070887516; 
 Fri, 23 Jul 2021 13:08:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id o3sm33857230wrm.5.2021.07.23.13.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:08:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Jul 2021 22:07:58 +0200
Message-Id: <20210723200758.510124-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/bluez-alsa: needs gcc >= 4.9
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

bluez-alsa needs C11/stdatomic.h since bump to version 3.1.0 in commit
c4041c230c18d3a9d82bfc6a96b2ceaabddbc94b and
https://github.com/Arkq/bluez-alsa/commit/04d904326ae77e2919bcfa56245cb7adbc19278a

Fixes:
 - http://autobuild.buildroot.org/results/a8cd389796bbc8488e5b5aea995d1cef4c581e8d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bluez-alsa/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index 2f103f409c..a31d125d9d 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BLUEZ_ALSA
 	bool "bluez-alsa"
 	depends on !BR2_STATIC_LIBS # bluez5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5
@@ -33,8 +34,9 @@ config BR2_PACKAGE_BLUEZ_ALSA_RFCOMM
 
 endif
 
-comment "bluez-alsa needs a toolchain w/ wchar, NPTL, headers >= 3.4, dynamic library"
+comment "bluez-alsa needs a toolchain w/ wchar, NPTL, headers >= 3.4, dynamic library, gcc >= 4.9"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
