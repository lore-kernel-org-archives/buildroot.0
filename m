Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C06CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07EFC60675;
	Sat,  3 Oct 2026 22:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gdf_OlzplKLn; Sat,  3 Oct 2026 22:44:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 117A260644
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067494;
	b=qNSvPZrB41rVi2W/YuUHSyiEZAYBLaPYNNA2o/YTDO0XYglmpvH0NCOW/sJbWtu07P2n
	 IlM2JGKoor0uUNLa1ZSarqljJYQ4P3Kfe+xTHGCIrTN+GsmkPgMD6jOpoxkgI0O84kc1O
	 VvVGfv+pgZKc4lf2vey3H02pmolG3m4h62gzJHXrpl3EhFRv7aK0pjPOXwoZROX0s7FP3
	 2SbYkUgQPc0RXikwwIFRId0V8hfAhLtNuKnA9y8d5NjQJjxbh+KhLWmj3m6Ns8Pj8s1vV
	 pzFE5qdt0RYUBZU7WuPWr/a7HwBiBOpRWFzybJJUVi0urft914lm+0F0IQVMBBvtJsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067494;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CWPfeIVJ6Ap+BS/Lwn+E4Se6GDQbN7vF9KoDxeOggHo=;
	b=Y1POtWbC+AK5DWpCQMeG7bVfVNTeAFeABENOPlEOtFpI2mlX4SL9aO8RQ9L8b5Ao8B3X
	 OylugOGk1ATKY0voMKGA02dArOsFCuKSrDntK50Zw+Qu7IH79xp9BNppiW9ibyZoyT5ef
	 4jkOOny8Wg1UTWjsUyc4YBgXVg/t3HjCX8Oy9CEAUGjnhgoC8pMYJUJxpUheFo7rQ4HK1
	 8qUGRW04lTr08pmiv7NpCQ+dKODNAO//RLL/u8v8K8q03395LbYA9RVwgR3hnbvRJLKXu
	 fT33kTAmkWr4DmS3lifrqhS05HZEF5WXCyvM8NsJD1eKgNe9dvgzuYVjLT+WWmZd0LA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067494;
	bh=CWPfeIVJ6Ap+BS/Lwn+E4Se6GDQbN7vF9KoDxeOggHo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=YbJvTp6vDx+WAGqvCPfg0eO+ejyo9SNs3Ed5/C8J97WcQJ+4Ljvz/Mf90B8GqjnIj
	 GNoTka5hUGbK2OTkQNOrQTs+T0LsSzj7FjzTNJMmlHdiQf2uAnK59qmYlKB+csorcG
	 yZLexzgai99cK/3PGxTnqn7GkbnGGq6qAQ5v94uffk4EOQNkSlj7dNIRMccSrE6c08
	 1+W+xuWdvYdM8+PDDmO0hrz8HrRkV6wUxmiov+rNY9GZwlOT6GGofWu+TogLrObir6
	 R3e4jT8uXh7bXPX6ExlZV1u0FYnClr0VG6CwO7w9EEfsgVnalLEER8eVbP8/asXqS4
	 Vm+CVXx+RdJBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 117A260644;
	Sat,  3 Oct 2026 22:44:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 031F0282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 001FD40AC0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwAkagVvPf_j for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:44:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1D75040AB8
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067491;
 b=gGTgsEC7T19DFm/iL4HdDVvXFIfNKwNXGBb1MMcnBFTuV7Mo0hjJQD83+qfR9Nk6yHuy
 JRet7BaLAlapoJDjg+4YBL+biZ//C1JeabRREQ3f6FbddXvBHRuuBWWo7niymAFkxCJnu
 vtoqZnlScrAgeIIjTjIcYk3rL1VfTDUKJpnTUGy8EiY/m/0ku7Ts/ZhPv3adfZryNk1J8
 vY6/vRaqcRJMjRBQ4Y+7jVFBaGgxtM5tbB3IXDCehtBjLK2S1zNhX9YuyZAAJKM422+rp
 HDQVXHojzm1xePuxRjpy6OEkE9NnKd33VOq7SlqlrGtv2SsK/GneJOFZTc7u2/uFzvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067491;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=UpO9Q8uUz3ANBNzeNpIAKgFDaGKJ6oySBwHdV1rptDI=;
 b=sZGN6jC5go6XPG1IeWJEAqcPU4qrsBmj1EiSBKwEWT87w5mhjIGizCRANgaUkkkH30n2
 3TjI7SKNCzNMQbWS3hOOCGBvvAcsVsQ/W0gHyfenG8H6F3w93aG66R2tPEyTR9i9vy+0I
 vJchRWN8OSB5QF3uhuCZlcU9M/gQ4XfALDH14t+E4jUekEN/wa6tuVSFybHd97uwU6Ohv
 Xgr1a6lxlGHJOgd2C9Rd/EwpV+868CJKWljQb/DeWWl5qjCk8rBxj0Ta0kw8U95799T5F
 xzEeKLN/sT4rOVrEMj49k0oEr+yYwTJxtMH+WdsX9B5pC4r1/uhx2ztSKEUxkWyV7zQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=gwXBDabp; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gwXBDabp
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D75040AB8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:44:50 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823adac76e2so419863a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067489; x=1791672289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UpO9Q8uUz3ANBNzeNpIAKgFDaGKJ6oySBwHdV1rptDI=;
 b=gwXBDabpegRXavZva/zrtzTHYFWcZgF+v7lWPJOdKtVPCRZw/X4u3iUq8QYQpvI4V5
 bZUH1cX0IPA1wJVWqGqhOkdAKc2tJbTcK79HIW5CLpJeS8ZbpQkN08PHI9sDZsn04jbm
 YNwCU0HSFhzRtipJQiKn/kDjeMzWI3lhAFp65NtTo3ErXRAZZCgDBC7lGE0JoUf/MF12
 qAjMKXn4nLRd1p48ZUG5q1Pm86smkxuTZjLBaKInOctzQcX7jpAHMQOrfJOBwTx6kG9W
 GOWr0I107IfamfSzT2EuRVrDuO2ZmqDuMFZkbgOBcFu8+fHBCDcMmdsccqnJCrZiOoI6
 qaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067489; x=1791672289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UpO9Q8uUz3ANBNzeNpIAKgFDaGKJ6oySBwHdV1rptDI=;
 b=hideEgPv1uAwPbNohKpCg+pz7HuBUqROtMxdneWGun4zat/5e4OuIggf2m06sf27mt
 4Cjjnr4vU2pUcR/sris0Hipi9RhiRkRGjbOuseRNg4CFnPkkq9jOufFrD6cScy/uX1b3
 7ege3uVT/AZoVnXqIwwhR/5LRBM3DgGuBH1Z6xNp0ktSsyBlyjcSmNDMUiBi5pU0+1Si
 RsDmPpmcPig36jKuvRxx3nHXbq+39ZdjslC19l4nKWVoziannZrSlCw5RBESWI0Ur3eT
 HOfG3bnzOeGEqpMvNIM3j4vC0oHh5+GFqBjibNPB7O0Iq1B+4TQGpAiNoK2nBOYs7m24
 Ia4A==
