Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCE6E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFEA840151;
	Fri,  6 Sep 2024 18:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNyp1qh2AEL2; Fri,  6 Sep 2024 18:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B30884018B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B30884018B;
	Fri,  6 Sep 2024 18:57:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66F2E1BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 544026062F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3fzoQ0eJIcY for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53477605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53477605E9
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53477605E9
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:57:48 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82a3acaa1bbso89077339f.2
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725649067; x=1726253867;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IFxvalZWD/d629DD1XIlU7dn94fzfEqetixk4BKu+jI=;
 b=Ak7nxL0D0f/2ctPkUd2leRc/gsmktKz0yc+WgwfTJdnGIK6H8V1t0paFTFIrX3pOdd
 lGeER9LFAblsFfBSoqI0Be5NT5FynCBfF49Of5jjqIfWOK32jUpeIY+cIBQsvhuRQRnb
 Kq0ndCdcsJ5YHEa3EPyVkD+UepJvjsTDc3j0+bn44gJ//IAP0uiNKVKSAeXJh3VA8nnN
 1KH6sgMv9R0xLtwjW00j9qlRdfXUwzkshoJ7JZ6xRTmioXuZC6f3eF90aMMHdXgGrjvF
 ASmTzjDwOHHh+LMf9Embk7lmFRjlSEyui3GFClDf1blVbiKl//avOQb+Moi4xmarzyNq
 8GeA==
X-Gm-Message-State: AOJu0YzI9PbhYtraTng9xhkcMBvIvIHCNIqbAQIwZLNteNqcLeush0K6
 KWHaAp1kLWAnEjb/WQws76VeruuLAxhc8nwjL50oA9Rqy7L0WGXSsZ/o7Q==
X-Google-Smtp-Source: AGHT+IGP2LXMaZHIfMkkLyZUE+jRrFCiFFEo6RB7owx5z1gPgONs6ScF7yKyve/53oREoTJvy0vMMA==
X-Received: by 2002:a05:6e02:160d:b0:3a0:4e74:8af with SMTP id
 e9e14a558f8ab-3a0576b618dmr2807215ab.24.1725649066910; 
 Fri, 06 Sep 2024 11:57:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f57711cd8sm33292225ab.33.2024.09.06.11.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:57:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:57:45 -0600
Message-Id: <20240906185745.1412933-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725649067; x=1726253867; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IFxvalZWD/d629DD1XIlU7dn94fzfEqetixk4BKu+jI=;
 b=Ltx2m0bPGk+FkZPIr1ajNmgpA9D18wvsdtv2oUYu0FlJ7SxPSIih21OaNZ5hxCoj1Y
 EDhLvzwgyXLx7z+PvG6Y+J2IMMdb7L5OLmZRZj2dTRmA79NNYQNxT7MlK9NzArqtwxOE
 ZbumG8/nS9BV4zuhARuwX9qxXFm5oR6X0LwvgLgh5tfMHAPH4/1baAcNUk22/HEU6sZB
 fviHqSXmYmkRd0bhT2oMYnRcYZGPjwC8ajE8MInh7Fu4BMp3VAYT4kuRlHG4IBxmxDRm
 2C2IVAX9nO5/hJXhBW3z5Uhv/et68yICB2jZDVwBOBr2VTjGJaB1IH3fRcjUywz/00rP
 V17w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ltx2m0bP
Subject: [Buildroot] [PATCH 1/1] package/python-pyyaml: bump to version 6.0.2
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyyaml/python-pyyaml.hash | 4 ++--
 package/python-pyyaml/python-pyyaml.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index e1f9412c30..47bd6d1ef9 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyYAML/json
-md5  c9246277af2d9a13b7018af267a0831a  PyYAML-6.0.1.tar.gz
-sha256  bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43  PyYAML-6.0.1.tar.gz
+md5  9600ee49b2b4e1a0237cf4173b6dc594  pyyaml-6.0.2.tar.gz
+sha256  d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e  pyyaml-6.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  8d3928f9dc4490fd635707cb88eb26bd764102a7282954307d3e5167a577e8a4  LICENSE
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 40a1c25758..1101b59276 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYYAML_VERSION = 6.0.1
-PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/cd/e5/af35f7ea75cf72f2cd079c95ee16797de7cd71f29ea7c68ae5ce7be1eda0
+PYTHON_PYYAML_VERSION = 6.0.2
+PYTHON_PYYAML_SOURCE = pyyaml-$(PYTHON_PYYAML_VERSION).tar.gz
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17
 PYTHON_PYYAML_SETUP_TYPE = setuptools
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
