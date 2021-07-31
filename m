Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DF7C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:33:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA9560F39
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 21:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDA9560F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78E5E83640;
	Sat, 31 Jul 2021 21:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4b1Yw4jXFWdG; Sat, 31 Jul 2021 21:33:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5254835DF;
	Sat, 31 Jul 2021 21:33:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 894081BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76EC240136
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 21:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cth2OvUo3TgE for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 21:32:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90EEA400C3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 21:32:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h14so16254215wrx.10
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 14:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+U2cX3E5uQJEC4uNOEi7FDur+XKI6t2F8Jsv9V1CVbc=;
 b=N4mlXXYuoa7FRjVIVG+xTbB2zHqMIoVz8JL9+180SuZXlN4xKi1N6mTXB7rfCpbzTp
 XtrbrqqT5fYWFxrKY6eQl6xqLjSz90VUwcXCZFq7TAsKBBzsrFFaQaCs6UOW9UMtA0/B
 62Zlt7Ll3Z2HH4w6w01pSKae8qEkSqP3heZWjvHoZVqxtLJ0Nomehl5XVW11hUPD6G1G
 Uycrz+1R3lZGYwVj1NxPQotNKgl8onqi1lPi7LWEvddaujOAio6Pav68pN5AV3tejCs9
 ZhH/7+sAxoAikLakpJj2hAAwHeOmMwgDQPDyMiBjeJofwJHFArYWA0gRP2SEBmXUDMzR
 t/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+U2cX3E5uQJEC4uNOEi7FDur+XKI6t2F8Jsv9V1CVbc=;
 b=g8uNMex3zE9m70WWBjmWru9SmJqrBPUJy+p1Mou2i9YA46brk+CxN45Xzk1nmv8+/I
 pQwNQ/qa2fAyFk5hpjl11fI2A28NBsDPdHGnuqNyJrV+obF7R3pbfQN8pfyBjFJzNqMy
 v8A/iEDRdSLvI0kYGgPpzkf6AhFHaGGYb7MrOkVhU5B8A4PCQi20dUhuXu8p/vtPhbR3
 7WsBZlsbMfg+FTpRyF5Tfbi8r5ah9dxLTm5m7n4n7TYcLEsb+29JPmfBhwoLL3gKn7CH
 b+qjVm68oC/r1o46G2ZYJrOy4O3AQ6Q2ib8XshW4aaO7lH0pNCE9hwupf0WgnjqyV0hG
 pUNA==
X-Gm-Message-State: AOAM53099YsZKvISFmsZWSmxBCDGxXtmS8Gk6silSUGTPaFsyxa3QGEQ
 J/FVYCH4wLeEZaq8vRMiUrDO078DIdrLgQ==
X-Google-Smtp-Source: ABdhPJxL/fM+RtNRD66sPdWuMgAgjUHBRwJ0HmbeCWXAkfxbOv9PvzUeEIZiIVJi275dfO2Ao5PaOA==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr9857053wrs.125.1627767177319; 
 Sat, 31 Jul 2021 14:32:57 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id e5sm7247639wrr.36.2021.07.31.14.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 14:32:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 23:32:47 +0200
Message-Id: <20210731213247.1747620-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/duma: fix build with gcc 11
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

Fix the following build failure with gcc 11:

In file included from dumapp.cpp:39:
dumapp.h:88:49: error: ISO C++17 does not allow dynamic exception specifications
   88 |     void * DUMA_CDECL operator new(DUMA_SIZE_T) throw(std::bad_alloc);
      |                                                 ^~~~~

While at it, also drop DUMA_CPP which does not seem to be set since the
addition of the package back in 2013 in commit
bda69bf4e4b642ab199ffa13c7356709885f129d

Fixes:
 - http://autobuild.buildroot.org/results/ed838a55f09841a643b05e5a7a7ca0a9d2882acd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/duma/duma.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 0e8a623bde..906db872d5 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -21,7 +21,7 @@ define DUMA_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		OS=linux \
 		DUMA_OPTIONS="$(DUMA_OPTIONS)" \
-		$(DUMA_CPP) -C $(@D)
+		CPPFLAGS="$(TARGET_CXXFLAGS) -std=c++11" -C $(@D)
 endef
 
 define DUMA_INSTALL_STAGING_CMDS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
