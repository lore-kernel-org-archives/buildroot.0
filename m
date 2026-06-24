Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA6DCDB481
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 237C660D8D;
	Wed, 24 Jun 2026 14:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LgSzsJwDz1I; Wed, 24 Jun 2026 14:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B23DE60C28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310033;
	bh=nxQC2FXJRsZwTAcONoeo7U7dloxx1eViNc3oaJbgh7c=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ECIWWVa1I0hhvV08VFGC95o4Nj0l34orrknB1633RLzWf1XzA+TAy8cBQ/UOesau2
	 jXWQb5XCpE8ACGqzwEceV7BdnlqkemWosz9LMx1JguG0j/VA0mEAiC6kM6fm3IjulV
	 e+EqjLnx8qxeV6IOO0PE3BnvsNCBg6uYKKZulsgh5YUkMHMqPXoynMkdG9dSYHHM07
	 8yJN1hlryv2aD5ted3foNScARiGvtIIfwSFPMkBmqklYqHu5LUq+AUloPscFVEqI7I
	 kA0zhXRfFEDOdP/SI1vgIYTlYvK83V9WgjzfcfydYTWdwWkDMinZ/oixBOXyn2e9x1
	 Sl+iwkDLCNpwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B23DE60C28;
	Wed, 24 Jun 2026 14:07:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25791367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 176D9401CC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CR8gFT7xRpyR for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDF8D40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDF8D40120
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDF8D40120
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b1bbcf3aso6072335e9.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310017; x=1782914817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yJFFN2Ns2IR5ibRLR7NMQmudVHnqRNhGyYYynwO6/oA=;
 b=qg/F/Q13v4AMscXpdS26oH1ie4FBSRay+DIjXzMIoMPkukGagZ1hnCU37tDyVNlaV2
 myaHCtFACbIcaeGm9Hd0vMFaq8RwsY9P2INfTuV3o6uPpnJbSXdxtaGaW/Hl31La+oNL
 Y6JtHGSgWRwRpcXmgtasvkDWVSqGz727L5eQEoCpRSmanXM5HsTv26e8TrH+sDxfS6Uu
 4wtmYnFK3PxexnU1Xtkl53N5vZRrK4QDJ3FOEka+kmCpp3Vn0iK/SLcZyp1Ri1z4CShv
 29WIKGL/9IwIaoXhvvN2CQUWEbgVlTSy+pipGzZ2IedoifMIFp7e3NvyCL24sh80RUNF
 pPYg==
X-Gm-Message-State: AOJu0YzZIugZGp8n+hcbLB7AqeKedXc4vAAh9LCHnuHHB7b/rZqHPNks
 dDswVszvj6qPTy+ERG03QV1uT/hMNn1g4LXhxYrPSPLUprHEwPXhdJHiKioB7TCz1fhIPgsaHmi
 pA3M2
X-Gm-Gg: AfdE7cm7ScZUWjBbZmkp8bG6WWEueNt8seMHU8PPBkOoLLHYJUbcQvI5D0hA/wjWpou
 7J4vaIbWLoC6Jc42GFEhZn1+Ky6QnWM3VoELMBBnYGJrQW+nIZVgxtptR/yvGl6XbZZqFnJu2GC
 ZD6nfj5kpVcMMXRs/rRoKgRNZCm9fTVtbDf5MiHsowcoPOyBAk29DfTCJ5UMhM0uhUlzWrZDtC6
 p3IS68ma51JUKRvOKNGxdYZrvFwJ6XPjA4dmrb/WSVoEpPGThk7YIGcOixjOn/n8c90zTozd9Qi
 Trg5cmT7ndBodVeDIDIfxtTzRBUF/ztF59mnIlzshnIGDyEDCVlITBdeEojMFa08uBd5NlWGfiX
 I1KptUz481GRGHmOX6JY3cOrMsKNk0J0Zkt5DIa19wAns53mIBSjUpE/T4zlUNZ9o5unZt1MU4i
 KgFG9A
X-Received: by 2002:a05:600c:500d:b0:492:37b7:6080 with SMTP id
 5b1f17b1804b1-49249083ccamr290073565e9.7.1782310016510; 
 Wed, 24 Jun 2026 07:06:56 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:45 +0200
Message-ID: <20260624140645.185318-15-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310017; x=1782914817; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJFFN2Ns2IR5ibRLR7NMQmudVHnqRNhGyYYynwO6/oA=;
 b=PDL8p1D8Zfy8uY/8yW45meH3e6YXbt6Dn4jksjz6gdfWy+nsNeriUivrUUfvctG9lv
 2FR2jtz0NeNnejtsCjll9txMAU4c+7IYttEKvYYYirBvGWhmNvhk2EqEvszWQJ+mQeQ1
 E0ITIVbXpOLYuri+YEvnGtKBHLhTbaeWI3c6mCZ21N6v8iE5fga6Il5is0R0H1foliaE
 H8nWjEDl5xTTlW89rsOnq9Wq35c9o5Fo1FxA3/QUekkg9g1+fIu+CKXtmREH0lZ6baev
 HcpYSu0GuUTndfIVuvjRJIA4cOvSaOywlHi3uPWSLatJcqf/ULT2BqqAAaGIIGtNBMOc
 7dxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PDL8p1D8
Subject: [Buildroot] [RFC PATCH 14/14] package/clamav: add vulnerability
 details
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This vulnerability only affects Cisco device and is then marked as not
present in this case.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/clamav/clamav.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 7f8008ab5f..80935fede2 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -21,8 +21,6 @@ CLAMAV_LICENSE_FILES = \
 	COPYING/COPYING.zlib
 CLAMAV_CPE_ID_VENDOR = clamav
 CLAMAV_SELINUX_MODULES = clamav
-# affects only Cisco devices
-CLAMAV_IGNORE_CVES += CVE-2016-1405
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
@@ -36,6 +34,10 @@ CLAMAV_DEPENDENCIES = \
 	zlib \
 	$(TARGET_NLS_DEPENDENCIES)
 
+CLAMAV_IGNORE_CVES += CVE-2016-1405
+CLAMAV_CVE-2016-1405_STATUS = not-affected-vulnerable-code-not-present
+CLAMAV_CVE-2016-1405_DETAIL = affects only Cisco devices
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 CLAMAV_LIBS += -latomic
 endif
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
