Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135C6C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 14:18:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA502610A3
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 14:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA502610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB0F44012C;
	Thu, 12 Aug 2021 14:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMYsgJaZ32a9; Thu, 12 Aug 2021 14:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 081A140764;
	Thu, 12 Aug 2021 14:18:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D77BC1BF3A8
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C739582861
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DdTXMDmxO5j8 for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 14:18:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12E9E82998
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 14:18:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so7276719wms.2
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hF+jXaEbiIw32equP3UEVg9TblU6b63hJ+XggFFrmFA=;
 b=gwR8P+WlUdp048B6DZDBJkJEvviuZsKN3nc/nixMBTFrtsyBUwcnndUhUa07xJcC2L
 TRjxh0KnLwq0FrcWgVYLg/iVj7WwTlVw+y7x59eBFICzkRXiHR0KyPwscEOq6OZfSWIK
 C/EtY/w9X0/JBLcehDbPOa3bm68Kmn57BEI1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hF+jXaEbiIw32equP3UEVg9TblU6b63hJ+XggFFrmFA=;
 b=BVBXufrZzYPcsGet35tsyYTVf+2qq1/fx4T5CEIJmUTLTXaN6XGyqSyKkCdsTbuDiT
 nfWRseKJ3gJXRp2nvcaNyVFcxL8tTsyOSkIMB58STsL0I/AX0FGZDcfCNwsIuGCbBvYn
 F6RFBhH6/hlEviOi1DQdfBxXKNp7ydGOd6v9WXQRfdSGEbd9DEIyjna7pM5t3/ePYCSL
 pHcM46TFKpCvvx9qr2S12aLeIr4+UoP/Rbw0SXshotjGhuuXo/K9QmZxYKIJBMuGytBa
 x4LrAx98yWDqwWNGE6m9M+Dm69sSb2drNj/Oh2z3jEOnorcB2lxNofEx6+AkiepEh1iA
 haqg==
X-Gm-Message-State: AOAM533ky2op5yBPRGF0N534f3DUfysT9V2AInjvZhN2IHBKAQ/DqBcy
 R3LVNiigg1Nrr79uTP3mlyiENXAqZ0AKgg==
X-Google-Smtp-Source: ABdhPJzlqP+JKDVz2n+APxwAy4aiGV9Q8SxyURXMZql4WwnWBivRnva4LAseQTHlKdnjUhctrLSEiw==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr4413841wmi.85.1628777884944; 
 Thu, 12 Aug 2021 07:18:04 -0700 (PDT)
Received: from localhost.localdomain ([37.160.45.80])
 by smtp.gmail.com with ESMTPSA id 19sm3186953wmj.23.2021.08.12.07.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:18:04 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 16:18:01 +0200
Message-Id: <20210812141801.959504-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812141801.959504-1-angelo@amarulasolutions.com>
References: <20210812141801.959504-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-web2py: bump to version
 v2.21.1
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 4ff85668a1..2ef52b0a5c 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256 e3f05266b4b97650b76bfb85028df5e2194955674c9b98cfc065c72ed5791690  python-web2py-2.20.4.tar.gz
+sha256 44556376468139de874e9c29c9ef56e60ecd5f7536c7bee46d74b1f9d4178825  python-web2py-2.21.1.tar.gz
 sha256 2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 26214a8110..910efbe617 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.20.4
+PYTHON_WEB2PY_VERSION = 2.21.1
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
