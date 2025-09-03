Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF0ACA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 10:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B2461571;
	Wed,  3 Sep 2025 10:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7susrHRbLJo; Wed,  3 Sep 2025 10:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09D4E61552
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D4E61552;
	Wed,  3 Sep 2025 10:13:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 161F52BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 10:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0365361552
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 10:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBP-s_NjRp1S for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 10:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 788A561547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 788A561547
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 788A561547
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 10:13:12 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-b046f6fb230so47255366b.1
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 03:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894391; x=1757499191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FFdCIfT8skJpOO5zZEqHSSF4ePRxuMSOy8HRkJEC/F0=;
 b=BtVv+i+scAho0KRAA7tssOItM5G+qC/VmzFSctkfq7m1CZrjnSbCoGuejytKOLYm7S
 2H5nqyrpID2PFyTUSqadNXZPsbAYdnazuuo7lh28L+oka6el/wSWRkCc/NPcKTxsKoX6
 ulrcPc/wgXYnEv5pq7ONyZU0pnqLA7JyeCzXmPeydJYGGQlmn5WXrS0DTjz6id2yWBtM
 WAndK+euPobBRBWcUSOloH9uQKMrq0tCu4ww2Py1NmuE0vTygHD8GvNfRsD6xGTPi9x0
 6TAbwbDA5BdxADQkNupFVxYuJNkUSgD4pwfuJmJYxfdJ8hmwtpefCjJTDnokSsufCcpy
 ZjWA==
X-Gm-Message-State: AOJu0YyRWoC/ivtNDddl3RPUYEM33F3oLdrGKeOjhHsGk8b2cLF/ay1F
 JkfbQ9bmD/rR/zcivu7rrBEF8ZCTtesaoccoGh5ANfzkMwgoTSblWnLoCnCKKqijQWGAMDuhCUl
 07Cl6P6z/1Fkx
X-Gm-Gg: ASbGnct0zpZraRp+0xNJE4HZ7qUPEUnNBA8g3dWQHFgEEe/JqzvD2QQ16SSZyxXU3LZ
 /ad4FQZOkxiAFFWEEI5Tyo6y5RbUfBj1oX04pSNzU2vMVGfUqhA6Pi9Vvf4zhNz6q7yBDQjEufE
 ONudcQSfITB0sAlxgE5dbGRu7EEi1z5yF37T4maZOFP65suCtNZSbZulYmzOwQ6QKHTebX/mgyG
 YtGt9J5gUOUhjDWp3r0D0j4ToY31g17NUwBiZS1kGNFd9LG8thP9B8mnQwt20dxmC/ZRq0eFzG2
 kmOSFNm4BJm2hP98m8tqgulq++v3BbK5WBJsm2KIXfleWDnKQXztU/iOI/9BFNDvXoC3yxdI29t
 STz+y1H4HVSUE+D0Kj9mcsB5ywCOFDe0P1/X1
X-Google-Smtp-Source: AGHT+IEmZdgNabp6gez7G9QZoSKRWW9LZy4ZmHLpj2aX0qgd/NmNsBXp/8+nSihJcKZvfL7ypb7R2Q==
X-Received: by 2002:a17:907:6096:b0:b04:3b97:f972 with SMTP id
 a640c23a62f3a-b043b980cb7mr981302966b.3.1756894390882; 
 Wed, 03 Sep 2025 03:13:10 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04670b5eacsm147412666b.27.2025.09.03.03.13.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 03:13:10 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Sep 2025 12:12:53 +0200
