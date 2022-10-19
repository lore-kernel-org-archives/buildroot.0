Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EE8C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD9B41C1E;
	Wed, 19 Oct 2022 21:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DD9B41C1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMH2dBlQnk-6; Wed, 19 Oct 2022 21:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAAA241BE5;
	Wed, 19 Oct 2022 21:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAAA241BE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 866841BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 605C841BE0
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 605C841BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rqwhp7giZXtC for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:53:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8889F418FD
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8889F418FD
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:53:53 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id h18so9922257ilh.3
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jHwMx16c/G8lR2VWx3N4+OPrSamg/vS1IcWrCCPwcAk=;
 b=XByN9E+avK+CM0SJdr3SFsOIXSzd0uNhvb8G+kruMrnzpBBgmspiOPRYcVSwiUXYOa
 LwQjyMzaYc9THXQNELevFdVmMXf6irYtJLyTydJjrUELubGubfkq+dL7ppzVjdHglcVj
 reYtMebByI7XNTmeDatWbvJsQ89OS1PZVRQOAX+dJFFdLH8bHieQ5OxeqUTPvGmjG3ty
 kEmJdny77WhlCzg/F0BW61Q/knOyLx0n6ZslUTpofyiIF6ajZcfuXuvSOR/IYzQ/s4C8
 yb1P40schUnRq+BshwIT+pbeLQDebXu/c9H+YyKrFu9pVXWJ7BW0x132JUlQBRUovH0H
 I+GQ==
X-Gm-Message-State: ACrzQf1DpdsUS4HxBh58Y783lwzjgyFRXeQTjPPKLE3uiqnAos4KA78p
 DOY76WaLvlBg1WpHiPwfLT7SijSBJbpqlQ==
X-Google-Smtp-Source: AMsMyM41lziXVV1trYhG8mJZ6rNpe7oVfehxFveDn0ceKaCbWWcZfCoxlAQSmVpgJ81qe+tD3iApvw==
X-Received: by 2002:a05:6e02:b4b:b0:2fa:5de2:4cbe with SMTP id
 f11-20020a056e020b4b00b002fa5de24cbemr7491077ilu.101.1666216432289; 
 Wed, 19 Oct 2022 14:53:52 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v3-20020a056602058300b006bc69b0fa07sm2645358iox.12.2022.10.19.14.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:53:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 15:53:42 -0600
Message-Id: <20221019215348.3262192-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jHwMx16c/G8lR2VWx3N4+OPrSamg/vS1IcWrCCPwcAk=;
 b=GovVbDLRB0A9hQLqsToOycSTYGmsKNwtA4FoDKff+yk8Vcck/lpjfppfrpdVS+haGh
 vtzrbK2OW4c6cUEncc6GtBUvaS/pzBoe6UChLwqnk2n462jZ6r5xdhXuG2hwxrzJTgy0
 BvTLKECL7lsbMDFvr8/D+f3vc1/KyGhJ3w8dnaPa7UzNAVY3SBPi/IAmUCuN4kbmcK6Y
 OXJfxbxf4oynrPMys5v31RJLCFRZgAdSyva0ynrZd+dTq5JTzA9A6sb61CAx3eQfAwEr
 ZS+rFaABM1s27EoYeC7tvMTgYwWo580ozCNAyS0duJDIzgMUCHZXyOgEhp+9BeAOxnX3
 mf6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GovVbDLR
Subject: [Buildroot] [PATCH 1/7] package/python-pluggy: enable host package
 build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be needed for the upcoming host-python-hatchling.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pluggy/python-pluggy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index 59382518ed..6dc6f970ea 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -11,5 +11,7 @@ PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
 PYTHON_PLUGGY_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_PLUGGY_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
