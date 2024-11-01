Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C181E6F093
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B4A040624;
	Fri,  1 Nov 2024 22:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eip39dGoxGp7; Fri,  1 Nov 2024 22:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB6184062E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB6184062E;
	Fri,  1 Nov 2024 22:24:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 271B7979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 148A56073B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SojWOiuBryq for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:24:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FE2860752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE2860752
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FE2860752
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:24:07 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-83a9be2c0e6so93442039f.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 15:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730499847; x=1731104647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BOJrjEj6pq0AVdLSa/64rtlgHh1H2NrxB3J0tNCvuTk=;
 b=j5iXM0RfsdCvjw8V8sQaqK2sKeZiGPb4YZgGxKSW08t/ZgUsP8gvruY+lpxdVuGxVo
 Yx2bj/vz+YEPig4CgTnKDfr2ejOHJWGHNqNjdWipyzYaoIwJXSVTUE78yqpnt3WzMHye
 Xd49YdnlNLO37nr4zJs0M0oD7bUn4dklvWQRuVruXCBSx/0rMb7oKUkTDFQscii1Bt8N
 E87eL+N/eUaLp6x6B/gMGS/qa7C2nhqK7qdgE6xDX9/dSAKc44MojRmXA+8Xdv5GptIu
 UilJrwvX+edM6QeYnig8wBJiQIFeMLFhxShgxjPT4S0SC06HcgO6W5x1tyfGczbtZKla
 uyyg==
X-Gm-Message-State: AOJu0Yyx74A9P3IlXuwBAhlroG/UfpNdDe6efLMRCkuN2d5qEuPj63cD
 4p269fgQ/7pCWEr93eqKEnqRPX+8UVNhA28DIN6tHGy6yGTftoQlcwR9NA==
X-Google-Smtp-Source: AGHT+IF7lYLRIMOaBu2Q8SuqjJIe9DrupcSnk8wOQGe962Gedu1VJW8KZFLaGCsdg+QHEvllW2IxGA==
X-Received: by 2002:a05:6602:6d1c:b0:82d:13ce:2956 with SMTP id
 ca18e2360f4ac-83b719f04d6mr490257939f.10.1730499846615; 
 Fri, 01 Nov 2024 15:24:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b67c7cf6dsm101793539f.41.2024.11.01.15.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 15:24:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 16:24:04 -0600
Message-Id: <20241101222404.1308023-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730499847; x=1731104647; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BOJrjEj6pq0AVdLSa/64rtlgHh1H2NrxB3J0tNCvuTk=;
 b=jVEEVnqRKryfnhRSfeP2FflDGK0mbe1uA332bj4IkhhZhjYNxj3dcQXp2wxCBtsgeS
 9Cs4REQt1G9Gla7qduilhyMEB6fj1DtUCFQWCXsv2pvBRDxQJbfp2CGnnrLL37jUvPQD
 EeeNz+w0TGVxLFS7tAa1dlclj05KGZU3YZkpiTwBeI6ypxXsZfPxdkIdzk2M73OA9nbD
 JokatXnS2+qXSHCXTmICCE8O/NcO7gI7qrFtvIW/FLxtwoOmGgPsT6hjjrpv+JNoU8ga
 hfMAqxA5uKj1Fkg6hI6dEH1TJyiVIwOCJBztzTMk9sBo1XYbPbUL/Kp7JW/fv+gJOcsg
 graQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jVEEVnqR
Subject: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version 1.17.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 0966c51a55..3918383548 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  7b27203f854753afb8e6b0b560459f1d  yarl-1.17.0.tar.gz
-sha256  d3f13583f378930377e02002b4085a3d025b00402d5a80911726d43a67911cd9  yarl-1.17.0.tar.gz
+md5  d356afad18b20095b766ad47bedcb34a  yarl-1.17.1.tar.gz
+sha256  067a63fcfda82da6b198fa73079b1ca40b7c9b7994995b6ee38acda728b64d47  yarl-1.17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 2c6ff3ecc9..c7d846521f 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.17.0
+PYTHON_YARL_VERSION = 1.17.1
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/55/8f/d2d546f8b674335fa7ef83cc5c1892294f3f516c570893e65a7ea8ed49c9
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/54/9c/9c0a9bfa683fc1be7fdcd9687635151544d992cccd48892dc5e0a5885a29
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
