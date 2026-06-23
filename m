Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA3FCD4F26
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 08:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9474340A3A;
	Tue, 23 Jun 2026 08:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtbcU2xkwHoN; Tue, 23 Jun 2026 08:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE0B040A34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782204303;
	bh=lBHmvFWj9CGSN1R0otA/tIjGuTBCRJbmwKD1wMxJrjA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GYrS7CUD4tWu3B0JxDH4+Z88i1z6ZHBJRLc2jKxUqEptNxok44sOGg09h2YwMBmV0
	 ly8nu3VLpasJnz97pZVXQNsTZJZ1x9xmBJNURAyFrT34f2QULOeqhZptQ9teo9I1N1
	 LRJ40rzrPS7223Ct4fi3uYc62GEYdHg5JfNNDkPu5hLeYPlz3fNVTjYI0lJ2oUR4go
	 RvXV53eKkzIlX8iA+9NYKxesfZnIiVtB1dVlkAl6hExfvmnNqerEWIqvS8wn/XHNoa
	 QhOiyjroZ9rOAChvmANg+G7QX/KnSlqihuFd5Qgx8Aza2AWpUyoktzySXcspA4sx+r
	 Dz/jqkTucNZag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE0B040A34;
	Tue, 23 Jun 2026 08:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CC34367
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E32040A34
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:45:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8Izg3-QkpBN for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 08:45:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 391FF40A33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 391FF40A33
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 391FF40A33
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 08:45:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso44196615e9.3
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 01:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782204299; x=1782809099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77crXGK8RstgLR9YOKW7PGFdnep0KYOn9beBoSvd3bU=;
 b=JNQkTkZWOOJB5S5n+sWa1qlZNTuIYfALLNFmTerYVcqlCcjrEQSQZNk57kxo1BGPw1
 EXqVcKUcxgpgw31Rhd5qvFmSTQP5aEZsZYCdxtt1TYO7J0oa7q4GU2j0Zsvi030dnozD
 QuRTtYOIYq8k72xjTeq41WfZ2nGqefw8J0KogTm1dBlnPY0a8tRWfeJwjLonyAcVfreb
 IuODRDwGULdiLIKOoFswb1d1Mgk7/aO53eY5fFx7HZzVhCsWT0Rz/duLCBKt/lKSRfD5
 veyhICPzdZfpsYgLJZp9RJpVUIZTrbhFed8JYWa0mBcztfO2VQ6Jtr5d1ktGUaNgg8Ho
 ZzGg==
X-Gm-Message-State: AOJu0Yxd1GqpElwiws9D2xFO2ky8NCnY7a/+sepuZdvqzvAH5jdH3Vpo
 giIkC55vJW1U00psKLz8M2oKc+lnzhc/ZcH9ArGj6DkG+zzMPnnb9CU4vAV/XLhIUAIZVEZaE0b
 xusrhIf0=
X-Gm-Gg: AfdE7cnvBRCaWBe7Ld+DOYAiTp1X2DtslSaJUU9RJOpW0Wy0Vdpca3yabaNUxGET0rg
 SJVFVjhUldP6UG/y9BO5L9lxmdR+sUefZVvgQVBsHmoT6W/ufoezLE2KH2iojdc/oX/+nIyfG0y
 n0DzCpENeiekeX022Q/JZgWNiFpBgxCi1vQb3vAsBQFU1ao/rlBsI2f2cdwYKsT3X56Yk1sadVG
 62AIaCSJdJG0Dbg6XHh5feWOujllTtxHksua1z5dS/4TRn31uAVlz04XHwFWXE3KGzhiYCE3Hjd
 hi//jZsmmjemF9oEDYVi40IN3AHpzypYr5JfxJ3CNXkpL/KcBPAblsHStxdW/JMj1RxY9W1/Q4I
 0PuSKO9P+IcOhEvl5UiRadt4ib1VZarq8ckYzHZ10IB/Clw2wjqU9qwnfFtzi5PeVo48mV04oWK
 WTGLNU1TBp8Juh8D5xNcruwTuPRzz8JZmgUvTdBdeAQBCWPTPG6DfAjgpIheLgaPtzjSyAOUKnh
 MG29taM6w==
