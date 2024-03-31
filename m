Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06022CD1288
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 00:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D935820D0;
	Sun, 31 Mar 2024 00:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPEQakCTJviX; Sun, 31 Mar 2024 00:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E5D6820D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E5D6820D6;
	Sun, 31 Mar 2024 00:41:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39A2E1BF947
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FF9C401FE
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 00:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_znfii9x7As for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 00:41:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 106C3401CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106C3401CE
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 106C3401CE
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 00:41:50 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-368cd5ddb65so6954855ab.0
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 17:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711845709; x=1712450509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mF7KsER05OOi19D1svOWGm9Xtcbm/xShv3epkFsEfiU=;
 b=xCU1jaFRRfaCiW3ocnhqaD5QoleqEmXqv9s7Zwo2dhNUFyuaYxBacYJAIbxmV0BNIn
 CLfO+ciUahO3IYtS9mqSBi9dn2XbUdPpZh2Tn8CtJHTicOrIlfjMX0iT/WQJk8YlDFDT
 7JbKV39r8xOTBeTicBRWV12VCDyUrKZXSmC6AKsMbUo8QXnNWlvWVf6nUC5v8Ud60X1+
 D9Gz5iyP/F/iTzqAm2SuIS3jwFn6yg6cGOESfdrkhkO7Kifd5XaPtdoVYXlG9l7H/7Dg
 KwC//YAvQ083m3AUuEOXkfSKd/k9kPshSzFGfVaLSw+ovGFML5xSY6B1+3dEuRspYFJU
 pl7A==
X-Gm-Message-State: AOJu0YzdtCKE/VMdE7Q6bK0kcJEA79Yu57bhePXC1fpM3bvCU4jHVXNC
 kO5wV56EuPx6qkC1Rc0xlD7UKQIBJIRTHK6DrHuy2pEDgpndSpSXpA0/BWDjW7RZWw==
X-Google-Smtp-Source: AGHT+IH97gkM/aqPWiNjo/F7EGPPOAKil+IquZhWRo0eurImi6sYiKxm6wMCPRiuQyNoQu9flj4TpQ==
X-Received: by 2002:a05:6e02:1aa8:b0:366:97e9:c9c1 with SMTP id
 l8-20020a056e021aa800b0036697e9c9c1mr6365946ilv.8.1711845709569; 
 Sat, 30 Mar 2024 17:41:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 q1-20020a5ea601000000b007d05927cb31sm1851053ioi.45.2024.03.30.17.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 17:41:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 18:41:16 -0600
Message-Id: <20240331004133.636618-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711845709; x=1712450509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mF7KsER05OOi19D1svOWGm9Xtcbm/xShv3epkFsEfiU=;
 b=YseTzYjAKocEnloez6tziDgFevPFvGUPIN2CRR+/69Ufag4aoFB1ZkjDJaLEsTthh4
 wUJ3LaxslBoYQ2ON9B7cj0KL4jfQeGxj+MzggPnLQILBiXSLrxDm4dD2+aD2lyPoODG2
 tzz+3choBD++NlVn1YN+0PR7ilcM6vdyeCx0ND3BBbq3Ea9tRITXZPuOCO2gGEcS8HcE
 YgtlqvAaxvsFoNwXUvKDgjslsp+H0TV63fFo7IUvXCkiBl8DuBz0jDQHvQ3G2M+TiOrX
 nlXI3CPI4GkE3xmCOQxcoPo7swAq5rWrmsBxMlr+Zg0SZXx+XjUl52xe8kaEPZRfookb
 Dqkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YseTzYjA
Subject: [Buildroot] [PATCH v9 01/18] package/python-canopen: add
 setuptools-scm build dependency
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>, Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-python-setuptools-scm dependency needs to be added
prior to migrating setuptools to pep517 as this dependency
is listed as a build requirement in the pyproject.toml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-canopen/python-canopen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index 963c4ab801..09ec595ec6 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -10,5 +10,6 @@ PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/49/55/67e555f6f4ea
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
+PYTHON_CANOPEN_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
