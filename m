Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761BCC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 09:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ED9B404B5;
	Sun, 12 Feb 2023 09:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ED9B404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWLXXo_mAJY6; Sun, 12 Feb 2023 09:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F18A4040D;
	Sun, 12 Feb 2023 09:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F18A4040D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17DA31BF332
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 09:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECC998176D
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 09:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECC998176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yaeMQunUiLs for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 09:54:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5DC581255
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5DC581255
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 09:54:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id u10so6759381wmj.3
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 01:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LW8FIVvrN120YNmsz8aqTc2ktWeOqzQ1JHGZFvQYJFU=;
 b=WPkHSg63WwR0/0UMtgYi8b7Ka4Pz9OSvoaeNW5CIKe1OilpflznjiRGSzprKTraxYZ
 gAeSueY4mQ+4QQhnuyWjfk4J/f/eAhsJ6GA8aTOvODJmWPFyIsmisaAoboZGEd80Ht/s
 QfJegbPesd7k85oUzp1GZW3Ifk9+W5YYgYiO2T9paLc1OmLbkMEK3MKxL+BhBdRG6MXS
 4OH+zPg9vmiAz8VXjlR8dxkFpzlp4J29+bcGTu+tJ5Ucg9sRAsQWxaoFLklOwOvcOWM5
 tC5d9HZqxkbi3qMcMT5GUHRVta6n5u5yJjwxe58SE7TYoBDwVfZVVpufX9R7k3egkMKz
 9n0g==
X-Gm-Message-State: AO0yUKXo0SkHgZulCZGG7LELuEgzUR+TjUBTH142Mo3eeFgEZ9iP/hIx
 ALsXAuP48bRqkuIMrvQvk4/LX79+RFA=
X-Google-Smtp-Source: AK7set+mF1qdtwoxcvsvWtdloJIV+wJkLML/i125VK0VuWaGvb8iGhph4cUkaCAiyCHc4R5EvqxOuQ==
X-Received: by 2002:a1c:7417:0:b0:3dd:62fe:9914 with SMTP id
 p23-20020a1c7417000000b003dd62fe9914mr16701491wmc.18.1676195665828; 
 Sun, 12 Feb 2023 01:54:25 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c2cd300b003dfefe115b9sm11682386wmc.0.2023.02.12.01.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 01:54:25 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 10:54:24 +0100
Message-Id: <20230212095424.1326531-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=LW8FIVvrN120YNmsz8aqTc2ktWeOqzQ1JHGZFvQYJFU=;
 b=A2KrRE73HSd4wTlo79bHhDB1DqgK9Dl5ky1Odu4DNylZoSWZhcrBfDz/6+Lqgx7p/i
 UntSjW3zkkPr+VbEQ7YMBazlf1mUnHNu5uTWafQO1/47V362FXKnhI6Eh2CnZ/4K1p1w
 9rhPRsScqDU5QhvEvZkIdtj9aeiGR00eSKo3yjO2Ru8vzzDFKPNcClBIswsOifDfP3Ch
 UVfGJqfl8WtOHXWjrD9BvAIg838mJ6as0I85BsvxC0lmff3Ze3e4B27KBaosvy6oaKvA
 eH+ID8OGKnCIt3SUY+5Qp+LD1QA2mnqykxVTLSnF8CbV2+7M4l4FcdSQggM18XXDjwpP
 27pQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A2KrRE73
Subject: [Buildroot] [PATCH] package/python-magic-wormhole-mailbox-server:
 add missing reverse dependency on host-rustc
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Julien Olivain <ju.o@free.fr>

As reported by Yann in [1], Kconfig warns about an unmet dependency.

The issue can be reproduced on master branch at commit 451672e,
with the command:

    KCONFIG_SEED=0x1D15B9D4 make randconfig

The patch adds the missing dependency.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_AUTOBAHN
      Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
      Selected by [y]:
      - BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER [=y] && BR2_PACKAGE_PYTHON3 [=y]

[1] https://lists.buildroot.org/pipermail/buildroot/2023-February/661898.html

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-magic-wormhole-mailbox-server/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-magic-wormhole-mailbox-server/Config.in b/package/python-magic-wormhole-mailbox-server/Config.in
index db20d3e7b6..a0721e866f 100644
--- a/package/python-magic-wormhole-mailbox-server/Config.in
+++ b/package/python-magic-wormhole-mailbox-server/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE_MAILBOX_SERVER
 	bool "python-magic-wormhole-mailbox-server"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-autobahn -> python-cryptography
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_AUTOBAHN # runtime
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
