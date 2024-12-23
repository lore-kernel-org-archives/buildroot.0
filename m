Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26487E7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BCB81763;
	Mon, 23 Dec 2024 16:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z07FvouhQFNl; Mon, 23 Dec 2024 16:50:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E370781771
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E370781771;
	Mon, 23 Dec 2024 16:50:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B66E7D3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AE004131E
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ln_hw8NDGmTC for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7325B4131D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7325B4131D
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7325B4131D
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:50:55 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-844eac51429so351321439f.2
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734972654; x=1735577454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9tDxFXPg9zejRgbNs+CPVCH59sM20w5w/lrW+GD5+Q=;
 b=vEDzwgLpQ8lEhROoy0NAKnZZHFdR02ZJRZZbHvcdMui+6kxmkADs3B8+G8KFAz5NW0
 pNRpQD3SZRwuhRmXOPQxTHwLaoW77GKCqlSau/R1qHQy9Emuj2dme7GCqFQvUqAiFrhq
 wwnlR41JnD2ychYxAM4jDK40hjsv+ul4Wa8g49FuEKLXdUlGc+NZrtT652rRAKZ0sY93
 3Udw59OLOaBkshnS3WklEX5a4+0+6iFduchVlB9rJms8608ZzbMkzQSfCvD5r0AoIc6W
 Zp/dkOVcHt1rAi0520Ky1CCnUuU771NOfZrRkCd/P4QvFhhsw7q6YgCIEn8aXgWKUDCZ
 fT3Q==
X-Gm-Message-State: AOJu0YyzizKtJHTKaZ9zB0mtNZ/7hvZ8JlTv3A/KibMVeMx8SRMiJ7eh
 Todez+Z2dgk2ww+g/G1fzpztysaZw23a6xWWeeZP02v/lYK0bF76AxhyZoO6lB8=
X-Gm-Gg: ASbGncuX8+jZli0YolvgyH3IpigrUCFKMY6GMJmNXxaXWZ/Mz/HgecQ/KuVMPrEpXyB
 ecpC98rJ7iEibo+eqXurg+T+EmackCyUYIZPMMf+Sip2YLPdyDndhCTPjUZU8a9YkhMse06UCmz
 +qQE4n9Bsnc47dAjy4zJZThllIcWpfLQ8ZI6O+2M1bbLtu//wF7p+M+Vh8w7wObG1XKF31Oaj/M
 I3O3YRq9ikPa1ZXSTPq3FNViYzQrucgnP44MWETmjTaM68qtnhKcZw2TLGlVEXfTCQF48++Zs01
 aZ0M8b189ONu7wCUsFFsGMQdPprjeDB8pg==
X-Google-Smtp-Source: AGHT+IEc2S5xG922jRi/fY9gsQ/FUnIPCcwDMw120A00EwvzKu/47C3b/M765lZS3jL6zV0phLhPeA==
X-Received: by 2002:a05:6602:1511:b0:844:b6bd:4b35 with SMTP id
 ca18e2360f4ac-8499e2ac0e5mr1506241139f.0.1734972654294; 
 Mon, 23 Dec 2024 08:50:54 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8498d7dda71sm212374539f.18.2024.12.23.08.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:50:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:50:52 -0700
Message-Id: <20241223165052.1879579-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734972654; x=1735577454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+9tDxFXPg9zejRgbNs+CPVCH59sM20w5w/lrW+GD5+Q=;
 b=lIzV28vV/JMmiNZlFfpOePm8SDXsYGQEEX2+/0PmlCquuHDVySqU5lVEKnjQxl6zec
 P9Ba9SPz4BcH8NVndoqKY/n5dF5X+Xo3fT/H5D5yezASZpxVkivda233FRjEtISuj+kn
 jbz+nDmy46h0+JGGS3lpAF0m1S336Rs0CTz5+aGSBa+veRs8PeoB2siQYnRatArY1Wc0
 KauXVal6Fp5jiedijj/cmpIRkPQP96xNu7rlOqV2YbvRLsY9rBWBQ7bKeCR5rd4TReRc
 MgjsQKZ+O8Mmj6C2qPW6gpu/xA9y5s62OgwhXjHlqEsfRkEC+x7N8xpIbCm03XkvSM+4
 60tA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lIzV28vV
Subject: [Buildroot] [PATCH 1/1] package/python-googleapis-common-protos:
 bump to version 1.66.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-googleapis-common-protos.hash                      | 4 ++--
 .../python-googleapis-common-protos.mk                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index 408f07994d..ccea86c1a7 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  cdb94d19ca05b4f16da10bbf39da2347  googleapis_common_protos-1.65.0.tar.gz
-sha256  334a29d07cddc3aa01dee4988f9afd9b2916ee2ff49d6b757155dc0d197852c0  googleapis_common_protos-1.65.0.tar.gz
+md5  28ba393a6c206bbd55efba7b68f65622  googleapis_common_protos-1.66.0.tar.gz
+sha256  c3e7b33d15fdca5374cc0a7346dd92ffa847425cc4ea941d970f13680052ec8c  googleapis_common_protos-1.66.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index 3f43f1516e..c1a1174e26 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.65.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.66.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/53/3b/1599ceafa875ffb951480c8c74f4b77646a6b80e80970698f2aa93c216ce
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/ff/a7/8e9cccdb1c49870de6faea2a2764fa23f627dd290633103540209f03524c
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