X-Gm-Message-State: AFuF++kQyRkarxuZ2WNMHbEuGLVuiO8bmO8gyJvTcVnS/k6RjNZrGd/m
 Q/LlL0GV/hWs1Rz5rx34BAvznQoqQmuDWI4xylxIKGICxIPzc8de08j9kZd9Bg==
X-Gm-Gg: AYBFou3+ggCdYTH2rGCOS2o02GElWtq+Bd+K3CkYqlvHtw4GMy1mNiTiZBibPMuYPnD
 Z9Eb4+8xYXTo8IQGmCZqxejHA4drbLVxq4quDqUcNOGT+p/tD/JlMOLssQ1/Y1owSuhyLveoQ4i
 M85xe/beyIai2A8r3rEtVSxx/yIo0qHGxzZdt+zD/zPgS3drB3cxeqI54BQiFxXuEVzi1Un+xEG
 K9p5NCEleOwe1SC55hhyo3o8z4oytazjxveMv6ELiAh573Z1IQrdBEO2xQ5/EaPLD+2yrO1nR4h
 Xl5Ved3hrCQrGaKjJa5f0qYtVwy4HwvcSX8ElYxTKqYeHiWLzsJAluBDWpv5S858i+cj+DvESFy
 EPz6lfAjhRU95jlrilNia9W5ESLBvvBRlm397MImDuHcINEOpXzodvggcuM84fmt54nA5Ris1pB
 omjGkwaKxy9u3+43p60QG7t6d3iqtGPkEIgJInccsuEAMByrR8zx4Hvhq7DV7LIPXyl9rGHLDEB
 gLvGMIvYA7U4GKNnlxse/5x2PbzY4NIPgvBmVNWVLz67iviyTqsUikVdCoZdDAHz0L2w4hJ5Ocn
 RRq9YLkGL1vgcRaGjFqvx5qFOYPZUPtSGn4Y42yyZSLaBbYwED0aoWVYG1a6O1Dcem2E9dVMRXa
 iOSL/ecqCJ79R7kQ5bmx/lMsMvQ50IQU5krCs7y3sZg==
