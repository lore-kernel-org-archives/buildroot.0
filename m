Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5145EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 00:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5503B410B0;
	Tue, 25 Jul 2023 00:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5503B410B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cpCuD-xBTrb; Tue, 25 Jul 2023 00:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30EE1408A3;
	Tue, 25 Jul 2023 00:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30EE1408A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E86731BF97D
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 00:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0BF5408A3
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 00:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0BF5408A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEcsKX0eOOGl for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 00:43:39 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5CD040583
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 00:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5CD040583
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-268160d99ccso238476a91.1
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 17:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690245819; x=1690850619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbQjjgUsb2iBa2sS356dO8uoXt7xiPG6G7RQGRLnvoQ=;
 b=l9ZBPRO6NxX7kgPLVj80f2do2YsnX2FUUgKQbe3AwcnoZVtZ2jqn5kB0AIzR7FvQpj
 22/xV9hMI6y3rGKBbt6p/L7q4MVYJYGz9aOKYdjxRw7T/Ef/9H2Ha7qTKo/2fUnTm3DJ
 tw1/nRBNhRpRzgL9CGn1H+SvtbGzUdTjHr+FXF6mgDQncyUH0tA20aB0uUYe/QT5piYz
 gH7+iJ/XmtUBJsjKy7dh0KsVmAvyRGKJVdVIS4qgrV+5YnKDQdNzpudOKLpLVc4ymeed
 2m8/IQq/BjsUJ3NBD/CqTrQBnu4gt1idTkl/RPgaxkYrTDxq8udos8ik1hR3Ypy/iKb7
 TZzg==
X-Gm-Message-State: ABy/qLaRS/RHJOfARgRv+HOD3191h7i6tfWhtcCzXpnscPARzWN/OebA
 YEQ1IzrYjSo/lKUchW0GlznEzm4fj36sJ4sd7kH+BQ==
X-Google-Smtp-Source: APBJJlHsSOh5rOQoPURISNH58Fk7ZokkSI1oLQMJeU6TSDEai2oSouHUpexm5SnPsDs8AQodcZ5WLg==
X-Received: by 2002:a17:90a:280e:b0:263:ed7:3574 with SMTP id
 e14-20020a17090a280e00b002630ed73574mr10810511pjd.1.1690245819035; 
 Mon, 24 Jul 2023 17:43:39 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a17090a4c8500b002676e961260sm225734pjh.0.2023.07.24.17.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 17:43:38 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 9FC44820; Mon, 24 Jul 2023 17:43:36 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Mon, 24 Jul 2023 17:43:22 -0700
Message-Id: <20230725004322.3150281-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1690245819; x=1690850619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kbQjjgUsb2iBa2sS356dO8uoXt7xiPG6G7RQGRLnvoQ=;
 b=WEinJqE6BiDVw3HpDrfGgDi46XXp+ckCys0h8k1FzpkUm32PkX5hGEkqVSWoGXSrIC
 Ucyiul6SpQM20UsTr0dbHhox9muRnby+lkZVVqLEXZVCORw2jfzbf3CUQwj5pP1adP9z
 9K6kkOCiq5JmfqW7iNNRhhq29Fa5pHQ/S0fng=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=WEinJqE6
Subject: [Buildroot] [PATCH] toolchain/helper: check_fortran: silence error
 message
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>, Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

check_fortran will display an error message if there is no Fortran
compiler in the toolchain. In the past, running into this error message
would be unlikely, since the Fortran test was only execuded when
BR2_TOOLCHAIN_HAS_FORTRAN was set.

However, since commit c7f641cbaae9 (toolchain/toolchain-external: always
call checks with dependencies), the Fortran check is unconditional. The
error itself benign, and the macro will handle the situation correctly,
since that is what it is designed to do. However, the error message
looks ugly and can be confusing.

[...]
>>> toolchain-external-custom  Extracting
>>> toolchain-external-custom  Patching
>>> toolchain-external-custom  Configuring
/bin/bash: line 1: .../bin/aarch64-linux-gfortran: No such file or directory
>>> toolchain-external-custom  Building
... everything continues normally ...

Let's suppress the error message, since triggerig the error is an
integral part of how the test works and doesn't mean that anything is
wrong.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 86a90c0a834d..8e5d6a1f6b3e 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -394,7 +394,7 @@ check_fortran = \
 	__CROSS_FC=$(strip $1) ; \
 	__o=$(BUILD_DIR)/.br-toolchain-test-fortran.tmp ; \
 	__HAS_FORTRAN=`printf 'program hello\n\tprint *, "Hello Fortran!\\\n"\nend program hello\n' | \
-		$${__CROSS_FC} -x f95 -ffree-form -o $${__o} - && echo y`; \
+		$${__CROSS_FC} -x f95 -ffree-form -o $${__o} - 2>/dev/null && echo y`; \
 	rm -f $${__o}* ; \
 	if [ "$${__HAS_FORTRAN}" != "y" -a "$(BR2_TOOLCHAIN_HAS_FORTRAN)" = y ] ; then \
 		echo "Fortran support is selected but is not available in external toolchain" ; \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
