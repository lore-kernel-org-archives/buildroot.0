Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AF2C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 11:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2383761042
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 11:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2383761042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D44C14058C;
	Fri, 30 Jul 2021 11:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUbrWHxNy6GF; Fri, 30 Jul 2021 11:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C19740576;
	Fri, 30 Jul 2021 11:38:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1A31BF3C5
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 11:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A21D40576
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 11:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GFnSoNhS7qXV for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 11:38:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 159BE4056D
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 11:38:48 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so7066582wmd.0
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 04:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UV3fqI/+FMAemJIEfjgBAaGKplBlsDfGbah7eNbpbs=;
 b=Uz5jS6IG4Or2FimrIHIXqxLooHSCaxHrWCb9B0lrDfqS7kkIKDTyMkXZKOZVmDXeRP
 QizUg+UwQA9rwNCLFX2P8GZStNyXRj4/HYjtCat9tl18CYMOj5oq6/5DgAlCcmX8gBXd
 ndWayFPVlXblMgH3Zxa0pQN/4sxEM7DOyNZoRNqTCckmzrq5cAPwutzTGPCgVH/bg8JH
 shbd5pArQqZnwS/fUTCRh0ESS3HL1f1/+6cgu0Q+ElquetKVxCMP9rvrrNwLL6AydJFc
 9ejBlJ0lsPBdFZzfz+dF4wthvVyDl40oXmLlSm4kgSTZWXiTLhZPUCjCeuqKIDqihuVt
 AzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UV3fqI/+FMAemJIEfjgBAaGKplBlsDfGbah7eNbpbs=;
 b=VcUqGDTuQEv8unjoPFbCaXAqMWnra0VNwNHOb/UEsf3sYk/2M4B+pCQn3PekM4W/fV
 Zinss7UckXyBhm7ie1pezHXz3ygbREAhwbM8qjz6ljcdtIVlVz8IlZSwv7rmd8WSFR3A
 bZIsw0dwp/nhgIAdwoBYXHSPco+x8xSmxXYkjiSA9UoRQU3hxaOPv40jcxZ+q7hvEUGB
 NjKc4kyScArfFTlJEMw8H/L7gUQhKtYxyOJgorK7ub5WwUD1Im5DjHLDg4JmRLtGmK5t
 OHxrmUVgPErYACkpmYrcL945ihs5HVKd2vaAn6m1LuWxRHtt+D8DCiq4IpifB48RVXH9
 o0aw==
X-Gm-Message-State: AOAM533gwZQB0FhjZrwJIwFvFF+TBznu26glEPRtg3XB7A1avl2F06tX
 XiNvt1KyjS/t4Scp0hdCNEKTPr/k6CJ8hQ==
X-Google-Smtp-Source: ABdhPJwLWvlJJQmOgRXcer+NHSwpXrk4su14LeIwq3NeudqoRcDN/XAbiHxlNuMy2ecrPuLB4qmSaw==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr2341422wmc.141.1627645125871; 
 Fri, 30 Jul 2021 04:38:45 -0700 (PDT)
Received: from kali.home (pop.92-184-116-29.mobile.abo.orange.fr.
 [92.184.116.29])
 by smtp.gmail.com with ESMTPSA id z2sm1362384wma.45.2021.07.30.04.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 04:38:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 13:38:33 +0200
Message-Id: <20210730113833.3678984-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xml-security-c: requires DES
 support in openssl
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Enable DES in openssl to fix build failure raised the addition of the
packahe in bbda38afbbfa79ff436e1a187bb267b8d9558036

Fixes:
 - http://autobuild.buildroot.org/results/fb9252de77e020182fea7e9011a3e402c49d926b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xml-security-c/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
index 81d945f23d..17d0ca3aad 100644
--- a/package/xml-security-c/Config.in
+++ b/package/xml-security-c/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_XML_SECURITY_C
 	depends on BR2_INSTALL_LIBSTDCPP # xerces
 	depends on BR2_USE_WCHAR # xerces
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XERCES
 	help
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
