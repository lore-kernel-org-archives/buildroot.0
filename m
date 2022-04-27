Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A29C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 03:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C58E831DE;
	Wed, 27 Apr 2022 03:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLyZ8DSs89uE; Wed, 27 Apr 2022 03:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F38A831C1;
	Wed, 27 Apr 2022 03:56:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0FF71BF962
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 03:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE11C418EC
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 03:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2je-cpQgvNVQ for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 03:56:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD7AE418E9
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 03:56:02 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id 125so1297960iov.10
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7DBexflY2kZmFucEJopKxhZweWltYfr4CcbmYUdOgMg=;
 b=POkhrOCUvHews850Iz8mTyM1qky3GF/B8CnRGt3ajlUK+NWTT0S0W7/odFJsCldLzd
 JnUB1bbEIp+x2CMe2D7ZTIVJDxXR1810j2OSh3U2WDzDp1NxPCBSdlvptlvwdHJwOAsr
 QfWMW4FrQSOvw8KjqHS+YABaMWR0jrZSvUXd73T/NgPCdf7m3oyvgvqevdyXpxvZ0kX+
 cPY+X8tbpQ221qdll3ZGV/3YITW6Afx1Bpmu+BjphwRsB0TM7Vs8VXj3I9k86/esO+yu
 irAF/j+eCLtyd+ADOwqc5fUlzgYjrIn+WqUPQlnwZJwoUd8nCpwGHpgizARPUPPCZCZD
 njBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7DBexflY2kZmFucEJopKxhZweWltYfr4CcbmYUdOgMg=;
 b=snqU4dHGXO7JpndepcWgDmRQZFWovSxt2VJ76SfpmJSPp77B48rVbWy0XKXwNQubNc
 o0uod95EasEUKUAnERGvNttR01AOrC30pL7ngR0RL9xo5c1geGCh/x0jNHjj6t1NHg37
 SkSju+3zfAcUrkbDUF8qUPv+/G9dUxWKTXtfrEHNbbPaUeqH7NxvCh6Hn6iCPkq4Kji1
 XXmZWYa1A3WpvNxbZsKc2X91pSeodkNFN35V0WT0utN7uC/BuSs9cPdeu5LSRA4E7oKp
 KsyW4c3IykxbCRaLtbQyJmVovMavFBbH3JYzEou9SVz+228TyVDxTBciD64BgT8r12CL
 njTg==
X-Gm-Message-State: AOAM531g9T+9xDYStx0z6kOw6nGKFQ8ZPdUPDgPQIvgZ0MYopWvqgK2F
 1eqIWoKzQ1/BnTHnbwTcRO8Sa5yusAY=
X-Google-Smtp-Source: ABdhPJygcSd9yKRcGLq9pAEVus0Ymgf0syknh+IuwOHQ1f/HqmWl2IIViB2alhyOxqLTJdFS2Xp7hQ==
X-Received: by 2002:a05:6638:164b:b0:323:ac42:8d4b with SMTP id
 a11-20020a056638164b00b00323ac428d4bmr11373470jat.75.1651031761541; 
 Tue, 26 Apr 2022 20:56:01 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 v1-20020a6bac01000000b006575e6d99c7sm9069821ioe.29.2022.04.26.20.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 20:56:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 21:55:56 -0600
Message-Id: <20220427035556.1814178-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python3: fix unsafe openssl header
 path
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Explicitely set the openssl path so that python3 doesn't search host
header paths for target openssl headers.

Fixes:
 - http://autobuild.buildroot.net/results/c27/c27fe795e079350dd1c9af45be417d41b55e57c3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3a334fb28d..7f3b7cc8a5 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -103,6 +103,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
 PYTHON3_DEPENDENCIES += openssl
+PYTHON3_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 else
 PYTHON3_CONF_OPTS += --disable-openssl
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
