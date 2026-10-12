Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9B0CA9ED5
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 06:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E20F040627;
	Mon, 12 Oct 2026 06:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RwAdaer8I3VL; Mon, 12 Oct 2026 06:26:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C7950406BC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791786362;
	b=qNipasVlEqxAxNebCcnMIYtoVKB2YRTdb+TJn9G/sdA+wF8TJDCxT0+f3U83ow/3bRsS
	 lteUmyL7mh91jrZUiT2i702ovvTmkGsqcWHWC0Se51U36FkdMz+g5XTxTSrBBmOs1liB9
	 cHJ4F/AJ/gdDZ3w+8FlXYA3q+tvBj5sOwJuEfnjV3IbQCKVfEyB1bLaCnUBZ59HG+U3Gq
	 0TjhCNykcNM2JzdPZjuUKTGFHhLuoNAHadNZSN1kqj077w2CmTV4YuFChYODhA1OttxUF
	 lKks3zedX2gZInmt/4wR6PrgpptAk3n/VbzXOCJDfYbHY0SAXWS0ENpcgdhKgMrojDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791786362;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=TERMdZW9uDROrzLq9l5RNRzlG4N7uU8dkMCTtJ3X2TE=;
	b=AjdnGmDmd6puV7jlz7YlFsG3ExmunS9t5e8XBdWFcW8eHFb7Yis/8VX4ARqFUjgk6MAe
	 jwtA3UywJ8+LHPUfDzkV7v/Te9u5RkNCMDYgJEtohUF9dtDQZ9mgjuAgw5RhN2APMcdXH
	 jiVWEiNWEYPJGUt7VC+fiDimZ3yhUgdwjhAFYA+IuTrnXQYPhIu4FGWXrzl3QduFRisuu
	 1s7ZNY572rGLMvzbUviqbtgkzfxQ5W5GAXz9S5geXYV7KWj4CzTazWc137rwtjRB0nE4X
	 B/knax1B5ynOaBkIAay2VyCFnfLM3b36AKj9qNPm2QsdYX1JOgfTeZKvnK55hkdfE5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791786362;
	bh=TERMdZW9uDROrzLq9l5RNRzlG4N7uU8dkMCTtJ3X2TE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SyQWAJSx5C1z02ngjWQY7ibRNuazKLzajXzjAZx5rZ9Vlq5+Nk3uF2UCoAyeWsRoJ
	 EGh/M+mLlhUht06GH9dvGPv9I2eRdrNLSvECBEiAoJ64ihJ+858/LfVAYOB8e4Q/EX
	 PzZG8yrfU9dr/ZKS6Q7RibiUGrsrDm3a0jFiQg8+DCoX/DXidMAEmu9Q3XuxLNCFQ3
	 qoNn3TRTuSaAd5WAx1MKjuagjx2IXwkk8cKHdKEcVp1QXYjYj2Q5FUMkjGgVA048Sh
	 dSoBbhRIGtpZgDsXw7AIOOpKdiGEr/L4zRXkvvBL/Sdf6or3QSIGXB/wJMAuQX1+rf
	 mdEtwzWj5601Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7950406BC;
	Mon, 12 Oct 2026 06:26:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D0ECD5E
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CC9080CEE
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 06:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMQGhzsK78_T for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 06:25:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BC1DA80CEC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791786350;
 b=TcmXacvy513RSzwZ0KK+UgdrRIB3aXiUeV1zm5ax6R5Q58SKhmvwvH82w5kexOqvjrm2
 5XzKIj9FEWbpq6GcX5ZJTSkeBSochJa9/a5Pq39RoqbYCHzvG4tYIfoXGAagR25P0b56O
 rwL3RAz4aOyYYcy67FzDVjLMmURCgyIbdOdFTTfDpesXC25d1123YZnzRaK6aLp7iB9P0
 8OECE/xGAzRUHGacBBGf8bktHjpjdTWznVH6flHkZAC8EC56yhepRujXcOB06evCQQ2XH
 LiGSmImHWH36UUfRkS9b6qdbugJLx1hZIcY3egb67kLhe9kqeMnvAogwDys8sdnNKOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791786350;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Yljv/9w7/DonEECElwD02tUNsowk/pniF0Udpv+5tr4=;
 b=iUvjrIqCEDlVw+ui2xy2uG6hkgf4zlkcyL2s4SJ7mhbYzpV6Xi90OnpUzgIN4Pfl2iSK
 l14DuguRp4DZLUZkl5/adkRr9bZlY+gDcPo7ZqqWHlgv6BXzjSYvS3UkGgWkeZtih453I
 8H2KD8HBrQP9SX5q3ScZxIFsu87ZbS3HqVK0VGI5NU+wlMYzccy9kM/Aus9nqOA5lwoSf
 O4cdM6qndxbu0yQgkh1bWZ8o9oOEvAI3ye55AYjwre4MhA1e4c+r4rq8LwsVBoHwZdpZz
 cLa97cY3txG6d8BG2Dk29S+Yt0ezljn+gW3y3m+iUa9+KyFwnbkVIJEzCse/kA5k+Vg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=k62+0ICd; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=k62+0ICd
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC1DA80CEC
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 06:25:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48b0584ad71so720856f8f.0
 for <buildroot@busybox.net>; Sun, 11 Oct 2026 23:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791786347; x=1792391147; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Yljv/9w7/DonEECElwD02tUNsowk/pniF0Udpv+5tr4=;
 b=k62+0ICd/a1M9Vn/pY9osuW1KxZcbz3NUGyCQejMiLUOa2wYNvPuqwjNxQD+P5EVlo
 nHCkKDyK5tcjKpX0hL8sDyfKj+g9sVBngIBCUAmGYfwi1RN4PcNkhYlG28ZaRtfBvvDY
 5qOjchBVG8OrYqWVDJn+UsAV3mp8GdlLF62z1DwGoN7xPtHMX3NOBHtevUSdTJzPubZA
 HibPan1EEARXES2ixNI3zSqVZIKYDAVFwhLyzdL3u9Ft8PPOYpS2ta/ca8ogGCWrig/z
 gW4YNhe4eZy7W2icvRxDfiKXmzYTQSSwjaLrbBe1M5uszGd8PSD/i/3+y9J+/V+F53h5
 7Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791786347; x=1792391147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Yljv/9w7/DonEECElwD02tUNsowk/pniF0Udpv+5tr4=;
 b=prvDqfWBMscpHdb80zZDg3JGe7UG6wEzz5cddW28pLKchi7s5VA4uycYE5wUvakHun
 G5Nwuw/k/TsLODxokhvdBZA/MI/tem1NEq+rwN/OQJERyFRPb77TkcsOFLwI5T8Gugij
 20zoeO1/675bnFi9BLP6VJvUmDkDpJ6QRfpGrn7WUf/NOqO25wfyU7Hl8KluhJgmsxTb
 p/MBljq/E9ueU94hXvUKBdktvlDkbfgedzz+jaVYYV5MvybQ0SVrRUxzlRO4BEpFYWYu
 scGccuLrx/LLsaoD271FDYM+MLgK/DyVlAOI670/n9Je+lIaD+n3CT+6RfniNwGcTlsa
 lQ8w==
