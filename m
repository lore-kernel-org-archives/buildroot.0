Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3D1E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 19:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D238402EA;
	Thu,  9 Jan 2025 19:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18LinaNv86LY; Thu,  9 Jan 2025 19:19:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0B6405C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E0B6405C1;
	Thu,  9 Jan 2025 19:19:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27EE476C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1480740F89
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_WqG6HsuCty for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 19:19:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD6D840F87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD6D840F87
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD6D840F87
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:19:15 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-844e1eb50e2so40560539f.0
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 11:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736450354; x=1737055154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K8+Qa4illbfcaX7ao0IIb1amqmo4fVvA31GaCShooYA=;
 b=dlRwdcOQaYXGRedM7BjlHROcyp/t/PlDkQtkCHjNFLCiZpPk8u0YVy31KkIyIJu5Mr
 8NQHumdYNkAb4eiry1+CNgtmFc/YBzPCTn7R17CERawIZKaDOpna8+tcVuUQqBlJupZ6
 79+V5e9Lzt/bEtgUxG5GLvEx6D5PUrhpvLy2DiALOTwcXxqb27BbofvaDhX+gBZyLunW
 DlH4tZXE+Wzzq4an1CtGdp/uK7J3afNaMedmiOmQ1MeDgyDGE7+5gHGYc40T6lGHgX8s
 pHsUhbCMDGr2HWU8hV/YQQX4TG3ZZahEO+4TUbYyFHDUUUQBTnLObiY/n/wiihYw7NZK
 NmUQ==
X-Gm-Message-State: AOJu0YxJ4o2OM14TSxmPP89LWK8TsGVhYk3lYIoJzrqAytKkZx/uoMTZ
 Rxafqu+4b08A5AduIR9+V4SFp4grLbPI5w4VAzIeqZ/VhqPpOiggYLmeNdDktaY=
X-Gm-Gg: ASbGncsYq2IOpNXlKtaUX55il2VkCxKcODFRccE7cA/cd27v9Ab2deX9xfnCO43uFxL
 L9Ve8HnlvTgwARSNbbXKNmicFeWhTRGnaMDItJeK1RpVAAjb6GWu9DXqmr7R01RLUA4t+vYNMLo
 HMcJB1/cMfQoxWjt1S84jf6pf6aQuAn/3dDhrLUYQjUIkFvDRmhkHLmT1Qi6jjB+4Ue0LSjZlOQ
 4TjcuWRkVh/eZD6RBK9DoiztRUDr8cTLNqr7U6wavJQyEgCYR4QvVFdmThIx+DzehMrWT1cgAlK
 T3Qhoef038WUzHZ/DlbH/dPPgKaX5SQ=
X-Google-Smtp-Source: AGHT+IGyUzon7Y3sDuv/jsf8TOVpDmZq0NWx0VOnuKpt5WbB5/GKupBx9Fe8u61b5C9oT2bCxFyr2w==
X-Received: by 2002:a05:6602:3605:b0:844:c750:3d9d with SMTP id
 ca18e2360f4ac-84ce0081cf9mr805663239f.4.1736450354647; 
 Thu, 09 Jan 2025 11:19:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b613354sm466978173.43.2025.01.09.11.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 11:19:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 12:19:12 -0700
Message-Id: <20250109191912.2359594-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736450354; x=1737055154; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K8+Qa4illbfcaX7ao0IIb1amqmo4fVvA31GaCShooYA=;
 b=fSzhLU/0eg0vCDIALnuylp7K7/86ZXKxRzlbIo93EysTJFiNBzSbcJc9mGVz4TwWwK
 MgopK9b6OQoFKRP1c7bPyj1TX7k7YDrBMlmOTq5Ae2VI6l83nVnMUSP6s//mv5CAE9M0
 hzh077VLwzDfmkmzKN0ulLAdzmhzfNPcUa+j/2kJdWt2CwFZXfCUSs1kIG83Rm+Mc9iI
 71YqPLVUnsJRP4Bhm6UtUtQvp7BwgRyKv/qG0yeGSktIQYOtTF9SzgP9IdeWx6h8RuOx
 XDC4tTjpr59/c6kiXQWAN1Tl5D1youvNpUfzYE0UAtaKQ/SCFGVck4p03bNVJU+uUsvr
 sIiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fSzhLU/0
Subject: [Buildroot] [PATCH 1/1] package/python-argcomplete: bump to version
 3.5.3
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

Migrate from setuptools to hatch build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-argcomplete/python-argcomplete.hash | 4 ++--
 package/python-argcomplete/python-argcomplete.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-argcomplete/python-argcomplete.hash b/package/python-argcomplete/python-argcomplete.hash
index 82b22673ee..2ff7631eba 100644
--- a/package/python-argcomplete/python-argcomplete.hash
+++ b/package/python-argcomplete/python-argcomplete.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/argcomplete/json
-md5  947144ffafe463aed8c8eb97bc981d11  argcomplete-3.5.2.tar.gz
-sha256  23146ed7ac4403b70bd6026402468942ceba34a6732255b9edf5b7354f68a6bb  argcomplete-3.5.2.tar.gz
+md5  28fb9dace31a5d6ff98c686d9914d3b7  argcomplete-3.5.3.tar.gz
+sha256  c12bf50eded8aebb298c7b7da7a5ff3ee24dffd9f5281867dfe1424b58c55392  argcomplete-3.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.rst
diff --git a/package/python-argcomplete/python-argcomplete.mk b/package/python-argcomplete/python-argcomplete.mk
index bbf4031c5f..1c78d880c8 100644
--- a/package/python-argcomplete/python-argcomplete.mk
+++ b/package/python-argcomplete/python-argcomplete.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ARGCOMPLETE_VERSION = 3.5.2
+PYTHON_ARGCOMPLETE_VERSION = 3.5.3
 PYTHON_ARGCOMPLETE_SOURCE = argcomplete-$(PYTHON_ARGCOMPLETE_VERSION).tar.gz
-PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/7f/03/581b1c29d88fffaa08abbced2e628c34dd92d32f1adaed7e42fc416938b0
-PYTHON_ARGCOMPLETE_SETUP_TYPE = setuptools
+PYTHON_ARGCOMPLETE_SITE = https://files.pythonhosted.org/packages/0c/be/6c23d80cb966fb8f83fb1ebfb988351ae6b0554d0c3a613ee4531c026597
+PYTHON_ARGCOMPLETE_SETUP_TYPE = hatch
 PYTHON_ARGCOMPLETE_LICENSE = Apache-2.0
 PYTHON_ARGCOMPLETE_LICENSE_FILES = LICENSE.rst
-PYTHON_ARGCOMPLETE_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_ARGCOMPLETE_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
