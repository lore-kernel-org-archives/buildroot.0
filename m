Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819ABFA3750
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5044071E;
	Fri,  2 Jan 2026 22:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSIazzkisXhj; Fri,  2 Jan 2026 22:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C174070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393692;
	bh=isuIaLWD0ERG2uzgUuUpX5ggnabyV6MxMaHyUbopvKY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LbxWrtqLT/V5IivbOEj2nPV1KhRBZo+/tm9qI3HqzWcpz2hj4BuAXdjmYJ7Qzd+zP
	 aIuEN2Xg50SpcuDCA+nDIAgAAch/DNyFzG3SswO+lHB8GirUhhrW/EZVH8jKM+KdHq
	 N9cVsVtdTVNrJQdk7ODsgbW2JRMHFCcJ9JgmIOkUk1pa8fQ2B2rSsXelXVFWz7fO5t
	 KGxCTUC2KrPFZ66g9C3BZT85eg5oEbDrUOq8R7p4EQLGQeFwqbWTQEVlLnlV5cuRQB
	 FpZXAqxQDNu4IhnYzp6ymajEHihEUjqHUDXl/dZFbntMSaPZDLEETacb0q0qTX21By
	 GyXAqbfYyniOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C174070C;
	Fri,  2 Jan 2026 22:41:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C119249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E272401F3
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEpBCfahfow9 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:41:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A383E40072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A383E40072
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A383E40072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:41:29 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7c75fc222c3so5914007a34.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 14:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767393688; x=1767998488;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qkewgx/gKrFuJFjfRJ/+DqizqtKHdSbxmDUbhVCQqLo=;
 b=IP078q7+Prmvwil0dW0yWlotk7gMxKqCNWWS+8/wzYfEh6tczzFx+T1N5ajX6JF7Kr
 n/5zlfJEUgk5bdxpe4NfqT2osbhvgBJ3jBEJbc3KgAWqPl9AZTBBrtP5JjqwixJeH5gm
 uml7xPXkDHCNx6/xV7rO2znt5obmS/zjFJgZZ9/cGUREv0xmoO26vj2/ckMUMZvs1lBT
 wpD3VFHmKQ3gyHZsJRACtC0yS6LTG8t0/ex+h3aocw3LK8w4kkEXySIvKRoJ2mVbEoHn
 ty5CHR9Q2Xnq9u1pv+7iWv6wesKu3Uq3fMZHTxwCZHf0zkK9sOAXwSlAdTchUdScY8Zo
 0xWA==
X-Gm-Message-State: AOJu0YyY9W0h1FwRRa+jSYL3QkJ3pw+wfzSc287XiRS49BUYQAoMTGEc
 n77n0ZwQc97F49xaPcXrrEpTfnpvlra5x6GxqlEJG1SFzVyYgM3ByJ9OPqCU2nNIVlg=
X-Gm-Gg: AY/fxX4Wd8RyzKRx6IDuxrR/e3LxNcFiErvx+88BAfyjkvGYysrCmDR3eLU6gmVjLmZ
 uhoiawQW45Wtn2BDiZBNIQpEdIB//xvShnuSQXm9soUrsTO/OpzxeEPB8lZnlwNANxfDAyHjLcW
 6Erlt0rorvWMFb3A9gmRVYSVE4JlGF8TeZlZ7HJWJ5K9xco68nooExb0L0ia9g1aeQJfhuRJOAn
 vDjK6IMG35wmSO5TR3fuz25P73Oh8uZjUb518NWm2XddRpRO3YEm3Y6yrgzVFf/G8DymB7Cs5Sg
 4g8ZTkXdwC5CpBZETRcpOrAZmhlW7qdJwXO4kCuLahIQwWY6elPsNQtwX+yFwXlfO9ruZLtSypW
 O/Ejxo8CzgxtBOOOMojsGNmsWHi2TGglLweuXdThbmIyvee+DgnEd8ulW1Pv79Rzn96Ze29s+Ct
 7leBT2K1U0FBmZAd3NmBPKuZnGMmdIYwd0M2U2p6n4g0YtyObwx1tvxBgeaEXBLOzK5BeoeqT1N
 cY2vKP0XxwUk+9bVgotQsucK2OJUHyFEVhM83oWq5+3tt9UOg6Y5ww=
