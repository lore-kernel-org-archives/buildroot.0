Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7703CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F26440E4F;
	Sat,  3 Oct 2026 01:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8_qGqnjy1xpM; Sat,  3 Oct 2026 01:33:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E065640E4A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991230;
	b=VaSDzysAAJ3CQCT9Q/H1K+S5GSE8n5Z549hSOAaxnIhrlc7EhumRMwKuZCHW00cKZDJW
	 CNil1pe6ERuNdEqKeaghCwh4aLCYilqeekoB+AQguSCTpKMU8yjeQlD3Q6z6evEn1jA/Y
	 SK11ad2oM2MpbgK2FM2qf2FvO19dOeCbkd9MNx6NsSgZCvZFVuvuA5oPpjDckgHJ1VJN2
	 FB9VSkyKaFGmrGjxfTm5eTmJY3wVUbXLFuNpbyoPdKOGYVvyClkqp6gHC6+d3dCX3M49y
	 N0uTMBv/KlgBob1TVGT1zqvEtrrZO1SXdmkihJsIj1AJRjeEjnQyjcoUW276IGTtajQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=buAjLc7UPHpIULdeFRjkiRGTeNVl5FGbjmNlgKcz+cM=;
	b=V0n73z5blsDpebPt4l51srAsOBYJuuIEZ6Va0sNPyuZPSOHNz72g6M84+f428wB3zrAZ
	 2YDB2D7flFZz5CDWTdPrx052K4ytbhfar9GwvniOrC+anzxsKfHb5N6+6OsomUa5dVNEz
	 GmsbigFbZ/DEG8Ejwh1sG5tnyv3iM/2ExoZmstYRdhPCffGUUVJaNV/7+nEAZ7sMjGJLo
	 +GQJsqEuYEeMJ6z+IqRxKCqpIQHdpwMZizNEYRcJfPHHQJ6MXMtoqAmnCAWkM0LK4Ht4U
	 JJmK1l/HhaVvUOrShnK6gca/7oZNO9Dz+uf7GxUC7eGDDD5q+aymwivwZUDUeHq1gTg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991230;
	bh=buAjLc7UPHpIULdeFRjkiRGTeNVl5FGbjmNlgKcz+cM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lQBkoOEQzPsOSI3TCOY76BVS9vYhr/9Wu0qgJTpSQN+M9QSTtQbXtP6VZ/YX4vUpX
	 bKFCGUnTDnLSUwbp9k/OkNRfGhxo7Ukv6vZd2Kmbc8lv0bfbZRm/5/4dQ7BFhpbBYC
	 pwrgI6sd0CACGTAzYr7E+RCYIxEgj/XvGzKeOgEdxctfmEVYWy3mj2ujnVrEQoSih3
	 NCGo3x7dV2alFgAw3XzXCltCmOw1U6GV0Zx7Oe+uVjkhciwoFF/i2wg/y8+0GQUJxw
	 zdXsn2PdjFZiTGnH0rjoUKchWOC9V3moy5uMHdvdbabNQA+BvPhSE078yBWG2JkqbB
	 eA5VKdDnHobIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E065640E4A;
	Sat,  3 Oct 2026 01:33:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13D3D2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDE638137E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CN2MDW0Fmz-I for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 129C981377
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991226;
 b=cIAVIZkoj8YgeFMtmkzyGqITBt0QnctbJqVCsTY7UqzoriRtX0X+Y4xnp8RC3VEEAWG8
 Mar4XoDn8ZchCXQD7cSWOfJA9gEdF3k1JD6yAQ6O1phXUscoA64YOIDxW4YrDFF27UKrt
 b8EiFrjqkofEfKLDOzMXHAp1hEiN2Y9lFSRaOUQISB8NchXZaHQEshS6WMS9j5NIHNsl9
 exo+eVSZhpX+aRUJrd8v4CSZUnxZ2RyAcELxRt1rk7TYnCq4LBbKiwNDd9xKnVkI9iStB
 mumaW1nMWu5uGhbydVXyT0qqxG2YoYMnQyaXpbmhBT/cfhf301gxq40aQGbpuRy6oeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991226;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=+sJBHs2w+VNXuKSKw0eVSD3BN9lvqLjzVSQ19jooP28=;
 b=GTpy5b+GVWX5C3DS1PC1AKABT4f5G35HOf22+FsNQnNx6EzKD4c71kgRt3liNW5kEHPT
 ZspNDZC84+9ZvjNHM3iBDUuyZ1MNxTp8FWZvNE60RYJpg0/9aYLpOzLV8oDjKKV7IDY86
 eS4SJdOh0D4HdVWpXVYt6O8KCiit04dspq55vuQ3JKikGXKH1xawhvOdIcCLWaut3+Ord
 g5dnIUp6cpXD30Q4/TJSR3TjGTafQbgTbsKuNZaZHvTiJRBaJaGzG/puinhGTkvXHfmrX
 B+9a7/nrmmjRko/EkhkfgHK2+Ij2uhO+1gxHoyOG/2yJXVPo7zoaqONHARSBr+tSnJQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="jQc6KoT/"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jQc6KoT/
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 129C981377
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:45 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-823b938464fso342248a34.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991225; x=1791596025; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+sJBHs2w+VNXuKSKw0eVSD3BN9lvqLjzVSQ19jooP28=;
 b=jQc6KoT/eS547k1mdWR4+vmQfrFK10Lo2b9L2lFVg5hLXkWZUtS2TeJtRCWAoxkNp3
 EEJlf3pgyY1Gy1SBhIbsvXFpNP5J07Cd8hyHQnIk2g3yEEeYYQWom1NCMbebrpzDWVaM
 eS3vt9c7NDQW3BTFnFjhd/FExWLd7mLnKUgOCwJLsEbPeBe7ikItCK4vO6JJqHQ2o4Db
 6nFVmVVmORTryU3yQ7U2ybc/NmNNvvoNGS452GjwQDgbnPsOyJjF7Iu/4zR7NX8RagRK
 QL1HfF5s/qWhAT8wAfIi1snkhhguqCP66B2UKWtyETV5HCEgE2saeHlQte8aiKZ348SF
 9fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991225; x=1791596025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+sJBHs2w+VNXuKSKw0eVSD3BN9lvqLjzVSQ19jooP28=;
 b=NXGo9T+658bGLMGN29iECQELM3qm/cizRJKUeRAN7tHn6c9y00m5/iE9G6CzocwkcV
 VuBlTyAjD5Dc5TDF2wttAtEPHQxxeeZq7jwAuvlmbWLrZ2F6d/woEWtYVvJT/QsyYYnQ
 hWy78excZlQ6EAxUCbxosryp784ofcaaVbL/T4STq7ZhUERVg6aExgGFMoHCMUt88DH2
 hwd5Q+VHy+/LQTDnlu0I40V7NKi+JPq9luaBkbudZ/Z7uplI7c4ufD1ItUNmgjmb30Hr
 THdUuo2oGGpItgP9vZ8ZVQeZqBdKI2MVKo1vNiJda+VCa/3E8wqBkfqu5vvbpx4nrquN
 1ERQ==
