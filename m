Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602FACC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2986880E3E;
	Tue, 13 Oct 2026 16:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4M4tCCj7uTn; Tue, 13 Oct 2026 16:43:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EF7B980E4B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909823;
	b=EhHWx9UAuXgqi9ke4O5D9TMhI9CR9QO8LwfVSCankKe0dQAx2U/jK/UNtZB4gJVo0141
	 cmkN6Y7bEF/fgj4MsHJZSUNKoCYfnXAmRYvZS7ikKYPToRudyH9cGkhB9HhKLUDgy79+l
	 vbt9HylXsajX75juloAaHMmgSOeKlL0VTUDvPqnOLO/0guRUOM4Cpuv2M3T7FqI32mEgF
	 OiXi9n19YGjclivmcomerONXuDlMdbWM3tHYTZm4nvrZpjZwmg7asvW7XWHSREsw6YGZZ
	 gHYVtBLhSYTpiRTQRD9zT2r3AtEtex5MdK/2BPyTRr94hKcpi1nmomkE75AZsEc6afw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909823;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=JBoCM//3kkY3xmiAozP0Q2hAb8lv7rUbBIutrudOVO0=;
	b=MiGQyQwN4Uy9P//OhF3KpzLHaqW6IeDcKK06Pg8Io01w1I5wKOwV7zXKQuQdJJuRhSuX
	 zFxtvd6c3eQbZiN9saQbRFIMYH3/1JkQ1q5vaGys9NuiOjCZezJD6eVloflsyHZf1vcUW
	 PtxaTFkhFbgPPSdBAA/Ahm80XQ/YxTarELdkDUcicU6eQ2sb2iksw8N8o9RJodW6uLcif
	 O2j3g0E9IouGFYRI97EWzdFT685GalOFLtdUah9lg3e5ywRp+wZEVky5oR5Dh/e0Ee38j
	 JuU2uAHICLAApzOhcDrlvjLzrP1owPIbBfICaqbyLfntBP/s32lK24Mr9MgswtQnhnQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=POsW9Eia;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909823;
	bh=JBoCM//3kkY3xmiAozP0Q2hAb8lv7rUbBIutrudOVO0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=WQ9dBeXBPDPn6bA/xvu/rM3aQ8fYVsuX7EjaN076+GNOvAGYxGYWDPEbceoaSZbvg
	 M00tP6sFSo356fdHFo/cH5S0cHz/LIddRHReq+wOwv1cgiImB8ZSrPLV+6Sm1S5yhx
	 BYb61FqC+5Kt374nPUBTa5aRtLPcS/K/kT+UF+xfUwS4Q1EH/w+7onLy0LYdakFTEi
	 p3mRGmSIQlMM9XLpX9paPSG6Qmhh68hJS2r0X6q4pC13JmTor89WPNaZh4dCZkLvhr
	 csEfT/UzB4J/x+qe41YXjqSbSEVjXx+d2vIz/Ne7BshzeMUgbLQsIacpUernRETBPg
	 KCZaMhkyRIXfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF7B980E4B;
	Tue, 13 Oct 2026 16:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51BC8DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42EE080E48
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfz3Cpd6oJ3W for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4165D80E3D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909816;
 b=Cht9ZPPS0OUgXUxoH4YNFfjrQ4PgSfZy261t48M+slGzS3BKRkYXTkLC7nkvWWczAU+C
 ND370VTimBUT70vvc3HrWv0xegJhsuAcdhLz4twjIeeXIs9dBCe/TICHoZGtNcM4id0nX
 ZifcscW4oVqb4Jm4fEbJkZ6Hn5IokUK51UHEEz9e1BL4ctJNxIeq8TnYkAFoFk1RY0OL1
 CwJZZlwTrTNyIkQknSU9k/H0BMSS5h3Sfc692kiCIcIJnuDzY5WAFGEkadtU2I4UNvkS7
 k3+RMhm/E0bGR5UQgHi4Q8Czcg0RhCiUrJJo4IjPBGwH7jN/15RAIHUcm79mEanzV7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909816;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=rq+l9mT9l8SfJv7NvgODAaZhz5crxDvzvcvJZ9QZsZo=;
 b=NlpE1mKxJyC8GPGTKFSfLJ/v1119P3UECl6PjYbFdf9aN4WRIjrnCV/NSNZN/+eehfIf
 +Sxd6GpBaH//mhIcVZfhgSLrWiojQkN6vbm8LGTzAZovJGJSFOVWkY/iAOWNMX9uyRpnz
 oigaCmsvKxxHHWl2e1b49bwo9R2rZLln4Lbe5eGDbtV9BZH6TCFGmb7WOynxEVbNpelUP
 0eZUyPVRNVcWfWbK5CKL8oYBLcpIYTa8mFAfs+5nDEknqrGsDPzN+aYVOvnefKETjFaib
 QvXaY/UUfBBqKoIBqU7negtSGxSv0oq5RfgfszFNGCs4y/7KQH85c53xYcdp8G+3J2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=POsW9Eia; 
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=POsW9Eia
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4165D80E3D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:35 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-49dfaa16190so3789737fac.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909815; x=1792514615; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rq+l9mT9l8SfJv7NvgODAaZhz5crxDvzvcvJZ9QZsZo=;
 b=POsW9EiaA8uQBdcjDikaU3f215nmx2xfXDcIP9/QPuuUlTx34mfe8rQBzk09MZP2hu
 Aq/0yELkc67OEEQgVCTghxrQXRYe3x6R9o939S+qxbmCT9nygWH50c2zeDDbRr18S4ju
 kPy3tKds40dXmFIqeqnTZKTpUyORHKoNz7Qoq0fvvC8io1IO0+UC67sVO7GGgDn71zc+
 /K8Z7F3lwDZ+zddHgLamgyMiHUBjEj6yw/xaH8p/+t3LK3wHM+W1mBBJ/DN9g8h+4+WC
 FKpInI1Zcdi2aRgRZNwqsoutsMms9kwEW6DctvF1s8+8mjKpL787GB0tk74M5Lp2h5Ue
 NdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909815; x=1792514615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rq+l9mT9l8SfJv7NvgODAaZhz5crxDvzvcvJZ9QZsZo=;
 b=THgv1xAeU7Th28D39hZAmPFgKovZvzU/pbrwjDbOnD3xxNa/8zGqu7hBQYb5WhqysI
 cXvMmL9bpcA5MoFvq4AtSCs6KS2jIepg9o5V7E95nWVUsgLKcxZv5DnUWxK0Wvl4r/yB
 EYuihA6FPb9RQFA3d+PjYSQN/gXaqJooIe/vD+BgpjHCLzZarJXnsanTK3k6+3F/+vJY
 69xrMP/zcCOpd+r9indqhBsBSKIZwiLHUBnSyTYZ/BDQp1HbJU+j4mNheCj80o8WIG4T
 hIKuyDfg0DHr7HUJ2+oQBwSlz9i1emX4jPJGOwo1XdAwgBy/gqlqL66ohjgoL1fsvVT7
 VwEw==
