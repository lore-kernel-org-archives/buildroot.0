Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59257CA5FE2
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2336960DD5;
	Sat,  3 Oct 2026 01:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNzNsU10viaB; Sat,  3 Oct 2026 01:33:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 21BDF60DBB
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991225;
	b=M4tB4rVc3Toyz3qZ404fMMLATGDGfIbrMI/e205jB3F2Nb+M+c8wcxhfc73jUVeHYVHm
	 JFSrSI1gzvoIMVxCR9qqwH/q3jrGf+IR/vv2lStEjhlSF3Y20FhHraF9P/jInfi8LARpe
	 zGZqeEGUUueJnnddf8DH9j9XyRw9TAi+qnyB9v4YzbPKQLOpDT7ydetrqTbudBAeAlbit
	 SXEU3Vocip5uvoc3Gjufg2Vc3XtxCZ86TfN6GusBSFkVpbtjA7Xd9Rzi5fE/E9DC9+Nm0
	 gAXkdA7Z2/n25DOZCjchbqqtcNzZ8WiubYrjp9Nr7gnccxOVYdB8tZmYrMYqEvT7OSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OmdhN0F25jTDa1/LgMq0gaMCF638l07ardnlfbcT0bc=;
	b=blrFVQtfZHq5q3fkQqRTMwhJna0+LU5QJ1ysMQ2gZY6qLw9fZvy1dLSNFQBT+9g3sGTT
	 9dCVLwG1X+FPPYHeVFl9PuJmATZ1iEtxqkvYLH0leIN1eXDsR8KRw5jPGQbY3QV0mXYIo
	 mUZSYr7r6lh/LPIxcIIMY5nFe9fUnKYMAFVPBcYafMMxG1kyICQqeMKQgs01YNY2JnWOd
	 Tss/Wp7uCMP+Z1j3fPW7azz8RsOiAxcPGGdssF6b9zlLLK7t4HU8IEJeGfVNViVaqsOuR
	 NbuQVLvr0YcOSU+XPB+Rc0Ip6pfmpkkHkJc18Rp1z2RJsmm1ygtPah65zrkfKIiFMIQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hb4LMIqy;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991225;
	bh=OmdhN0F25jTDa1/LgMq0gaMCF638l07ardnlfbcT0bc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JNHZV0mTj806nDou/mC/zkfc/A6r88UF9lYOvi7KDwjGob7uVVxoOhDAiPAPClTBg
	 FF7bgpQzT4F5HB97Z7OqUQm6HplotykOmhuoFwl2Gi3jC4+44BR7FLA9Jo0Bn3JRRr
	 0YS9mO0WrjWPmqJ2iQtcKsdnG874GLXHKBfamG+L8kyZljz/97OxmVxdNxQzFodoSX
	 Qe9WciMlWApV8hYaanFcuxMKk9+hvKo5CUm3fKPR4+TsZxbXJvK/XpbaOTyJDTSqpI
	 9sN7FOtzCzMKfueQ7qrX2d1VaDl0N3ZFBd63k+10wsTL/bZT6CGut1ZEsDVEXOjwml
	 EopxfjGhUfOxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21BDF60DBB;
	Sat,  3 Oct 2026 01:33:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A6F4F1D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98DC560DD9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qaROSekVlTKX for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 78CF76065F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::27"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991222;
 b=c+E8y/vGXcyc/eZ0tIbtFb2LMkE/E/NJyAfUmhs3AIxSq22bZ+8JdxH3jg+ohcwP+O69
 z/EHFgL1AqpmPBeZiJXUk5givWVClEyngP1hJ3tUknO6A+XqFfnF6wSjPjabfNyw10g2E
 eaSSfG2qm+sIbM3ZQcBE++6/t8wydjn0JdPVJlIbCM8sg60HkAf+4ALtXnUz/vAeTLUUu
 Us6UD0SPQ8N0ZNAFT0eO5Ut7qqj5GMeVYFKSejMngkDsRSxUa9ZeO3KpaZDa9mE2CmHBV
 hcqkaLM+5FcNBf/NsL87S00Yt8TF12s1uAc0oYfGqSKen6DKyFDEG4NmOF+kcrdeStQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991222;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=FoPxaR4+15zZQ5QL/DdNxtaU+9IvGX6/9Xfh2hsO6jk=;
 b=cOHTjz80SORkCJ1R7t/Ugjokd4BgT8Fg+QWsLN6Ev5gI7FUYSaVAnnM10mDL6bgHW5Qc
 5xYy8KmbubRU14jn6m//BVzWYn5uVRuh7WZvC25v/kXOxLcbHuErCrZM+0ndgesJWYnZt
 86riPyPH7UE9Vv/6yu+POu8yBihMZBHQZjsfQoQKRRk+oWB4qvuPA0KsPGbXOrsITlSkX
 NWW1UprRcRS/61XhA9EDvuMkb79GTPIWdAr7qvPRiQ9gvksFYjEry47eZfzB6kukyhcQD
 Oj0sPm+WZaLF3pvILFCd4E7R3jqfe7m5ZU1B2oTE/eYcbXQF2D6nfnLOPR4cJmjgwTw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hb4LMIqy; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::27"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::27; helo=mail-oo2-x27.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=hb4LMIqy
Received: from mail-oo2-x27.google.com (mail-oo2-x27.google.com
 [IPv6:2607:f8b0:4864:31::27])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78CF76065F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:42 +0000 (UTC)
