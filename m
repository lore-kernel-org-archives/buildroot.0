Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33343CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0D87813DC;
	Sat,  3 Oct 2026 01:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXC0mwprgu5P; Sat,  3 Oct 2026 01:34:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 04DB1812D9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991245;
	b=UA1bdgoEf0B4U5kyIMxiwLhbQMthgrh/Nj3H/W5T56pF3JQyi5WdnxQ1Jrm4U2hiMmle
	 8A6DY7jSkW9a01FOqclydkVyMB1b8B/jnFT/l9lxhmqWkmF2gLvlBNfz6pwNieQIyRwcD
	 0R2zdYTyHo82LQejEp9T9hwEBJv+HiAiepOfzdAsrEMAdLO6o1pD+vdjdL5rHMzJUVT5x
	 NepQR19gABJ9mX4lcr506hzDnONm4p63FNcca80aq1XqjTdx5UV0WF6HJHreZ45hi4H5A
	 pLV0FuBiDkvbkpWYmfQMoAIPdTT5rbx5Fklmq9KzfVRwEN2FDRdx9fuI5IREGfj2/kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rtv/UVtMwwDv4s4qeJLjOxZ83KSdvKT3/MftnjGX1ds=;
	b=rSjsilVjhBA4qD2z7ThbnRK63zNFWtFyGV/GhM/wVJUE6Y2iruRuQOqai/cS27Ts8F9T
	 oOHy3XT5cx65XXObAOf1Epx/QHKRbe7c5S5KjKmZtBHXXvYlakcKbE6tZRdSh8tMYqEzT
	 twM6JmPBQYwUvD9nrS0a04JnOywRQgqr5g3eixT08Z5CPPsk1Duw7Iw0Rv4jvKbFI06kE
	 nS0CnbR+LIvsBOsQfBnFWwV/GEZRPqqLNUoveSDi7GG96brRxKkInNy6bd64CuEHxmf1S
	 U76yiGsPvKPJ4CnGQSaeCHYQ8NlqWePvi7DcC3PnzFk9ke9IzOMxRTDziwGgXa1IF8A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991245;
	bh=rtv/UVtMwwDv4s4qeJLjOxZ83KSdvKT3/MftnjGX1ds=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CzeZK6jw9T1kthmIkl3OTIum9xF3S1rlqFvZkmnGq+pU+TY6QEpt+Go61+wD4J5D7
	 yCXDEqcNKbywSR7Ko+QPlrM3ZTCi37jVwrX4yOQBsQgtLU5vmQ+7VdIy++5dMPXqnH
	 tahPMcBRg6sJjgV6RK8UD4LGSiyfo4GntUdkxmMVumT8rWT1hOXTgP708fcuGwO/ny
	 PaH5r2xZX+pQVveDmQXXcb8LKaFCzSp7wv/jhHSBLWwkh0eLgUuh7WF7/Jn5BpyyXk
	 W9IMuUIkfCJ1mC978iupoEQlIQul07/RUYhzYfF4b0sZVw0VPJWQNwb+yneXjVu5a4
	 ps0Tw8D0NJcow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04DB1812D9;
	Sat,  3 Oct 2026 01:34:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C42E92E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6A0660DB7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmUjbjNYeZCc for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:34:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2043E60DDF
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991241;
 b=XNagz+lSWHP81N3g2GHT6xC6JaZ1td62fqqArtKRPLnzVjTYqrAUBVUgQnGfG0fhBGFp
 ydmAgOfZ6L2Tvs6NCLBxByIUcQLleTSXWxgw2Kevrz6YSUbdb5F+577nIIuLuthVnJ0mS
 32WyVuqazxE6hBM9XAaafhjKrHA6w7rKw+NlJNftj12a0AG7PbnbugK2vX95KjvNrQgkA
 HMB4AdTbc5OcjN+NuQF41hUAnLtClvqmmJXDk3ijO5qnTQ9C7kex5gVSgxdILHaaADts1
 NNwVecHBFdWNFQjgYFiITs9rrzhW+kqAsxccUH9nZEEVPB45CCaFdVFXXTfGcUCZ/Qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991241;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=euGKR80PMiGeIKoCdEYvbZhFqzOXp7zX+yl9UWQVlec=;
 b=rmxKsa3RjPR4EPI8t00/AaLyt/SvM0ejWXOAmPQQAnSM0EIM/zq5ZbhGdErlG7SYEraX
 63zNrAWEwkxsKK2rx1VaX1DoB5ZFGnA5q9fUQCkiXh8jteSiTqV0ee6BLrlIRChaaaxVm
 PYy8L+iWfvsrvRA9NSmbobCsoKbm7trinNZCpYZXOKzy0tpRWrkvC8/e1iOBb6H5QUsnq
 nMMfUZPGYq+muSjhBLxJn4tN8oUJ6PtcvcSkYPeX9e+99mM1HrTqqQBm1CrBEFPgDMuRX
 YqUi179v7OwCskW+xahEn2JPEZ6NLorYErXYrZF1cW3WyMYdOVs4OIyYRfHfGbz2B9w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mv3d2c9l; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mv3d2c9l
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2043E60DDF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:34:00 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 46e09a7af769-8226a912bc9so507672a34.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991240; x=1791596040; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=euGKR80PMiGeIKoCdEYvbZhFqzOXp7zX+yl9UWQVlec=;
 b=mv3d2c9lfNSPqah9usJehXkpFGgnarx0re42I5fo3uppsYdGwEktWgjl5D2omWGKdQ
 +54zlwjV8llBAZwxa9PDH8E+czHq2O+PcfdSKFf085T1HCmvnlS3QONttI+Fq4RiNQRY
 TtvFzaDQTbyLxTvwTL9M1KZk2mNitB35qEQ0sz3yi34I1M1UiDMxlKIhfzRW9yPkqiLF
 +soYkax5hKkdouD9ERf6EqoT2eIkqJ7udY6jaDPwYn2cV2YncOsFrT+oXlfVzY7BhHqM
 YvACPsylszdeSh/oDKonGF50/aEBh8QcScJvshR+XqnGT8nWEuQKM7Ydl+pxyj36YUhC
 Ixgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991240; x=1791596040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=euGKR80PMiGeIKoCdEYvbZhFqzOXp7zX+yl9UWQVlec=;
 b=Bcp9RC1H+flCYMQMwA4EutL9yVV9jVkc5pQnJA1zY82X9UtDpDYjJfkXXiVnWfOFC1
 6OiVljO0QowsKfXK4QMz4GUZW/ub+rjzA57KF25Q5b3iK7sOxOuXDOzfLK4r7v2Bz3Dc
 uZdJRrYDIC1cH8aVDkj3wqSkXvYJZ0l5ycunRyiukCQMPV5pdEkQzYtWJqLHFrBLiXau
 OR8DhIDZbqOWizJSmS0O0so0Uw9YANQRGzBHO8tu4XjMag1ZaCWfh/xVw5Ig+Q2meciX
 4raaKLP6BgC31vg2bJsQTKBhAXsdaocsXeoF5oNoo6vh3uJTPHlkG2fefx1h2NuTwMPJ
 I68A==
