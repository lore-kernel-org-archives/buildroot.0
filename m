Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (unknown [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8006FA3741
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 02:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E4F960E85;
	Sat, 29 Oct 2022 02:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E4F960E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evIPDjMJfk1X; Sat, 29 Oct 2022 02:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1426660E7E;
	Sat, 29 Oct 2022 02:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1426660E7E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A648D1BF365
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 02:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F90A60E7E
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 02:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F90A60E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjZsTdRDnXBp for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 02:46:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B21160743
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B21160743
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 02:46:41 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id o2so3865308ilo.8
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 19:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e48NkjZ5hzPS7UHKJoh3UO9upz6f95d8zu+7gMqmeWk=;
 b=WvfmTPlUbdF0TOCKxphM14s0bZMuy86mmXbHEaIpN6DqaD/WkW+3bhz8lLLS4zyM49
 VdNaNXb5Ef7sqoxr0ikCP4fG4jsddlbNslWWIsGdTfuJ3S3LFEJWjEtKk7eruu820Gvc
 F/wbDdI9g65wahIkB+CkOsI7ZFXtDp29LrMWH79zi/cmAaotX+gOUKYmXOyVux9F05OD
 KfuhT2U5k1eBGetfT/XV7Et0uI1YeWS71yfTfinMsICIxuBd1b11pslURnDcDLpO6o/p
 bOH/o1UIRWrAamkY3Qj6CzTQtyOnrWrFoMhjd71mViHLFUbaCecJhRhiSaPOUe8URJsB
 v4Ng==
X-Gm-Message-State: ACrzQf0G/6j+TLaObDZkngpvHVw0NLiK/xzOPx4g2Pj5aqIQrOjgOInI
 01xKlLlrxEWVuyhHEcuQZaRy3hJGcP9DHw==
X-Google-Smtp-Source: AMsMyM6JM/tm/EHMK/EaZYRkqxF4nqxG4dIWAkh92vbgOTYBOxO6xE/mEC/q6x6LHnGheV7wdNqH4g==
X-Received: by 2002:a6b:3e55:0:b0:6a0:cb10:e1f3 with SMTP id
 l82-20020a6b3e55000000b006a0cb10e1f3mr1141238ioa.149.1667007739604; 
 Fri, 28 Oct 2022 18:42:19 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m12-20020a92d70c000000b002e9818bc2dfsm118210iln.8.2022.10.28.18.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:42:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:42:17 -0600
Message-Id: <20221029014217.1408835-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e48NkjZ5hzPS7UHKJoh3UO9upz6f95d8zu+7gMqmeWk=;
 b=KVsgu1O/phEEcrKI9f5armudk2yiVwpnH5selvxmeFolX1L96uSNtnzoOve2azAgP5
 PshyquKiM+jxLcAc3BpzGsdlA4fHlSt1HdpqyiKzZfqvg+QTfJx5Q53xqU2iW8I7xQZi
 IIYb4lSTD3r7IUeKTv1CwItmR793KYfobxIf7UYlg6Tg4jeQdrkW42xtVZMn7sz/Y7dS
 dsKjbO7WAK0D5WQy4dQp/DD2g5DWK48iJK/ipJi8pzgIuVDG+rjGFzJXQDh3LNBHNjX9
 736P0UmiIDLMCh9GdpzevBdJMtgTVO9c1jbI/V3BIU4zGc7iW6skCR9Lqz67389E7d1H
 XXWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KVsgu1O/
Subject: [Buildroot] [PATCH 1/1] package/python-tinycss2: bump to version
 1.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tinycss2/python-tinycss2.hash | 4 ++--
 package/python-tinycss2/python-tinycss2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
index e8e1d93f83..f9b638df6c 100644
--- a/package/python-tinycss2/python-tinycss2.hash
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinycss2/json
-md5  60272f58f8d5834b2e09ffbc9bd5de53  tinycss2-1.1.1.tar.gz
-sha256  b2e44dd8883c360c35dd0d1b5aad0b610e5156c2cb3b33434634e539ead9d8bf  tinycss2-1.1.1.tar.gz
+md5  e8a06102e7f42ca791463f11ce7b814d  tinycss2-1.2.1.tar.gz
+sha256  8cff3a8f066c2ec677c06dbc7b45619804a6938478d9d73c284b29d14ecb0627  tinycss2-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index e4fc5dc9c5..de26639587 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYCSS2_VERSION = 1.1.1
+PYTHON_TINYCSS2_VERSION = 1.2.1
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/1e/5a/576828164b5486f319c4323915b915a8af3fa4a654bbb6f8fc8e87b5cb17
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/75/be/24179dfaa1d742c9365cbd0e3f0edc5d3aa3abad415a2327c5a6ff8ca077
 PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
