Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB86C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 17:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00E9983E47;
	Wed,  8 Dec 2021 17:31:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGd6MXl7vEDf; Wed,  8 Dec 2021 17:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6410783E32;
	Wed,  8 Dec 2021 17:31:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 605F21BF2C5
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 17:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 512DE409AD
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 17:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKaLSYNioq7x for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 17:31:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F003E409A6
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 17:31:01 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id y196so2319862wmc.3
 for <buildroot@buildroot.org>; Wed, 08 Dec 2021 09:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fY5TAu8mRZ0Eqwmb/NGWEcglIvtxz03Fb7Jf9+9+GrQ=;
 b=U4VYg6eag0Ojrw7ocKs/GZudvwxPe7grg67/O0JL5IJMqNtCCwmR+VtDEEa9e8yM2Q
 uoL1Ua8mjMM8b1DCz8/bYfVSMnYQ6Z3PwI025D1KvkkdsSQEaZGr5f677ZfLeOeXILrr
 UP+AI6GwZiiYPC7IpV0PebYwklNxMrMuVhLxTPOcm9Z9atSspX0/HgDR4vu2yPZVqEyM
 L1+r2FbDC2ZP/wQ7wYaYNTzMDJ5ZS7T5zB+jigyWU566Xaaf8TBoEeWeS78d8hUpMJjx
 fYiRPDNPF1NND9+qeO+QmGzUz8Ve+I/H8IYAZun/TUgNzInJVXMpA1JxFYdlHLg1chbj
 NJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fY5TAu8mRZ0Eqwmb/NGWEcglIvtxz03Fb7Jf9+9+GrQ=;
 b=kSJszBCe6tjRlPGstwyUNvcZFcv2kJntX6ptHdJc14JTm8pdtDBk+fNWYyRCH2Ea8l
 +piT5soDlQcwdCFdQZdpRcXpBZijFk5DvIhwHUTXRGCOJVQ9oGbk/0Bad+n8SH2qKVDT
 E6tG4iJi04HfplbPPsjFiA4rgZcWW19oWGDa5SqhzKk8t0CF58CMHDDRPnZE9Pg/rT4D
 YQdtQvAcQLHeCuReVJ+eEH4Mql8n9tO7HT8GjosOJ04tZFfmayZ1ffdDD2DorolBodCf
 25oIdrY4EfjlT519my9J/sBC0kSL5K8zAYMOn+50t17PpXD0E1sevAmbDMQ6Lm7NDuOc
 LHNw==
X-Gm-Message-State: AOAM531DYQT5ILWrpF0jCM9jJXHmaURDVxEU8hYlLGpXOakencGklZwD
 fC02A/RaI0nXRTqt6XVgwTvR3C3DT2IB4A==
X-Google-Smtp-Source: ABdhPJwtZPL+g7at4CRYhNRRv/FJYJOX/w91lkA2qPbjS0JNe6tk7Jq+xkGgVpAV/Mi8GEWk+AEA3Q==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr88129wmj.166.1638984659909;
 Wed, 08 Dec 2021 09:30:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id y15sm4500241wry.72.2021.12.08.09.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 09:30:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Dec 2021 18:30:51 +0100
Message-Id: <20211208173051.3816198-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dmalloc: fix strdup detection
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 5.6.5 in
commit 736932c71552adc4dfa95c5236d1064860900e8a:

In file included from /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/string.h:631:0,
                 from arg_check.c:31:
dmalloc.h:377:7: error: expected identifier or '(' before '__extension__'
 char *strdup(const char *string);
       ^

This build failure is raised because 0004-fix-strdup.patch was wrongly
removed and because configure.ac wrongly assumes that strdup macro is
not available when cross-compiling

As configure.ac can't be patched because autoreconf is not working,
patch configure as already done in DMALLOC_POST_PATCH. An upstream patch
on configure.ac will be sent as soon as upstream merges this old PR:
https://github.com/j256/dmalloc/pull/44

Fixes:
 - http://autobuild.buildroot.org/results/00565c4b0618ea5f553d8c22284637b6574e4a93

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dmalloc/dmalloc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 05943943d6..93dc45c15d 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -48,6 +48,7 @@ DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
 
 define DMALLOC_POST_PATCH
 	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(@D)/configure
+	$(SED) 's/ac_cv_strdup_macro=no$$/ac_cv_strdup_macro=yes/' $(@D)/configure
 	$(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
 	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure
 	$(SED) 's/ar cr/$$(AR) cr/' $(@D)/Makefile.in
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
