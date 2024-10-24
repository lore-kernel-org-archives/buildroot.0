Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E9DD0BB46
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 00:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776884029C;
	Thu, 24 Oct 2024 00:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCTAvXP2bnDk; Thu, 24 Oct 2024 00:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71D3F40309
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71D3F40309;
	Thu, 24 Oct 2024 00:09:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C0FB972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A4AC60894
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACtwEdhBEUjt for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 00:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 725C36088D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 725C36088D
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 725C36088D
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 00:09:28 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83aae6aba1aso13417839f.2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729728567; x=1730333367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E1S0coOlbsZ+hd5HXMH2A99derXkjhbBHIhWo3Xqeww=;
 b=AqikFM5tfTuZBT20UQvb46XWcilBP9HgOJuN1imKrp1CEa8BAwDPMHvqgjz36KNWbM
 +DCuxBc771+lJrpNCiJynip6iTxcxwAKymkE/KTRCurWpCIeXxPep4512bPm4VJyv4ql
 H6LSYNYUrMZFAbDtqYICu/TxrevJDTYeY0PxnJBctzEkRWmhw3W07ZRzwiwbToaBSGEu
 QxmZ1pTJPHaQ4uanHvLmcoG6Dbs2tQ2JzEr5/BZhXrkya1mR/J+XLr1N84zszTioOk2Y
 8vIkqQaqtWZYZvnY6oFYWXlyeSQhasfof7564BQiDXBK4CbJMGTblzz2EyoQRc/rKnLr
 4pYw==
X-Gm-Message-State: AOJu0YwHBPIQNRjHEoj09YYTW+5KKXCJsvrJW8nEFN/VR4cPEL3B1OY/
 3Mor0PY8BNQvopzcT4I08SD9pg3tBs1GOu6yTKP5vcZqG6Ld8Qjy19J2jg==
X-Google-Smtp-Source: AGHT+IHvg4OOWK2MMfZmi8fJaHz6Ue0p+Kk/1cvcoNALYKqTJKpAhOMSYB4rQckkFhDSqDBoCGZLfg==
X-Received: by 2002:a05:6602:2cc9:b0:83a:aa8e:5f72 with SMTP id
 ca18e2360f4ac-83af6163931mr429573939f.4.1729728567247; 
 Wed, 23 Oct 2024 17:09:27 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a60969fsm2444100173.85.2024.10.23.17.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 17:09:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 18:09:23 -0600
Message-Id: <20241024000923.3357714-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729728567; x=1730333367; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E1S0coOlbsZ+hd5HXMH2A99derXkjhbBHIhWo3Xqeww=;
 b=dg1huFMuSF/B9WIVBw6sMvnIN+FX7o42fPWM2KnCOa0++QCk8Hl6IpMma9RNnoQZuN
 /gjaSa7ME1XRHD/4HpD1kvc19nBllMOAUh58UmH5rLG6Nsl7LkrrIC1eihQ3giyQSC5p
 ksG+iiMD7Fy9+EloePJC8V2XztX4h+nRprcDV4b8txRgm1Q/eiykFEu3XPMnTn5vzfD5
 rqAs1DRiszs6197mdjHaESf+urw1R/IJMMVuEror/Jki99MApodyNr4FGz7zgdARuNur
 y1neGOlDidj6cLMOsGA0B1zHoupWg4kzsveK7iVQ6JFYXIGKeE82W3lP97PMIEtTyS2r
 gNig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dg1huFMu
Subject: [Buildroot] [PATCH 1/1] package/python-pyhamcrest: use hatch setup
 type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyhamcrest/python-pyhamcrest.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python-pyhamcrest/python-pyhamcrest.mk b/package/python-pyhamcrest/python-pyhamcrest.mk
index 6631ff1d6a..712fc8af3d 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.mk
+++ b/package/python-pyhamcrest/python-pyhamcrest.mk
@@ -7,11 +7,9 @@
 PYTHON_PYHAMCREST_VERSION = 2.1.0
 PYTHON_PYHAMCREST_SOURCE = pyhamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
 PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/16/3f/f286caba4e64391a8dc9200e6de6ce0d07471e3f718248c3276843b7793b
-PYTHON_PYHAMCREST_SETUP_TYPE = pep517
+PYTHON_PYHAMCREST_SETUP_TYPE = hatch
 PYTHON_PYHAMCREST_LICENSE = BSD-3-Clause
 PYTHON_PYHAMCREST_LICENSE_FILES = LICENSE.txt
-PYTHON_PYHAMCREST_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-hatch-vcs
+PYTHON_PYHAMCREST_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