X-Received: by 2002:a05:6820:1ca1:b0:6e1:b8fd:d233 with SMTP id
 006d021491bc7-6e1b8fdf297mr1223634eaf.74.1791067489259; 
 Sat, 03 Oct 2026 15:44:49 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:44:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:25 -0600
Message-ID: <20261003224447.744966-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/circus: bump to version 0.19.0
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

Switch to the flit build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/circus/circus.hash | 4 ++--
 package/circus/circus.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/circus/circus.hash b/package/circus/circus.hash
index b9e1ef2e68..db7de203b7 100644
--- a/package/circus/circus.hash
+++ b/package/circus/circus.hash
@@ -1,4 +1,4 @@
 # md5, sha256 from https://pypi.org/pypi/circus/json
-md5  9887ddafebef7475c08ff2c8e5cc2fad  circus-0.16.1.tar.gz
-sha256  dd7c011eb67785a1c96a4db94a56a22810c6ed608cebf301152dabc771654c5d  circus-0.16.1.tar.gz
+md5  e737525ca9196708ac4ea71ba55cb816  circus-0.19.0.tar.gz
+sha256  fbe6a5029998ac1239b17ebdd38251ac8b22627d30e4ec6f68cb10233911b0f4  circus-0.19.0.tar.gz
 sha256  3df739c05a4eed7efdf4987142658d2a4f1243e5f08e72a5ecedac5749c92a49  LICENSE
diff --git a/package/circus/circus.mk b/package/circus/circus.mk
index 8f650de1e7..f56ac9c146 100644
--- a/package/circus/circus.mk
+++ b/package/circus/circus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CIRCUS_VERSION = 0.16.1
-CIRCUS_SITE = https://files.pythonhosted.org/packages/09/8a/44a0b6b35ecf5dcf22bf51e4bcf188ec9e7ab9dd4c14330ba1b8bea51102
-CIRCUS_SETUP_TYPE = setuptools
+CIRCUS_VERSION = 0.19.0
+CIRCUS_SITE = https://files.pythonhosted.org/packages/94/97/824bfce6949716ea93adcd5ff8aa4c277f40a735d7f644669674ec132ae4
+CIRCUS_SETUP_TYPE = flit
 CIRCUS_LICENSE = Apache-2.0
 CIRCUS_LICENSE_FILES = LICENSE
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
