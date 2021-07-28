Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74DCC4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 06:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F0360F37
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 06:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92F0360F37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B13383868;
	Wed, 28 Jul 2021 06:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0KIG9TPD7pkv; Wed, 28 Jul 2021 06:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C16218367C;
	Wed, 28 Jul 2021 06:06:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2655F1C113E
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 06:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15A6F4035C
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 06:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JljpPwa9-zMs for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 06:06:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38E3540337
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 06:06:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id e2so1046078wrq.6
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 23:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h21y+jq3dXx6GAsaPntHvw6NN8KmHk2Al8yWZefxk3M=;
 b=P7rFuC0nyUwpiBi8hZaUSsa0oLVl8h/fa/8baYsKR6mlHf88YQdVJM8dwVenN1R8f+
 grV73gtHMAw9+HyMrck5HDe2WgafENJyGE49cazTG054zEipzVTJq91il1Ris70pd1lv
 DMFkyt9kyaqoarnCSIW39liBl/FY4UcSwNKjTogJlTxtZy0Vab9JMK1xpU03zDramFs8
 5KgIsMa+0PWPU0ip4WKsFL98/i675fi5dtAdT6HCXbYYPbl2xzg+kmklql9HJeO+acss
 8wjMP0kJrPZ6ClcyyR5MEl49sgZTpL2cOgEekw6Per7Buijfo5D4g7jSAgGa5k9v7fuR
 2nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h21y+jq3dXx6GAsaPntHvw6NN8KmHk2Al8yWZefxk3M=;
 b=TWrGnqXV4O0cffbHq7N0Z7KTQ9H8+f/H04dI5voD+O7zKUlVEhPwoz0Ir27eODy3kz
 d/SDUCxVpDKPrXXac+5akDsRCZ4kj75j2na2jj4KX8ZK0Udy0btnKBnsYWjPWwF4JH0g
 pk5Q2M7+3LHay2UaBOD7HXD0MEQrPaub+ASpo2i2O8Xv+k+LdZgcYvwoAkReGK1vRhXZ
 QQGsiP/byjciXODcLR95JrufrRjoAgM/vEpGS1WuPdOEHLGJbZvKN9+LIpwUpplh1LJq
 IttAv8cIj54zWpDUgYghT1kTSkdUiRBVgaDdlBG4z/MdstY5vcTlHrV8ZVCnoefyxq84
 OE9A==
X-Gm-Message-State: AOAM532m5+Q0zWdyiaber3MJgOeX1GsDK2c6maD2fDwfqQWIIAhfPlIp
 irx3Y0Mq9lkPuX31lSHupr9pET6hj/yWMg==
X-Google-Smtp-Source: ABdhPJw10KaciQIp1274hf4kgUqbDLzIIAYl9DKrX49sfQTKMcIl46WoxZE0UlkULAg+UnrEtCiorA==
X-Received: by 2002:a5d:6daf:: with SMTP id u15mr29041952wrs.41.1627452413939; 
 Tue, 27 Jul 2021 23:06:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id t17sm2234585wru.94.2021.07.27.23.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 23:06:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 08:06:36 +0200
Message-Id: <20210728060636.3482091-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libogg: switch back to http
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

LIBOGG_SITE has been switched to https since commit
c8dd578b135041eed639c06810e67b8b018402d4 resulting in the following
download failure:

Connecting to downloads.xiph.org (downloads.xiph.org)|2001:470:eb26:42::1|:443... connected.
OpenSSL: error:1407742E:SSL routines:SSL23_GET_SERVER_HELLO:tlsv1 alert protocol version

So switch back to http

Fixes:
 - http://autobuild.buildroot.org/results/56225b5daa471668d25cbe3b794e83c75c6724f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libogg/libogg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 3faf1b7357..49f9c7b6ac 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -6,7 +6,7 @@
 
 LIBOGG_VERSION = 1.3.5
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
-LIBOGG_SITE = https://downloads.xiph.org/releases/ogg
+LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3-Clause
 LIBOGG_LICENSE_FILES = COPYING
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
