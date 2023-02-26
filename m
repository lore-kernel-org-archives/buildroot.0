Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D69C64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 15:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9DA80DB6;
	Sun, 26 Feb 2023 15:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C9DA80DB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtSgyUr9jSEG; Sun, 26 Feb 2023 15:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD1BA80D9D;
	Sun, 26 Feb 2023 15:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1BA80D9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 914B11BF3BD
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 15:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AB1B40346
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 15:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB1B40346
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qv0dnY8fhn7Q for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 15:44:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16E9B4033C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16E9B4033C
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 15:44:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so5537020wms.2
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 07:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QTMw/hv8HdTO1uJ5g54O/n9rzqeV2hQP3KxBcft+l7E=;
 b=yBK6sJir7Q7kvTInWvNHLWAFZUdgOwGWSIDLNSZmHAhNYVbdRHn6b03DpdYjTdSSWX
 g9zFC5IyWCCzvvwIGwY4V6BbjwhQkilzf5z9gu9kqKWwz9UevpmhBNTBAofzJ3NGe9je
 viICr3L4Kc9gv6iTHuYVrpNPe8KnKVwrVkAB5JX00NqibPaUfoTrwt8Kf9kMg+rzSe4j
 FTGqx//M8qo4bW6xi1HTVxcRsR1NVhGEacnApI5es01SpzXMYKVjl4XZYBriPkmI+nBp
 n+1P1RIrm2lSrZPSMVExc/QYZhW58jHhLHaNl0NfXr5vlFvmsPxePjynREm4+S/KxxGT
 uNgg==
X-Gm-Message-State: AO0yUKWQhl4BG9Y9R9JhMJhMReN+tNde8PY/kjqXH09yeTZdoS+EmsBa
 bDLfaEfe/IAC+A9AjaYU3TqUeUg7VIc=
X-Google-Smtp-Source: AK7set+9G/e/cg7wpiuUZUzZGceNfJVkldb6yvF94VLWSe+7K+MKfkuNfF2IUOAe4yFxCwuyzm5cEg==
X-Received: by 2002:a05:600c:3b15:b0:3ea:ed4d:38ee with SMTP id
 m21-20020a05600c3b1500b003eaed4d38eemr8057449wms.4.1677426264637; 
 Sun, 26 Feb 2023 07:44:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e17-20020a05600c219100b003e7f1086660sm9779400wme.15.2023.02.26.07.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 07:44:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 16:44:21 +0100
Message-Id: <20230226154421.47285-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QTMw/hv8HdTO1uJ5g54O/n9rzqeV2hQP3KxBcft+l7E=;
 b=dPO9Fw0geTuABatixetCZS8FHPHFCUKmkSsdh2CGs4/eJJ2ColnUUsrSPVIr3rdrnC
 USFqiex5UxVSuGeQ0MZTJ0EcF+2TckKY5DPV6jkueAVizfUAFFZZ9Wvz9M2aXoyc/d12
 Jpnidt6A5a9wQfL4g4xy7a0JIEpMkCPMXsxVfI0oTMJH/o0lT9oG50ucsP8z3Fgr4CtR
 pU6Mwgv8J5ITpPfizRl4Tj7NGqxykCmhhMkrX1QNl1lXcZzv19pRYIL2iKt0f62Ob45M
 LpAf2XzzF5PbwbLXCiuNjdOCcSliFtmXbRxtwKyDyh5eRRfZ0aESD1Rx2bYr3lMocYzA
 peQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dPO9Fw0g
Subject: [Buildroot] [PATCH 1/1] package/proxychains-ng: set -fPIC
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

Set -fPIC to avoid the following build failure with some architectures
such as mips or aarch64 raised since bump to version 4.14 in commit
35953d1e61aa8581be09c9dca39365955b10590e and
https://github.com/rofl0r/proxychains-ng/commit/35a674bdbc294730429a1007c9e7ce01e65b49b5:

checking what's the option to use in linker to set library name ...
cannot find an option to set library name

Fixes:
 - http://autobuild.buildroot.org/results/8ed1481e29321ed3da40251f700cb3bd66f62c94
 - http://autobuild.buildroot.org/results/fd01df6eb9a37257894740d44a33eece9123355a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proxychains-ng/proxychains-ng.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index c4d487c7db..beb8909088 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -13,7 +13,8 @@ PROXYCHAINS_NG_CPE_ID_VENDOR = proxychains-ng_project
 
 define PROXYCHAINS_NG_CONFIGURE_CMDS
 	cd $(@D) && \
-	$(TARGET_CONFIGURE_OPTS) ./configure --prefix=/usr --sysconfdir=/etc
+	$(TARGET_CONFIGURE_OPTS) CPPFLAGS="$(TARGET_CPPFLAGS) -fPIC" \
+		./configure --prefix=/usr --sysconfdir=/etc
 endef
 
 define PROXYCHAINS_NG_BUILD_CMDS
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
