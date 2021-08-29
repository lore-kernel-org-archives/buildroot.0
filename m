Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D30DC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:47:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A87360E97
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A87360E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A7C6400FF;
	Sun, 29 Aug 2021 02:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n4ZizYutfE5Q; Sun, 29 Aug 2021 02:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD6A540191;
	Sun, 29 Aug 2021 02:47:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2337C1BF37E
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1193D404BE
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfvCN4sHyvCE for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 02:46:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C59CA404BB
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 02:46:44 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id y18so14773366ioc.1
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 19:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XlfLc35zkRcZAuxX5r6MYhDnTRvmoCWe/CjuFuQppBI=;
 b=UYxhxJAS2r1mjCJrm638LVP2Eu1iGyO6iEJDWW1zpGjw6qG1c9VUjBuPyTnNSVQ+tM
 TR9GjrcKQLHLr7n0tkifEhiD50kF1pRg7MlT3iNJMOLwTuj0iaPyJVMkTWlpGBc5BYKM
 /5i2VjCa2ummLLEAwcQT+5Mtso7bZXz+FG5x0ZHiPhElGlaMbrv3gxLs/wZFrjrhcOb0
 PaN+3cf1Y+FVZ0BaD9phHIyZmicbJatuTeBiv9ovMT+0wrDhloRUD5scz+oOijvWNONW
 JH5ajENy1ywWmYq+CeV2yq0eu6fvAfQ8+Pzx7ZbDsfAr1q3TQZA2eNw6mqlB/7ZgHs/6
 ogHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XlfLc35zkRcZAuxX5r6MYhDnTRvmoCWe/CjuFuQppBI=;
 b=ONzhvZVmHR4SNnTYQ5khGEMoDSMyPQR3O7Wp2Bmm4ViJmlkQlQmZljtauj9bC5bbVD
 efQT2T4TsojvIJLhnO3WQnxXWxNmfn37QO4mUpKO2i5DfiDR/OXnhrtqpiLi+XVhUXny
 qMCshzLsFivuZqnFrZzLIbtsn+kcoKwMT6CzLQQ7n2ZxJ7N5CWgncr2j6mpuPeiaXGCV
 c3wtMFtdT4yxl7/4uiqYZ9mxZeB2faeI365UrEHYyTqH9yrRU9dQY3XnEAd5DilWlbVx
 TQcM4B0pma8x7ecnhwa4ijb5KuPBcNMDe0vILBgNH7Kq9B0Z9xoQ/FctEhzo76NjBtn3
 gwXQ==
X-Gm-Message-State: AOAM531k7f9a/cplEq8fKd3XisZ00eia/rcwLsh8MTsDG3Q7WI6OVEea
 x+Xqiawg6/1mh+0zGWD0pMQTZouGqy4=
X-Google-Smtp-Source: ABdhPJwR7AV/b6nDJQnbmLRrZiYz6hiC45TFCPGex773lTWx1rLtHYnDjq3AXL6GpW2+8z9z0u+s2A==
X-Received: by 2002:a5d:81c1:: with SMTP id t1mr13558096iol.31.1630205203787; 
 Sat, 28 Aug 2021 19:46:43 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id g23sm5741951ioc.8.2021.08.28.19.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 19:46:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 20:46:29 -0600
Message-Id: <20210829024632.682029-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829024632.682029-1-james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/8] package/swupdate: add comment on origin
 of services/configs
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index c9bd486127..256f0930ce 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -222,6 +222,8 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
 endif
 endif
 
+# Services and configs derived from meta-swupdate(MIT license)
+# https://github.com/sbabic/meta-swupdate/tree/master/recipes-support/swupdate/swupdate
 define SWUPDATE_INSTALL_COMMON
 	mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
 		$(TARGET_DIR)/usr/lib/swupdate/conf.d
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