X-Gm-Message-State: AFuF++nqYqKPCiUeWyy3oLSVD8Fy6XNxm23nfIuDMnP7R5YZDJoC9bi5
 kqqYC23QanDyKqnOMHaMKQLuUmnfjlMQ76dB4aL5ondGnen0mOARRRP1OtA5RQ==
X-Gm-Gg: AYBFou3Ko7OIIVKLWl/3X/T3X+i3fc6nucTDQUQvVzQNkTYgH4mlgEj+MlJnlxHvbrx
 UaOluB60RxejrxzzbVMC5/gZ+I3/LEA5+//uM5x+gtTtuFy91FLdIYwRNRabEE30gHBwGZ8AaV6
 y9AOGanYe7h/iBByv1f6Vn/Nr9YwDbL1Rusnvgrt88wW2vsaXZu3aK2PIMz3jKvt2UrgVqf+Bfw
 2Q0DgplV9vuz2X3MzAAydFgLbldle1ZyUm4+4Vg7d0AUV+A5MsTnk411csbzh8HnYzgZG55u2S6
 pRP9tBCnMEBiea09KOm54x4hIM8hLkMo/ftAy59tKnL9odc7p+E/rfXhP6N00szBLOXU65z4GU/
 AHw3381bn/SdY/9F31uErt32xvBM4EPDNiONnd6qzygzGqBpm4ZeZKSLe5tVraSb2QCLqJ5dvOl
 pubGoBLicdpJP52avZ5FHxLNTnCreXv7U5SrxUs8v+qKiDQ98IzChG5iLopyDNuc6qHdpV3d1QN
 Pw7h04WCX8JNtLDvmGz0P+lPlOy/3SONpdfIc0hG5GGoT/0QKJYiuiT9sa7mCdKgNCQb5ujbc/P
 DG69s7vcasZkx2QjEc0+bf8NAifStrRtuls4OXvKKy94X5CHlr5cqHQl6a93OuexowHny8Rg3t1
 aTwY96TGQ0GBKuw24m2HCaoCRpD4kYDPNTpJrBpqfmS8=
X-Received: by 2002:a05:6830:83bc:b0:805:2785:fad5 with SMTP id
 46e09a7af769-823fd8f9bfamr1054448a34.27.1790991224929; 
 Fri, 02 Oct 2026 18:33:44 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:23 -0600
Message-ID: <20261003013304.400979-23-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pyproject-hooks: bump to
 version 1.3.3
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
 package/python-pyproject-hooks/python-pyproject-hooks.hash | 4 ++--
 package/python-pyproject-hooks/python-pyproject-hooks.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.hash b/package/python-pyproject-hooks/python-pyproject-hooks.hash
index 54e85e7173..e1482bf433 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.hash
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject-hooks/json
-md5  ed3dd1b984339e83e35f676d7169c192  pyproject_hooks-1.2.0.tar.gz
-sha256  1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2a79a824c970da1f8  pyproject_hooks-1.2.0.tar.gz
+md5  4946aadbb25ac57019c431257e910583  pyproject_hooks-1.3.3.tar.gz
+sha256  defda19b854fa0d3bd4f76ea4ddcba8abd7dcfcdd585a6690ade050744fc5f43  pyproject_hooks-1.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.mk b/package/python-pyproject-hooks/python-pyproject-hooks.mk
index 7edbd64294..31013f9715 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.mk
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_HOOKS_VERSION = 1.2.0
+PYTHON_PYPROJECT_HOOKS_VERSION = 1.3.3
 PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
-PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/e7/82/28175b2414effca1cdac8dc99f76d660e7a4fb0ceefa4b4ab8f5f6742925
+PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/6d/5d/f2ddeef4a855a102aaae5e97826a0260007522ab504421b75addfdb1517c
 PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
 PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
 PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