X-Gm-Message-State: AFuF++m/wDAjS+umHUFrWxZIMwmOotYWF68f1oNJCTwJJKX7Wue47RxY
 K0zw1r83JTlmILAZHuWAqBe64QmCfW39K9h8lLyhabdey/70jSCwkW1+plDAbQ==
X-Gm-Gg: AYBFou2F6he/MapZAe3MUtvWWd+iux93rAw8Bl6aDADakInMFU+5POvAUwQ1q2oLc9X
 7TWwSu2q9vKJH9WQfvi4HM6vD7Ps7Ibk4aroofWq/A4bwhbNLvibhxWYSDf3Ry4BsVVwgiTPm7Q
 Qs7nEAZylyyCmsx/9zUyYNG8+xHWdjEYyfbX9l5VnYiwjyWHd5DVbmLZgW4wIo5EIPTcNEUNQn+
 x3HPEosUNhi2gRqdWYQ/HIBROLyDMbjePWG8+ZqDwn4Ux2bfqLoJDYdHUmoVkOsLgngdXR0ANM8
 TwE3KLXkozX0+h6KwqZl+h4Qc3zbFhp46+dZGRAE27L52x09vExB/3QlVMQHCUyYnW+EWtAGA2i
 iy0kHTFDmmYpyS+syT3vKS3MQF//eO8PU0rmeJ7fkIhpQFaawn1B14Qr06Tm/UwYql0WU1JDyqt
 pGiPviGG0njiXIbSZszvGmsO+BAVzKxUN/et3BDRsW9GuQG3ejDHAx2/eWhXwKEhGLEUrr4jPGQ
 4oMiyt3VAeLlnfm7I/9NXZHC6zXvkA8ModsmcVmyKQZdoK9MoWw4m/R37dlXmooVQ9mVD0hokJw
 zood3/B3CBPhkwIflDMIbSiT/CrpKVEMVnCZkJiH2Rkp7VBQqu8b8QAw6ASnoQ4I38EAEmAxRMD
 1vHc88y5PuXjUtDpC1fn0RSJAfiHwiBmppmhy0rJssw==
X-Received: by 2002:a05:6830:138d:b0:823:e626:278d with SMTP id
 46e09a7af769-823e6262c9cmr1147400a34.27.1790991239783; 
 Fri, 02 Oct 2026 18:33:59 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:32 -0600
Message-ID: <20261003013304.400979-32-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to version
 0.54.0
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
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index cab65882a9..13232df00a 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  4179c72dbfcf49d1e6ce8e42e0195683  uvicorn-0.46.0.tar.gz
-sha256  fb9da0926999cc6cb22dc7cd71a94a632f078e6ae47ff683c5c420750fb7413d  uvicorn-0.46.0.tar.gz
+md5  97795d0d027e3574fa8419fb4da5e11d  uvicorn-0.54.0.tar.gz
+sha256  a2e33cbfaa0306f8e6b0c13e0cb89d7d7a2da3e62b90c66e18c33d9807b28620  uvicorn-0.54.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 66bbcd7253..8f9da07e28 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.46.0
+PYTHON_UVICORN_VERSION = 0.54.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/1f/93/041fca8274050e40e6791f267d82e0e2e27dd165627bd640d3e0e378d877
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/da/34/30e9280707135d2cfc589dfff3cb796bd07a3aeb1a3e415ba09dd89d7bb4
 PYTHON_UVICORN_SETUP_TYPE = hatch
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
