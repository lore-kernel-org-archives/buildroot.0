Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4F5CA5FC1
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 19:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A24D340866;
	Wed, 30 Sep 2026 19:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzd97bgfXHsX; Wed, 30 Sep 2026 19:36:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BA4D940AAE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790797017;
	b=jqpT/S4rVTgEZo9U9knlCi1EkMT41dOXLVwYQIjcWqG0w5y/sMziMusgJ+J0dUVKllY4
	 m8y1G6rWgOfXfdinT6PD5dqd6nk78g77DZtZdKcf4H+GcRNi+D+e6hMfCTC0zbp8CrPBt
	 rKTYr98SVnvUAz1IsTfVZS8iCV5j/OhPWOkJcRdWESp3Cn+CG85QZSS5oRfZzBleEyfNA
	 g0oIWpuS6GHMNy18l7YOAPClM+Y7iGWRyndfPor+AEnkQ0T//kQbL8qnExmw57IUF6flg
	 CcrlTOhLnVsZ+WlVhdc8tb8yV8hJei+VQ42xLSjdPy2UUnoigqGxaxKEk4qIuDEi0Sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790797017;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GbXccKFp40sHlg8BTWROS0juF8aRtqwZhKaZgu8XYSs=;
	b=HQEOHdm88f3Nmd3slF8Wxt1XrwMNXA8AcK7tUykk995S/J1rmqpdSf7kfZhlqDlpRoad
	 m2WXAr1hLblJHNkboNT4HQe5b16j70i8H145CsqllZ5UuyW8aDEJkGXRB5l3jpmqUf4DB
	 ak9HZhrxmu7TDKHU6lH8kXgn1RJ/IYzyLAXXB7oL2BYbo7H5EON3Pc69kyYHtUw6sObz6
	 /oGu4Q8t0aEtnffSWx9JRXoOv4OOIGrtylwOnk+lTKyzJD2CExqeByR0PNgD/eoPbt+c4
	 ieCGYsCWFOw/xehkYzZhXKsP/kbBAkAv1tA9lD8sBD4f7i0ti+NDCFUj4Huozn87SzQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790797017;
	bh=GbXccKFp40sHlg8BTWROS0juF8aRtqwZhKaZgu8XYSs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q9/ZilinVhlkL94q0NJCoBH+7x/8E7+3jcTOVXZ2cMf9IDlBj2Toe/ZLD5KtowpBB
	 G2sz9hvo+vKGG5hkSyugZMxV7YwbVo3QxJncwGA4OIrzgP3EaJbLa+mLlT3rX0TZJz
	 D372ZQ83kdTKeRWzRUFmJiaKb2fk/GFgGZHNmOnsLwPfMa4clX5+p8Wfw8PTDFeqjo
	 stiLDs1vxRK6R7M0mqdvxd4YQNoX7e1mkys+9z53l6s0+W0bjWJAwf7aQZDVE1yP8m
	 jg2K+ht2gXzAO45m9RtWxXPRLM/XVhSHlxZjzRoWUl10DY9xn77xaa/H5+8dd+/R+q
	 Fg+SkxkuqEtMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA4D940AAE;
	Wed, 30 Sep 2026 19:36:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EA31314C
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D05A681124
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELNimRSqt7B2 for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 19:36:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1BE77810B8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790797015;
 b=adKMtXoWG3BNL+TCnaKVoVIhSPasYLGASwMvZKngCUI714P9rcnJxl3jFvhYiDGdLMXB
 ud9WkEuPJne4tt46AR9SU3vKFeftZ92UbeXH8mbWXjP7+MPfgY52eNnptIq0WsaRM9hxW
 6TWOTicGZyruB0omMeToMkPb6G4NIiwLZUcyXhJle6COgbZCguKMUgCGbiFt/4vZGwn9Y
 o/pv67qLn9EmTXEWXXiTPaeAtUrAOpj9UbaC2WiCQH5X924lCKM3ESDES0Wq1dbiRUAss
 j0XvVUNa3JeDq7S70rFbigCLzixbTb2XY550uAS/34B5WBlzg9DMX/Ultvl7yGfxaTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790797015;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pKIk6Vo3RWY4oErTta7vlAOKUutWdRvehFdTNglV8eA=;
 b=W7Fc7gMa7DMGmygfiENDY4a1lQ5v3IOtmv5tcW+pk4IllSmFFNZJO73uyfPm7pTh0nMm
 C53wyRybL49AU/vHT1Nj0263QkKP8eu4zQeF20YyMIkn/SOF9KhFjG1nmmWlZLsZsYhp9
 mvh7LqykPdC/F8uz9W1151E8P0Sl3/IvnlnLUUn2QOxhv2Inty0bwwCiwOH3QEsaLV5/3
 3Kc/SJpbJq1RsnsDK26lOnGPgc1JF8If87qxl4hfw3/wYNTkjRP0IY0+w7OZr0O+KtL3h
 rfXKJB8z7YXLB3FoKaXsh5ZDEQCQTlfJVE03CoZF9YZ++jheFNhCd2Df7wcdVB1sQmg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BE77810B8
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:36:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B34C198450; Wed, 30 Sep 2026 19:35:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 21:24:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99ea0fbb3db76057a77bbd618cfbd188c69a6f86
X-Git-Newrev: 97a94e01efa24d9a9b7a410a42cd0fe312e65197
X-Patchwork-Hint: ignore
Message-Id: <20260930193541.B34C198450@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: security bump to
 version 3.6.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/97a94e01efa24d9a9b7a410a42cd0fe312e65197
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/openssl/openssl/releases/tag/openssl-3.6.5

This release incorporates the following bug fixes and mitigations:

Fixed DTLS retransmissions of handshake messages from a stale buffer offset.
(CVE-2026-84782)

Fixed excessive memory allocation in relative CRLDP processing.
(CVE-2026-35189)

Fixed QUIC unvalidated amplification credit may be over-accounted.
(CVE-2026-35191)

Fixed potential CPU DoS via O(n^2) fragment reassembly in QUIC.
(CVE-2026-42772)

Fixed a timing side-channel in scalar multiplication for mon-NIST EC curves.
(CVE-2026-54872)

Fixed QUIC STREAM fragment metadata DoS.
(CVE-2026-54873)

Fixed non-constant-time SM2 scalar multiplication on ARM64 and RISC-V.
(CVE-2026-54875)

Fixed out-of-bounds access after SSL_set_SSL_CTX() during a handshake.
(CVE-2026-72897)

Fixed QUIC connection-level flow control was not enforced for streams.
(CVE-2026-75804)

Fixed a NULL pointer dereference in CMP client revocation response handling.
(CVE-2026-75805)

Fixed an unauthenticated and undersized DTLS 1.2 AEAD record causing DoS.
(CVE-2026-75806)

Fixed a timing side-channel in SM2 signature generation.
(CVE-2026-77696)

Fixed an unbounded RETIRE_CONNECTION_ID backlog in QUIC stack
implementation.
(CVE-2026-84784)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 46ac5589dc..b7083cc3d7 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.6.4/openssl-3.6.4.tar.gz.sha256
-sha256  9bffaa1ad1e07b354c21bd3324ec02fa15579f45a7d0494b3e74bc449b7333ef  openssl-3.6.4.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.6.5/openssl-3.6.5.tar.gz.sha256
+sha256  a2157c2830efdec3788939b00c9b0638306d3f0bbb76dc4832ee503bb397df98  openssl-3.6.5.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9b3eec4baa..4aad749eec 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.6.4
+LIBOPENSSL_VERSION = 3.6.5
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
