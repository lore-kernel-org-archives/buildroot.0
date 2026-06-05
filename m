Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1E7CD6E7B
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 23:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1034E613C9;
	Fri,  5 Jun 2026 23:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4vu_-LZ5oXU; Fri,  5 Jun 2026 23:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A624613CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780701354;
	bh=XsULphKGameclEjBe7mgWSZq6+f1G8ZfN2SUQd48PA4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=RxSBr/T2PNojJ9c+TL+e4HZUGRcXycQjDZivZLLZo7XVBWvthTM8R1xX/YzhviR8k
	 SPL0SZDQMinGqM+Sg3R7D0nMffwNar3q8yigvG2Pq/BSUFAp3TldsyqTmDlza5tK1C
	 861HdpSVWYjbBTg2VpHWi4eRerftQSW5Azr5wmF6WmO4bAoAGJGY9Vs5zjg093oY9T
	 HZk/9477+3w59usFHpwolgosPDwLPpRkzhPl1uJv8q7sTFNCvk2O7U5ItPkOFig58H
	 clp6d83BXna0RlzsmaO+VQfnJQOGGLXaaxFizy4S7ZfsXAgJg9gN4oVPRM0bQUcy5m
	 tm12HG2xQXmAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A624613CA;
	Fri,  5 Jun 2026 23:15:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8605E2EF
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 23:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C3BA613CA
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 23:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04tTURzdEKfy for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 23:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BC20613C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC20613C9
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BC20613C9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 23:15:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so1634093f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 16:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780701350; x=1781306150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWl3eBBd000PfCUtZYZeFuSpvPzIBJGcK+oDaZGEkyk=;
 b=NIff8g9GdTPBNKtsXPC7t7TUopwwhFLjn3Kz5Cjtliv1PWrkUHGiiuqLw5+MhzzXb5
 kHcYHrMdfV6a297CZ+1FYaZIY0tpEUSkKsBFenhlEmjsZlKJ4NdzgpAdR7AnkCVlc4yG
 3Yax8VnmmK1Zd1fCUEmNZCm/RAsBzACdFTG5b5C+sPILxDDDtUYys+j5E82gS5UCmBab
 VAguuTxwsQ4YI8Ragfc7Y0cVlDOmPYjeziMuk+vkTEGCRUCHOiX+J+P1h/xAM1I5QY6K
 iZehbKJqj6pAcCw7AJ0CQbTuaOS0qYlC6xYvAceAETA5t+SqR/Q3WkaNqFv3I+A4KvtS
 /J5A==
X-Gm-Message-State: AOJu0Yx8yPfYYBKUMCJBoeZ1jbltxUSMFb36L2AgSpfu2wafoXXzQMAr
 amYtlItLRp3tag0TBEFEKcusZmaREk2iOs4RphzKI7IFbHCgIJ4vbWCYFzwNQq2j/EBwNmZem9k
 xclV4
X-Gm-Gg: Acq92OED6YKTxi1EAwv/JZQVYkAX+8LHD3zgmn7CyKOnjNQCxiO4AHHCEJrEpCuuVzy
 wsz+09ay8dTVRS/NiA1Qs4YOoqBLvf0vW2kKZG42ZtQvde+u9Hzq/eV/ezeSznXGsSFTqoZQCpH
 1fECQNH2v6dWL1zGK01DVxCkDQPsibXMlwWw0PG2DK3tSM4V3iUOv1wxytEhaKqXE9nkfDiVPyY
 HOjQXg+9xDJzjV+PBmTp2mLloyKkUSNWH+uavYK0M0OaT5Gvu9Y2B9Tw27Vtu9CSQQZitDdUk+w
 uZCw3bhrKpoIkTnBKj9P+kAs9Xpa72YiRkuZq5m6+nNKidzMdUrGrGh183DFil43/PVdljo88PO
 ZNYXKa3B1fCqBHAAITqSzI/VLAVayVb/eDyhqMf/KBaZZNhrbvhfyynIwBnomQ9/o6x+JSNlL2E
 puhJ+H1xjI5YEeQ3jyyOL06wajYuNs/tP8cQI9qGQfXhiOleIW1m5PlmDbnNHoLPXi1TdHU+vmK
 fIkyb58qGODZX5byDlW6KxJmbCB4iJ/SW8t
X-Received: by 2002:adf:f292:0:b0:45e:eee6:8504 with SMTP id
 ffacd0b85a97d-4603061eb2dmr7284006f8f.28.1780701349870; 
 Fri, 05 Jun 2026 16:15:49 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46028a6dcbdsm19497791f8f.7.2026.06.05.16.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 16:15:49 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  6 Jun 2026 01:15:46 +0200
Message-ID: <20260605231546.2876989-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780701350; x=1781306150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWl3eBBd000PfCUtZYZeFuSpvPzIBJGcK+oDaZGEkyk=;
 b=EiOyQkLVjQs+Iwk2wKPYrMGQt4kywHqlOLJL+JxJSDCo4NtRubPaChV1EeimLMvdfR
 uzG9nXzGgrxaNLePjuueLZkYFnf44B3TTvp3/22KBtviAPiHf4W4kBrXdhKLJUiul0sP
 Mtm145TKsh0NXsvYD+55xRLIC+oIgWCW6/elA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=EiOyQkLV
Subject: [Buildroot] [PATCH] support/testing: TestOpenJdk: fix test by using
 bootlin toolchain
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The OpenJdk runtime test doesn't build since the last ARM aarch64
toolchain version bump [1]. Indded the OpenJdk 21 code base is not
yet ready for such bleeding edge toolchain using gcc 15. We need
to add OpenJdk 25 [2] or use the latest OpenJdk 21.0.9 release [3]
to build with the latest ARM aarch64 toolchain.

As a short term solution, switch to the Bootlin Glibc stable
toolchain.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14696526185 (TestOpenJdk)

[1] 8d413d61792724877bfd886fe3ba519fb5259566
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20260221164020.318115-1-thomas@devoogdt.com/
[3] https://tracker.debian.org/news/1661321/accepted-openjdk-21-21095ea-1-source-into-unstable/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_openjdk.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
index d57bc0a711..dd1456d365 100644
--- a/support/testing/tests/package/test_openjdk.py
+++ b/support/testing/tests/package/test_openjdk.py
@@ -10,6 +10,8 @@ class TestOpenJdk(infra.basetest.BRTest):
         """
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