Message-ID: <20250903101253.117289-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756894391; x=1757499191; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FFdCIfT8skJpOO5zZEqHSSF4ePRxuMSOy8HRkJEC/F0=;
 b=I7d+HcdV5tLI9m1MM0vvSJbn3lwR2+i1mRWyAfoaiqdXpeh9q3LmtdG5jXraH+t26E
 GkpxGV0l1oUWKCXcueTvPvMO1dlMpc2Wx+oFpBhtZ6BP0hfBhOAr6kcAGLq3xVGMYNqk
 JT8JPwHPHDn9jao+GEyLMViatw/G0EQTKH0/VKLgryypvf9lqTqVXK+hYCavLD3gepwp
 KUG+cMBZkcEE9Uq27SSYNwmv164Y7waiL+W6I4Es3M26RJrMSfW/QbX9Sa4F1xw8y5IC
 1SvtXfgg0dlsPFHGlJAqpoHmSVRic6vPPcm/17ZxbyfxMIoqGwya135mt+ClyeqemwX0
 D70g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=I7d+HcdV
Subject: [Buildroot] [PATCH] package/netavark: security bump to v1.16.1
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even though this is not mentioned in the release notes:
- https://github.com/containers/netavark/releases/tag/v1.16.0
- https://github.com/containers/netavark/releases/tag/v1.16.1

According to https://bugzilla.redhat.com/show_bug.cgi?id=2383941,
the fix for the CVE has been merged upstream, and is in netavark
since v1.16.0.

This fixes the following vulnerability:
- CVE-2025-8283:
    A vulnerability was found in the netavark package, a network stack for
    containers used with Podman. Due to dns.podman search domain being
    removed, netavark may return external servers if a valid A/AAAA record
    is sent as a response. When creating a container with a given name,
    this name will be used as the hostname for the container itself, as
    the podman's search domain is not added anymore the container is using
    the host's resolv.conf, and the DNS resolver will try to look into the
    search domains contained on it. If one of the domains contain a name
    with the same hostname as the running container, the connection will
    forward to unexpected external servers.
    https://www.cve.org/CVERecord?id=CVE-2025-8283

Also bump package/aardvark-dns in the same lockstep, as advised in
the packages .mk version comments.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/aardvark-dns/aardvark-dns.hash | 2 +-
 package/aardvark-dns/aardvark-dns.mk   | 2 +-
 package/netavark/netavark.hash         | 2 +-
 package/netavark/netavark.mk           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/aardvark-dns/aardvark-dns.hash b/package/aardvark-dns/aardvark-dns.hash
index cef7f262e5..9c502775a4 100644
--- a/package/aardvark-dns/aardvark-dns.hash
+++ b/package/aardvark-dns/aardvark-dns.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d38758c5cf1a732d34c8bcf8f4d3d49d308903206082721c6099daf89fcca87f  aardvark-dns-v1.15.0-git4-cargo4.tar.gz
+sha256  629df64d5d713b5b78cf8d9387de12d84b88103a8581457e60c7697cf64ad83c  aardvark-dns-v1.16.0-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index 1d2e06fd03..368e52ab39 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update netavark in lockstep
-AARDVARK_DNS_VERSION = v1.15.0
+AARDVARK_DNS_VERSION = v1.16.0
 AARDVARK_DNS_SITE = https://github.com/containers/aardvark-dns
 AARDVARK_DNS_SITE_METHOD = git
 
diff --git a/package/netavark/netavark.hash b/package/netavark/netavark.hash
index 0f6d3976e6..8e8adc4ad3 100644
--- a/package/netavark/netavark.hash
+++ b/package/netavark/netavark.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1a530b275d73c937c63d513bfe3f5ac3651b9346fdf98411b16fdcf9e1cd59b0  netavark-v1.15.2-git4-cargo4.tar.gz
+sha256  1eb17a5ed223928bdd433e0eb8518682ae71dd02981019fb726a9330d7166b2d  netavark-v1.16.1-git4-cargo4.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/netavark/netavark.mk b/package/netavark/netavark.mk
index 4a4038d02f..1754759bc6 100644
--- a/package/netavark/netavark.mk
+++ b/package/netavark/netavark.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, also update aardvark-dns in lockstep
-NETAVARK_VERSION = v1.15.2
+NETAVARK_VERSION = v1.16.1
 NETAVARK_SITE = https://github.com/containers/netavark
 NETAVARK_SITE_METHOD = git
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
