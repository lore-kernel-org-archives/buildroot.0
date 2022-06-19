Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB09C43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA765400CC;
	Sun, 19 Jun 2022 16:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA765400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yx2yAg_C4lKx; Sun, 19 Jun 2022 16:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EADD408E9;
	Sun, 19 Jun 2022 16:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EADD408E9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE131BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDC71408B0
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC71408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fc3Tx2Nowoad for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:39:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D0B0408A1
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D0B0408A1
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:39:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso6675821wms.2
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dkVn3AxFDuYB6iG45WJMqbR2d2wjO1HrH0aRD1/KPNQ=;
 b=YlMpJLqnl1Xb9crBSS/dUBes6Lp8qscs14nxRCl86NhXykWGzXRxfyN4X5PWvH03sb
 CX7Sw/s42/swI+udtVqXN9Mq/C2N63A29UL+tfcJ/6G3EeonkFPW3Y6WVKysMDjdbsZR
 klk3Aq15SJj5fJWzLL8fRS8alRMx724Ns/IR3KVZ+PrXhPi7Iue6TkBkCS52aTCYaIFP
 QK14Alu4MDAKh8TfFVik2IL3UrMVjVnRp9MuR7wZUj33/Ux3dhCOQgEXt39L+QSlAFYM
 FKXujusIfhwgA3wf7SlgPJ+5AtwmARkThbZnAEuaQGNXh2txRbwHn/VE5AIFpgsRqDE3
 mytw==
X-Gm-Message-State: AJIora+u4DJG5ULJsNCtQnYd9Sj8qH4v1YGJoJGHIqpFmW7Y66S1TiAe
 Kf9lQLlcal7e8lp7nOlTcjHei5vQzVM=
X-Google-Smtp-Source: AGRyM1sYgLZ/uZwG78QepXBEXM0Mvhv70UwVt3/FuGDEW+FcQ8z8mdLehE4Vst9CxjqQFzY9Xchc/A==
X-Received: by 2002:a7b:c92b:0:b0:39e:eabd:cfd8 with SMTP id
 h11-20020a7bc92b000000b0039eeabdcfd8mr12316237wml.178.1655656746274; 
 Sun, 19 Jun 2022 09:39:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d6e04000000b0020d02262664sm10658530wrz.25.2022.06.19.09.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:39:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:36:24 +0200
Message-Id: <20220619163624.636348-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dkVn3AxFDuYB6iG45WJMqbR2d2wjO1HrH0aRD1/KPNQ=;
 b=L2JYpDFb5Oo6kaqMKWHazBgSfrUB4kJ8Wqa3i8iyyvFbEDQLnWif/sRAihjC12brd+
 ha7+Tf897V3IOMwjwiKMLMBuvladBR8KAVgO6cKEw8L8Uo6MIQJudVfHceULSBTPjMkG
 mfSCkL7wh/cSj31nCY2l/M5qyNDtNaPTDoTEBUhUT/n/p8Nruct1fhT0uBIKomSQZEV1
 ga730eaMTXcjcdyOxarqZ4osi9jSiqGTcqfu5WVmx0Qi+oShCTKF7YzJtqFyfstZGyGJ
 J+/L3d/XiBNe/RvF7RBq/a0bADO+Y3vIHvoKm/wO+T+VTtXcJXP3Nwpl6bwsdKfaF8V2
 Bn+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L2JYpDFb
Subject: [Buildroot] [PATCH 1/1] package/rabbitmq-server: replace
 RABBITMQ_SERVER_CPE_ID_VENDOR
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

pivotal_software has been replaced by vmware in March 2022:

 <cpe-item name="cpe:/a:pivotal_software:rabbitmq:3.7.28" deprecated="true" deprecation_date="2022-03-17T14:05:30.170Z">
      <reference href="https://www.rabbitmq.com/">Product</reference>
      <reference href="https://github.com/rabbitmq/rabbitmq-server/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:pivotal_software:rabbitmq:3.7.28:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:vmware:rabbitmq:3.7.28:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avmware%3Arabbitmq

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rabbitmq-server/rabbitmq-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index ca769e13cc..aa8328b5ec 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -31,7 +31,7 @@ RABBITMQ_SERVER_LICENSE_FILES = \
 	LICENSE-MPL \
 	LICENSE-MPL-RabbitMQ \
 	LICENSE-rabbitmq_aws
-RABBITMQ_SERVER_CPE_ID_VENDOR = pivotal_software
+RABBITMQ_SERVER_CPE_ID_VENDOR = vmware
 RABBITMQ_SERVER_CPE_ID_PRODUCT = rabbitmq
 RABBITMQ_SERVER_SELINUX_MODULES = rabbitmq
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
