Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1AFC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:23:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C2360EE4
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72C2360EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4387982BE7;
	Fri, 27 Aug 2021 16:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4jre0aCy0Nx; Fri, 27 Aug 2021 16:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBCC882DD9;
	Fri, 27 Aug 2021 16:23:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 341491BF40D
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 216BB407E8
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYmIwEQk-_kk for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 16:23:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 236164028E
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 16:23:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso9644095wmc.5
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5T6/xnTjbOWKuG//L446x/uSPrDKZM3No7mu8qIHN+Y=;
 b=IcWd/WRI5g280H9EaBiG6d6VbBXIZJ9/RGNt93C9JjmjQbs6Yg/JzRyMeqDrS5Ngz0
 QNrNBQO9mvX8zCMBVDOIddAzwKugdTpzfizKz/7FIObCK5ZWMaH9+fA2qXIEMadmX3RC
 1G17iAg75Jn0OZz+Quy7ojIzYM5RuKe5GiUpxx3MQiFlSZkqZc999Frv5CYguz61HeZC
 4eIfXnXhNoptIfSQE9gYQRlAG06QWaDaml6aZVZrKUxi/mkpt1eVflDei610nU/PaGHB
 ZOoc2UgxflvKm+MCqiaIogqYT5FP+xC6mMt2LUFihy4QoOF8pjt0p22dz+fhqE531GWJ
 /gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5T6/xnTjbOWKuG//L446x/uSPrDKZM3No7mu8qIHN+Y=;
 b=s4p680DQLJ4AuX+kpolJXqOSPMxZO9JtcWUMBADhThLULaQlivtMj26yaFCJFgf1ev
 5Cis3ILz+6LTLQLVHVLaNvhzo+kqzQNAX220wg3p4hUE3aZOqZV42FUZCqnyU5DGOWxL
 gQm2BD/7C51yoPPaLGBQgjiyHthN99d9QZg7mdTV/ACDST1RPtObwgPm5hqTAavl0hT1
 z4Ql2ewrOhS6e5JamdDhqW9r8SRMfAovcI39bnQ310biGEj83+CGtdyTkYTIQIqgE/cr
 4zytWA1ZTn9wnO8p/YneMhQieJ5P+S/FkglqC/SF36j40+hYK3SGz2BlECygoKJNt4UQ
 qDdQ==
X-Gm-Message-State: AOAM53039gkPo6Ipj1b2KfHCck0xlUgLfFFVQPcxej2acMyBh/rU6vt3
 zv7wY7Xqtan+VuSTz7JC5h+2qLfr5BQL3w==
X-Google-Smtp-Source: ABdhPJyT2l6uGX5bcTaNohh5GGsaMG8yscTfOVj8DzErcU7MH8VHS7EO+S4o4rrXqmxILLInsZ8Rzg==
X-Received: by 2002:a1c:443:: with SMTP id 64mr9770280wme.180.1630081402324;
 Fri, 27 Aug 2021 09:23:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id q11sm11684119wmc.41.2021.08.27.09.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 09:23:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 18:23:11 +0200
Message-Id: <20210827162311.2006524-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/ipmiutil: touch config.h.in
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Build fails since bump to version 3.1.7 in commit
011f31ee244b7fe4621b3f69ca3d7e7b1cfdb5bb because config.h.in is older
than aclocal.m4:

make[1]: Entering directory '/tmp/instance-4/output-1/build/ipmiutil-3.1.7'
(CDPATH="${ZSH_VERSION+.}:" && cd . && autoheader)
/bin/bash: autoheader: command not found

Fixes:
 - http://autobuild.buildroot.org/results/2005af881726473f2cda176e90c1e41e4baea67c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - touch config.h.in instead of autoreconf

 package/ipmiutil/ipmiutil.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index d85b9643f0..a8d9bb8763 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -11,6 +11,12 @@ IPMIUTIL_LICENSE_FILES = COPYING
 
 IPMIUTIL_MAKE = $(MAKE1)
 
+# aclocal.m4 is newer than config.h.in. touch it to avoid autoreconf
+define IPMIUTIL_TOUCH_CONFIG_H_IN
+	touch $(@D)/config.h.in
+endef
+IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
+
 # forgets to link against libcrypto dependencies breaking static link
 ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
 # tests against distro libcrypto so it might get a false positive when
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