X-Gm-Message-State: AFq9FYLvsLrNiGYSDYffCUwMmIKrQLs5JJh7cn9KjCrG5MZPOb26jmxb
 ZnNV5bJjybFqP+UNqsq0pv9HXfURLP3V0HweNbpHUiHEOnsYXI+HVhPfvbYGaQ==
X-Gm-Gg: AYBFou0FZF9mU8Wik+O1w2PxFyHH2TGY36tiuYZK36p0Fk46srl48T+IrnDcGPA59di
 HffgDFw0n7GAQGqv2RxOy7T7H68HAokvr2Q0LP/ggHVUzi3yLy2be7xXO1DTJGMWy+QI788TjoI
 ZZIb373t5uhbbluVDLlmm8/WETLmb4blLfvW5UtWXML2czshb/XO60gpcTEr937Qpcsesp3TYme
 lLZalNGPjo2nv4MLDinARPIrky5vTKdoSmMG62n+Ntj/IeEj79H28QCg0icOn/f3RAgcmmZlaaP
 NKYIwcCWH8F4cnfa+gyheIeRwIKJvviiePXGGkcDMCi6ahHeKUs7uKUJKlRtF85Ts0pQ93wZeLD
 F0zRrUOM73dQby42NegoOrfzsAibBnUM0xBSaF39f60/kusFGgrBnvY7sroDKCQdwUmRSpbctk2
 yyGGC/PEApYTIF1YN36qWM8JcE3DwIDLIi4ntbR0I5bFW/EYi3YHKlIuG7y/HCLLohpKBn8n64v
 TijgPVdIrFfTGEBQOx2VfNgc0gq+6hWZAcSaBe/
X-Received: by 2002:a05:600c:3c89:b0:4a1:7703:e52a with SMTP id
 5b1f17b1804b1-4a18e493039mr142679685e9.9.1791786347424; 
 Sun, 11 Oct 2026 23:25:47 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm421486625e9.4.2026.10.11.23.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 23:25:47 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 08:25:32 +0200
Message-ID: <20261012062536.78874-7-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012062536.78874-1-francois.perrad.86@gmail.com>
References: <20261012062536.78874-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 07/10] package/perl-mozilla-ca: bump to version
 20260813
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 4 ++--
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index bd396d1de..9e0b6ff14 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  c28848458e8ae2325e46b15a243f1918  Mozilla-CA-20250602.tar.gz
-sha256  adeac0752440b2da094e8036bab6c857e22172457658868f5ac364f0c7b35481  Mozilla-CA-20250602.tar.gz
+md5  c1afba5f4fef71dfe7b6328ddd3c26d3  Mozilla-CA-20260813.tar.gz
+sha256  81f0bd9665eacbb6feef13b0fa16fbb30162c09292542b1206434e569196dd9b  Mozilla-CA-20260813.tar.gz
 
 # computed by scancpan
 sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 02b4cf3d5..a8cfdd66c 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20250602
+PERL_MOZILLA_CA_VERSION = 20260813
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LW/LWP
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
