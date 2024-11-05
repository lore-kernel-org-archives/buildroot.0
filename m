Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27FFD3177B
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4EB9406C0;
	Tue,  5 Nov 2024 18:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsIhpyJLczBM; Tue,  5 Nov 2024 18:11:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3836240682
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3836240682;
	Tue,  5 Nov 2024 18:11:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D888C3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9BF5608A0
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15eiC-AoXhES for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:11:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D38876089D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D38876089D
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D38876089D
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:11:44 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83a9cd37a11so225016139f.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730830303; x=1731435103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7CnFFcPh6s8EI6SycQaDKRvGlAAqs0DJiNI+Fbzet0Y=;
 b=k+a/kNNaMooRV1APjiwCXAP2Bxf59jrDpq6EJOP8BnmShq1cPY7XVjz+UVVgR4vRIz
 K5ufWGJmAY/sAR6dRa0fvhFIF+6rhc2rVRmgby9vNSRV0ZgCsXzjgsyLuWQ8eS6v4Gt4
 tw4h/7j06EYD5VeaIs8ViPVnpllWzXl0KFjL2GdSk11ONlYDtkmkOwplAMtnSpk9wURm
 UBFQArsucjUTXlsY0Mfax1MoLajstqH7sk+eX7BMgU1jsNG8pjnNaOSfal8gYeGd1i0K
 3qCwtiFYg1aT5kxmOHSfHWz2T1V7JzzPtB49nnauEcfS/uUnUiN5SxcNJzUMm3C3YVh2
 XjoQ==
X-Gm-Message-State: AOJu0Yw61C3iQiaoVjwlpuQ9kuh5HJDwysAKp42rStrTNVXcBlpwN1CO
 PiuCTQ6adxvBkhPkgnV5sWRkS8xtE/7RMtMTNpYTAOt/kS/TcpcR5DrPeg==
X-Google-Smtp-Source: AGHT+IESGYNdyjDyRl/hnzibEVL3FKJ+v24B9BZz+3YnXC0BRlERyyWgBZ6eGC6L61zx1GqBnYbalg==
X-Received: by 2002:a05:6602:134f:b0:83a:c296:f5b0 with SMTP id
 ca18e2360f4ac-83b1c412f48mr4263305639f.9.1730830303558; 
 Tue, 05 Nov 2024 10:11:43 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04887f6csm2534472173.6.2024.11.05.10.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:11:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:11:42 -0700
Message-Id: <20241105181142.1421388-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730830303; x=1731435103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7CnFFcPh6s8EI6SycQaDKRvGlAAqs0DJiNI+Fbzet0Y=;
 b=DTLc+1Oz9BNrgKMCIVLoHLEDcdn8Jiob5uH3ln6P73w6jmTOhsJBaimmiSrsBS9wGS
 J50VJkb2Hwji+3OWuhVoDCjhyFzCGdeXOzqsmcnZJmdqft/j2EI3SEU3AoiXG224QPM7
 FscrSIR9IB5p/el3ng27+exSbg7Np7yGDL+xYnhq6+4pNZp89645FqTia0HDvUqgj2bm
 Exuw+SIYFquzW86RmXFo/E6NDaeXpYfIqT+ctoTkrfyYzycqVn3eAfU7ki//HxA8ic0H
 bephYaGzfJaKGm0SgcWpv6wfwS/qCVaXK1RQHlobj4NUTV3Hx5/Rol6sdwClnSAsSNCa
 48fA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DTLc+1Oz
Subject: [Buildroot] [PATCH 1/1] package/python-pylibftdi: use poetry setup
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylibftdi/python-pylibftdi.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index b4a9d82ef8..1085c4879a 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -9,9 +9,7 @@ PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
 PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/74/b3/a3c333a250143d204a0bb60de7c1e5f841543231f04c71ff4fa65e5b90c2
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
-PYTHON_PYLIBFTDI_SETUP_TYPE = pep517
-PYTHON_PYLIBFTDI_DEPENDENCIES = \
-	host-python-poetry-core \
-	libftdi
+PYTHON_PYLIBFTDI_SETUP_TYPE = poetry
+PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
