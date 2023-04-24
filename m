Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D007BC77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C300416AF;
	Mon, 24 Apr 2023 20:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C300416AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qb7nvhbo5Kwy; Mon, 24 Apr 2023 20:25:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4618141741;
	Mon, 24 Apr 2023 20:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4618141741
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59BAC1BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3301941755
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3301941755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_6TN2VgtfQa for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A03A04116B
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A03A04116B
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:20 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b64a32fd2so6647844b3a.2
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367919; x=1684959919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/+WDKApFL57MRtFzPe0K4c5n0aidUo9iSmp9utCx6Q=;
 b=ML+kHXF0iLjqjFk3Yvoj46rvK4iIsTR7UAcE+jTkrb5FAZYVZ6TPMCpRtNK8+2HGzU
 rOww1vTpuvNbFifRxYDRZ3btiyCTM90usOyVlS76Yv/v8FYW4xYw7JP5qorugTLdTxbW
 0/k+q6Ur162mEXmpVVVwPonj14kzh24UlVB9dcaUhkmXU8Fq4Gh3P/g4gdXWuVgwupP9
 vgaa5A7jghT0IEgdfjmJlb0jYqJMOeuEIBajrxuyIs+uye695toGfKuFYjBwOn1QVRuU
 X5do5xKxmDXpzL1HwD+PMvAE5hn15zUYK0oh+3roIkL3CyBcNeA9lwJeFLAOxnugp24y
 0zXw==
X-Gm-Message-State: AAQBX9ep1aFrznF3JfgWX44NHhOqPjxJmlTOjMKkJldJz7lV/xScbJ7r
 4PijREvj9SbWRcbzjqYLsnQQi/RjUqipWQ==
X-Google-Smtp-Source: AKy350bAzNQBHCj2LqRR9RenyYOJEoHIf+gP63eIyO4cn7VX8gzMHD3JY0AErCMSymJ/miyfOt+c1g==
X-Received: by 2002:a05:6a20:e405:b0:ea:ef5f:70ce with SMTP id
 nh5-20020a056a20e40500b000eaef5f70cemr13383679pzb.52.1682367919516; 
 Mon, 24 Apr 2023 13:25:19 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:18 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:03 -0700
Message-Id: <20230424202514.1546092-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367919; x=1684959919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/+WDKApFL57MRtFzPe0K4c5n0aidUo9iSmp9utCx6Q=;
 b=sZx6e/q1RGE9x4cViST9lBpsl2gwsbvTFHqoYxV8gjJomR5PQsBlLOnSYJtmqT43dE
 8wgdrP4NSkQYCS2ivNZd+JOC0TP2sPa221Ux9GRpFPbF6zRqUN3d4ulwX/Sl2BTgvxrV
 Qsva5EziSZb42fcolmlj1ZBC7Qkriwixxg7OjBZfsLV7v2qTJj2+Nv04LPfsQ5wWWTFe
 wjZpCuPX+g57bCD17yvifl22Z7nFXHHOz+WFtctzjhP690/7b8j8uySlGoN6e+iFD1BH
 A3ZQIf8Nss2+1Kgkv50PF2Cd2JDMNQt8o/sIGdC4itrA7SMTPEhUdAUPQikN6ZoDzlpA
 T+2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sZx6e/q1
Subject: [Buildroot] [PATCH 02/13] package/python-pip: add host variant
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the following patch that updates libselinux, the libselinux python tools now
require pip to install.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-pip/python-pip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 8cf3aaa3ec..35ad7bede2 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -14,3 +14,4 @@ PYTHON_PIP_CPE_ID_VENDOR = pypa
 PYTHON_PIP_CPE_ID_PRODUCT = pip
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
