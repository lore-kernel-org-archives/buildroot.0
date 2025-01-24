Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4864C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D7EE80D95;
	Fri, 24 Jan 2025 20:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzRkCx1bmXVC; Fri, 24 Jan 2025 20:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B19B80DB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B19B80DB0;
	Fri, 24 Jan 2025 20:22:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07A3994A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9D404094F
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uT4EpavDkdM8 for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:22:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA57B40960
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA57B40960
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA57B40960
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:22:40 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-844ce213af6so74857339f.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737750159; x=1738354959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JCw2pO+J5yHs0uQ6fSymYr9rw7rABAPlkMo/J3Wlt0E=;
 b=EQvhb7jdZxc3hel4WNDtpSxh8gku44nt2w9N4bbqlEqLp0LV3N+wqMZ1uEqU/MDBve
 +rcC3n03bPPU6eFd7MFfrH6O1E5g+DHl69BXivffUIzHryMIDsoWnUoob5YKHJSqywJf
 WWtpZv12tQSuOXMXJRXhRk+stP/74Csb034wkQ3rW5UQoj1ZZq2EIvsl9DQAXXAsxRyR
 TZOUGlx7t2kp2N7hnfi758ExuwMS/5mHFuI0spU0Axp4rpdqA2ZbJQ9ONSmE6CYmfnB3
 xw53Tx4jylIDuyTkYXVcYCbP1DH8KheOjsjfrKNi9RMDk5OqdsTAo1OCepP40+Hq/KEu
 DoZg==
X-Gm-Message-State: AOJu0YwPgdHlLo0Mny9AyookqO6bmgeFSaxBd2Ws2vd6v3VmGceGqPbP
 uRGKv2kyje/lTu3rMpPqdufmSy1IeM9dB69TAetV4cPPUbPU/YPgFKRdecXj
X-Gm-Gg: ASbGnctKWaxD/MVpfi4Gr9j2FTtNZRbxYmb4Um2bbonffNB/eqSSRvnGaxDG8PTNIMd
 6Tsli1PGK2T7j9J6JOJ83zr7YhG6nE23YDc0g+UbkcMgCM7Lk1I7W68tijM8sAlC7gLOOY24jwb
 nwdEmUge1FAEQsf7bfn5pDUko27XWunA8FZ2DegFdnFORgIKWcoL+TXlrWzzUrrSI2IeS10bbrF
 1BoYKP9LUzQOUw2GkxnbovfI4JDh0BBrNlqLFkajnQbzp6eEHdcfcbX5/QYnewKq55UQWQ2GHbZ
 5vvKKm5d2Qd/BNDpeANYmfofbwbbpCxZZiOkgkThccZlMw7nXaNPUQk=
X-Google-Smtp-Source: AGHT+IGqZF3FYLd6vUHtcAhiLPal8vOd7PDq3ANLH4pns29TMq4Gfw9nY6W35N0vLVlzAsDy/NTMiA==
X-Received: by 2002:a92:ca4c:0:b0:3cf:cbfb:b509 with SMTP id
 e9e14a558f8ab-3cfcbfbb7camr27781705ab.2.1737750159624; 
 Fri, 24 Jan 2025 12:22:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1dbb1532sm828646173.139.2025.01.24.12.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:22:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:22:34 -0700
Message-Id: <20250124202234.3851040-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737750159; x=1738354959; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JCw2pO+J5yHs0uQ6fSymYr9rw7rABAPlkMo/J3Wlt0E=;
 b=m7idFd+J48hHEe6FZ5g/suyceYfaH/q+gPveSU7MjsreSDsczI45jkvS9T+0zr7JJM
 /4jqst4bFPRk9nQvttbaVl3V15mggSVixUqORsGx9NnHNmAynyVaz/LOPMzkYLbzu/NH
 n2Vm+ihNoQzNSfgQB19kAFb73v5rg5WfDzpOMGNJSHKUFlYXeBI22g7x5hQamJDbPldg
 C5eDw8BWRMtzeFVi2sU4nPikrJPccVWky470xeu33di60Bm6Gg2kt46eN8ttH7SokALu
 xuzL3qu0g9tRMGhaCxqK1sw8Ve+xk4tp9U0Y9Hea9TKUwiq70lOoyYdaxCAkQG2PRnkQ
 /igg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m7idFd+J
Subject: [Buildroot] [PATCH 1/1] package/python-referencing: bump to version
 0.36.1
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
 package/python-referencing/python-referencing.hash | 4 ++--
 package/python-referencing/python-referencing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
index a19dd4a24b..ebf7208ad3 100644
--- a/package/python-referencing/python-referencing.hash
+++ b/package/python-referencing/python-referencing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/referencing/json
-md5  4cd2bdcefd1f9a9db2d1ea31338b4ae3  referencing-0.35.1.tar.gz
-sha256  25b42124a6c8b632a425174f24087783efb348a6f1e0008e63cd4466fedf703c  referencing-0.35.1.tar.gz
+md5  f76e7b565b6e25c83bc5815c870735b7  referencing-0.36.1.tar.gz
+sha256  ca2e6492769e3602957e9b831b94211599d2aade9477f5d44110d2530cf9aade  referencing-0.36.1.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index ce0e895548..dc70152beb 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REFERENCING_VERSION = 0.35.1
+PYTHON_REFERENCING_VERSION = 0.36.1
 PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
-PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/99/5b/73ca1f8e72fff6fa52119dbd185f73a907b1989428917b24cff660129b6d
+PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/27/32/fd98246df7a0f309b58cae68b10b6b219ef2eb66747f00dfb34422687087
 PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
