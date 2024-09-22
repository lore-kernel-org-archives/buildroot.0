Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ECACF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 05:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 200D84011C;
	Sun, 22 Sep 2024 05:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEGZZL-pB4kD; Sun, 22 Sep 2024 05:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1B24402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B24402E4;
	Sun, 22 Sep 2024 05:46:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7C971BF3C5
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D41998148F
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 05:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gg4huTloiQcf for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 05:46:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1F958148E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F958148E
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1F958148E
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 05:46:12 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82ade877fbeso197763339f.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 22:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726983971; x=1727588771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+1bWwCuhFxaL2SYv6YkdbYk6z+31dz4NKN1oJISl1zs=;
 b=uG/0WZN3Z49TMzKNszVMWaJosehRIxYaONBoPdKWaLAUa+RGs2ND//n3ZSmBRtGgu+
 svo2pg92CLg9i/TlT9+Aj7Zc6uzlR6o74Yc2s9F+CmGDKhjx9Ntu14CkJmPAWTskpbae
 XQHaLahNTBXSo2UPdKX4krPIc6GH8xy8ToKikUEhP6jCbUby7Mhp8LPjLsgFFXH3qg22
 gVzjXZIPPt2vAUf2TzXn36eDdUT5vqIl/8uR2dWaGWSM+PAjYZ9VdcFHoCsayyFO/O58
 p/QGOFSn+bgZHcENPd0FRus6zTs5jJ8Y/V7E1L/BqYa6HwvIX4bzFjWH+VKK1y7Hr+Cg
 jUJQ==
X-Gm-Message-State: AOJu0YyS4+7TeSm+WGrBJtI0IUhIgmEAFpjQClgTuzXmWQLD04FPU6j6
 K+2Dm5b57d0bD8rN3OFFbDwJ22Uk5gufFStAB7gywbSwjv7Gs0R6LkwhHw==
X-Google-Smtp-Source: AGHT+IF8NosKhS9TzAptHXkqFuLrY29k4J0Iqj2cSZEoG37ok0Vjwehntel4l/mbNWRkIMMYpJFY+A==
X-Received: by 2002:a05:6602:13ce:b0:82c:ee6d:a7ee with SMTP id
 ca18e2360f4ac-83209cdf027mr683201639f.2.1726983971638; 
 Sat, 21 Sep 2024 22:46:11 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec1eff9sm4463659173.58.2024.09.21.22.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 22:46:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 23:46:07 -0600
Message-Id: <20240922054607.946074-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726983971; x=1727588771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+1bWwCuhFxaL2SYv6YkdbYk6z+31dz4NKN1oJISl1zs=;
 b=goVCkc/E8Yjhis1g0fQwoNpceBkrON0RL1KBMNTPv6Sr30QQ2wspuQztdQx8T9HJaV
 VaHZP8aPG4b42pMyqoFC5l4y4HOwP+1xdNwZ1tEXZtrxkXWRE9dOrbmlJpjpBDoFglWS
 wKpM0Pcnf6OtoSb2lzIwyidmi94iC0hglWfvn1htMgfMGjhJZ/8y0amHuWLr8E2DirV1
 k/CHFd005Ao/9e0eqrGyy4+biSCPVY3ONpL/k6IB48W05KLTJPgxEvuvaaJt4z5iz3FC
 K0YH48jA4uXZqUoY68eSJkMCfpoU1NJuM93QZTDG056PWlVyju5A0zH4avzPFi9gFfZt
 Ke4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=goVCkc/E
Subject: [Buildroot] [PATCH 1/1] package/python-types-python-dateutil: bump
 to version 2.9.0.20240906
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-types-python-dateutil.hash                         | 4 ++--
 .../python-types-python-dateutil.mk                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index ef5e9380cf..4a2dcec502 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  58072922ac0c740121e311e970f003bf  types-python-dateutil-2.8.19.14.tar.gz
-sha256  1f4f10ac98bb8b16ade9dbee3518d9ace017821d94b057a425b069f834737f4b  types-python-dateutil-2.8.19.14.tar.gz
+md5  0d91422e92000e77d633a8adff3039e7  types-python-dateutil-2.9.0.20240906.tar.gz
+sha256  9706c3b68284c25adffc47319ecc7947e5bb86b3773f843c73906fd598bc176e  types-python-dateutil-2.9.0.20240906.tar.gz
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index b230394120..c210d71b0c 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.8.19.14
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20240906
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types-python-dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/1b/2d/f189e5c03c22700c4ce5aece4b51bb73fa8adcfd7848629de0fb78af5f6f
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/3e/d9/9c9ec2d870af7aa9b722ce4fd5890bb55b1d18898df7f1d069cab194bb2a
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