X-Received: by 2002:a05:600c:6288:b0:490:e18f:d108 with SMTP id
 5b1f17b1804b1-492490a7778mr199833245e9.19.1782204298721; 
 Tue, 23 Jun 2026 01:44:58 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249207dabsm490734505e9.0.2026.06.23.01.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 01:44:58 -0700 (PDT)
To: buildroot@buildroot.org
Cc: romain.naour@smile.fr,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Tue, 23 Jun 2026 10:44:37 +0200
Message-ID: <20260623084439.2321675-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782204299; x=1782809099; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=77crXGK8RstgLR9YOKW7PGFdnep0KYOn9beBoSvd3bU=;
 b=0X9+t0WK5HgwXJhXE2JmhVbedoBRcpEpZawevzDbWPLQ7rBtLZapxqyN1QpfZhN5HV
 BJhKZAMhMdJ9APpyXKpyApbwvm8eIvIlP3ZRKXbFfSM2qrskxvSrO+pd4u0r7Qxkc9IO
 4g/lBPax5vKQHEwKNij0q7/l43cU3e7HjXsIg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0X9+t0WK
Subject: [Buildroot] [PATCH 0/2] support/testing: Add builtin-kernels and
 Gitlab CI automation
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everyone,

This patch series introduces a new automated way to generate and maintain
prebuilt kernels for the Buildroot runtime testsuite.

Currently, we rely on prebuilt kernels downloaded from the autobuilder
server. However, these kernels are difficult to rebuild and maintain
since their configurations are not stored directly in the repository. As
we are migrating runtime tests to target Aarch64 instead of legacy ARM
targets, this is the perfect opportunity to improve our kernel
maintenance workflow.
Moreover we will later migrate the testsuite to use this new pre-built kernel
instead of building one kernel for every test, thus saving ci-minuts as we 
are now using shared runners.
The first measurements on 5 tests showed a 56% reduction in test time, 
showing a genuine interest to save our ci-minuts and for faster feedbacks.

This series does two things:
1. It adds a Buildroot project in `support/testing/builtin-kernels` 
   containing the required defconfigs and scripts to build an Aarch64 
   virt kernel natively.
2. It adds a manually triggered job in our GitLab CI pipeline to compile
   this kernel and automatically upload it to the GitLab Package Registry.

More details on how to generate and use them will be described in the serie.

Dowan Gullient (2):
  support/testing/builtin-kernels: add aarch64-virt kernel
  support/scripts/{gitlab-ci.yml.in, generate-gitlab-ci-yml}: build
    runtime kernel in Gitlab CI job

 support/misc/gitlab-ci.yml.in                 | 50 ++++++++++++
 support/scripts/generate-gitlab-ci-yml        | 21 ++++-
 .../kernel_aarch64_virt_defconfig             | 20 +++++
 .../builtin-kernels/aarch64-virt/linux.config | 76 +++++++++++++++++++
 .../aarch64-virt/patches/linux/linux.hash     |  2 +
 .../common/linux-config.fragment              |  2 +
 .../common/linux-initrd.fragment              |  2 +
 support/testing/builtin-kernels/post-image.sh | 43 +++++++++++
 support/testing/builtin-kernels/pre-build.sh  | 19 +++++
 9 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/builtin-kernels/aarch64-virt/kernel_aarch64_virt_defconfig
 create mode 100644 support/testing/builtin-kernels/aarch64-virt/linux.config
 create mode 100644 support/testing/builtin-kernels/aarch64-virt/patches/linux/linux.hash
 create mode 100644 support/testing/builtin-kernels/common/linux-config.fragment
 create mode 100644 support/testing/builtin-kernels/common/linux-initrd.fragment
 create mode 100755 support/testing/builtin-kernels/post-image.sh
 create mode 100755 support/testing/builtin-kernels/pre-build.sh

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