X-Google-Smtp-Source: AGHT+IH5a4v2qm0QGt/HOXe8qcyXQXj+qeL9RC7bLCk5daO6fUXo3QdFINvyuWerQcApchECIrhjCg==
X-Received: by 2002:a05:6830:4ac4:b0:7c7:6063:8e0f with SMTP id
 46e09a7af769-7cc668eb42emr21897258a34.15.1767393688210; 
 Fri, 02 Jan 2026 14:41:28 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc6673bdb6sm29022748a34.11.2026.01.02.14.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 14:41:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:41:15 -0700
Message-ID: <20260102224115.491959-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767393688; x=1767998488; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qkewgx/gKrFuJFjfRJ/+DqizqtKHdSbxmDUbhVCQqLo=;
 b=Xom8mc/Kilr65ibAMjRwspr8zYAI4t+2mjeYh/oFwWV4WVacOpyu9L3yuvmJECwR6d
 UEVmBJRAvhgQZZKhOrAX/T/lSee4JQI1SZdm6/gEj0nqiO/d+wE7VPvdkfCnesno6mhd
 h2j3dSN58zaycFoJlpJS+xsHtqJhxvQuRHSQ/q5cd5LOzve+bMSaUr6Qg+DBbR3TuTWf
 z/tQufpQZ8BbVUd+qpDMXDg58LKSJxWYXA5/bAgdns5loA6RQQL29GwRYPEQsY4y5iqX
 TRzu0sDrnXgB4CzkkwTEw09DZrN1c2dr4CzFf6IjYJRAkCB7cvxcSBe5jnmPuREUwdaF
 A4Bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xom8mc/K
Subject: [Buildroot] [PATCH 1/1] package/python-jaraco-context: bump to
 version 6.0.2
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

License hash changed due to move to license file autogeneration:
https://github.com/jaraco/jaraco.context/commit/9a81db3c77bc106017dcd4b0853a5a94f43ae33c
https://github.com/jaraco/jaraco.context/commit/d2b8d7750f78e870def98c4e04053af4acc86e29

Add new python-coherent-licensed build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-context/python-jaraco-context.hash | 6 +++---
 package/python-jaraco-context/python-jaraco-context.mk   | 8 +++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-jaraco-context/python-jaraco-context.hash b/package/python-jaraco-context/python-jaraco-context.hash
index d638965772..3f65a6275a 100644
--- a/package/python-jaraco-context/python-jaraco-context.hash
+++ b/package/python-jaraco-context/python-jaraco-context.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco-context/json
-md5  bb22ef027077b1fa8528ef1d9840b838  jaraco_context-6.0.1.tar.gz
-sha256  9bae4ea555cf0b14938dc0aee7c9f32ed303aa20a3b73e7dc80111628792d1b3  jaraco_context-6.0.1.tar.gz
+md5  b75fd0eeed9134ba598bad534244b984  jaraco_context-6.0.2.tar.gz
+sha256  953ae8dddb57b1d791bf72ea1009b32088840a7dd19b9ba16443f62be919ee57  jaraco_context-6.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
+sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index d33521afdd..27cfd7467c 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CONTEXT_VERSION = 6.0.1
+PYTHON_JARACO_CONTEXT_VERSION = 6.0.2
 PYTHON_JARACO_CONTEXT_SOURCE = jaraco_context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
-PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/df/ad/f3777b81bf0b6e7bc7514a1656d3e637b2e8e15fab2ce3235730b3e7a4e6
+PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/8d/7d/41acf8e22d791bde812cb6c2c36128bb932ed8ae066bcb5e39cb198e8253
 PYTHON_JARACO_CONTEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_CONTEXT_LICENSE = MIT
 PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
-PYTHON_JARACO_CONTEXT_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_JARACO_CONTEXT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
