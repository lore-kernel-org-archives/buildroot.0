Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178E3E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 07:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE21B845C3;
	Fri, 13 Dec 2024 07:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eX4vV41oPv3; Fri, 13 Dec 2024 07:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF567845C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF567845C6;
	Fri, 13 Dec 2024 07:40:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE5D81146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CF9B6143D
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGtfIgNOpmsv for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 07:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B312661431
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B312661431
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B312661431
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 07:40:39 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa6c0dbce1fso188990566b.2
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 23:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734075637; x=1734680437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sqKz5H4jXxcbH2bzf1cgSX0wL6IDrNInRT4O0GtHf2s=;
 b=BSo7mhmaRgUU47qoxeZrCwsvj19UVcRN4UV1SM7+nYpY7kO4Txs344UP/nq4JQ9SDR
 3MCxbqvCjxU+zkkJBX2B7S3Vx9kvdbhTSFwXIjiDJYz5DZFtvrDAabfyoSL4qsc/VcCZ
 5DLCRVl6lJxopjdiQJq/+Jc3JKkg1fq8tJY4MgKLrUrq7Wx8i+LE3uc+4wKA+O7a3qaY
 RLkV/uW1uspvNytDIYETfhXAtWEzLA/H+QRhIBUt+AKOTxYG2XY7/S8uJIUanaoGONPE
 6zGio2wO/A6zuaZNbgBzD+GaiHzEUHt3dexCq9VOvOeM/3TyaZnBoTSrX1L/ltSIzj/E
 +dZw==
X-Gm-Message-State: AOJu0YwrxiHeG0u8VjUL0cu+XUHNZk5+B1NBkTbUgLw2N+ntV5KFN5Mw
 ikbBgN45M0N7BVOl7ywMMjjEb9sbQ+TbTCII9yUVUlMBqYtRv/GA8TlAZA==
X-Gm-Gg: ASbGnct71zIxVYfDBmMw7DoPP3/AD5o+l9EoyniUQfSy4XSYoHKtaUc/CF9U4S0SVWl
 M8NGg+gPxWrlWbGr04R3iJstZ+4LXTfX7474BgBSG5OJG3b1fBMMbfpbFDGJFCn97KixAdDqPY7
 veggxbBFKJiPwR8cNfKVvFnbFGBPAGO2RdYMzlUEJ8AIvi/lHM47hBzT2zz0FDHMzJOL1xztk/K
 8zLuHZDSILRamL8S6HNLROwJY/0Uvat+T4ffJPgJ/78MKHBI/hQZt5KKteVTOiIoFFkGAyqb4h7
 Z66GRVFXcfuve8ap8GOigjK14mWo6u2g5X4JSQ==
X-Google-Smtp-Source: AGHT+IEHLjQihABi3KGytmFVtL4DIpFFjuMP3lWbJjRdN+vgIpbHq70JZRVnwsz/IoVkjOH4smlcOA==
X-Received: by 2002:a05:6402:3815:b0:5d0:d2ed:ebb with SMTP id
 4fb4d7f45d1cf-5d63c300965mr3314411a12.3.1734075636732; 
 Thu, 12 Dec 2024 23:40:36 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6590f5457sm879362166b.195.2024.12.12.23.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 23:40:35 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 08:40:29 +0100
Message-Id: <20241213074031.2674579-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1734075637; x=1734680437; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sqKz5H4jXxcbH2bzf1cgSX0wL6IDrNInRT4O0GtHf2s=;
 b=nM1dR0Df8HKXj112yKGroegQzTtWg2LHr93ypV4LTD4SG5Zbp7E5jQ4QebtT2C5xxo
 aa3bTO6XxS43+H/nqSBr6Q1UNve7U8XsNUdPOZKeAtg5xIMXmY5ykTFAeX/PHE2oPCaI
 7KD8cT9n5ceoV4ixLEbao4Afu1BAvh3c6xS/QspJnKqIz+qY0EE8B52ubyIpxKOMHhFQ
 SO+fghC/LSy+oWBGlpz9rZRVGDqbb9U4FgE5dyYaWulZ1DT2WvbWzX8vOqitsvyR11tA
 D+ogWhZe61+KkP7fAOdVLJBD5BUgTiLHBfeq3AekascxIyh8YJQtHZvujA2oMG/5aY8n
 uIfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nM1dR0Df
Subject: [Buildroot] [PATCH 1/3] package/python-semver: enable host variant
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The host variant is required to build the python-changelog-chug
package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-semver/python-semver.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 29d7ba46b1..65faa8a851 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -11,5 +11,7 @@ PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
 PYTHON_SEMVER_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_SEMVER_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