Received: by mail-oo2-x27.google.com with SMTP id
 006d021491bc7-6de31c745c0so136610eaf.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991221; x=1791596021; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FoPxaR4+15zZQ5QL/DdNxtaU+9IvGX6/9Xfh2hsO6jk=;
 b=hb4LMIqy7dXv0KOeX4X8zP9hhZMNU4BeLvg9DPRvqgGcq6tFQQMvQBZ1y4GZoiLJ0w
 a9H47IH/dI2KTwXtxaWwAo0sCt3V22SbYkeF/LKXUazi2qKnyHXg6gY81KjFsH9T3vrA
 r6Ncx5inpJmHMFcL56eKXETxnxs62d2DAXjoPU2mssN0ArDd64ddsLyg8DIM9MZ/63P0
 +y/9yTnon0WnoXMU+3MdeX9XghSAEkMhsUmWgmR483+3gPqw20VfpD4DJ4uUNJIhFq5F
 tf+0z5yuOuNBc+D2se8Va+yXmoobE8ZVb1s/YAYxh8EBvtKSAT5TQfgyAha9qUQxedEY
 tsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991221; x=1791596021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FoPxaR4+15zZQ5QL/DdNxtaU+9IvGX6/9Xfh2hsO6jk=;
 b=IQ0FsKAqWuOyejk+FfN2X8nC3TqC84wMvWjcvwgm3rcmdsu/1bp41cn6qA3nQu/GPM
 VEn9M61IeVfhbyzeoENHcaA0pzj62T4RsVx6d8bn+jLI0HGvxUZvax5A0REWC3MmwQ5s
 c46EYjnNDi41ftfPBeNjRRmUWRDxFmlA/Z+9wcwJ2iE3JivjL1pajOAxtw9Fy0DJ/Fhq
 9tGUHSd0+RnEi1LXfpC4giHiBV4k3BsQ53EQhol5l+E+CMshPnDG9FlF+CosesODg+xH
 zb+fQ8+R4Uy419EV5opaa+uIO1Kvr2TR3bYR7thbmfMgbmD7xZ/WEm8uI4Ukwg7Zlurd
 tFIA==
X-Gm-Message-State: AFuF++mh0zIr25d+turdVW0Tr9TbVnKAIW2TPSpcL/9qbradClV5mUBb
 Tdb1xpJeXzMFVvLfkSRikVqAQFhX/z714+/cAuOQOWiswzej6w3Za9W/Nl2lCg==
X-Gm-Gg: AYBFou36+fYNgPu2PeTg5VAmbshRjGXCmq2wPIsvkU/u93kRVR5kAVC/A/w6SkoQCXK
 l3S3k/9VvgOQjbJ1Vh++SAgOCum1udzTd6F9HAN9xYzgeg9+E9bFGtFpwBHEUovOzyjtHKZpdzh
 5gtnYN3vU2Av6owShsBj9Jk4lDbbUrGFhLw8Gddq8Iz+4VBGoGEmTO87DTRP/5+9GB9eV//hHqm
 6BPYs7U6ii59LlaQyFUEewF59ky9yfxRgGYhtcKMiNpuwmThcSklggSK21mHDHnnMIKZTOZiL6g
 24uiA3dFJEa8qj4KZ/Wl+8TdQcuZunsyBwkfUNf6m67BJ/6od3UbvxGhy7wItFRxXkrbLMYeqti
 ZPr8bExyeGyj2N+RaTN3UrmObOVihyMAUiobuCWyi5krWmmtjDF8RowXhWYS+twggfJ+2lyQac7
 S9rQAYqBSbh0DefD1jybJRlgin/BexXpDtQjM7SO9NVMr0iDyvdLHg2WNpeK8q4hqPArcGTOgwn
 BggvhVeejoKG6ACP0NDqDS4QHBFbJdV7bOLgDg+9Eue7mokS0eWVhuFTkelEuxOFrEgAXA8LFVZ
 kzqilem+7/ba8A/y3cQAseulZwb1jPS2h5kSo9MykDaRr/UNi+0EnAkzExvHQ2iTz+Y0+zwmd1a
 P8j3mc6Vw7R3AP2Zt+eRjDHuDvRvWBNiPVJ0QvTk1zw==
X-Received: by 2002:a05:6820:290b:b0:6b7:8396:f3cf with SMTP id
 006d021491bc7-6df34e6e98amr3656085eaf.49.1790991221061; 
 Fri, 02 Oct 2026 18:33:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:21 -0600
Message-ID: <20261003013304.400979-21-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.15.0
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 7da0adf9da..85eaa0e103 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  d2db6a8e9ae1688a6ddf227a4c9e5ccd  pymodbus-3.13.0.tar.gz
-sha256  da4c87afe772787620594c564cd8aa8a4c58ff9786382aba9550fe0ce8879f32  pymodbus-3.13.0.tar.gz
+md5  fc14238eed9f8d3ae4287e82911f9111  pymodbus-3.15.0.tar.gz
+sha256  4c5f715128bfeba59f4c9fb3542b0c32a8afd4b90081111e39c12f7af0c89aae  pymodbus-3.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 2d969b0f65..40f0e14c3b 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.13.0
+PYTHON_PYMODBUS_VERSION = 3.15.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/3d/55/eee0782c2ca9fa8e7c3218caca22fe30e850cd6c0c0d475c10b8c19e5a36
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/e5/b8/03dace16e0e5d1c3eb16e8b9bcce9885f5e8a38db34345ec375cd70ed2e2
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