X-Gm-Message-State: AFq9FYKd9zKZQyzfJrwvCxxQut9r7LDTxQopkjSCeD8hlGrJPAIJtRtp
 kOgD6Yl61w0eDCrIcwht5YoAlKfYEmm44dMktTvY3bDoCdD41wXHJSY4UGJGiw==
X-Gm-Gg: AYBFou32VT+8b/AHbs6aQX9jrlx7Cv/dbcTCYYzEp4X0roDr1qc264hUPppvMjDYuEH
 ocPnUP6SlNlwQCcn/5eLnPponIquXFsa0HJgM3yUeJE6LMq2W+caHggwUo/99PBakbVIuDj75A4
 kT7Ae0xZC+oCujz3hUm+O5xNUwcdutUvcpLhY1mNcB75iIuIxTkengVqKvDrip5k8XwjPaDUzod
 jsiW/zvPv6bsFBpYsIJf3qTL7OaG2nAuO+w/zOSSfVL41+t18BNXQs99S3PkzXK/dH/30Zs/E55
 kOfJGHVO7iqXTyfR9LwCMdUb2mpk/u3ktdMwL1zLpH1Rg7fmvJhIphl30sJt9hlKE41vVuamRja
 Pha8xoPt7gy9cREvFmMBFHP5J2uSmAAd1l3ijKx2r+S5mRkxEf6f/n4YLcmEqXvbXU1jwkm3tzG
 ePiiEonuQDT3CVFtyXcbp+LPUrGjSsxx+Zy77gzr/czeIIqchkYF1eIuXKeG4V+sgAAusspPvhR
 /mFKvo543Ug7kT8qEIHvkH3zq6kLqQaHPTriGwJ9Ju9/9Xh3pojxVjTJoBwvKADeyTRkNpQDXcm
 H2vTSRBjfDQ+uHpIK2nP/ClVOWDxyQEHzOK3oC4unXQZUYIY8ZaI+vHKNNsiVMWpgnn4Bm8eILh
 KXnvWmNvsA85QRljcQ1+43YnxCf14dl+S4nAS4jghFpg=
X-Received: by 2002:a05:6870:253:b0:48f:e0f6:bd4e with SMTP id
 586e51a60fabf-4a2a4b1a988mr9234067fac.35.1791909814954; 
 Tue, 13 Oct 2026 09:43:34 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:11 -0600
Message-ID: <20261013164254.1476592-25-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pycryptodomex: bump to version
 3.24.1
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
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index f0b9a052ca..3d3c72172c 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  f8298c5255a43e033703f758fc7c688e  pycryptodomex-3.24.0.tar.gz
-sha256  0428f19f13452c6b89bbaf2c530f84f369873811dfa77f0cee0da4f40fb0474f  pycryptodomex-3.24.0.tar.gz
+md5  1ae989574479d8b5f5440a68a4159148  pycryptodomex-3.24.1.tar.gz
+sha256  09081666ffc599976c0b8b29caf2cf82212c0f05bed233c8f8ed53e4f6e1d356  pycryptodomex-3.24.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 72f91b0c9a..a9ec4b25e3 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.24.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.24.1
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/4c/25/214ea825a9031f5af2c8b2506ee16701a2560d4712165dd00098dd527bcb
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f4/e7/50e72301e32acb73a314e663c2014e1ddefc019d5f434ff14ec89861d664
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
