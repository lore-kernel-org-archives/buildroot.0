Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB9DCC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59B8607D2;
	Tue, 13 Oct 2026 16:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-l5U17uNJaJ; Tue, 13 Oct 2026 16:43:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C71E5607CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909814;
	b=nTfMBeLgOywjSqEl5gSPSFqmV2MnOsIhWGhJcFnWBOcOH+R1ntkbZLl9J0Z9ZLzqIJ8p
	 XjdLhKaLzecMAbSHJDDBK+tSLdTtRM/ZziHQB8Z+/7u2PpT7NeSLzijxunxqh3RiRYY1H
	 yXNe/lXq6falClR7VnqTk3/NOlanu+532Se+0wOjaacbqHS0hnUMCyAQnt9vl53t4iIZH
	 vf0j5vCz0I9LYtP2RhUt3q4y+WHPWqhXfjOzAMJd8gJ2Kk6Rn2g0+lCbFnFyswYGD3gRm
	 Yfu0nABg+IAZN8F6tEi/rT6lKFd2fXdpKkbdEl+1sJG5ejhgVkbscYxRzoVRCOcCRuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909814;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lJlHzk/OS89yY4jp7HBhYcxdB6YJ0fOjwMaVC1GL0Gc=;
	b=GMLX7VjTUuJCDWHbwDVNQcubZmK6afAglAgRCxyKuTAIBOzfpFkLC/7OpyZFZ74BnFf7
	 1kqxdS/liYViVtY8YgY0ckna5lIv/S7liKe9GSAnMhzmgItNfVnqrAZfWE1/UzTjKQhns
	 Ek6JrAar1DkOkryTvGnTw5mnKoqWcgwJCYnALE7dELxQN726ZIzzhYI0N7G7tXgE5mpjg
	 TZCBN/xqWURVu4hVo2nGJpTDFZDCCTqcQ1T6HBu+GuTG8unWBWr3e7D4Hl3RJFMlOIaXa
	 Fqug4GMDHx2leAJaaqbyrOGuI0xFfuOP6wfoOpGx4GVh0juMMKkJRZ2w9Ns37qrWFvA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909814;
	bh=lJlHzk/OS89yY4jp7HBhYcxdB6YJ0fOjwMaVC1GL0Gc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bPQmf2uc1My3RGa8UZfMCeX7j79ErMlMqHFkeQjsxGdlVt2w9GfqB6dTBG/mL3VHg
	 Wph4S0Y7NFRiZVTmK40mZG5fyFgL4LyZR0z51CVlwxQ3FTEwFdovTXIvJrM+dQIooS
	 TNfVo2VjKfQR9h+T+IFgMgr96xPdG3aArcDz/3O8NKyAqQ1IIFEeMRcAOuIR+36kT2
	 aeSDl5hyTUTOLmaCZP+YBvZkfbbawWdwAdM5N9RRVBybAsnh+lU0EL0B4VOlu5d/d8
	 KncTwBDcCMrSYPwwtSfAaN6+69OnJ7kP56yj+BsOPBG+6HSWKpPY85RjEBRXI8Nfpa
	 l/v1kvi0aLYkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71E5607CE;
	Tue, 13 Oct 2026 16:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89B9A1399
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70BBC400D1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opiSPzLT_m8f for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 739A64007D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::34"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909808;
 b=st+Xtxms9nU75R22ROgQTEcCZqLnEeETR5zshKK6LXgdlOo/fLbMj4aDNvkYCgIUAF9/
 JLgr+UX7/07I5RSK1KH8v1Kdktm/fgLIXihR7e2OxudbvF4vOBB0pSLtUJJQpDXRU0mzv
 xXmckiFjz+je+Qqho+XyLHG4MJnsyseKYfHNDgFxP9jLWyuWx5ESHcD0DOm21EtJV8K7z
 rmc/V4UobjwJhTrTeEGrxreXU7ARggadb2yHLSF62EANOuBp7dqnccQqLZx+KRIoCsZj4
 HcQi1yDYNVgKjGMHOeBiNXtp2Lrdrr3JZuJSkB29qv5OaOY5DcMbIVzGayWmLX/aAgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909808;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=sQyp0MGZt7M16ihHfLr8vnhZ1b1KYxIBPQqxhiWtBGI=;
 b=Aujh//1m1sXqQb/UF7PxjGmGtYUVNypN0Xnsl66Ykx1XZsQ9+7rNloHs/wI8H9eJF8qN
 OGCILoyAyhh9GyFESHnkbFQhsbY59bf+aMn+ta5YtnUuZHE0UEBf1Oi4aLXnhP4CGYDnC
 sGqW8FO0K48TAtTXWEuJ4FN4SjbFYl9ZyPw4+xbhg3iP+WnIVEO76x95C6+7y3+duTCNy
 reZz6UT8Gl/LcLp330rdCX2psw1tU/dkiIS2RbHRWQ1NRFMM9mrkMTdgP/tZmXd0YXkyC
 4eRt/t0pga7we0W9CNhVEWzrV9c61Zt8SgWr17EOuO6OLDVvSOwzz4cYy9rXWkuYK/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FDUzapid; 
 arc=none smtp.remote-ip="2001:4860:4864:20::34"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FDUzapid
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 739A64007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:28 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-4877837890fso1624214fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909807; x=1792514607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sQyp0MGZt7M16ihHfLr8vnhZ1b1KYxIBPQqxhiWtBGI=;
 b=FDUzapid3qW2jg0gRxrEM6aquS41AEQExaEUIIfp+jhawKwEnTxjqMCSVhqpoQg71F
 EhgPcz/bh+JWv4gGi3pAiQl2yjlIlmRjMcOkl0b7Ye+iUc8abWWNVIRRhO96EqtsW+Xs
 xi8mpKV7R2OnXyHGVeIakoEvO+yWL9BRH9nio68WpRitLlgInBxjg1RAgs9ChA3nLKQG
 111tclMLtR5tfLTHRNgkpVV9jERQhOUmfTEQ8mV4tiBfojZbGVhJL4n1Aozwf0aoa2X3
 Y51IjXQ5Etq2wUztv1nOPZbDP3471K0ftc2IXJK8IgNJUfjy5JiPx26rc19REYwwmQkd
 m7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909807; x=1792514607;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sQyp0MGZt7M16ihHfLr8vnhZ1b1KYxIBPQqxhiWtBGI=;
 b=UFlj3lulyAl/PAf/5BLfTnX8nkL+YKGUVW85IVcb3RPkVAbMmvNZENuPW34YtBvknf
 ckW4tdcVDWRX5zB+yajO5Yn1kWdO8pJyqkUv22jI9+GaX/UyKsqPTkuw4V/Fi3DWjoNE
 sW5g2GVOCawTNXxKKs6ofb2z66c5hC7mOOwFebEQUrq/OenxIUTcqXjQ3O26V+zbRaKm
 n+q5f4ApYjKXugRkrb5+8EfcX50ezc/UtGZfcG1f4Hyz7XJ6BV/zIbMXNQvX8hyrVUQ/
 DKJiCF9byx+gosepc18ZTmYfIfahn7XrwE8cksCOSQxjHqSy/emf6yG6v+MjKBPLVqgX
 +hOQ==
