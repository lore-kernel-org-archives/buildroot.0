Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD7ACEE32D
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97CC740284;
	Wed,  9 Oct 2024 16:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPKdX3Qnlw0h; Wed,  9 Oct 2024 16:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55E44403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55E44403C4;
	Wed,  9 Oct 2024 16:48:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 175291BF3F6
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A64626059C
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RThnsAcQo6Bm for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA95060643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA95060643
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA95060643
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:48:06 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-8353f5862a7so31204939f.2
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728492485; x=1729097285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VlWt6EQkx4L9xOUS13zevZiRs2IdCIm8PP5/UlwjCZ8=;
 b=GMT/BFI08dfQSryKjgYjVrR2NBNW08exlmmtYar74wTqKfgGpRQf1WTXWMBld1nV8n
 We12pNCRkcj7hOhFpc8eo40i5BSYQBigbCooObFHtWlQtvSH8ebXldAlSF6O0B0IcZg2
 QLcl+AdkNV/Kn2PN+oQa7SlPpSF+73JiQuEwqkC5wrI6iLgf1RMFj2hac+arXnRo3Cdp
 WtHl0U0Z5B9dz2soW4zeGvivrKS4oRWdDLOhehvHmLq73L0wwkYWbxF1lzeAbzCLN29a
 0sptVX00NSBNvVRK47vW+rErXacb43h8wJuR5/gRNPxvPicorIPmG/2Lx8avV2yGrIyo
 kAEg==
X-Gm-Message-State: AOJu0Yzo1GaWrcSu/qh4USJALuNlSfZBBiduVpJSoPQqfhb+MHx0Vgpz
 aM0J9rZeNHDKe3b/UI1g20IzCq89FU4aN2DfEfwwPEOyaFzbXhRxNUYFbvGs
X-Google-Smtp-Source: AGHT+IFNwG8b33hB63sfzOtuqnYneYl77ILERonnpCcy4vG/AL9Rp9y+aA16dTJ+TDKTE9+HPnIjTQ==
X-Received: by 2002:a05:6602:6b19:b0:82a:a8af:626f with SMTP id
 ca18e2360f4ac-8353d47caf5mr364248839f.2.1728492485302; 
 Wed, 09 Oct 2024 09:48:05 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6eb56ab4sm2120426173.64.2024.10.09.09.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:48:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:48:03 -0600
Message-Id: <20241009164803.3829162-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728492485; x=1729097285; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VlWt6EQkx4L9xOUS13zevZiRs2IdCIm8PP5/UlwjCZ8=;
 b=QM29zI0GvfES//0gBLwxX6T9XcOPPA83iVtPt9ofluTZ5uYdXGSKFJnHAZe7xoOK1D
 0gp0WjB9ZknWd/Uc9UP6o6Q0L/OcV+/5A3dKDNJ7e1zvyp8WF5ftVQpopEFYd0oknQQH
 XOAa07ohmw9QiMWzqYrWNSsR19G4C5AQPTdp/OaYiwPmFJ1odD2Df6PBZEiAsDhJ8z5H
 HpxmEf14SH4LsI83Jmcc2WWTqzXZv7LmveSDJOdJTmfYMGi8NOHeuI52X8+2yPEW2OMM
 p1/XiTuXL54JAqVJHOK5dIA8IoiXaAMIdTvgicyf7SVsavBhZoSqYeCQ+DktXdst2+a8
 qhDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QM29zI0G
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.28.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index c8001362dc..77d804f70c 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  cfe2461181c5ccc92e0039011898ab12  ipython-8.27.0.tar.gz
-sha256  0b99a2dc9f15fd68692e898e5568725c6d49c527d36a9fb5960ffbdeaa82ff7e  ipython-8.27.0.tar.gz
+md5  2031b37b5054423f1c5009d99da1ca86  ipython-8.28.0.tar.gz
+sha256  0d0d15ca1e01faeb868ef56bc7ee5a0de5bd66885735682e8a322ae289a13d1a  ipython-8.28.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index d88d1ed5af..9c1afed03a 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.27.0
+PYTHON_IPYTHON_VERSION = 8.28.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/57/24/d4fabaca03c8804bf0b8d994c8ae3a20e57e9330d277fb43d83e558dec5e
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/f7/21/48db7d9dd622b9692575004c7c98f85f5629428f58596c59606d36c51b58
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
