Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8902DC0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5171C600B5;
	Tue, 28 Jan 2025 17:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inTpsAwOKVQP; Tue, 28 Jan 2025 17:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49991605F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49991605F0;
	Tue, 28 Jan 2025 17:13:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C893AF7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87EEB605F0
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rp1YLa8JH3XJ for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:13:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AEF2600B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AEF2600B5
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AEF2600B5
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:13:41 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-844ce213af6so162283439f.1
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738084420; x=1738689220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pkcs+4tpRKobN8BYPHoHhzzR8xQq6+BzdiCIEtpvCDs=;
 b=fvBYkx4tMlcK/x3ufgvfSxdf8QmMgKjrx/k/fCBG66bCrR+Ld3yk8XrQJf2Auu59Se
 DrzbPYCWbjymicIytSS0ZLqmqPskba1gx0DsDMWlKhTN1FnLXlwWC2BLKj27SoMRMM9i
 /TF7QihdUa6FYL7YfZ1i/k20iwNKJAwdjX/FyA5moE69tLoWN2sqSsoVhfOJ5rkVKoju
 0ZHI025C/+u6xk9tyVE5RtzWQp4XPzmmcuXh2+5BHbI2GWAg0Xo6zfopfRuSjXPo3zk6
 hGpEy/siX/InBjdhiyNGeS5sSSD5+SQkODjadrUesCRLv5U+9LgNF0x1YIvhDyuWF0Yz
 geUQ==
X-Gm-Message-State: AOJu0YwQCvLUBKALYwIov8DTIRp3KyfdVMpF9zd0OJoH+Mx4VPev6vsQ
 vT2Ekuj/GI4/S30HY7bBAwgeO4QuG6WldeyoW0xpK71TsLVjhozj24JHWbAx
X-Gm-Gg: ASbGncuZgGuKwIjjuoaFONZ8iGLPBejLxte5t+c2E5+uN6iferrp5/22kmvPuMLF2ha
 UjtvaAyGnLbZYIz5HkwWakU1zIvTzlQQO4/g/THpjIlUiBfF56SVW+fxI8OAdWXGlmDeUdbIsrv
 wOfim/G6y+txcTWxiJqPvsRfiWA2PoQ9IMqkDjj9ZULVMNBebB4S9pZM8kO9ZBBNucFbtuhYLbI
 y1WiH/v/dLJWRUQqBGnmQ+iuZYxLhzVgM0zJYoDlCcaBCr3Jyo6JIaPqgdTtfd6RSKAm08I1VYf
 WSQ06rlk6//o0SHDqQ6LRJlfhBo2owPX7YNd7GjQ5LsmhP2w/pKULGOyjewoNLZZiQ==
X-Google-Smtp-Source: AGHT+IFuk/p1VFGkQxPVlsayMQNi3YxTyxWjvG8oZ/mJx5c5ojoAhQ+TY3EU1KBSIbvnjEcr+QjD0w==
X-Received: by 2002:a05:6e02:b2c:b0:3cf:b87b:8fde with SMTP id
 e9e14a558f8ab-3cfb87c4a87mr192672825ab.17.1738084420063; 
 Tue, 28 Jan 2025 09:13:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1dbaf035sm3230374173.134.2025.01.28.09.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:13:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 10:13:38 -0700
Message-Id: <20250128171338.2444939-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738084420; x=1738689220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pkcs+4tpRKobN8BYPHoHhzzR8xQq6+BzdiCIEtpvCDs=;
 b=Tj7Ls4rVuWGo/n9rYMvThqf4axoznBH9P8ppi869fLZZIS/ISTvnX0kcCqT/j4PJyl
 B7ZkCn0YsQBUndEDzTMAap1Acf1Not6kzEVRGx5n5i2bzWUQvYdP+/SfEJrTPZaTl/J7
 Rw3YqeFwUkhAu8ztZZv4JeIfFIBPstzYFP70XnOba0U3wDccWLsitmChHIWmHTAUJACP
 TjV1ucY/xO+zMwLbDItPoeFYUlLhbiyZRqi/F7ytWJsT+1jCJkcvtNCAy2YEuv3CbBg4
 /J2kyF3JSumkRIsAhg1v11Uh82diPFLXoDqY9PnMKe1hC7k+ERw5oMLeFHrDCCZzqdHp
 uNjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Tj7Ls4rV
Subject: [Buildroot] [PATCH 1/1] package/python-pip: bump to version 25.0
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
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 9ecdcbace4..f6b11ee26a 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  ddc01fbcc66b449a9c8dc78d9c13e4df  pip-24.3.1.tar.gz
-sha256  ebcb60557f2aefabc2e0f918751cd24ea0d56d8ec5445fe1807f1d2109660b99  pip-24.3.1.tar.gz
+md5  c698f55e2015dc7dbb5b77c6df1cc88a  pip-25.0.tar.gz
+sha256  8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b  pip-25.0.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 7fe70c9bc1..9ffc0b66ea 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 24.3.1
+PYTHON_PIP_VERSION = 25.0
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/f4/b1/b422acd212ad7eedddaf7981eee6e5de085154ff726459cf2da7c5a184c1
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/47/3e/68beeeeb306ea20ffd30b3ed993f531d16cd884ec4f60c9b1e238f69f2af
 PYTHON_PIP_SETUP_TYPE = setuptools
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
