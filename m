Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA06C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 11:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0BA9422DF;
	Fri, 22 Jul 2022 11:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0BA9422DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70AYyKLyFALz; Fri, 22 Jul 2022 11:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A6BF4195C;
	Fri, 22 Jul 2022 11:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A6BF4195C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 606D51BF365
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 11:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4895284921
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 11:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4895284921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4WXJHQYQxE7 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 11:00:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50AA684920
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50AA684920
 for <buildroot@busybox.net>; Fri, 22 Jul 2022 11:00:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id n12so5995589wrc.8
 for <buildroot@busybox.net>; Fri, 22 Jul 2022 04:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RDgOS6j0I3vmF/OTdP3mkSB/DMYd9ky9sEtTk++cBBQ=;
 b=AcvzRDwJHgR5QdHNpM1JaDlzBlqK8ySjyoAycKJtjWF3CtdsM3pPf8CVV6peXAc7tw
 rlFbfbJscBSS1YWIQicI+RIiWlISYVb4ROActnB5GLQo7IBA2dKGGDnd4re99WvgpELK
 lab4R1CswVDQm+X+xYUW9s8nP9Eipnnb65GaaJ1sMAx9We7CO/jgRB9btdZo2spko/42
 CWavDrWkI2NwqPr24f/uF7pNNB9Og8T+7Lu+c55zkDG/M9U7iASjtcM6Pajc2NNfMBeW
 4l5fYP+1hftkE9BpEhcM7jHNhsRLvEqzxL7y01dn+PkPYp40xQLfLohF0mgcxmTUALSm
 WHrA==
X-Gm-Message-State: AJIora9VL0MWMNUeK23vRRO8HMC9lndvrYpDrRJLD4MxAcHebwedU0Ui
 XSUBNJCKHTs9FeV6YA+wLIxA25ASaEc=
X-Google-Smtp-Source: AGRyM1u6qFCinNsJcqIc0HfxF3irTwBHIq6oq1IbmWNTtSucqVyL6iFPohXfRbe69Op1Z2TjjJm6PA==
X-Received: by 2002:a5d:648b:0:b0:21d:a61c:a9c9 with SMTP id
 o11-20020a5d648b000000b0021da61ca9c9mr2080679wri.268.1658487617403; 
 Fri, 22 Jul 2022 04:00:17 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003a30fbde91dsm9560199wms.20.2022.07.22.04.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 04:00:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 22 Jul 2022 13:00:08 +0200
Message-Id: <20220722110008.3294552-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RDgOS6j0I3vmF/OTdP3mkSB/DMYd9ky9sEtTk++cBBQ=;
 b=CmV5PMuoicHIKi5v4XwSSoO56ubbW/WP0LFzCkG5UbYImJ1y1tLMyhXiSmPww3/Ph/
 ER6AzQ7GKez3i/+M/I4hJpAskJpAZSCbqB2BlVoLs/tBSzgGH21DX32GTtZYBvQrIUMF
 NwZ1/dmTL1WcxbGyPFgnO4Aw26JZ/hcCBIsjH9FpPtodn6HWRpijIceM/JpZ9k6DbQx7
 PExTUm3rlav+fBz3L8+RH6UaSve6+7pl6SSUwM7fp+RHSaPuLGrzZ0aD+Y7+/Cx/Pm6L
 1F28jYXnRSC6Pt+DhNhxGyCKGGpbBmY4T9yVJnJcX+L0QK0JdcB1uh8gf6AcWRy3kPpJ
 556w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CmV5PMuo
Subject: [Buildroot] [PATCH] package/open62541: disable Events when minimal
 Namespace
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

the option UA_ENABLE_SUBSCRIPTIONS_EVENTS is enabled by default,
by not compatible with UA_NAMESPACE_ZERO=MINIMAL

see http://autobuild.buildroot.net/results/d8e34b8bddf0f3568e64705c6618b17bce70d210/

CMake Error at CMakeLists.txt:1120 (message):
  Events require at least the reduced Namespace Zero

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/open62541.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 594243c8a..5f46703c1 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -34,7 +34,7 @@ OPEN62541_CONF_OPTS += -DUA_ENABLE_ENCRYPTION=OPENSSL
 endif
 
 ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
-OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
+OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL -DUA_ENABLE_SUBSCRIPTIONS_EVENTS=OFF
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=REDUCED
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
