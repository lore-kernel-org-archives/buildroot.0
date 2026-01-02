Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B03EFA3750
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FE4E81DA3;
	Fri,  2 Jan 2026 22:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWLB2Pqhlt5e; Fri,  2 Jan 2026 22:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6631A81DB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767392073;
	bh=Nd/kVhPCVdKu+GuYcZEZjUti0kT3FmVDfurLRAeOUWg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EKjreLL0qKTQ+Zhr5HE99bHiuX27N6IvkcLfXNwX32V9vAtbwBQrbkFSYx011kxkr
	 GO/Rp9DGajxGWAG0OAiv961irCT7ZJb3xYwIVXySGm3cgnBH4wsiwzyss8K0ZepyQ6
	 /PKoiGQVReBBaOSaK5G1R8Mr3+ShrsSEmVeGOI8qBEoSA/tnK7PoQzEPkyi+uHkEfR
	 S2dOBIVjMAeLs4WdjZ0if1dHdFpv2OAfvBNpEQdx7hPCur8E0Z9d9XExABwITxsLcV
	 TQR2MnbENyzrCboOtBu6TgGmerwcVbwAfi68BaRqjAZ9O7s1ab/9nL4WKcYAyOxFCb
	 aJKVEz3V1TvJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6631A81DB2;
	Fri,  2 Jan 2026 22:14:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49FC319D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45F4440151
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9qAFt5MMTH9 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4514140072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4514140072
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4514140072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:14:30 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-3eae4e590a4so6389446fac.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 14:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767392069; x=1767996869;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UpwKUzkuEqvYyUpl0wAkm6ZOjztYaZtia7W2XHt3dIg=;
 b=ME2SjIeYVN//haqN7n9NZ0QLjsRaTtvL4LRwHJM2AyPyUz4/85UKNy+XKRl2mJL9Ji
 lodeEdaQSeiTJovmvN6vGFHZJq9hsh5NF2ZhKhB0eBeN8nrACbxWnXh4qvvv6Hnt215c
 9O+d6MOAlG6QOgQ+w3uIKTo20jHiC3t1NppMbaXT+ujaYIgvvtpzegVgJEY4lARt2HEJ
 CTpJgH3FpDmue+LF43L1kSrWWfUI6SwuHqf8UPz41dOUtnc6neMBZemgqJ86FI7LUdyS
 VlNpQlewAxIjH+z8tJQQgEffebLL5H0e/7zhzDDnj6U0zTHm2ktatcVnIT62+h+0XElX
 v/dA==
X-Gm-Message-State: AOJu0YwQa+0wUS0S+lm2vObAtg0VxMPFWlw9IMyhy1viDPkZDa24bg8C
 yweb2r82McGcJKaQNGsSXjSQpwdRq5MtWhA0B+oEcTFNry5z2XJpYH29B8KT+ED0wdY=
X-Gm-Gg: AY/fxX7op4lmd30trMb3HbP1D4oqZbFuffmPPyMaTUMGe2HKYqWUUUpyeOwULX+ABwi
 mK2du3fUTnSDNDLMxSdXCYL855CxCoBpLwf6uusMpVRe7sqcNLyDFEKJTVJQN8ePOoLNaoDmDLk
 JDG2mpmoP+7hZs0MHCvWiWrPvoXPeGY7DFIMjQclSTL4MorF/QjbBoM0nrHfmJ2rZaES7AfbXPV
 /eAF0H3PNtkD+gWU/h7sR/Gwwir6651U/gaHpK7LKhkK4UQnBmeazhHDiNCubbwPDriDG5tSnBj
 0mos4wj65SsP5NvMcxiALtbhFXh20JWJ5xnfRm5aBmXtdmLEfL+IC65hDAj/m5P7HlOKcp0pJ2n
 UcM7WWfUS0KXVVo53s7RcTS4SOg3vZLjSVVfB9mtHGgkTevNcQjBd6c+7CV3C31g7HomcMpN9xg
 aXS8Njb60Ls7FG6tJloX4pjSLcg8KQYQWRG6P8fvjPEHPgHFyAwKE7Dfuj7EYKUExYvNz1hRQ+x
 l08Es7oh8LLvpIy/ldPOZZIfGstyBVvMi3J1sVq0+uKhxHFgOpA0nd/ijtqtRBL/Q==
X-Google-Smtp-Source: AGHT+IFY+rX8w1uXHHF2vqbWOgF13Z6gEp7LroAYkxvkEBJo7T3dva5VuXa7+TrjpJbABMp4MTMzJw==
X-Received: by 2002:a05:6820:2d4c:b0:659:9a49:8e73 with SMTP id
 006d021491bc7-65d0eafe171mr14553713eaf.67.1767392068796; 
 Fri, 02 Jan 2026 14:14:28 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaa8d366esm26193355fac.5.2026.01.02.14.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 14:14:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 15:14:25 -0700
Message-ID: <20260102221425.445648-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767392069; x=1767996869; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UpwKUzkuEqvYyUpl0wAkm6ZOjztYaZtia7W2XHt3dIg=;
 b=lNPfUTVN3D5cO9wJ+b6vZK+3tkX9l3ZVDNB2NZI7iMC5d9d+XZoxowmi/YmsI3vSmG
 bNhQ6g6ZmsdnthyphdZHRdBRA/4npXSYR/PCmFp3scLLCxo1WrjutAMtQ3vbDhdkloqq
 Ra06z47XYhcRFAqoKL5I1vIG0roRUakejCnirJ+Bffqam4ZL65qoJmd1InzXsGPgXe5x
 UdsqkZxU/IhqBs6END/HjAt3CL6T5c+PDnJqpV5QRfd7fD0zmXljL0K7cqPNbD6wANxJ
 zWZpUth9FJ63Bg+FvJ24S+qph2aw0OLMhIwaWmi5eFS+TF/tFkit4lDMrO9reBE03y+Z
 +AEw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lNPfUTVN
Subject: [Buildroot] [PATCH 1/1] package/python-lark: bump to version 1.3.1
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

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lark/python-lark.hash | 4 ++--
 package/python-lark/python-lark.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
index 4536f24e62..fedc6c7189 100644
--- a/package/python-lark/python-lark.hash
+++ b/package/python-lark/python-lark.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lark/json
-md5  06c2015b9996beafc714cba8b7ae62dc  lark-1.3.0.tar.gz
-sha256  9a3839d0ca5e1faf7cfa3460e420e859b66bcbde05b634e73c369c8244c5fa48  lark-1.3.0.tar.gz
+md5  4cd79a5ca06dfc57c984a89a87ef938e  lark-1.3.1.tar.gz
+sha256  b426a7a6d6d53189d318f2b6236ab5d6429eaf09259f1ca33eb716eed10d2905  lark-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2eee60f52d4e11357bf89e72b034d050e285e47fda1361e5662fb322ee27d771  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index b5f195eff4..a52fe73fed 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_LARK_VERSION = 1.3.0
+PYTHON_LARK_VERSION = 1.3.1
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/1d/37/a13baf0135f348af608c667633cbe5d13aa2c5c15a56ae9ad3e6cba45ae3
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/da/34/28fff3ab31ccff1fd4f6c7c7b0ceb2b6968d8ea4950663eadcb5720591a0
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
+PYTHON_LARK_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
