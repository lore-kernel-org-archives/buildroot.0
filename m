Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F23C433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:49:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9866B610A4
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 19:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9866B610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E6E161048;
	Wed, 15 Sep 2021 19:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-u0eOpn9dx0; Wed, 15 Sep 2021 19:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BC3860E8F;
	Wed, 15 Sep 2021 19:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0291BF30F
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 488F182AB6
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 19:48:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqTsnqXwckzh for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 19:48:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90FAE82AA9
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 19:48:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b6so5634276wrh.10
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D9iZ1dBw40nhlkdBA7U4vgMIBbxXIE6sulMNw+6ETS4=;
 b=CGG81TeYVsoSs6qQyiOlk+Ib8fGrncPe/VIarwJNdPP0ffj+fRupbDsHAwgVX2xhe6
 B/s4uxrxzXv/viV1G4kwJW00bF5MmTFKxtlAYhXSGh0xByYA3JlNPnE4B1jti7hARBRA
 vmmp/DXcF+2DzICZzx0YVWb2r2OeWY+oOEf4tc47P/XUmi2/SOC4jYI/5h9SuQEBgjJ3
 kzaMNtD0TUwMc5fbqXLKdwqVKsJQlYhyjrq0qHK44sUDf2QbDZFZjp5lPa7j4qs5jWhn
 J0mVHDM0UyCpnkW07RwkxbNjLzPU4ueADeumbYJ9N2HgvfzQUIBRQ9COSCWNWvszwcWF
 79yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D9iZ1dBw40nhlkdBA7U4vgMIBbxXIE6sulMNw+6ETS4=;
 b=klfaKHAQLaEfbn4oQE9sCOCE+5nSVxTsXn0RADxmKJodU7BJ64CohH8iWvGJ4DOvZg
 +/MDddnQSaGfMUvMxfH1j+bLPpwihaiQZ9+VaAEHi3CG1l6oVc2ZqZGLCtka0HRyUAXG
 H+alwO+ksDuDYaROJ8sq2gTN67ao1q1DT4oqR2JgUGQqHis4p49/6dW3z3RjoLTrNu68
 H7Zp4OqTIk+eTKoJgE+21yh85KrlpScnQ2NgetlenUm65seBfnoVCFAanjMU98zn4/el
 cp9C/aNj15lgILbfLhrd3PgUSCI8WcVS+HtoirB/74AYVpFmfVr/j2J1INeSYsLdAleC
 BWlw==
X-Gm-Message-State: AOAM531BT52aUGPQtc9pj4BHCnybHjLNkAsFRb2SqwiTThKX2Aem7UJu
 zwUwsV7cFCnyy/4GIhhJ4QmYQdsxrR0=
X-Google-Smtp-Source: ABdhPJxM5G8ecgZ1i2r9YRYQj0nszbpXbI7Kppy+9WX408RE1U5Y5Ug9STHWZMLCdrsjTYGlUGydEA==
X-Received: by 2002:a05:6000:160d:: with SMTP id
 u13mr1936402wrb.17.1631735327573; 
 Wed, 15 Sep 2021 12:48:47 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id l26sm5099699wmi.25.2021.09.15.12.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 12:48:47 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 21:48:37 +0200
Message-Id: <20210915194839.22122-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915194839.22122-1-petr.vorel@gmail.com>
References: <20210915194839.22122-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] utils/scanpypi: remove python2
 compatibility imports
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: David Laight <David.Laight@ACULAB.COM>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

ee8b680816 ("utils/scanpypi: use python3 explicitly") started to use python3,
thus compatibility can be removed:

from __future__ import print_function
from __future__ import absolute_import

Tested with python3 -m py_compile.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
New in v2

 utils/scanpypi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 9dede4e119..1f3326cf4d 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -6,8 +6,6 @@ Utility for building Buildroot packages for existing PyPI packages
 Any package built by scanpypi should be manually checked for
 errors.
 """
-from __future__ import print_function
-from __future__ import absolute_import
 import argparse
 import json
 import sys
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
