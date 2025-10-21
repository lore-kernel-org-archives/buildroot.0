Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A732BCCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 09:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBEA180C3E;
	Tue, 21 Oct 2025 09:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LRHgBOamxFv; Tue, 21 Oct 2025 09:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F30EA80C2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F30EA80C2C;
	Tue, 21 Oct 2025 09:42:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E660070A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3E1E402F0
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OhMBttLxgAj for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 09:42:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E0AB74044C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0AB74044C
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0AB74044C
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 09:42:03 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b40f11a1027so1063031366b.2
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 02:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761039721; x=1761644521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xBmLyVKA0ihi431GqwxbOU2VOzI5PAvLoB5DrO/qiyw=;
 b=MArPpA72leCdxrIqCoATrN/DX7SzHKIbrMEWOcllC/jW4kWu8XeWOrxGUQOi92th7Q
 uiXf3oF+LnQAxrYyKuALgnEkTEPMH20du5LdwZz5sgiQCpyt+vy3+R3k9Ig1dZfrA1eQ
 9WmwMChrNFJ7ZpMEk5YMJUd0DeKWqbyETnhKxVu/JKpuTpWhlwHpoFQZ/l3MyoqP4YnL
 h0edYGTd0GM4xJ1xWA4LGr2Zb7E0IkUL/pQ6QtYZ1mqEYIBmim8zn0p+EU43RXajcWPc
 Z3M4KXIZ25PYvOC/Mzm8FunhTpuaiKMn41Mlhyb8JrBuUBzROgfnIJIB4ykYg/83BwgQ
 EGxg==
X-Gm-Message-State: AOJu0YxBhBTXAe03d6jyDnatsUf3nZ+Td+tKr3cDz2WtYYjVgLLthAkz
 K90yD7PcTl7p4o4QME7fTTi2wt5K0pgD9b+XGY9rYDiN14xpHYwu/mQVXZfJlA==
X-Gm-Gg: ASbGnctsdTCKPcgkLtnNs26kdTuKvJAtZzzHdTkBPUEDt2Eh1PPOv1uctEeKDelCzIf
 Hj0C+Eks1tZ5wDTU4SHILiCpeMACvzRXROVtUkEWPk94ta1hasilSqa0vk4AUrvLvqZUbgcnxd4
 vDsBoTnGtOA3PePJG1XLR4f/9nYoicAQ4X5oA3SJYXfo0xKh5xvzG0t60YmKK4xyqk68k815OwB
 xHdSVzjNjBy1M0CqnwVPz0cQXikoA1kNPBJxkKrcd7svpdZkYf7y+8AWhkRIyVBKGsegBt+otuO
 EiZPKP/ze/qrusNv0iIbFJkhwjw29JhjNJclgF9F3OLFR9xQNheWPqMYUxbQPNDFav7h+FQoDA9
 AlcjnqI579a0zT9BrufQwgYqPE5ENc3eZ7xtNDZYOzCv50qgFpZLDWIAexgDmnEtyejKGBM+zgS
 SqpszJBLpqHut86i0fXI/HeR6/6RM2tEQvXuT5ILPhH5WpeIdLB/4mNmy1ENQTMF0RkNQ=
X-Google-Smtp-Source: AGHT+IGIsXDAEBuuPjnhBIqJWlDGRLcpuhX8E8NcWROMFTEBnlOSQ3dxmQy+rSa5eoHeseA2O19XFQ==
X-Received: by 2002:a17:907:c11:b0:b4a:d60d:fb68 with SMTP id
 a640c23a62f3a-b6472d5d6fcmr1594573666b.6.1761039720595; 
 Tue, 21 Oct 2025 02:42:00 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da2c5dsm1015817566b.15.2025.10.21.02.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 02:41:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 21 Oct 2025 11:41:56 +0200
Message-Id: <20251021094156.2863572-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761039721; x=1761644521; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xBmLyVKA0ihi431GqwxbOU2VOzI5PAvLoB5DrO/qiyw=;
 b=Ik3jgQ/IryPK3Y/WuLhPWtdJDhtxeTiDyWnX/jSPnHU+CQ6RSNskvmVotI8WQOvicz
 9nQVc3UwLtOZx+nAcLYN0wLmHk/wDvUZS9OsQezAp9nrTaUr2tlZ8Vt+JF30MULt8lIj
 NfbQFsyA/JvsyEK087Bqmv5cvYsW1bcgLu5P0wSBr5hw57les/kvvePekyrKOzCztqDw
 OmaHryPwzp+DlFR33iTikYcrLJoSUay/WlmwSeIpYCcTRVPmM9DL/kxTjzD3blAGm463
 iQJDVUWS2YotosW1DlKhiN0f3Y3kurHobzs3VZPBgeI7DxNxOfLNqBJYBV6zW6MNZngq
 LRGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ik3jgQ/I
Subject: [Buildroot] [PATCH] package/python-sqliteschema: add missing
 dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

python-sqliteschema introduced a dependency to setuptools-scm in the
following commit:

b84056b Modify to use `setuptools_scm` for package build

Fixes:
https://autobuild.buildroot.org/results/ddfb25489c17d54cdb44f199c7a8d1646e605a32/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-sqliteschema/python-sqliteschema.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-sqliteschema/python-sqliteschema.mk b/package/python-sqliteschema/python-sqliteschema.mk
index 93d50d1aea..a55ae8a0e0 100644
--- a/package/python-sqliteschema/python-sqliteschema.mk
+++ b/package/python-sqliteschema/python-sqliteschema.mk
@@ -10,5 +10,6 @@ PYTHON_SQLITESCHEMA_SITE = https://files.pythonhosted.org/packages/90/ad/0d7010b
 PYTHON_SQLITESCHEMA_SETUP_TYPE = setuptools
 PYTHON_SQLITESCHEMA_LICENSE = MIT
 PYTHON_SQLITESCHEMA_LICENSE_FILES = LICENSE
+PYTHON_SQLITESCHEMA_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
