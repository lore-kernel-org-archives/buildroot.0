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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD1FC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:13:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A529610CF
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A529610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C7060699;
	Sun,  1 Aug 2021 12:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GftkWEWt-707; Sun,  1 Aug 2021 12:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FBE1606CC;
	Sun,  1 Aug 2021 12:13:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9921BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4204683CA3
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POQg_XlbpkbV for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:13:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DA7183C9E
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:13:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j2so17940658wrx.9
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 05:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lMmjv30vEMKgPZHNZqihOTY7oXR4gk487r5gTjPCcUk=;
 b=gjzTPbe+6gpR5ARb4xfObyzVJv/cd05jkWC3MIAkL+tptHB/egSjlppTNpLi29AH0S
 99y92JAlItUy8nV5X7x7Wq7ufzIa5YBgTqBjwyNKzJdDKHDsFmf7EbC1rTPSXsvdqIt4
 IIktJiFVetn8J/mdfxOjzlH74ur6g808uknvAz/g9+lzgnoiAqD3UjPumfaurM/uE/UC
 xNU8kDZxqBYaIGt661gr+6JRaBogKqfR7hC3V0EquPchfrFW9yitBXFJEs7DnUU4LdBA
 fKipQEbADYdCTYw4a0Dk8XUeCeBbpS8wg9JW37lDPJZBTjZnXwu5kGiX7kMy5tRXeIHd
 6YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lMmjv30vEMKgPZHNZqihOTY7oXR4gk487r5gTjPCcUk=;
 b=sDDLIsYN8ozNOhGM4rF31RSdaCUWtKvwyBkMqs6q8PIINyvtUpB7voQ7sqGbJgvEPO
 Zkw+qpEUqOFTdNbSSexWr1rf7FQb8uShpG6SfHOhRUnlt8MHhBTn4tmru8WdlxZnVyLL
 cWNhS3UlXaVW5EX6FiIMeg7wgG4dDgZq0jKWXZhdg123RRZgAp0t+dqyE/Ddn09PDoZa
 eL3YhraDJO7XFENZ87DFFkcYA+hyJhJZcYfwhweZJ0Js5ZcXZTFMdvxWHF4xybxtKSxM
 nFDgOt2sVqgxsO5vwXCseA8M7e7Atvxzy40nr7ld5GZghR2pCWA/fKfKQPAkqrkKMI69
 gzkg==
X-Gm-Message-State: AOAM530R4Bv7mWCH4S+iiVf8FO72Dzi2ZjeumUe0IhApE78OwuulaaGF
 EjKyMlmT5Lhes8Z8NxF24gtg0cQu32p6Ng==
X-Google-Smtp-Source: ABdhPJyj+va7oPZB1rkc3SXopaN4sKTkX2+1g7ALSdzg06B5ONU0Rbvi87jvpWilmMIl+2SmO1G3Pg==
X-Received: by 2002:adf:df12:: with SMTP id y18mr12737754wrl.189.1627820025217; 
 Sun, 01 Aug 2021 05:13:45 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id w18sm8176896wrg.68.2021.08.01.05.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 05:13:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 14:13:36 +0200
Message-Id: <20210801121336.3054884-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libloki: fix build with gcc 11
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
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from ../include/loki/SmartPtr.h:33,
                 from SmartPtr.cpp:20:
../include/loki/SmallObj.h: At global scope:
../include/loki/SmallObj.h:462:57: error: ISO C++17 does not allow dynamic exception specifications
  462 |         static void * operator new ( std::size_t size ) throw ( std::bad_alloc )
      |

Fixes:
 - http://autobuild.buildroot.org/results/768727160beaca5df3ef18be29cfbaa3ced67ad5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libloki/libloki.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libloki/libloki.mk b/package/libloki/libloki.mk
index 7564239f6a..07a9372df9 100644
--- a/package/libloki/libloki.mk
+++ b/package/libloki/libloki.mk
@@ -23,6 +23,7 @@ endif
 
 define LIBLOKI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
 		-C $(@D) $(LIBLOKI_BUILD_TARGETS)
 endef
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