X-Gm-Message-State: AFq9FYKp/gaIbgR6LCArPGAXKRulO59vYHRePeD33RnsuHttgDqt8nuH
 6ZXipypilNKFbxJHbEtQwH/mYz8ZN5Va98TFd4ZjtMxEiwNrBXvMUf77C5ZZyA==
X-Gm-Gg: AYBFou1ZsRZUcxPtpzSaKMRVBNaUWKvObKPXjWHSextlhf+TXxYzUi4zwbPxg/neEpn
 ULsLFcXdsTOgDUsoviMvzkpT1ibNcLGh1Zabn1ns+5k5MCoNQxGWSjzwjK5Nnw6CYRG7AujV36L
 qMRDmhYMu1meXEwrjZ0LJIq2KB6wH+jQbf53oJv9QkKKFrj95tK0BC/rpFa9I1cMJY1jrVanyvA
 lUOCZnf3noGskbh+AdDAVF3PLSF5zZEpoBTV0Amp99ge4F7+kDXbf2soaVvuTg9/GhZVWGwGMVY
 QqWXJkuLMQHpz64/+4XIxHAZ2TjlhlOQvrYKLI1chKsngYNKOIokWaSCgdFLrekm71wVL2nAkjc
 XbfiTvrpHNMCmlBVyNX6GX80MhZkAmi8GVSCMBLbD+8XSozbGTomYSK8Phz0qPNXSEQbqOV05OG
 4TTtjfVN6yKzYhvN/1szDrPNrlJ5DmtbclFg0UPxKSo4M3TCOtKc+vPpWa6BvnATacOXF7YJss8
 PsKPyarkd9Qha/6nRwlPKo64dz1N1LUbqkAak2keIpPISugzQBTrscrfiScuc4cMOOg92cpldNY
 pypgqWIx6cSUYxf7YQqbY0Qdn7bS14uhCfxtwy7d+8nP1+e1l41X8jJZbEkO3IeXhe14J5pny+h
 34e7GzIbFzMN5wI64DXXot2qPoZU2X5CUvt3qUN9Ja+MjR9n4vcpolw==
X-Received: by 2002:a05:6870:3349:b0:48f:e24e:6b6d with SMTP id
 586e51a60fabf-4a2a8b7865fmr11853374fac.62.1791909807173; 
 Tue, 13 Oct 2026 09:43:27 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:06 -0600
Message-ID: <20261013164254.1476592-20-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pbr: bump to version 7.1.3
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
 package/python-pbr/python-pbr.hash | 4 ++--
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index 797e4ce94f..49215c5a01 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5  5e6b4341677c4d330637add000f59fdc  pbr-7.0.3.tar.gz
-sha256  b46004ec30a5324672683ec848aed9e8fc500b0d261d40a3229c2d2bbfcedc29  pbr-7.0.3.tar.gz
+md5  94f988adca86448b3a5a57d5909631a3  pbr-7.1.3.tar.gz
+sha256  9a4a85b84e906337708009af0b5f5cdabeeb72d4dc213c9e97974da54fd9acc5  pbr-7.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
 sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index 9b3d34c4e8..d0055a12e4 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 7.0.3
+PYTHON_PBR_VERSION = 7.1.3
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/5e/ab/1de9a4f730edde1bdbbc2b8d19f8fa326f036b4f18b2f72cfbea7dc53c26
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/6b/8d/ce438c28c7958e33184e8ac851ea2225b47a41e5e9e708fa3bddba631135
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
