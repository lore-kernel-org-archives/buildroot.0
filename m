Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD8DEFCE2A
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 17:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE55981ECA;
	Wed,  4 Mar 2026 17:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-HcsTrWNTbH; Wed,  4 Mar 2026 17:56:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D435381ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772646969;
	bh=+RXXUE0s5r5J2dsRXYgTIwIE/ZVJOEWLbzNy87Z4gwk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VNvpI+OZPJIntBx9DCjkHrGjDqyLUQRTZtVtbH92vwE6FvcX8GgG3PQMlPscca13O
	 B2MQbnTeFKaxItDCQMBxvUhsW8507gMfpEKLx/jY01/UQMlqfI50l278Tby6l/mCfC
	 TyPoNAjat6BjpJilX5LqiXTiMll8o6dAOT7hyQkSiTnD+2Tf9fL66mFpX+1h7SfBjQ
	 guntBZig8vpoFzqfdXpWsKY3+wSoQd1jnotX/ovDznZRPFe1RrumzpI9u3eMq2xXq8
	 NRymA13t2FaNtBNPgELkIGzDoJ0bi5huLzD+H77iQaMfzIRIZVGjqKTwElYHr45QLu
	 YROIuGiisV1Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D435381ED1;
	Wed,  4 Mar 2026 17:56:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32010F6
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 17:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17E02406C1
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 17:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yzt2RTVkjdgR for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 17:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 537C240689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 537C240689
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 537C240689
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 17:56:08 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-4043b909ed4so1598244fac.3
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 09:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772646967; x=1773251767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76MeqlPJdIDr/qBk7+bELKPm6J+UQpv8mYVjBA3WRB0=;
 b=BVRH+dZP9+ughi067LzRjyCmEFxkXggVJBdgTX/7LLZuPUN6JYTqqupTvmYHzjOAj+
 8sGS/f0BYGDebrG00YtqgKXRolqhCKO4dLf5jELUH/X1ftSCdKcKYZT2wFefNuuW1bQC
 GMWCKSE8tXOeieBw+gvzFg/xOF1QSCBhPV2xTRfk6YuRtVazZhACeshQt9RhYu4ICvE4
 lst04awcKJGU/Vn1npB0SzVwwYJpVomcYAwESfAMP4ZclFXQ6oOnq3nHZzX8ZPHQT9Ww
 HJXzyszY8LBY+udMrAfH7iVPrk8cWEIMTHk5WKyAUG9zO3tFwdWlE090+JgwdNAWZ4+M
 caSA==
X-Gm-Message-State: AOJu0YwzWOi/s9BLHm/3t0NgFQFd8wEAn6ypaTA/yb+XU5AZWHoal9H5
 jLKEqDpsPvCy/2FA4QrvPg9KTZH/5FPYm4fYy7j7v8Qh0atLH9V6DQuv29+3kw==
X-Gm-Gg: ATEYQzwfQIhWJ2O+7PRhQGzmKuLRqdY4uqKP5TrWiV5yGDur48he+DPLbWNVj1CDSCQ
 gYqZ1Shp1jrg4GDGvmNx9epZexNRt3Lh9zHDW+T6X7IYKuwMv+3PQD6/8gg0wUpbBLw67VvjdMh
 T2yNgsd7A46W55Q6c+ovFe4oezBiKP0xAIOZ22ZOnHUnb/YuKvUSLQ5DVJHqoWq5M6+x+oLQaXY
 cjH/EGNrR3PSOtA7RKfKceAdCOS3Xirn9ZrzEQL+2gxK1Es3NQjgWHM6mM1rdHkg9TB+VO6ED92
 XiG2iNgnD2UaG23XGQVlafgQLsBFLonuDeyRdTtyjpJoiQT+C9aHi1HVUu436xG/JK9XMHYsul8
 qw5nSZA1mRvdSeEQ/NdgXXqSG0RLg2zUtkfjWKkzI+L6xtV3D8oZjFAwoOvB0cLxD+VlCu6hPd4
 S6WIlRIvXeJqtU62QxNwWTZITsm/WVgrTqkbtFim6XAa1xFHBm5tg3TMGX3Kh1eZZbMCem1XTpV
 xOkvONqvOc3AcenWwVkGLX7F5MjLv3AjeaPZy2xh79Y9zKDAY94pcTZsX5S
X-Received: by 2002:a05:6870:9e99:b0:3fa:966:a859 with SMTP id
 586e51a60fabf-416abafe576mr1622963fac.42.1772646966716; 
 Wed, 04 Mar 2026 09:56:06 -0800 (PST)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-41640b99b39sm13627571fac.10.2026.03.04.09.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 09:56:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 10:56:02 -0700
Message-ID: <20260304175602.3663816-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772646967; x=1773251767; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=76MeqlPJdIDr/qBk7+bELKPm6J+UQpv8mYVjBA3WRB0=;
 b=ai9A3FkkDfCLjHNS9RArSiWpU4zCKkpFYk3UaCrswOjmO5ZBTLENfdQkfS45KlupQx
 9OgPgxhz1FALwaA1d610kQEb2b2ZYFAKiKI3BSEBhLI9ZPvnt+GHtJc0m4e3w6j0YXzm
 EKVKqyyZPkdUCOA5peubgdG6zD05XouypzMydD3paXrRdaEx10h0We0lPyFUBZQkeKv7
 c+JOjhEcwjQBFSqsNjgkbzos0ChAHUubyPplJJxhEHdkCT8QReYq9fgob2W0Uf6CiSGy
 vq8sBJsmUpa8klrJJL3PzZ1U3OOGwjvF9sgD/+h0k8sW1e41n/Zo/H+GKjAShmZo9JL8
 9pCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ai9A3Fkk
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 82.0.0
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index d0ed270e9c..0236a13999 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  82e1d67883b713f9493659b50d13b436  setuptools-80.9.0.tar.gz
-sha256  f36b47402ecde768dbfafc46e8e4207b4360c654f1f3bb84475f0a28628fb19c  setuptools-80.9.0.tar.gz
+md5  6e65b88d2466b35e86e5187b99502b1c  setuptools-82.0.0.tar.gz
+sha256  22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb  setuptools-82.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index e013000c57..3c94931fbe 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 80.9.0
+PYTHON_SETUPTOOLS_VERSION = 82.0.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/18/5d/3bf57dcd21979b887f014ea83c24ae194cfcd12b9e0fda66b957c69d1fca
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/82/f3/748f4d6f65d1756b9ae577f329c951cda23fb900e4de9f70900ced962085
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
